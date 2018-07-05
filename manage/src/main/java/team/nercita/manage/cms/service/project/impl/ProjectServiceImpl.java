/*
 * ProjectServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月10日 上午10:00:15
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.project.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.finance.FundsIncome;
import team.nercita.manage.cms.po.projectmanage.Attachment;
import team.nercita.manage.cms.po.projectmanage.DialOutFund;
import team.nercita.manage.cms.po.projectmanage.FundsDetail;
import team.nercita.manage.cms.po.projectmanage.FundsDetailChange;
import team.nercita.manage.cms.po.projectmanage.Project;
import team.nercita.manage.cms.po.projectmanage.ProjectEnterInfo;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.project.ProjectService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年11月10日 上午10:00:15
 */
@Component
public class ProjectServiceImpl extends BaseService implements ProjectService{

	@Override
	public Map<String, Object> doJoinTransFindProjectList(Integer goPage, Map<String, Object> paramMap) {
		String projectName = MapUtils.getString(paramMap, "projectName");
		String userName = MapUtils.getString(paramMap, "userName");
		String resource = MapUtils.getString(paramMap, "resource");
		Integer type = MapUtils.getInteger(paramMap, "type");
		
		String sql = "select a from Project a left join fetch a.user left join fetch a.userGroup where 1=1 and a.status = 0";
		String countSql = "select count(a) from Project a where 1=1  and a.status = 0 ";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(projectName)){
			sql += " and a.projectName like :PROJECTNAME";
			countSql += " and a.projectName like :PROJECTNAME";
			queryMap.put("PROJECTNAME", "%" + projectName + "%");
		}
		
		if(type != null){
			sql += " and a.type = :TYPE";
			countSql += " and a.type  = :TYPE";
			queryMap.put("TYPE", type);
		}
		
		if(StringUtils.isNotBlank(userName)){
			sql += " and a.user.name like :USERNAME";
			countSql += " and a.user.name like :USERNAME";
			queryMap.put("USERNAME", "%" + userName + "%");
		}
		
		if(StringUtils.isNotBlank(resource)){
			sql += " and a.resource like :RESOURCE";
			countSql += " and a.resource like :RESOURCE";
			queryMap.put("RESOURCE", "%" + resource + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("projectList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}
	
	
	@Override
	public void doTransSaveProject(Project project, Attachment attachment) {
		List<FundsDetail> detailList = project.getFundList();
		List<DialOutFund> outList = project.getOutList();
		List<ProjectEnterInfo> enterList = project.getEnterList();
		
		project.setId(Generator.getUUID());
		project.setFundList(null);
		project.setOutList(null);
		project.setStatus(0);
		project.setEnterList(null);
		baseDao.save(project);
		
		if(detailList != null && !detailList.isEmpty()) {
			for (FundsDetail fundsDetail : detailList) {
				if(fundsDetail.getOriginalBalance() != null || fundsDetail.getOriginalBudget() != null 
						|| fundsDetail.getPay() != null || fundsDetail.getNewBalance() != null || fundsDetail.getNewBudget() != null) {
					fundsDetail.setProject(project);
					fundsDetail.setId(Generator.getUUID());
					
					baseDao.save(fundsDetail);
				}
			}
		}
		
		if(outList != null && !outList.isEmpty()) {
			for (DialOutFund dialOutFund : outList) {
				if(dialOutFund.getAmount() != null || dialOutFund.getUnit() != null) {
					dialOutFund.setId(Generator.getUUID());
					dialOutFund.setProject(project);
					
					baseDao.save(dialOutFund);
				}
			}
		}
		
		if(enterList != null && !enterList.isEmpty()) {
			for (ProjectEnterInfo projectEnterInfo : enterList) {
				if(projectEnterInfo.getEnterTime() != null || projectEnterInfo.getAmount() != null) {
					projectEnterInfo.setId(Generator.getUUID());
					projectEnterInfo.setProject(project);
					
					baseDao.save(projectEnterInfo);
				}
			}
		}
		
		if(attachment != null) {
			attachment.setProject(project);
			attachment.setId(Generator.getUUID());
			baseDao.save(attachment);
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Project doJoinTransFindProject(String id) {
		String sql = "select p from Project p left join fetch p.user left join fetch p.userGroup where p.id = :PID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("PID", id);
		
		Project project = baseDao.findObject(sql, paramMap);
		
		sql = "select f from FundsDetail f where f.project.id = :PID";
		
		project.setFundList((List<FundsDetail>) baseDao.findObjectList(sql, paramMap));
		
		sql = "select d from DialOutFund d where d.project.id = :PID";

		project.setOutList((List<DialOutFund>) baseDao.findObjectList(sql, paramMap));
		
		sql = "select d from ProjectEnterInfo d where d.project.id = :PID";

		project.setEnterList((List<ProjectEnterInfo>) baseDao.findObjectList(sql, paramMap));
		
		return project;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void doTransUpdateProject(Project project, Attachment attachment) {
		List<FundsDetail> detailList = project.getFundList();
		List<DialOutFund> outList = project.getOutList();
		List<ProjectEnterInfo> enterList = project.getEnterList();
		
		String sql = "select f from FundsDetail f where f.project.id = :PID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("PID", project.getId());
		
		List<FundsDetail> oldFundList = (List<FundsDetail>) baseDao.findObjectList(sql, paramMap);
		
		if(oldFundList != null) {
			for (FundsDetail fundsDetail : oldFundList) {
				baseDao.delete(fundsDetail);
			}
		}
		
		sql = "select d from DialOutFund d where d.project.id = :PID";
		
		List<DialOutFund> oldOutList = (List<DialOutFund>) baseDao.findObjectList(sql, paramMap);
		
		if(oldOutList != null) {
			for (DialOutFund dialOutFund : oldOutList) {
				baseDao.delete(dialOutFund);
			}
		}
		
		sql = "select d from ProjectEnterInfo d where d.project.id = :PID";
		
		List<ProjectEnterInfo> oldEnterList = (List<ProjectEnterInfo>) baseDao.findObjectList(sql, paramMap);
		
		if(enterList != null) {
			for (ProjectEnterInfo enter : oldEnterList) {
				baseDao.delete(enter);
			}
		}
		
		if(enterList != null && !enterList.isEmpty()) {
			for (ProjectEnterInfo projectEnterInfo : enterList) {
				if(projectEnterInfo.getEnterTime() != null || projectEnterInfo.getAmount() != null) {
					projectEnterInfo.setId(Generator.getUUID());
					projectEnterInfo.setProject(project);
					
					baseDao.save(projectEnterInfo);
				}
			}
		}
		
		if(detailList != null && !detailList.isEmpty()) {
			for (FundsDetail fundsDetail : detailList) {
				if(fundsDetail.getOriginalBalance() != null || fundsDetail.getOriginalBudget() != null 
						|| fundsDetail.getPay() != null || fundsDetail.getNewBalance() != null || fundsDetail.getNewBudget() != null) {
					fundsDetail.setProject(project);
					fundsDetail.setId(Generator.getUUID());
					
					baseDao.save(fundsDetail);
				}
			}
		}
		
		if(outList != null && !outList.isEmpty()) {
			for (DialOutFund dialOutFund : outList) {
				if(dialOutFund.getAmount() != null || dialOutFund.getUnit() != null) {
					dialOutFund.setId(Generator.getUUID());
					dialOutFund.setProject(project);
					
					baseDao.save(dialOutFund);
				}
			}
		}
		
		if(attachment != null) {
			sql = "select a from Attachment a where a.project.id = :PID";
			
			List<Attachment> oldAttList = (List<Attachment>) baseDao.findObjectList(sql, paramMap);
			
			if(oldAttList != null) {
				for (Attachment a : oldAttList) {
					baseDao.delete(a);
				}
			}
			
			attachment.setProject(project);
			attachment.setId(Generator.getUUID());
			baseDao.save(attachment);
		}
		
		project.setFundList(null);
		project.setOutList(null);
		project.setEnterList(null);
		project.setStatus(0);
		
		baseDao.update(project);
	}
	
	@Override
	public void doTransDelProject(String id) {
		Project project = baseDao.findObject(Project.class, id);
		project.setStatus(1);
		baseDao.update(project);
	}
	
	@Override
	public Attachment doJoinTransAttachment(String pid) {
		String sql = "select a from Attachment a where a.project.id = :PID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("PID", pid);
		
		return baseDao.findObject(sql, paramMap);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Project> doJoinTransQueryProject() {
		String sql = "select p from Project p where p.status = 0";
		return (List<Project>) baseDao.findObjectList(sql, null);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<FundsDetail> doJoinTransQueryDetail(String id) {
		String sql = "select f from FundsDetail f where f.project.id = :PROJECTID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("PROJECTID", id);
		return (List<FundsDetail>) baseDao.findObjectList(sql, paramMap);
	}
	
	@Override
	public FundsDetail doJoinTransQueryDetailById(String id) {
		return baseDao.findObject(FundsDetail.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<FundsDetailChange> doJoinTransFindFundsDetailList(String id) {
		String sql = "select f from FundsDetailChange f left join fetch f.fundsDetail where f.project.id = :PROJECTID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("PROJECTID", id);
		return (List<FundsDetailChange>) baseDao.findObjectList(sql, paramMap);
	}
	
	@Override
	public void doTransSaveChange(FundsDetailChange fundsDetailChange) {
		fundsDetailChange.setId(Generator.getUUID());
		
		baseDao.save(fundsDetailChange);
		
		FundsDetail fundsDetail = baseDao.findObject(FundsDetail.class, fundsDetailChange.getFundsDetail().getId());
		fundsDetail.setNewBudget(fundsDetailChange.getNewBudget());
		baseDao.update(fundsDetail);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<FundsIncome> doJoinTransQueryFundsIncode(String id) {
		String sql = "select f from FundsIncome f where f.project.id = :ID order by f.changeTime desc";
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ID", id);
		return (List<FundsIncome>) baseDao.findObjectList(sql, paramMap);
	}
}
