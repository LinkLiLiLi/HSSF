/*
 * StartUpService.java
 * 创建者：L
 * 创建日期：2017年12月28日 下午5:04:18
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.project;

import java.util.List;
import java.util.Map;

import team.nercita.manage.cms.po.project.ProjectFile;
import team.nercita.manage.cms.po.project.ProjectStartup;
import team.nercita.manage.cms.po.project.StartUpDetail;

/**
 * 
 * @author L
 * @date： 2017年12月28日 下午5:04:18
 */
public interface StartUpService {
	public Map<String, Object> doJoinTransQueryStartUp(Integer goPage, Map<String, Object> paramMap);
	
	public void doTransSaveProJectStartUp(ProjectStartup projectStartup, List<ProjectFile> fileList);
	
	public ProjectStartup doJoinTransFindProjectStartUpById(String id);
	
	public void doTransUpdateProjectStartUp(ProjectStartup projectStartup, List<ProjectFile> fileList);
	
	public void doTransSaveProjectNode(StartUpDetail startUpDetail);
	
	public void doTransDelStartup(String id);
	
	public List<StartUpDetail> doJoinTransFindDetailList(String id);
}