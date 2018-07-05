/*
 * CommonServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2018年1月7日 上午8:07:08
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.common.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.form.ApplyChequeDetail;
import team.nercita.manage.cms.po.form.ExpertFeeDetail;
import team.nercita.manage.cms.po.form.ReimbursementDetail;
import team.nercita.manage.cms.po.form.RemunerationDetail;
import team.nercita.manage.cms.po.form.StorageItem;
import team.nercita.manage.cms.po.jxc.ConsumeItem;
import team.nercita.manage.cms.po.jxc.PurchaseAuditLog;
import team.nercita.manage.cms.po.jxc.PurchaseDetail;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.common.CommonService;

/**
 *
 * @author L
 * @date 2018年1月7日 上午8:07:08
 */
@Component
public class CommonServiceImpl extends BaseService implements CommonService{
	@SuppressWarnings("unchecked")
	@Override
	public void doTransCommonDel(String id, String entry) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if("ApplyStorage".equals(entry)) {
			String sql = "select a from StorageItem a where a.applyStorage.id = :ID";
			paramMap.put("ID", id);
			
			List<StorageItem> itemList = (List<StorageItem>) baseDao.findObjectList(sql, paramMap);
			if(itemList != null && !itemList.isEmpty()) {
				for (StorageItem storageItem : itemList) {
					baseDao.delete(storageItem);
				}
			}
		} else if("ApplyRemuneration".equals(entry)) {
			String sql = "select a from RemunerationDetail a where a.applyRemuneration.id = :ID";
			paramMap.put("ID", id);
			
			List<RemunerationDetail> itemList = (List<RemunerationDetail>) baseDao.findObjectList(sql, paramMap);
			if(itemList != null && !itemList.isEmpty()) {
				for (RemunerationDetail storageItem : itemList) {
					baseDao.delete(storageItem);
				}
			}
		} else if("ApplyReimbursement".equals(entry)){
			String sql = "select a from ReimbursementDetail a where a.applyReimbursement.id = :ID";
			paramMap.put("ID", id);
			
			List<ReimbursementDetail> itemList = (List<ReimbursementDetail>) baseDao.findObjectList(sql, paramMap);
			if(itemList != null && !itemList.isEmpty()) {
				for (ReimbursementDetail storageItem : itemList) {
					baseDao.delete(storageItem);
				}
			}
		} else if("ApplyExpertFee".equals(entry)) {
			String sql = "select a from ExpertFeeDetail a where a.applyExpertFee.id = :ID";
			paramMap.put("ID", id);
			
			List<ExpertFeeDetail> itemList = (List<ExpertFeeDetail>) baseDao.findObjectList(sql, paramMap);
			if(itemList != null && !itemList.isEmpty()) {
				for (ExpertFeeDetail storageItem : itemList) {
					baseDao.delete(storageItem);
				}
			}
		} else if("ApplyCheque".equals(entry)) {
			String sql = "select a from ApplyChequeDetail a where a.applyCheque.id = :ID";
			paramMap.put("ID", id);
			
			List<ApplyChequeDetail> itemList = (List<ApplyChequeDetail>) baseDao.findObjectList(sql, paramMap);
			if(itemList != null && !itemList.isEmpty()) {
				for (ApplyChequeDetail storageItem : itemList) {
					baseDao.delete(storageItem);
				}
			}
		} else if("PurchaseApply".equals(entry)) {
			String sql = "select a from PurchaseDetail a where a.purchaseApply.id = :ID";
			paramMap.put("ID", id);
			
			List<PurchaseDetail> itemList = (List<PurchaseDetail>) baseDao.findObjectList(sql, paramMap);
			if(itemList != null && !itemList.isEmpty()) {
				for (PurchaseDetail storageItem : itemList) {
					baseDao.delete(storageItem);
				}
			}
			
			sql = "select a from PurchaseAuditLog a where a.purchaseApply.id = :ID";
			
			List<PurchaseAuditLog> logItemList = (List<PurchaseAuditLog>) baseDao.findObjectList(sql, paramMap);
			if(logItemList != null && !logItemList.isEmpty()) {
				for (PurchaseAuditLog storageItem : logItemList) {
					baseDao.delete(storageItem);
				}
			}
		} else if("Production".equals(entry)) {
			String sql = "select a from ConsumeItem a where a.production.id = :ID";
			paramMap.put("ID", id);
			
			List<ConsumeItem> itemList = (List<ConsumeItem>) baseDao.findObjectList(sql, paramMap);
			if(itemList != null && !itemList.isEmpty()) {
				for (ConsumeItem storageItem : itemList) {
					baseDao.delete(storageItem);
				}
			}
		}
		
		String sql = "select a from "+entry+" a where a.id = :ID";
		paramMap.clear();
		paramMap.put("ID", id);
		Object obj = baseDao.findObject(sql, paramMap);
		baseDao.delete(obj);
	}
}
