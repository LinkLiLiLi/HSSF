/*
 * WorkPlanServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月16日 下午3:25:32
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.model.WorkPlanVo;
import team.nercita.manage.cms.po.deptmanage.PlanLog;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.deptmanage.WorkPlan;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.usermanage.WorkPlanService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年7月16日 下午3:25:32
 */
@Component
public class WorkPlanServiceImpl extends BaseService implements WorkPlanService {

	@Override
	public Map<String, Object> doJoinTransFindWorkPlan(Integer goPage, Map<String, Object> paramMap) {
		String userId = MapUtils.getString(paramMap, "userId");
		String ownId = MapUtils.getString(paramMap, "ownId");
		String content = MapUtils.getString(paramMap, "content");
		String userName = MapUtils.getString(paramMap, "userName");
		Date startTime = (Date) paramMap.get("startTime");
		Date endTime = (Date) paramMap.get("endTime");
		Integer status = MapUtils.getInteger(paramMap, "status");
		
		String sql = "select  wp from WorkPlan wp left join fetch wp.user left join fetch wp.userGroup left join fetch wp.distUser left join fetch wp.logList where (wp.user.id = :OWNID or wp.distUser.id = :OWNID) ";
		String countsql = "select count(wp) from WorkPlan wp where (wp.user.id = :OWNID or wp.distUser.id = :OWNID)  ";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("OWNID", ownId);
		
		if(StringUtils.isNotBlank(userId)){
			sql += " and wp.user.id = :USERID";
			countsql += " and wp.user.id = :USERID";
			queryMap.put("USERID", userId);
		}
		
		if(StringUtils.isNotBlank(content)){
			sql += " and wp.content like :CONTENT";
			countsql += " and wp.content like :CONTENT";
			queryMap.put("CONTENT", "%" + content + "%");
		}
		
		if(StringUtils.isNotBlank(userName)) {
			sql += " and wp.user.name like :USERNAME";
			countsql += " and wp.user.name like :USERNAME";
			queryMap.put("USERNAME", "%" + userName + "%");
		}
		
		if(startTime != null) {
			sql += " and wp.endTime >= :STARTTIME";
			countsql += " and wp.endTime >= :STARTTIME";
			
			queryMap.put("STARTTIME", startTime);
		}
		
		if(endTime != null) {
			sql += " and wp.beginTime <= :ENDTIME";
			countsql += " and wp.beginTime <= :ENDTIME";
			
			queryMap.put("ENDTIME", endTime);
		}
		
		Date nowDate = new Date();
		
		if(status != null) {
			if(status == 1) {
				sql += " and wp.beginTime >= :NOWDATE";
				countsql += " and wp.beginTime >= :NOWDATE";
				
				queryMap.put("NOWDATE", nowDate);
			} else if(status == 2) {
				sql += " and wp.beginTime <= :NOWDATE and wp.endTime >= :NOWDATE";
				countsql += " and wp.beginTime <= :NOWDATE and wp.endTime >= :NOWDATE";
				
				queryMap.put("NOWDATE", nowDate);
				
			} else if (status == 3) {
				sql += " and wp.endTime <= :NOWDATE and wp.evaluate <> 0";
				countsql += " and wp.endTime <= :NOWDATE and wp.evaluate <> 0";
				
				queryMap.put("NOWDATE", nowDate);
			} else if (status == 4){
				sql += " and wp.evaluate = 0";
				countsql += " and wp.evaluate = 0";
			}
		}
		
		
		sql += " order by wp.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countsql, queryMap), goPage));
		paramMap.put("workPlanList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}
	
	@Override
	public void doTransSaveWorkPlan(WorkPlan workPlan) {
		User user = baseDao.findObject(User.class, workPlan.getUser().getId());
		
		workPlan.setId(Generator.getUUID());
		workPlan.setUserGroup(user.getUserGroup());
		workPlan.setSetbacks(0);
		workPlan.setEvaluate(1);
		baseDao.save(workPlan);
	}
	
	@Override
	public WorkPlan doJoinTransFindWorkPlanById(String id) {
		String sql = "select w from WorkPlan w left join fetch w.user left join fetch w.distUser left join fetch w.logList where w.id = :WORKPLANID";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("WORKPLANID", id);
		
		return baseDao.findObject(sql, queryMap);
	}
	
	@Override
	public void doJoinTransUpdateWorkPlan(WorkPlan workPlan) {
		
		WorkPlan oldWorkPlan = baseDao.findObject(WorkPlan.class, workPlan.getId());
		
		oldWorkPlan.setBeginTime(workPlan.getBeginTime());
		oldWorkPlan.setEndTime(workPlan.getEndTime());
		oldWorkPlan.setContent(workPlan.getContent());
		
		baseDao.update(oldWorkPlan);
	}
	
	@Override
	public void doJoinTransCheckWorkPlan(WorkPlan workPlan) {
		WorkPlan oldWorkPlan = baseDao.findObject(WorkPlan.class, workPlan.getId());
		
		oldWorkPlan.setEvaluate(workPlan.getEvaluate());
		
		baseDao.update(oldWorkPlan);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<WorkPlan> doJoinTransFindWorkPlanList(String userId, Date beginDate, Date endDate) {
		String sql = "select w from WorkPlan w left join fetch w.user left join fetch w.userGroup left join fetch w.distUser where w.user.id = :USERID and (w.beginTime between :BEGINDATE and :ENDDATE or w.endTime between :BEGINDATE and :ENDDATE)";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("USERID", userId);
		queryMap.put("BEGINDATE", beginDate);
		queryMap.put("ENDDATE", endDate);
		
		return (List<WorkPlan>) baseDao.findObjectList(sql, queryMap);
	}
	
	@Override
	public void doTransSavePlanLog(PlanLog planLog) {
		WorkPlan workPlan = baseDao.findObject(WorkPlan.class, planLog.getWorkPlan().getId());
		workPlan.setLastProgress(planLog.getProgress());
		baseDao.update(workPlan);
		
		planLog.setId(Generator.getUUID());
		baseDao.save(planLog);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<WorkPlanVo> doJoinTransFindWorkPlan(String userId, int startIndex, int maxResult) {
		String sql = "select w from WorkPlan w where w.user.id = :USERID and (w.evaluate is null or w.evaluate = 1) order by w.createTime desc";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("USERID", userId);
		
		List<WorkPlan> planList = (List<WorkPlan>) baseDao.findObjectList(sql, queryMap, startIndex, maxResult);
		List<WorkPlanVo> voList = new ArrayList<>();
		
		if(planList != null && !planList.isEmpty()) {
			for (WorkPlan workPlan : planList) {
				WorkPlanVo vo = new WorkPlanVo();
				vo.setContent(workPlan.getContent());
				vo.setStartDate(workPlan.getBeginTime());
				vo.setEndDate(workPlan.getEndTime());
				vo.setStatus(workPlan.getStatus());
				
				voList.add(vo);
			}
		}
		
		return voList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PlanLog> doJoinTransQeuryLogById(String id) {
		String sql = "select p from PlanLog p where p.workPlan.id = :PLANID order by p.createTime desc";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("PLANID", id);
		
		return (List<PlanLog>) baseDao.findObjectList(sql, queryMap);
	}
}
