/*
 * ProductionServiceImpl.java
 * 创建者：L
 * 创建日期：2017年12月27日 上午8:58:17
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.jxc.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.jxc.ConsumeItem;
import team.nercita.manage.cms.po.jxc.ProductStore;
import team.nercita.manage.cms.po.jxc.ProductStoreItem;
import team.nercita.manage.cms.po.jxc.Production;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.jxc.ProductionService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 * 
 * @author L
 * @date： 2017年12月27日 上午8:58:17
 */
@Component
public class ProductionServiceImpl extends BaseService implements ProductionService {

	@Override
	public Map<String, Object> doJoinTransFindProductionList(Integer goPage, Map<String, Object> paramMap) {
		String typeid = MapUtils.getString(paramMap, "typeid");
		String purpose = MapUtils.getString(paramMap, "purpose");
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		String sql = "select a from Production a left join fetch a.productType where 1=1 ";
		String countSql = "select count(a) from Production a where 1=1 ";
		
		if(StringUtils.isNotBlank(purpose)) {
			sql += " and a.purpose like :PURPOSE";
			countSql += " and a.purpose like :PURPOSE";
			queryMap.put("PURPOSE", "%" + purpose + "%");
		}
		
		if(StringUtils.isNotBlank(typeid)) {
			sql += " and a.productType.id = :TYPEID";
			countSql += " and a.productType.id = :TYPEID";
			queryMap.put("TYPEID", typeid);
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("productionList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void doTransSaveProduction(Production production) {
		List<ConsumeItem> itemList = production.getItemList();
		
		String sql = "select p from ProductStoreItem p where p.productStore.id = :ID order by p.createTime";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ID", production.getProductStore().getId());
		
		List<ProductStoreItem> storeItemList = (List<ProductStoreItem>) baseDao.findObjectList(sql, paramMap);
		
		String value = "";
		for (ProductStoreItem item : storeItemList) {
			value += item.getPropertyName() + "-" + item.getPropertyValue();
		}
		
		production.setItemList(null);
		production.setId(Generator.getUUID());
		production.setModel(value);
		production.setOutStatus(0);
		production.setIncomeStatus(0);
		baseDao.save(production);
		
		if(itemList != null && !itemList.isEmpty()) {
			for (ConsumeItem consumeItem : itemList) {
				consumeItem.setId(Generator.getUUID());
				consumeItem.setProduction(production);
				
				baseDao.save(consumeItem);
			}
		}
	}
	
	@Override
	public Production doJoinTransProductionById(String id) {
		String sql = "select p from Production p left join fetch p.productType left join fetch p.productStore where p.id = :ID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ID", id);
		
		Production production = baseDao.findObject(sql, paramMap);
		
		for (ConsumeItem consumeItem : production.getItemList()) {
			consumeItem.getProductType().getTypeName();
			consumeItem.getProductStore().getAmount();
		}
		return production;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void doTransUpdateProduction(Production production) {
		List<ConsumeItem> itemList = production.getItemList();
		
		String sql = "select p from ProductStoreItem p where p.productStore.id = :ID order by p.createTime";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ID", production.getProductStore().getId());
		
		List<ProductStoreItem> storeItemList = (List<ProductStoreItem>) baseDao.findObjectList(sql, paramMap);
		
		String value = "";
		for (ProductStoreItem item : storeItemList) {
			value += item.getPropertyName() + "-" + item.getPropertyValue();
		}
		
		production.setItemList(null);
		production.setModel(value);
		production.setOutStatus(0);
		production.setIncomeStatus(0);
		baseDao.update(production);
		
		sql = "select c from ConsumeItem c where c.production.id = :PID";
		
		paramMap.clear();
		paramMap.put("PID", production.getId());
		
		List<ConsumeItem> oldList = (List<ConsumeItem>) baseDao.findObjectList(sql, paramMap);
		
		for (ConsumeItem consumeItem : oldList) {
			baseDao.delete(consumeItem);
		}
		
		if(itemList != null && !itemList.isEmpty()) {
			for (ConsumeItem consumeItem : itemList) {
				consumeItem.setId(Generator.getUUID());
				consumeItem.setProduction(production);
				
				baseDao.save(consumeItem);
			}
		}
	}
	
	@Override
	public void doTransIncomeStore(String id, User user) {
		Production production = baseDao.findObject(Production.class, id);
		production.setIncomeStatus(1);
		production.setUseTime(new Date());
		production.setUseMan(user.getName());
		
		baseDao.update(production);
		
		ProductStore productStore = production.getProductStore();
		productStore.setAmount(productStore.getAmount() + production.getAmount());
		baseDao.update(productStore);
	}
	
	@Override
	public void doTransOutStore(String id, User user) {
		Production production = baseDao.findObject(Production.class, id);
		
		List<ConsumeItem> itemList = production.getItemList();
		
		for (ConsumeItem consumeItem : itemList) {
			ProductStore productStore = consumeItem.getProductStore();
			
			if(productStore.getAmount() < consumeItem.getAmount()) {
				throw new IllegalArgumentException(consumeItem.getProductType().getTypeName() + "型号库存不足，不允许出库！");
			}
			
			productStore.setAmount(productStore.getAmount() - consumeItem.getAmount());
			baseDao.update(productStore);
		}
		
		production.setOutStatus(1);
		production.setOutTime(new Date());
		production.setOutMan(user.getName());
		baseDao.update(production);
	}
}
