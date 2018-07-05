/*
 * AttendanceService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月16日 下午8:26:06
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage;

import java.util.Date;
import java.util.List;

import team.nercita.manage.cms.po.deptmanage.AttendanceGroup;
import team.nercita.manage.cms.po.deptmanage.AttendanceSet;
import team.nercita.manage.cms.po.deptmanage.AttendanceStat;
import team.nercita.manage.cms.vo.AbsentVo;
import team.nercita.manage.cms.vo.AttendanceVo;

/**
 * 出勤service
 * @author L
 * @date 2017年7月16日 下午8:26:06
 */
public interface AttendanceService {
	
	public List<AttendanceGroup> doJoinTransQueryGroup();
	
	public void doTransAttendanceSet(AttendanceSet attendanceSet, String ids);
	
	public AttendanceSet doJoinTransAttendanceSet();
	
	public List<AttendanceVo> doJoinTransCurrStat(Date date);
	
	public List<AttendanceVo> doJoinTransCurrYestoday(Date date);
	
	public List<AttendanceStat> doJoinTransFindStat(Date date);
	
	public List<AbsentVo> doJoinTransFindAbsent(Date date);
}
