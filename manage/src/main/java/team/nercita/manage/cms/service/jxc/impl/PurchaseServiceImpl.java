/*
 * PurchaseServiceImpl.java
 * 创建者：L
 * 创建日期：2017年12月22日 上午10:05:32
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
import team.nercita.manage.cms.po.jxc.ProductStore;
import team.nercita.manage.cms.po.jxc.ProductStoreItem;
import team.nercita.manage.cms.po.jxc.PurchaseApply;
import team.nercita.manage.cms.po.jxc.PurchaseAuditLog;
import team.nercita.manage.cms.po.jxc.PurchaseDetail;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.jxc.PurchaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 * 
 * @author L
 * @date： 2017年12月22日 上午10:05:32
 */
@Component
public class PurchaseServiceImpl extends BaseService implements PurchaseService {
	
	@Override
	public Map<String, Object> doJoinTransFindStoreList(Integer goPage, User user, Map<String, Object> paramMap) {
		String productName = MapUtils.getString(paramMap, "productName");
		String purpose = MapUtils.getString(paramMap, "purpose");
		Integer status = 0;
		if(user.getPost() == 0) {
			status = 2;
		}
		
		String sql = "select p from PurchaseApply p where p.status >= :STATUS ";
		String countSql = "select count(p) from PurchaseApply p where p.status >= :STATUS ";
		
		Map<String, Object> queryMap = new HashMap<>();
		queryMap.put("STATUS", status);
		
		if(StringUtils.isNotBlank(productName)) {
			sql += " and p.productName like :PRODUCTNAME";
			countSql += " and p.productName like :PRODUCTNAME";
			
			queryMap.put("PRODUCTNAME", productName);
		}
		
		if(StringUtils.isNotBlank(purpose)) {
			sql += " and p.purpose like :PURPOSE";
			countSql += " and p.purpose like :PURPOSE";
			
			queryMap.put("PURPOSE", purpose);
		}
		
		sql += " order by p.applyTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("applyList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void doTransSavePurchaseApply(PurchaseApply purchaseApply) {
		List<PurchaseDetail> detailList = purchaseApply.getDetailList();
		
		purchaseApply.setId(Generator.getUUID());
		purchaseApply.setDetailList(null);
		purchaseApply.setStatus(0);
		
		baseDao.save(purchaseApply);
		
		for (PurchaseDetail purchaseDetail : detailList) {
			purchaseDetail.setId(Generator.getUUID());
			purchaseDetail.setPurchaseApply(purchaseApply);
			
			String sql = "select p from ProductStoreItem p where p.productStore.id = :ID order by p.createTime";
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("ID", purchaseDetail.getProductStore().getId());
			
			List<ProductStoreItem> itemList = (List<ProductStoreItem>) baseDao.findObjectList(sql, paramMap);
			
			String value = "";
			for (ProductStoreItem item : itemList) {
				value += item.getPropertyName() + "-" + item.getPropertyValue();
			}
			purchaseDetail.setModel(value);
			baseDao.save(purchaseDetail);
		}
	}
	
	@Override
	public void doTransUpdatePurchaseApply(PurchaseApply purchaseApply) {
		List<PurchaseDetail> detailList = purchaseApply.getDetailList();
		
		PurchaseApply oldPurchaseApply = baseDao.findObject(PurchaseApply.class, purchaseApply.getId());
		
		for (PurchaseDetail purchaseDetail : oldPurchaseApply.getDetailList()) {
			baseDao.delete(purchaseDetail);
		}
		oldPurchaseApply.setApplyTime(purchaseApply.getApplyTime());
		oldPurchaseApply.setEndTime(purchaseApply.getEndTime());
		oldPurchaseApply.setProductName(purchaseApply.getProductName());
		oldPurchaseApply.setPurpose(purchaseApply.getPurpose());
		oldPurchaseApply.setAuditMsg(null);
		baseDao.update(oldPurchaseApply);
		
		
		for (PurchaseDetail purchaseDetail : detailList) {
			if(purchaseDetail == null){
				continue;
			}
			purchaseDetail.setId(Generator.getUUID());
			purchaseDetail.setPurchaseApply(oldPurchaseApply);
			
			ProductStore productStore = baseDao.findObject(ProductStore.class, purchaseDetail.getProductStore().getId());
			String value = "";
			
			for (ProductStoreItem item : productStore.getItemList()) {
				value += item.getPropertyName() + "-" + item.getPropertyValue();
			}
			purchaseDetail.setModel(value);
			baseDao.save(purchaseDetail);
		}
	}
	
	@Override
	public void doTransAuditPurchase(PurchaseAuditLog purchaseAuditLog) {
		PurchaseApply purchaseApply = baseDao.findObject(PurchaseApply.class, purchaseAuditLog.getPurchaseApply().getId());
		
		purchaseAuditLog.setId(Generator.getUUID());
		
		baseDao.save(purchaseAuditLog);
		
		Integer purchaseStatus = null;
		Integer auditStatus = 0;
		
		//判断用户权限是否为主任
		if(purchaseAuditLog.getUser().getPost() == 0 && purchaseAuditLog.getStatus() == 1) {//主任--通过
			purchaseStatus = 1;
			auditStatus = 3;
		} else if(purchaseAuditLog.getStatus() == 1){//一审通过
			auditStatus =2;
		}
		
		purchaseApply.setStatus(auditStatus);
		purchaseApply.setPurchaseStatus(purchaseStatus);
		purchaseApply.setAuditMsg(purchaseAuditLog.getAuditMsg());
		baseDao.update(purchaseApply);
		
		if(auditStatus == 3) {
			List<PurchaseDetail> detailList = purchaseApply.getDetailList();
			
			for (PurchaseDetail purchaseDetail : detailList) {
				purchaseDetail.setStatus(1);
				baseDao.update(purchaseDetail);
			}
		}
	}
	
	@Override
	public void doTransPlusStore(String id) {
		PurchaseDetail purchaseDetail = baseDao.findObject(PurchaseDetail.class, id);
		
		purchaseDetail.setStatus(2);
		baseDao.update(purchaseDetail);
		
		ProductStore productStore = purchaseDetail.getProductStore();
		
		productStore.setAmount(productStore.getAmount() + purchaseDetail.getAmount());
		
		baseDao.update(productStore);
		
		PurchaseApply apply = baseDao.findObject(PurchaseApply.class, purchaseDetail.getPurchaseApply().getId());
		
		List<PurchaseDetail> detaliList = apply.getDetailList();
		
		boolean flag = true;
		
		for (PurchaseDetail detail : detaliList) {
			if(detail.getStatus() != 2 || detail.getStatus() != 3) {
				flag = false;
			}
		}
		
		if(flag) {
			apply.setPurchaseStatus(2);
			apply.setEndTime(new Date());
			baseDao.update(apply);
		}
	}
	
	@Override
	public void doTransCancelDetail(String id) {
		PurchaseDetail purchaseDetail = baseDao.findObject(PurchaseDetail.class, id);
		purchaseDetail.setStatus(3);
		
		baseDao.update(purchaseDetail);
		
		PurchaseApply apply = baseDao.findObject(PurchaseApply.class, purchaseDetail.getPurchaseApply().getId());
		
		List<PurchaseDetail> detaliList = apply.getDetailList();
		
		boolean flag = true;
		
		for (PurchaseDetail detail : detaliList) {
			if(detail.getStatus() != 2 || detail.getStatus() != 3) {
				flag = false;
			}
		}
		
		if(flag) {
			apply.setPurchaseStatus(2);
			apply.setEndTime(new Date());
			baseDao.update(apply);
		}
	}
	
	@Override
	public PurchaseApply doTransFindPurchaseApplyById(String id) {
		String sql = "select p from PurchaseApply p left join fetch p.detailList where p.id = :ID";
		
		Map<String, Object> queryMap = new HashMap<>();
		queryMap.put("ID", id);
		
		PurchaseApply apply = baseDao.findObject(sql, queryMap);
		apply.getLogList();
		for (PurchaseDetail detail : apply.getDetailList()) {
			detail.getProductStore().getId();
			detail.getProductType().getTypeName();
		}
		return apply;
	}
	
	@Override
	public void doTransSubPurchaseApply(String id) {
		PurchaseApply purchaseApply = baseDao.findObject(PurchaseApply.class, id);
		
		purchaseApply.setStatus(1);
		baseDao.update(purchaseApply);
	}
	
	@Override
	public Map<String, Object> doJoinTransQueryDetail(Integer goPage, Map<String, Object> paramMap) {
		String typeid = MapUtils.getString(paramMap, "typeid");
		String purpose = MapUtils.getString(paramMap, "purpose");
		
		String sql = "select p from PurchaseDetail p left join fetch p.purchaseApply left join fetch p.productType where 1=1 ";
		String countSql = "select count(p) from PurchaseDetail p where 1=1 ";
		
		Map<String, Object> queryMap = new HashMap<>();
		
		if(StringUtils.isNotBlank(typeid)) {
			sql += " and p.productType.id = :TYPEID";
			countSql += " and p.productType.id = :TYPEID";
			
			queryMap.put("TYPEID", typeid);
		}
		
		if(StringUtils.isNotBlank(purpose)) {
			sql += " and p.purchaseApply.purpose like :PURPOSE";
			countSql += " and p.purchaseApply.purpose like :PURPOSE";
			
			queryMap.put("PURPOSE", purpose);
		}
		
		sql += " order by p.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("detailList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}
	
	@Override
	public PurchaseDetail doJoinTransPurchaseDetailById(String id) {
		String sql = "select p from PurchaseDetail p left join fetch p.purchaseApply left join fetch p.productType where p.id = :ID ";
		
		Map<String, Object> queryMap = new HashMap<>();
		queryMap.put("ID", id);
		
		return baseDao.findObject(sql, queryMap);
	}
	
	@Override
	public void doTransUpdatePurchaseDetail(String id, int amount) {
		PurchaseDetail detail = baseDao.findObject(PurchaseDetail.class, id);
		detail.setAmount(amount);
		
		baseDao.update(detail);
	}
}
