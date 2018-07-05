/*
 * ProjectStoreServiceImpl.java
 * 创建者：L
 * 创建日期：2017年12月20日 上午11:14:04
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.jxc.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.jxc.ProductManage;
import team.nercita.manage.cms.po.jxc.ProductProperty;
import team.nercita.manage.cms.po.jxc.ProductPropertyValue;
import team.nercita.manage.cms.po.jxc.ProductStore;
import team.nercita.manage.cms.po.jxc.ProductStoreItem;
import team.nercita.manage.cms.po.jxc.ProductType;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.jxc.ProductStoreService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;
import team.nercita.manage.cms.vo.ProductVo;
import team.nercita.manage.cms.vo.ValueVo;

/**
 * 
 * @author L
 * @date： 2017年12月20日 上午11:14:04
 */
@Component
public class ProductStoreServiceImpl extends BaseService implements ProductStoreService {
	@Override
	public void doTransSaveProductType(ProductType productType) {
		List<ProductProperty> propertyList = productType.getPropertyList();
		productType.setPropertyList(null);
		productType.setId(Generator.getUUID());
		
		baseDao.save(productType);
		
		if(propertyList != null && !propertyList.isEmpty()) {
			for (ProductProperty productProperty : propertyList) {
				if(productProperty == null || StringUtils.isBlank(productProperty.getPropertyName())) {
					continue;
				}
				
				List<ProductPropertyValue> valueList = productProperty.getValueList();
				
				productProperty.setValueList(null);
				productProperty.setId(Generator.getUUID());
				productProperty.setProductType(productType);
				
				baseDao.save(productProperty);
				
				if(valueList != null && !valueList.isEmpty()) {
					for (ProductPropertyValue productPropertyValue : valueList) {
						if(StringUtils.isBlank(productPropertyValue.getVals())) {
							continue;
						}
						
						productPropertyValue.setId(Generator.getUUID());
						productPropertyValue.setProductProperty(productProperty);
						
						baseDao.save(productPropertyValue);
					}
				}
				
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductType> doJoinTransFindProductType() {
		String sql = "select p from ProductType p";
		return (List<ProductType>) baseDao.findObjectList(sql, null);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductProperty> doJoinTransFindPorductProperty(String typeid) {
		String sql = "select distinct p from ProductProperty p left join fetch p.valueList where p.productType.id = :TYPEID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("TYPEID", typeid);
		
		List<ProductProperty> propertyList = (List<ProductProperty>) baseDao.findObjectList(sql, paramMap);
		return propertyList;
	}
	
	@Override
	public void doTransSaveProductStore(ProductStore productStore) {
		List<ProductStoreItem> itemList = productStore.getItemList();
		
		productStore.setId(Generator.getUUID());
		productStore.setItemList(null);
		
		baseDao.save(productStore);
		
		for (ProductStoreItem productStoreItem : itemList) {
			productStoreItem.setId(Generator.getUUID());
			productStoreItem.setProductStore(productStore);
			
			baseDao.save(productStoreItem);
		}
	}
	
	@Override
	public Map<String, Object> doJoinTransFindStoreList(Integer goPage, Map<String, Object> paramMap) {
		String typeid = MapUtils.getString(paramMap, "typeid");
		String dealerid = MapUtils.getString(paramMap, "dealerid");
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		String sql = "select a from ProductStore a left join fetch a.itemList left join fetch a.productType left join fetch a.productDealer where 1=1 ";
		String countSql = "select count(a) from ProductStore a where 1=1 ";
		
		if(StringUtils.isNotBlank(typeid)) {
			sql += " and a.productType.id = :TYPEID";
			countSql += " and a.productType.id = :TYPEID";
			queryMap.put("TYPEID", typeid);
		}
		
		if(StringUtils.isNotBlank(dealerid)) {
			sql += " and a.productDealer.id = :DEALERID";
			countSql += " and a.productDealer.id = :DEALERID";
			queryMap.put("DEALERID", dealerid);
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("storeList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductStore> doJoinTransFindStoreByDealerId(String dealerid) {
		String sql = "select distinct a from ProductStore a left join fetch a.itemList left join fetch a.productType where a.productDealer.id = :DEALERID";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("DEALERID", dealerid);
		
		return (List<ProductStore>) baseDao.findObjectList(sql, queryMap);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductType> doJoinTransFindProductTypeByManageId(String manageid) {
		String sql = "select p from ProductManage p left join fetch p.productType where p.id = :ID";
		
		List<String> idList = new ArrayList<>();
		Map<String, Object> paramMap = new HashMap<>();
		
		while (StringUtils.isNotBlank(manageid)) {
			paramMap.put("ID", manageid);
			
			ProductManage manage = baseDao.findObject(sql, paramMap);
			idList.add(manage.getProductType().getId());
			manageid = manage.getParentId();
		}
		
		sql = "select p from ProductType p";
		
		List<ProductType> typeList = (List<ProductType>) baseDao.findObjectList(sql, null);
		List<ProductType> result = new ArrayList<>();
		if(typeList ==null || typeList.isEmpty()) {
			return null;
		}
		
		for (ProductType productType : typeList) {
			if(!idList.contains(productType.getId())) {
				result.add(productType);
			}
		}
		return result;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ProductStore> doJoinTransFindStoreByTypeId(String typeid) {
		String sql = "select p from ProductStore p where p.productType.id = :TYPID order by p.createTime";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("TYPID", typeid);
		
		List<ProductStore> storeList = (List<ProductStore>) baseDao.findObjectList(sql, paramMap);
		
		for (ProductStore productStore : storeList) {
			sql = "select p from ProductStoreItem p where p.productStore.id = :ID order by p.createTime";
			paramMap.clear();
			paramMap.put("ID", productStore.getId());
			
			productStore.setItemList((List<ProductStoreItem>) baseDao.findObjectList(sql, paramMap));
		}
		return storeList;
	}
	
	@Override
	public ProductStore doJoinTransFindStoreById(String id) {
		return baseDao.findObject(ProductStore.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductVo> doJoinTransFindOutProduct(String id) {
		String sql = "select p from ProductManage p where p.productType.id = :TYPEID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("TYPEID", id);
		
		ProductManage productManage = baseDao.findObject(sql, paramMap);
		
		if(productManage == null) {
			return null;
		}
		
		sql = "select p from ProductManage p left join fetch p.productType where p.parentId = :PARENTID order by p.createTime";
		
		paramMap.clear();
		paramMap.put("PARENTID", productManage.getId());
		
		List<ProductManage> manageList = (List<ProductManage>) baseDao.findObjectList(sql, paramMap);
		List<ProductVo> valueList = new ArrayList<>();
		
		for (ProductManage manage : manageList) {
			ProductVo pvo = new ProductVo();
			pvo.setProductName(manage.getProductType().getTypeName());
			pvo.setUseAmount(manage.getAmount());
			pvo.setProductId(manage.getProductType().getId());
			
			List<ValueVo> voList = new ArrayList<>();
			
			List<ProductStore> productStoreList = doJoinTransFindStoreByTypeId(manage.getProductType().getId());
			
			for (ProductStore productStore : productStoreList) {
				ValueVo vo = new ValueVo();
				vo.setPid(productStore.getId());
				
				String value = "";
				for (ProductStoreItem item : productStore.getItemList()) {
					value += item.getPropertyName() + "-" + item.getPropertyValue();
				}
				
				vo.setPname(value);
				
				voList.add(vo);
			}
			pvo.setValueList(voList);
			
			valueList.add(pvo);
		}
		
		return valueList;
	}
	
	@Override
	public ProductVo doJoinTransFindOutData(String pid, String typeid, String storeid) {
		List<ProductVo> voList =  doJoinTransFindOutProduct(pid);
		
		for (ProductVo productVo : voList) {
			if(productVo.getProductId().equals(typeid)) {
				ProductStore store = baseDao.findObject(ProductStore.class, storeid);
				productVo.setStoreAmout(store.getAmount());
				return productVo;
			}
		}
		return null;
	}
}
