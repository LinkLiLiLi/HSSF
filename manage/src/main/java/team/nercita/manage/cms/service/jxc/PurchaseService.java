/*
 * PurchaseService.java
 * 创建者：L
 * 创建日期：2017年12月22日 上午10:02:41
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.jxc;

import java.util.Map;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.jxc.PurchaseApply;
import team.nercita.manage.cms.po.jxc.PurchaseAuditLog;
import team.nercita.manage.cms.po.jxc.PurchaseDetail;

/**
 * 
 * @author L
 * @date： 2017年12月22日 上午10:02:41
 */
public interface PurchaseService {
	/**
	 * 查询列表
	 * @param goPage
	 * @param user
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> doJoinTransFindStoreList(Integer goPage, User user, Map<String, Object> paramMap);
	
	/**
	 * 保存采购申请
	 * @param purchaseApply
	 */
	public void doTransSavePurchaseApply(PurchaseApply purchaseApply);
	
	/**
	 * 修改采购申请
	 * @param purchaseApply
	 */
	public void doTransUpdatePurchaseApply(PurchaseApply purchaseApply);
	
	/**
	 * 审核采购单
	 * @param id
	 * @param status
	 * @param auditMsg
	 * @param user
	 */
	public void doTransAuditPurchase(PurchaseAuditLog purchaseAuditLog);
	
	/**
	 * 确认入库
	 * @param id
	 */
	public void doTransPlusStore(String id);
	
	public void doTransCancelDetail(String id);
	/**
	 * 查询申请单
	 * @param id
	 * @return
	 */
	public PurchaseApply doTransFindPurchaseApplyById(String id);
	
	public void doTransSubPurchaseApply(String id);
	
	/**
	 * 查询订单信息
	 * @param goPage
	 * @param user
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> doJoinTransQueryDetail(Integer goPage, Map<String, Object> paramMap);
	
	public PurchaseDetail doJoinTransPurchaseDetailById(String id);
	
	public void doTransUpdatePurchaseDetail(String id, int amount);
}
