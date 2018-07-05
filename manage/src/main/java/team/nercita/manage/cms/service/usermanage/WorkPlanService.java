/*
 * WorkPlanService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月16日 下午3:24:41
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage;

import java.util.Date;
import java.util.List;
import java.util.Map;

import team.nercita.manage.cms.model.WorkPlanVo;
import team.nercita.manage.cms.po.deptmanage.PlanLog;
import team.nercita.manage.cms.po.deptmanage.WorkPlan;

/**
 *
 * @author L
 * @date 2017年7月16日 下午3:24:41
 */
public interface WorkPlanService {
	
	public Map<String, Object> doJoinTransFindWorkPlan(Integer goPage, Map<String, Object> paramMap);
	
	public void doTransSaveWorkPlan(WorkPlan workPlan);
	
	public WorkPlan doJoinTransFindWorkPlanById(String id);
	
	public void doJoinTransUpdateWorkPlan(WorkPlan workPlan);
	
	public void doJoinTransCheckWorkPlan(WorkPlan workPlan);
	
	public List<WorkPlan> doJoinTransFindWorkPlanList(String userId, Date beginDate, Date endDate);
	
	public void doTransSavePlanLog(PlanLog planLog);
	
	public List<WorkPlanVo> doJoinTransFindWorkPlan(String userId, int startIndex, int maxResult);
	
	public List<PlanLog> doJoinTransQeuryLogById(String id);
}
