/*
 * OutStoreServiceImpl.java
 * 创建者：L
 * 创建日期：2017年12月25日 上午9:55:37
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.jxc.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.jxc.OutStoreApply;
import team.nercita.manage.cms.po.jxc.ProductStore;
import team.nercita.manage.cms.po.jxc.ProductStoreItem;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.jxc.OutStoreService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 * 
 * @author L
 * @date： 2017年12月25日 上午9:55:37
 */
@Component
public class OutStoreServiceImpl extends BaseService implements OutStoreService {
	
	@Override
	public Map<String, Object> doJoinTransFindOutStoreList(Integer goPage, User user, Map<String, Object> paramMap) {
		String typeid = MapUtils.getString(paramMap, "typeid");
		String purpose = MapUtils.getString(paramMap, "purpose");
		Integer status = 0;
		if(user.getPost() == 0) {
			status = 2;
		}
		
		String sql = "select a from OutStoreApply a left join fetch a.productType left join fetch a.project where a.status >= :STATUS ";
		String countSql = "select count(a) from OutStoreApply a where a.status >= :STATUS  ";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("STATUS", status);
		
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
		paramMap.put("outList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		return paramMap;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void doTransSaveOutStoreApply(OutStoreApply outStoreApply) {
		String sql = "select count(o) from OutStoreApply o where o.createTime >= :NOWDATE";
		
		String date  = new SimpleDateFormat("yyyyMMdd").format(new Date());
		Date nowDate = DateTime.parse(DateTime.now().toString("yyyy-MM-dd")).toDate();
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("NOWDATE", nowDate);
		
		int count = baseDao.queryObjectCount(sql, paramMap);
		
		outStoreApply.setId(Generator.getUUID());
		outStoreApply.setOutNo(date + "-" + String.format("%02d", (count +1)));
		
		sql = "select p from ProductStoreItem p where p.productStore.id = :ID order by p.createTime";
		paramMap.clear();
		paramMap.put("ID", outStoreApply.getProductStore().getId());
		
		List<ProductStoreItem> itemList = (List<ProductStoreItem>) baseDao.findObjectList(sql, paramMap);
		
		String value = "";
		for (ProductStoreItem item : itemList) {
			value += item.getPropertyName() + "-" + item.getPropertyValue();
		}
		outStoreApply.setModel(value);
		if(outStoreApply.getProject() != null && StringUtils.isBlank(outStoreApply.getProject().getId())){
			outStoreApply.setProject(null);
		}
		
		outStoreApply.setStatus(0);
		baseDao.save(outStoreApply);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void doTransUpdateOutStoreApply(OutStoreApply outStoreApply) {
		OutStoreApply oldOutStoreApply = baseDao.findObject(OutStoreApply.class, outStoreApply.getId());
		oldOutStoreApply.setProductType(outStoreApply.getProductType());
		oldOutStoreApply.setAmount(outStoreApply.getAmount());
		oldOutStoreApply.setPurpose(outStoreApply.getPurpose());
		oldOutStoreApply.setProject(outStoreApply.getProject());
		oldOutStoreApply.setRemark(outStoreApply.getRemark());
		
//		ProductStore productStore = baseDao.findObject(ProductStore.class, outStoreApply.getProductStore().getId());
		
		String sql = "select p from ProductStoreItem p where p.productStore.id = :ID order by p.createTime";
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ID", outStoreApply.getProductStore().getId());
		
		List<ProductStoreItem> itemList = (List<ProductStoreItem>) baseDao.findObjectList(sql, paramMap);
		
		String value = "";
		
		for (ProductStoreItem item : itemList) {
			value += item.getPropertyName() + "-" + item.getPropertyValue();
		}
		oldOutStoreApply.setModel(value);
		if(oldOutStoreApply.getProject() != null && StringUtils.isBlank(oldOutStoreApply.getProject().getId())){
			oldOutStoreApply.setProject(null);
		}
		
		oldOutStoreApply.setStatus(0);
		
		baseDao.update(oldOutStoreApply);
	}
	
	@Override
	public OutStoreApply doJoinTransFindOutStoreApply(String id) {
		String sql = "select o from OutStoreApply o left join fetch o.productType left join fetch o.project left join fetch o.productStore where o.id = :ID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ID", id);
		
		OutStoreApply outStoreApply = baseDao.findObject(sql, paramMap);
		return outStoreApply;
	}
	
	@Override
	public void doTransSubAuditStoreApply(String id) {
		OutStoreApply outStoreApply = baseDao.findObject(OutStoreApply.class, id);
		outStoreApply.setStatus(1);
		
		baseDao.update(outStoreApply);
	}
	
	@Override
	public void doTransAuditOutStore(String id, int status, User user, String auditMsg) {
		OutStoreApply outStoreApply = baseDao.findObject(OutStoreApply.class, id);
		
		//判断用户权限是否为主任
		if(user.getPost() == 0 && status == 1) {//主任--通过
			status = 3;
		} else if(status == 1){//一审通过
			status =2;
		} else {
			status = 0;
		}
		
		outStoreApply.setStatus(status);
		outStoreApply.setAuditMsg(auditMsg);
		
		baseDao.update(outStoreApply);
	}
	
	@Override
	public void doTransOutStore(String id, User user) {
		OutStoreApply outStoreApply = baseDao.findObject(OutStoreApply.class, id);
		ProductStore store = outStoreApply.getProductStore();
		
		if(outStoreApply.getAmount() > store.getAmount()) {
			throw new IllegalArgumentException("出库失败，现有库存数量："+ outStoreApply.getProductStore().getAmount());
		}
		
		store.setAmount(store.getAmount() - outStoreApply.getAmount());
		baseDao.update(store);
		
		outStoreApply.setOutMan(user.getName());
		outStoreApply.setStatus(4);
		baseDao.update(outStoreApply);
	}
}
