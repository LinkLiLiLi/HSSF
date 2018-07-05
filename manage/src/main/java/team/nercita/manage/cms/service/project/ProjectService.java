/*
 * ProjectService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月10日 上午9:58:55
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.project;

import java.util.List;
import java.util.Map;

import team.nercita.manage.cms.po.finance.FundsIncome;
import team.nercita.manage.cms.po.projectmanage.Attachment;
import team.nercita.manage.cms.po.projectmanage.FundsDetail;
import team.nercita.manage.cms.po.projectmanage.FundsDetailChange;
import team.nercita.manage.cms.po.projectmanage.Project;

/**
 *
 * @author L
 * @date 2017年11月10日 上午9:58:55
 */
public interface ProjectService {
	public Map<String, Object> doJoinTransFindProjectList(Integer goPage, Map<String, Object> paramMap);
	
	public void doTransSaveProject(Project project, Attachment attachment);
	
	public Project doJoinTransFindProject(String id);
	
	public void doTransUpdateProject(Project project, Attachment attachment);
	
	public void doTransDelProject(String id);
	
	public Attachment doJoinTransAttachment(String pid);
	
	public List<Project> doJoinTransQueryProject();
	
	public List<FundsDetail> doJoinTransQueryDetail(String id);
	
	public FundsDetail doJoinTransQueryDetailById(String id);
	
	public List<FundsDetailChange> doJoinTransFindFundsDetailList(String id);
	
	public void doTransSaveChange(FundsDetailChange fundsDetailChange);
	
	public List<FundsIncome> doJoinTransQueryFundsIncode(String id);
}
