/*
 * ChequeService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月8日 上午11:33:01
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply;

import java.util.Map;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.form.ApplyCheque;

/**
 *
 * @author L
 * @date 2017年11月8日 上午11:33:01
 */
public interface ChequeService {
	public Map<String, Object> doJoinTransFindApplyChequeList(Integer goPage, Map<String, Object> paramMap);
	 
	 public void doTransSaveApplyCheque(ApplyCheque applyCheque, User user);
	 
	 public ApplyCheque doJoinTransFindApplyCheque(String id);
	 
	 public ApplyCheque doJoinTransFindApplyChequeById(String id);
	 
	 public void doTransUpdateApplyCheque(ApplyCheque applyCheque, User user);
	 
	 public void doTransApplyAudit(String id, int status);
}
