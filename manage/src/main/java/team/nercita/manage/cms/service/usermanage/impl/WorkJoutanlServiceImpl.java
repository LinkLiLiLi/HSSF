/*
 * WorkJoutanlServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月19日 下午8:48:03
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joda.time.DateTime;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.model.WorkJoutanlVo;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.deptmanage.WorkJoutanl;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.usermanage.WorkJoutanlService;
import team.nercita.manage.cms.util.Generator;

/**
 *
 * @author L
 * @date 2017年7月19日 下午8:48:03
 */
@Component
public class WorkJoutanlServiceImpl extends BaseService implements WorkJoutanlService {

	@SuppressWarnings("unchecked")
	@Override
	public List<WorkJoutanl> doJoinTransFindWorkJoutanl(String userId, Date startDate, Date endDate) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String sql = null;
		if (startDate.getTime()== endDate.getTime()) {
			 sql="select w from WorkJoutanl w left join fetch w.user where w.joutanlDate >= :STARTDATE and w.joutanlDate <= :ENDDATE order by w.user.post";
			paramMap.put("STARTDATE", startDate);
			paramMap.put("ENDDATE", endDate);
			return (List<WorkJoutanl>) baseDao.findObjectList(sql, paramMap);
		}
		 sql = "select w from WorkJoutanl w left join fetch w.user where w.user.id = :USERID and w.joutanlDate >= :STARTDATE and w.joutanlDate <= :ENDDATE order by w.joutanlDate desc";
		
		
		paramMap.put("USERID", userId);
		paramMap.put("STARTDATE", startDate);
		paramMap.put("ENDDATE", endDate);
		
		return (List<WorkJoutanl>) baseDao.findObjectList(sql, paramMap);
	}
	
	
	@Override
	public void doTransSaveWorkJoutanl(WorkJoutanl workJoutanl) {
		workJoutanl.setId(Generator.getUUID());
		baseDao.save(workJoutanl);
	}
	
	@Override
	public WorkJoutanl doJoinTransFindWorkJoutanlById(String id) {
		return baseDao.findObject(WorkJoutanl.class, id);
	}
	
	@Override
	public void doTransUpdateWorkJoutanl(WorkJoutanl workJoutanl) {
		WorkJoutanl joutanl = baseDao.findObject(WorkJoutanl.class, workJoutanl.getId());
		joutanl.setWorkContent(workJoutanl.getWorkContent());
		baseDao.update(joutanl);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<WorkJoutanlVo> doJoinTransFindWorkJoutanlApp(String userId, int startIndex, int maxResult) {
		String sql = "select w from WorkJoutanl w where w.user.id = :USERID order by w.joutanlDate desc";
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("USERID", userId);
		
		List<WorkJoutanl> joutanlList = (List<WorkJoutanl>) baseDao.findObjectList(sql, paramMap,startIndex,maxResult);
		
		List<WorkJoutanlVo> voList = new ArrayList<>();
		
		if(joutanlList != null && !joutanlList.isEmpty()) {
			for (WorkJoutanl workJoutanl : joutanlList) {
				WorkJoutanlVo vo = new WorkJoutanlVo();
				vo.setJoutanlDate(workJoutanl.getJoutanlDate());
				vo.setContent(workJoutanl.getWorkContent());
				vo.setTitile(getDayOfWeek(workJoutanl.getJoutanlDate()));
				vo.setId(workJoutanl.getId());
				voList.add(vo);
			}
		}
		
		return voList;
	}
	
	@Override
	public WorkJoutanl doJoinTransFindCurrDayWorkJoutanl(String userid) {
		String sql = "select w from WorkJoutanl w where w.user.id = :USERID and w.joutanlDate >= :STARTDATE and w.joutanlDate < :ENDDATE";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("USERID", userid);
		paramMap.put("STARTDATE", DateTime.parse(DateTime.now().toString("yyyy-MM-dd")).toDate());
		paramMap.put("ENDDATE", DateTime.parse(DateTime.now().plusDays(1).toString("yyyy-MM-dd")).toDate());
		
		return baseDao.findObject(sql, paramMap);
	}
	
	@Override
	public WorkJoutanl doJoinTransFindDayWorkJoutanl(String userid, Date joutanlDate) {
		String sql = "select w from WorkJoutanl w where w.user.id = :USERID and w.joutanlDate >= :STARTDATE and w.joutanlDate < :ENDDATE";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("USERID", userid);
		paramMap.put("STARTDATE", joutanlDate);
		paramMap.put("ENDDATE", DateTime.parse(new SimpleDateFormat("yyyy-MM-dd").format(joutanlDate)).plusDays(1).toDate());
		
		return baseDao.findObject(sql, paramMap);
	}
	
	public String getDayOfWeek(Date date) {
		String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		int day = calendar.get(Calendar.DAY_OF_WEEK);
		
		return weekDays[day - 1];
	}


	
}
