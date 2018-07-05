/*
 * BusinessServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月19日 上午9:10:56
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.project.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.project.BusinessDetail;
import team.nercita.manage.cms.po.project.ProjectBusniess;
import team.nercita.manage.cms.po.project.ProjectFile;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.project.BusinessService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年11月19日 上午9:10:56
 */
@Component
public class BusinessServiceImpl extends BaseService implements BusinessService{
	@Override
	public Map<String, Object> doJoinTransQueryBusiness(Integer goPage, Map<String, Object> paramMap) {
		String busniessName = MapUtils.getString(paramMap, "busniessName");
		String unit = MapUtils.getString(paramMap, "unit");
		String contact = MapUtils.getString(paramMap, "contact");
		
		String sql = "select a from ProjectBusniess a where 1=1 ";
		String countSql = "select count(a) from ProjectBusniess a where 1=1 ";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(busniessName)){
			sql += " and a.bussName like :BUSSNAME";
			countSql += " and a.bussName like :BUSSNAME";
			queryMap.put("BUSSNAME", "%" + busniessName + "%");
		}
		
		if(StringUtils.isNotBlank(unit)){
			sql += " and a.unit like :UNIT";
			countSql += " and a.unit like :UNIT";
			queryMap.put("UNIT", "%" + unit + "%");
		}
		
		if(StringUtils.isNotBlank(contact)){
			sql += " and a.contact like :CONTACT";
			countSql += " and a.contact like :CONTACT";
			queryMap.put("CONTACT", "%" + contact + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("businessList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}
	
	@Override
	public ProjectBusniess doJoinTransFindProjectBusniessById(String id) {
		
		return baseDao.findObject(ProjectBusniess.class, id);
	}
	
	@Override
	public void doTransSaveProJectBusniess(ProjectBusniess projectBusniess, List<ProjectFile> fileList) {
		projectBusniess.setId(Generator.getUUID());
		
		for (ProjectFile projectFile : fileList) {
			projectFile.setBussId(projectBusniess.getId());
			projectFile.setId(Generator.getUUID());
			
			baseDao.save(projectFile);
		}
		baseDao.save(projectBusniess);
	}
	
	@Override
	public void doTransSaveProjectNode(BusinessDetail businessDetail) {
		ProjectBusniess projectBusniess = baseDao.findObject(ProjectBusniess.class, businessDetail.getProjectBusniess().getId());
		projectBusniess.setLastProgress(businessDetail.getLastProgress());
		
		baseDao.update(projectBusniess);
		
		businessDetail.setId(Generator.getUUID());
		baseDao.save(businessDetail);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void doTransDelBusiness(String id) {
		ProjectBusniess projectBusniess = baseDao.findObject(ProjectBusniess.class, id);
		
		String sql = "select s from BusinessDetail s where s.projectBusniess.id = :STARTUPID";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("STARTUPID", projectBusniess.getId());
		
		List<BusinessDetail> detailList = (List<BusinessDetail>) baseDao.findObjectList(sql, queryMap);
		
		if(detailList!=null && !detailList.isEmpty()) {
			for (BusinessDetail startUpDetail : detailList) {
				baseDao.delete(startUpDetail);
			}
		}
		
		sql = "select p from ProjectFile p where p.bussId = :BUSSID";
		
		queryMap.clear();
		queryMap.put("BUSSID", projectBusniess.getId());
		
		List<ProjectFile> oldFileList = (List<ProjectFile>) baseDao.findObjectList(sql, queryMap);
		
		if(oldFileList != null && !oldFileList.isEmpty()) {
			for (ProjectFile projectFile : oldFileList) {
				baseDao.delete(projectFile);
			}
		}
		
		baseDao.delete(projectBusniess);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void doTransUpdateProjectBusniess(ProjectBusniess projectBusniess, List<ProjectFile> fileList) {
		baseDao.update(projectBusniess);
		
		String sql = "select p from ProjectFile p where p.bussId = :BUSSID";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("BUSSID", projectBusniess.getId());
		
		if(fileList != null && !fileList.isEmpty()) {
			List<ProjectFile> oldFileList = (List<ProjectFile>) baseDao.findObjectList(sql, queryMap);
			
			if(oldFileList != null && !oldFileList.isEmpty()) {
				for (ProjectFile projectFile : oldFileList) {
					baseDao.delete(projectFile);
				}
			}
			
			for (ProjectFile projectFile : fileList) {
				projectFile.setBussId(projectBusniess.getId());
				projectFile.setId(Generator.getUUID());
				
				baseDao.save(projectFile);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<BusinessDetail> doJoinTransQueryNode(String id) {
		String sql = "select p from BusinessDetail p where p.projectBusniess.id = :BUSSID order by p.noteDate desc";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("BUSSID", id);
		
		return (List<BusinessDetail>) baseDao.findObjectList(sql, queryMap);
	}
}
