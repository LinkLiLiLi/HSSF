/*
 * ReimbursementServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月8日 上午11:35:04
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.form.ApplyReimbursement;
import team.nercita.manage.cms.po.form.ReimbursementDetail;
import team.nercita.manage.cms.service.apply.ReimbursementService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年11月8日 上午11:35:04
 */
@Component
public class ReimbursementServiceImpl extends BaseService implements ReimbursementService {

	@Override
	public Map<String, Object> doJoinTransFindApplyReimbursementList(Integer goPage, Map<String, Object> paramMap) {
		String payUnit = MapUtils.getString(paramMap, "payUnit");
		String projectId = MapUtils.getString(paramMap, "projectId");
		Integer status = MapUtils.getInteger(paramMap, "status");
		
		String sql = "select a from ApplyReimbursement a left join fetch a.project where 1=1 ";
		String countSql = "select count(a) from ApplyReimbursement a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(payUnit)){
			sql += " and a.payUnit like :PAYUNIT";
			countSql += " and a.payUnit like :PAYUNIT";
			queryMap.put("PAYUNIT", "%" + payUnit + "%");
		}
		
		if(StringUtils.isNotBlank(projectId)){
			sql += " and a.project.id = :PROJECTID";
			countSql += " and a.project.id = :PROJECTID";
			queryMap.put("PROJECTID", projectId);
		}
		
		if(status != null) {
			sql += " and a.status = :STATUS";
			countSql += " and a.status = :STATUS";
			queryMap.put("STATUS", status);
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("sementList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveApplyReimbursement(ApplyReimbursement applyReimbursement,
			List<ReimbursementDetail> detailList) {
		applyReimbursement.setId(Generator.getUUID());
		applyReimbursement.setDetailList(null);
		baseDao.save(applyReimbursement);
		
		for (ReimbursementDetail reimbursementDetail : detailList) {
			
			if(StringUtils.isBlank(reimbursementDetail.getDetail()) && reimbursementDetail.getAmount() == null){
				continue;
			}
			reimbursementDetail.setId(Generator.getUUID());
			reimbursementDetail.setAddUser(applyReimbursement.getAddUser());
			reimbursementDetail.setApplyReimbursement(applyReimbursement);
			
			baseDao.save(reimbursementDetail);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> doJoinTransFindApplyReimbursement(String id) {
		String sql = "select r from ApplyReimbursement r left join fetch r.project where r.id = :SID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("SID", id);
		
		ApplyReimbursement reimbursement = baseDao.findObject(sql, paramMap);
		
		sql = "select r from ReimbursementDetail r where r.applyReimbursement.id = :SID";
		
		List<ReimbursementDetail> detailList = (List<ReimbursementDetail>) baseDao.findObjectList(sql, paramMap);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("detailList", detailList);
		resultMap.put("reimbursement", reimbursement);
		return resultMap;
	}
	
	@Override
	public ApplyReimbursement doJoinTransFindApplyReimbursementById(String id) {
		return baseDao.findObject(ApplyReimbursement.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void doTransUpdateApplyReimbursement(ApplyReimbursement applyReimbursement,
			List<ReimbursementDetail> detailList) {
		String sql = "select si from ReimbursementDetail si where si.applyReimbursement.id = :APPLYID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("APPLYID", applyReimbursement.getId());
		
		List<ReimbursementDetail> oldList = (List<ReimbursementDetail>) baseDao.findObjectList(sql, paramMap);
		
		for (ReimbursementDetail detail : oldList) {
			baseDao.delete(detail);
		}
		
		for (ReimbursementDetail reimbursementDetail : detailList) {
			if(StringUtils.isBlank(reimbursementDetail.getDetail()) && reimbursementDetail.getAmount() == null){
				continue;
			}
			reimbursementDetail.setId(Generator.getUUID());
			reimbursementDetail.setAddUser(applyReimbursement.getAddUser());
			reimbursementDetail.setApplyReimbursement(applyReimbursement);
			
			baseDao.save(reimbursementDetail);
		}
		applyReimbursement.setDetailList(null);
		baseDao.update(applyReimbursement);
	}
	
	@Override
	public void doTransApplyAudit(String id, int status) {
		ApplyReimbursement applyReimbursement = baseDao.findObject(ApplyReimbursement.class, id);
		applyReimbursement.setStatus(status);
		
		baseDao.update(applyReimbursement);
	}
}
