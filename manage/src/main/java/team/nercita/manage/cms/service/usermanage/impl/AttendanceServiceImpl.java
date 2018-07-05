/*
 * AttendanceServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月16日 下午8:38:50
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.deptmanage.AttendanceGroup;
import team.nercita.manage.cms.po.deptmanage.AttendanceSet;
import team.nercita.manage.cms.po.deptmanage.AttendanceStat;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.usermanage.AttendanceService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.vo.AbsentVo;
import team.nercita.manage.cms.vo.AttendanceVo;

/**
 *
 * @author L
 * @date 2017年7月16日 下午8:38:50
 */
@Component
public class AttendanceServiceImpl extends BaseService implements AttendanceService {
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AbsentVo> doJoinTransFindAbsent(Date date) {

		String sql = "select count(a) from AttendanceGroup a where a.user.useStatus = :USESTATUS";
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("USESTATUS", User.UseStatus.normal.getValue());
		
		int count = baseDao.queryObjectCount(sql, paramMap);
		
		if(count == 0) {
			return null;
		}
		
		sql = "select count(a) from AttendanceStat a where a.statTime = :NOWDATE";
		
		paramMap.clear();
		paramMap.put("NOWDATE", date);
		
		int num = baseDao.queryObjectCount(sql, paramMap);
		
		List<AbsentVo> voList = new ArrayList<>();
		
		List<AttendanceGroup> groupList = doJoinTransQueryGroup();
		
		if(num == 0) {
			for (AttendanceGroup group : groupList) {
				AbsentVo vo = new AbsentVo();
				vo.setUsername(group.getUser().getName());
				vo.setReason("未打卡");
				voList.add(vo);
			}
			return voList;
		}
		
		sql = "select a from AttendanceStat a left join fetch a.user where a.statTime = :NOWDATE";
		
		List<AttendanceStat> statList = (List<AttendanceStat>) baseDao.findObjectList(sql, paramMap);
		Map<String, String> alMap = new HashMap<>();
		
		for (AttendanceStat attendanceStat : statList) {
			alMap.put(attendanceStat.getUser().getId(), attendanceStat.getUser().getName());
			AbsentVo vo = new AbsentVo();
			vo.setUsername(attendanceStat.getUser().getName());
			
			if(attendanceStat.getZaodaka() != null && 1 == attendanceStat.getZaodaka()) {
				vo.setReason("异常");
			}
			
			if(attendanceStat.getQingjia() != null && 1 == attendanceStat.getQingjia()) {
				vo.setReason("请假");
			}
			if(attendanceStat.getWaichu() != null && 1 == attendanceStat.getWaichu()) {
				vo.setReason("外出");
			}
			if(attendanceStat.getChuchai() != null && 1 == attendanceStat.getChuchai()) {
				vo.setReason("出差");
			}
			if(StringUtils.isNotBlank(vo.getReason())) {
				voList.add(vo);
			}
		}
		
		for (AttendanceGroup attendanceGroup : groupList) {
			if(!alMap.containsKey(attendanceGroup.getUser().getId())){
				AbsentVo vo = new AbsentVo();
				vo.setUsername(attendanceGroup.getUser().getName());
				vo.setReason("未打卡");
				voList.add(vo);
			}
		}
		
		return voList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AttendanceStat> doJoinTransFindStat(Date date) {
		String sql = "select a from AttendanceStat a left join fetch a.user where a.statTime = :STATTIME";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("STATTIME", date);
		
		return (List<AttendanceStat>) baseDao.findObjectList(sql, paramMap);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AttendanceGroup> doJoinTransQueryGroup() {
		String sql = "select a from AttendanceGroup a left join fetch a.user where a.user.useStatus = :USERSTATUS";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("USERSTATUS", User.UseStatus.normal.getValue());
		
		return (List<AttendanceGroup>) baseDao.findObjectList(sql, queryMap);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void doTransAttendanceSet(AttendanceSet attendanceSet, String ids) {
		AttendanceSet set =  doJoinTransAttendanceSet();
		if(set == null) {
			attendanceSet.setId(Generator.getUUID());
			baseDao.save(attendanceSet);
		} else {
			set.setStartTime(attendanceSet.getStartTime());
			set.setEndTime(attendanceSet.getEndTime());
			set.setLunchStartTime(attendanceSet.getLunchStartTime());
			set.setLunchEndTime(attendanceSet.getLunchEndTime());
			baseDao.update(set);
			attendanceSet = set;
		}
		
		String sql = "select a from  AttendanceGroup a ";
		
		List<AttendanceGroup> groupList = (List<AttendanceGroup>) baseDao.findObjectList(sql, null);
		
		if(groupList !=null && !groupList.isEmpty()) {
			for (AttendanceGroup attendanceGroup : groupList) {
				baseDao.delete(attendanceGroup);
			}
		}
		
		String[] idarr = ids.split(",");
		
		if(idarr != null && idarr.length >0) {
			for (int i = 0; i < idarr.length; i++) {
				if(StringUtils.isNotBlank(idarr[i])) {
					AttendanceGroup group = new AttendanceGroup();
					group.setId(Generator.getUUID());
					group.setAttendanceSet(attendanceSet);
					group.setUser(new User(idarr[i]));
					
					baseDao.save(group);
				}
			}
		}
	}
	
	@Override
	public AttendanceSet doJoinTransAttendanceSet() {
		String sql = "select a from AttendanceSet a ";
		return baseDao.findObject(sql, null);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AttendanceVo> doJoinTransCurrStat(Date date) {
		String sql = "select count(a) from AttendanceGroup a where a.user.useStatus = :USESTATUS";
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("USESTATUS", User.UseStatus.normal.getValue());
		
		int count = baseDao.queryObjectCount(sql, paramMap);
		
		if(count == 0) {
			return null;
		}
		
		sql = "select count(a) from AttendanceStat a where a.statTime = :NOWDATE";
		
		paramMap.clear();
		paramMap.put("NOWDATE", date);
		
		int num = baseDao.queryObjectCount(sql, paramMap);
		
		List<AttendanceVo> voList = new ArrayList<>();
		
		if(num == 0) {
			AttendanceVo vo = new AttendanceVo();
			vo.setCount(count);
			vo.setName("未打卡");
			voList.add(vo);
			
			return voList;
		}
		
		if(count > num) {
			AttendanceVo vo = new AttendanceVo();
			vo.setCount(count - num);
			vo.setName("未打卡");
			voList.add(vo);
		}
		
		sql = "select a from AttendanceStat a where a.statTime = :NOWDATE";
		
		List<AttendanceStat> statList = (List<AttendanceStat>) baseDao.findObjectList(sql, paramMap);
		
		int dakazhengc = 0;
		int dakayic = 0 ;
		int qingjia = 0;
		int waichu = 0;
		int chuchai = 0;
		int jiaban = 0;
		
		for (AttendanceStat attendanceStat : statList) {
			if(attendanceStat.getZaodaka() != null && 0 == attendanceStat.getZaodaka()) {
				dakazhengc += 1;
			} else if(attendanceStat.getZaodaka() != null && 1 == attendanceStat.getZaodaka()) {
				dakayic += 1;
			}
			
			if(attendanceStat.getQingjia() != null && 1 == attendanceStat.getQingjia()) {
				qingjia += 1;
			}
			if(attendanceStat.getWaichu() != null && 1 == attendanceStat.getWaichu()) {
				waichu += 1;
			}
			if(attendanceStat.getChuchai() != null && 1 == attendanceStat.getChuchai()) {
				chuchai += 1;
			}
			if(attendanceStat.getJiaban() != null && 1 == attendanceStat.getJiaban()) {
				jiaban += 1;
			}
		}
		if(dakazhengc != 0) {
			AttendanceVo zc = new AttendanceVo();
			zc.setCount(dakazhengc);
			zc.setName("正常");
			voList.add(zc);
		}
		if(dakayic != 0) {
			AttendanceVo yc = new AttendanceVo();
			yc.setCount(dakayic);
			yc.setName("异常");
			voList.add(yc);
		}
		
		if(qingjia != 0) {
			AttendanceVo qj = new AttendanceVo();
			qj.setCount(qingjia);
			qj.setName("请假");
			voList.add(qj);
		}
		if(waichu != 0) {
			AttendanceVo wc = new AttendanceVo();
			wc.setCount(waichu);
			wc.setName("外出");
			voList.add(wc);
		}
		if(chuchai != 0) {
			AttendanceVo cc = new AttendanceVo();
			cc.setCount(chuchai);
			cc.setName("出差");
			voList.add(cc);
		}
		if(jiaban != 0) {
			AttendanceVo jb = new AttendanceVo();
			jb.setCount(jiaban);
			jb.setName("加班");
			voList.add(jb);
		}
		
		return voList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AttendanceVo> doJoinTransCurrYestoday(Date date) {
		String sql = "select count(a) from AttendanceGroup a where a.user.useStatus = :USESTATUS";
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("USESTATUS", User.UseStatus.normal.getValue());
		
		int count = baseDao.queryObjectCount(sql, paramMap);
		
		if(count == 0) {
			return null;
		}
		
		
		paramMap.clear();
		paramMap.put("NOWDATE", date);
		
		List<AttendanceVo> voList = new ArrayList<>();
		sql = "select a from AttendanceStat a where a.statTime = :NOWDATE";
		
		List<AttendanceStat> statList = (List<AttendanceStat>) baseDao.findObjectList(sql, paramMap);
		
		int dakazhengc = 0;
		int dakayic = 0 ;
		int qingjia = 0;
		int waichu = 0;
		int chuchai = 0;
		int jiaban = 0;
		int kuangg = 0;
		int dakawanzc = 0;
		int dakawanyc = 0;
		
		for (AttendanceStat attendanceStat : statList) {
			if(attendanceStat.getZaodaka() != null && 0 == attendanceStat.getZaodaka()) {
				dakazhengc += 1;
			} else if(attendanceStat.getZaodaka() != null && 1 == attendanceStat.getZaodaka()) {
				dakayic += 1;
			}
			
			if(attendanceStat.getWandaka() != null && 0 == attendanceStat.getWandaka()) {
				dakawanzc += 1;
			} else if(attendanceStat.getWandaka() != null && 1 == attendanceStat.getWandaka()) {
				dakawanyc += 1;
			}
			
			if(attendanceStat.getQingjia() != null && 1 == attendanceStat.getQingjia()) {
				qingjia += 1;
			}
			if(attendanceStat.getWaichu() != null && 1 == attendanceStat.getWaichu()) {
				waichu += 1;
			}
			if(attendanceStat.getChuchai() != null && 1 == attendanceStat.getChuchai()) {
				chuchai += 1;
			}
			if(attendanceStat.getJiaban() != null && 1 == attendanceStat.getJiaban()) {
				jiaban += 1;
			}
			
			if(attendanceStat.getKuanggong() != null && 1 == attendanceStat.getKuanggong()) {
				kuangg += 1;
			}
		}
		if(dakazhengc != 0) {
			AttendanceVo zc = new AttendanceVo();
			zc.setCount(dakazhengc);
			zc.setName("早正常");
			voList.add(zc);
		}
		if(dakayic != 0) {
			AttendanceVo yc = new AttendanceVo();
			yc.setCount(dakayic);
			yc.setName("早异常");
			voList.add(yc);
		}
		
		if(qingjia != 0) {
			AttendanceVo qj = new AttendanceVo();
			qj.setCount(qingjia);
			qj.setName("请假");
			voList.add(qj);
		}
		if(waichu != 0) {
			AttendanceVo wc = new AttendanceVo();
			wc.setCount(waichu);
			wc.setName("外出");
			voList.add(wc);
		}
		if(chuchai != 0) {
			AttendanceVo cc = new AttendanceVo();
			cc.setCount(chuchai);
			cc.setName("出差");
			voList.add(cc);
		}
		
		if(dakawanzc != 0) {
			AttendanceVo wdk = new AttendanceVo();
			wdk.setCount(dakawanzc);
			wdk.setName("晚正常");
			voList.add(wdk);
		}
		
		if(dakawanyc != 0) {
			AttendanceVo wdk = new AttendanceVo();
			wdk.setCount(dakawanyc);
			wdk.setName("晚异常");
			voList.add(wdk);
		}
		
		if(kuangg != 0) {
			AttendanceVo kg = new AttendanceVo();
			kg.setCount(kuangg);
			kg.setName("旷工");
			voList.add(kg);
		}
		
		
		if(jiaban != 0) {
			AttendanceVo jb = new AttendanceVo();
			jb.setCount(jiaban);
			jb.setName("加班");
			voList.add(jb);
		}
		
		return voList;
	}
}
