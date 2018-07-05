/*
 * UseCardService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月6日 下午12:13:46
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply;

import java.util.Map;

import team.nercita.manage.cms.po.form.ApplyLeave;

/**
 *
 * @author L
 * @date 2017年8月6日 下午12:13:46
 */
public interface LeaveService {
	 public Map<String, Object> doJoinTransFindApplyLeaveList(Integer goPage, Map<String, Object> paramMap);
	 
	 public void doTransSaveApplyLeave(ApplyLeave applyLeave);
	 
	 public ApplyLeave doJoinTransFindApplyLeave(String id);
	 
	 public void doTransUpdateApplyLeave(ApplyLeave applyLeave);
}
