/*
 * WorkJoutanlService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月19日 下午8:20:34
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage;

import java.util.Date;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;

import team.nercita.manage.cms.model.WorkJoutanlVo;
import team.nercita.manage.cms.po.deptmanage.WorkJoutanl;

/**
 * 工作日志
 * @author L
 * @date 2017年7月19日 下午8:20:34
 */
public interface WorkJoutanlService {
	public List<WorkJoutanl> doJoinTransFindWorkJoutanl(String userId, Date startDate, Date endDate);
	
	public void doTransSaveWorkJoutanl(WorkJoutanl workJoutanl);
	
	public WorkJoutanl doJoinTransFindWorkJoutanlById(String id);
	
	public void doTransUpdateWorkJoutanl(WorkJoutanl workJoutanl);
	
	public List<WorkJoutanlVo> doJoinTransFindWorkJoutanlApp(String userId, int startIndex, int maxResult);
	
	public WorkJoutanl doJoinTransFindCurrDayWorkJoutanl(String userid);
	
	public WorkJoutanl doJoinTransFindDayWorkJoutanl(String userid, Date joutanlDate);

	
}
