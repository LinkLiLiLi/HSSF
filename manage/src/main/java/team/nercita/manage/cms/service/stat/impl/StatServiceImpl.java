/*
 * StatServiceImpl.java
 * 创建者：L
 * 创建日期：2018年1月9日 下午5:35:34
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.stat.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joda.time.DateTime;

import team.nercita.manage.cms.po.deptmanage.AttendanceGroup;
import team.nercita.manage.cms.po.deptmanage.AttendanceStat;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.sign.Attendance;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.stat.StatService;
import team.nercita.manage.cms.util.Generator;

/**
 * 
 * @author L
 * @date： 2018年1月9日 下午5:35:34
 */
public class StatServiceImpl extends BaseService implements StatService {
	@SuppressWarnings("unchecked")
	@Override
	public void doTransSaveStat() {
		Date date  = DateTime.parse(DateTime.now().minusDays(1).toString("yyyy-MM-dd")).toDate();
		
		String sql = "select a from AttendanceGroup a left join fetch a.user where a.user.useStatus = :USERSTATUS";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("USERSTATUS", User.UseStatus.normal.getValue());
		
		List<AttendanceGroup> groupList = (List<AttendanceGroup>) baseDao.findObjectList(sql, queryMap);
		
		for (AttendanceGroup attendanceGroup : groupList) {
			sql = "select a from AttendanceStat a where a.user.id = :USERID and a.statTime = :STATTIME";
			
			queryMap.clear();
			queryMap.put("USERID", attendanceGroup.getUser().getId());
			queryMap.put("STATTIME", date);
			
			AttendanceStat attendanceStat = baseDao.findObject(sql, queryMap);
			
			if(attendanceStat == null) {
				attendanceStat = new AttendanceStat();
				attendanceStat.setId(Generator.getUUID());
				attendanceStat.setUser(attendanceGroup.getUser());
				attendanceStat.setStatTime(date);
				attendanceStat.setKuanggong(1);
				
				baseDao.save(attendanceStat);
			} else {
				//1：查看考勤
				sql = "select a from Attendance a where a.attendanceTime >= :NOWDATE and a.user.id = :USERID";
				queryMap.clear();
				queryMap.put("NOWDATE", date);
				queryMap.put("USERID", attendanceGroup.getUser().getId());
				
				List<Attendance> attendanceList = (List<Attendance>) baseDao.findObjectList(sql, queryMap);
				
				if(attendanceList == null) {
					continue;
				} else if(attendanceList != null && !attendanceList.isEmpty()) {
					if(attendanceList.size() == 1) {
						
						String attTimeStr = new SimpleDateFormat("HH:mm:ss").format(attendanceList.get(0).getAttendanceTime());
						Date attTime = null;
						try {
							attTime = new SimpleDateFormat("HH:mm:ss").parse(attTimeStr);
						} catch (Exception e) {
						}
						
						if(attTime.before(attendanceGroup.getAttendanceSet().getStartTime())) {
							attendanceStat.setZaodaka(0);
							attendanceStat.setWandaka(1);
						} else if(attTime.after(attendanceGroup.getAttendanceSet().getEndTime())) {
							attendanceStat.setZaodaka(1);
							attendanceStat.setWandaka(0);
						} else {
							attendanceStat.setZaodaka(1);
							attendanceStat.setWandaka(1);
						}
						baseDao.update(attendanceStat);
					} else {
						for (Attendance attendance : attendanceList) {
							String attTimeStr = new SimpleDateFormat("HH:mm:ss").format(attendanceList.get(0).getAttendanceTime());
							Date attTime = null;
							try {
								attTime = new SimpleDateFormat("HH:mm:ss").parse(attTimeStr);
							} catch (Exception e) {
							}
							
							if(attendance.getTimes() == 1) {
								if(attTime.before(attendanceGroup.getAttendanceSet().getStartTime())) {
									attendanceStat.setZaodaka(0);
								} else {
									attendanceStat.setZaodaka(1);
								}
							}
							if(attendance.getTimes() == 2) {
								if(attTime.after(attendanceGroup.getAttendanceSet().getEndTime())) {
									attendanceStat.setWandaka(0);
								} else {
									attendanceStat.setWandaka(1);
								}
							}
						}
						baseDao.update(attendanceStat);
					}
				}
			}
		}
	}
}
