/*
 * ReimbursementService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月8日 上午11:33:01
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply;

import java.util.List;
import java.util.Map;

import team.nercita.manage.cms.po.form.ApplyReimbursement;
import team.nercita.manage.cms.po.form.ReimbursementDetail;

/**
 *
 * @author L
 * @date 2017年11月8日 上午11:33:01
 */
public interface ReimbursementService {
	public Map<String, Object> doJoinTransFindApplyReimbursementList(Integer goPage, Map<String, Object> paramMap);
	 
	 public void doTransSaveApplyReimbursement(ApplyReimbursement applyReimbursement , List<ReimbursementDetail> detailList);
	 
	 public Map<String, Object> doJoinTransFindApplyReimbursement(String id);
	 
	 public ApplyReimbursement doJoinTransFindApplyReimbursementById(String id);
	 
	 public void doTransApplyAudit(String id, int status);
	 
	 public void doTransUpdateApplyReimbursement(ApplyReimbursement applyReimbursement,List<ReimbursementDetail> detailList);
}
