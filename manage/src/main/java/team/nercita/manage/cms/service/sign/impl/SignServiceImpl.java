/*
 * SignServiceImpl.java
 * 创建者：L
 * 创建日期：2017年12月18日 下午3:54:29
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.sign.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joda.time.DateTime;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.deptmanage.AttendanceGroup;
import team.nercita.manage.cms.po.deptmanage.AttendanceStat;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.sign.Absent;
import team.nercita.manage.cms.po.sign.Attendance;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.sign.SignService;
import team.nercita.manage.cms.util.Generator;

/**
 * 
 * @author L
 * @date： 2017年12月18日 下午3:54:29
 */
@Component
public class SignServiceImpl extends BaseService implements SignService {
	@SuppressWarnings("unchecked")
	@Override
	public void doTransSaveSign(User user, String addr) {
		String sql = "select a from Attendance a where a.attendanceTime >= :NOWDATE and a.user.id = :USERID";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("NOWDATE", DateTime.parse(DateTime.now().toString("yyyy-MM-dd")).toDate());
		queryMap.put("USERID", user.getId());
		
		List<Attendance> attendanceList = (List<Attendance>) baseDao.findObjectList(sql, queryMap);
		
		int times = 1;
		if(attendanceList != null && attendanceList.size() >= 1) {
			times = 2;
			for (Attendance attendance : attendanceList) {
				if(attendance.getTimes() != 1) {
					baseDao.delete(attendance);
				}
			}
		}
		
		Date nowDate = new Date();
		
		Attendance attendance = new Attendance();
		attendance.setId(Generator.getUUID());
		attendance.setUser(user);
		attendance.setAddr(addr);
		attendance.setTimes(times);
		attendance.setAttendanceTime(nowDate);
		
		baseDao.save(attendance);
		
		sql = "select a from AttendanceGroup a where a.user.id = :USERID and a.user.useStatus = :USESTATUS";
		
		queryMap.clear();
		queryMap.put("USERID", user.getId());
		queryMap.put("USESTATUS", User.UseStatus.normal.getValue());
		
		AttendanceGroup group = baseDao.findObject(sql, queryMap);
		
		if(group != null && times == 1) {//在考勤组内
			sql = "select a from AttendanceStat a where a.user.id = :USERID and a.statTime = :STATTIME";
			
			queryMap.clear();
			queryMap.put("USERID", user.getId());
			queryMap.put("STATTIME", DateTime.parse(DateTime.now().toString("yyyy-MM-dd")).toDate());
			
			AttendanceStat attendanceStat = baseDao.findObject(sql, queryMap);
			
			String attTimeStr = new SimpleDateFormat("HH:mm:ss").format(attendance.getAttendanceTime());
			Date attTime = null;
			try {
				attTime = new SimpleDateFormat("HH:mm:ss").parse(attTimeStr);
			} catch (Exception e) {
			}
			
			if(attendanceStat == null) {
				Date startTime = group.getAttendanceSet().getStartTime();
				attendanceStat = new AttendanceStat();
				attendanceStat.setId(Generator.getUUID());
				attendanceStat.setUser(user);
				attendanceStat.setStatTime(nowDate);
				
				if(attTime.before(startTime)) {
					attendanceStat.setZaodaka(0);//正常
				} else {
					attendanceStat.setZaodaka(1);//异常
				}
				
				baseDao.save(attendanceStat);
			} else {
				if(attendanceStat.getZaodaka() != null) {
					Date endTime = group.getAttendanceSet().getEndTime();
					if(attTime.after(endTime)) {
						attendanceStat.setZaodaka(0);//正常
					} else {
						attendanceStat.setZaodaka(1);//异常
					}
				}
				baseDao.update(attendanceStat);
			}
		}
	}
	
	@Override
	public void doTransSaveAbsent(User user, String reason, int absentType, Date startTime, Date endTime, String duration) {
		Absent absent = new Absent();
		absent.setId(Generator.getUUID());
		absent.setAbsentType(absentType);
		absent.setStartTime(startTime);
		absent.setEndTime(endTime);
		absent.setReason(reason);
		absent.setUser(user);
		absent.setDuration(duration);
		
		baseDao.save(absent);
		
		String sql = "select a from AttendanceGroup a where a.user.id = :USERID and a.user.useStatus = :USESTATUS";
		
		Map<String, Object> queryMap = new HashMap<>();
		queryMap.put("USERID", user.getId());
		queryMap.put("USESTATUS", User.UseStatus.normal.getValue());
		
		AttendanceGroup group = baseDao.findObject(sql, queryMap);
		
		if(group != null) {//在考勤组内
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			List<Date> dateList = getDate(df.format(startTime), df.format(endTime));
			
			for (Date date : dateList) {
				sql = "select a from AttendanceStat a where a.user.id = :USERID and a.statTime = :STATTIME";
				
				queryMap.clear();
				queryMap.put("USERID", user.getId());
				queryMap.put("STATTIME", date);
				
				AttendanceStat attendanceStat = baseDao.findObject(sql, queryMap);
				
				if(attendanceStat != null) {
					if(absentType == 1) {
						attendanceStat.setQingjia(1);
					} else if(absentType == 2) {
						attendanceStat.setWaichu(1);
					} else if(absentType == 3) {
						attendanceStat.setChuchai(1);
					} else if(absentType == 4) {
						attendanceStat.setJiaban(1);
					}
					
					baseDao.update(attendanceStat);
				} else {
					attendanceStat = new AttendanceStat();
					attendanceStat.setId(Generator.getUUID());
					attendanceStat.setStatTime(date);
					attendanceStat.setUser(user);
					if(absentType == 1) {
						attendanceStat.setQingjia(1);
					} else if(absentType == 2) {
						attendanceStat.setWaichu(1);
					} else if(absentType == 3) {
						attendanceStat.setChuchai(1);
					} else if(absentType == 4) {
						attendanceStat.setJiaban(1);
					}
					
					baseDao.save(attendanceStat);
				}
			}
		}
	}
	
	private List<Date> getDate(String startDate, String endDate){
		List<Date> resultList = new ArrayList<>();
		long startTime = DateTime.parse(startDate).toDate().getTime();
		long endTime = DateTime.parse(endDate).toDate().getTime();
		
		if(startTime == endTime) {
			resultList.add(new Date(startTime));
		} else {
			boolean flag = true;
			while (flag){
				if(startTime < endTime){
					resultList.add(new Date(startTime));
					startTime += 24 * 60 * 60 * 1000;
				} else {
					resultList.add(new Date(startTime));
					flag = false;
				}
			}
		}
		
		return resultList;
	}
	
}
