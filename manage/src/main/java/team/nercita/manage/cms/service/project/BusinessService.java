/*
 * BusinessService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月19日 上午8:58:16
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.project;

import java.util.List;
import java.util.Map;

import team.nercita.manage.cms.po.project.BusinessDetail;
import team.nercita.manage.cms.po.project.ProjectBusniess;
import team.nercita.manage.cms.po.project.ProjectFile;

/**
 *
 * @author L
 * @date 2017年11月19日 上午8:58:16
 */
public interface BusinessService {
	public Map<String, Object> doJoinTransQueryBusiness(Integer goPage, Map<String, Object> paramMap);
	
	public void doTransSaveProJectBusniess(ProjectBusniess projectBusniess, List<ProjectFile> fileList);
	
	public ProjectBusniess doJoinTransFindProjectBusniessById(String id);
	
	public void doTransUpdateProjectBusniess(ProjectBusniess projectBusniess, List<ProjectFile> fileList);
	
	public void doTransSaveProjectNode(BusinessDetail businessDetail);
	
	public void doTransDelBusiness(String id);
	
	public List<BusinessDetail> doJoinTransQueryNode(String id);
}
