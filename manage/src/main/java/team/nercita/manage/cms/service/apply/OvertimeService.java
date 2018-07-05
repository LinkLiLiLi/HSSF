/*
 * OvertimeService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月13日 上午10:29:48
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply;

import java.util.Map;

import team.nercita.manage.cms.po.form.ApplyOvertime;

/**
 * 加班service
 * @author L
 * @date 2017年8月13日 上午10:29:48
 */
public interface OvertimeService {
	public Map<String, Object> doJoinTransFindApplyOvertimeList(Integer goPage, Map<String, Object> paramMap);
	 
	public void doTransSaveApplyOvertime(ApplyOvertime applyOvertime);

	public ApplyOvertime doJoinTransFindApplyOvertime(String id);
	 
	public void doTransUpdateApplyOvertime(ApplyOvertime applyOvertime);
}
