/*
 * ExpertFeeServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月8日 下午4:43:19
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.form.ApplyExpertFee;
import team.nercita.manage.cms.po.form.ExpertFeeDetail;
import team.nercita.manage.cms.service.apply.ExpertFeeService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年11月8日 下午4:43:19
 */
@Component
public class ExpertFeeServiceImpl extends BaseService implements ExpertFeeService {

	@Override
	public Map<String, Object> doJoinTransFindApplyExpertFeeList(Integer goPage, Map<String, Object> paramMap) {
		String title = MapUtils.getString(paramMap, "title");
		String keyWords = MapUtils.getString(paramMap, "keyWords");
		
		String sql = "select a from ApplyExpertFee a left join fetch a.detailList where 1=1 ";
		String countSql = "select count(a) from ApplyExpertFee a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(title)){
			sql += " and a.title like :TITLE";
			countSql += " and a.title like :TITLE";
			queryMap.put("TITLE", "%" + title + "%");
		}
		
		if(StringUtils.isNotBlank(keyWords)){
			sql += " and a.keyWords like :KEYWORDS";
			countSql += " and a.keyWords like :KEYWORDS";
			queryMap.put("KEYWORDS", "%" + keyWords + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("expertFeeList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveApplyExpertFee(ApplyExpertFee applyExpertFee, User user) {
		applyExpertFee.setId(Generator.getUUID());
		List<ExpertFeeDetail> detailList = applyExpertFee.getDetailList();
		String keyWords = "";
		if(detailList != null) {
			for (ExpertFeeDetail expertFeeDetail : detailList) {
				keyWords += expertFeeDetail.getName() + "|" + expertFeeDetail.getIdCard() 
					+ "|" +expertFeeDetail.getUnit() + "|" + expertFeeDetail.getTitle();
			}
		}
		
		applyExpertFee.setDetailList(null);
		applyExpertFee.setKeyWords(keyWords);
		baseDao.save(applyExpertFee);
		
		if(detailList != null) {
			for (ExpertFeeDetail detail : detailList) {
				detail.setApplyExpertFee(applyExpertFee);
				detail.setUser(user);
				detail.setId(Generator.getUUID());
				baseDao.save(detail);
			}
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public ApplyExpertFee doJoinTransFindApplyExpertFee(String id) {
		ApplyExpertFee ExpertFee = baseDao.findObject(ApplyExpertFee.class, id);
		
		String sql = "select a from ExpertFeeDetail a where a.applyExpertFee.id=:AID";
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("AID", id);
		
		List<ExpertFeeDetail> detailList = (List<ExpertFeeDetail>) baseDao.findObjectList(sql, resultMap);
		
		ExpertFee.setDetailList(detailList);
		return ExpertFee;
	}

	@Override
	public ApplyExpertFee doJoinTransFindApplyExpertFeeById(String id) {
		return baseDao.findObject(ApplyExpertFee.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void doTransUpdateApplyExpertFee(ApplyExpertFee applyExpertFee, User user) {
		List<ExpertFeeDetail> newDetailList = applyExpertFee.getDetailList();
		String keyWords = "";
		
		String sql = "select a from ExpertFeeDetail a where a.applyExpertFee.id=:AID";
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("AID", applyExpertFee.getId());
		
		List<ExpertFeeDetail> detailList = (List<ExpertFeeDetail>) baseDao.findObjectList(sql, resultMap);
		
		for (ExpertFeeDetail expertFeeDetail : detailList) {
			baseDao.delete(expertFeeDetail);
		}
		
		if(newDetailList != null){
			for (ExpertFeeDetail expertFeeDetail : newDetailList) {
				keyWords += expertFeeDetail.getName() + "|" + expertFeeDetail.getIdCard() 
					+ "|" +expertFeeDetail.getUnit() + "|" + expertFeeDetail.getTitle();
			}
		}
		
		applyExpertFee.setDetailList(null);
		applyExpertFee.setKeyWords(keyWords);
		baseDao.update(applyExpertFee);
		
		if(newDetailList != null){
			for (ExpertFeeDetail detail : newDetailList) {
				detail.setApplyExpertFee(applyExpertFee);
				detail.setId(Generator.getUUID());
				detail.setUser(user);
				baseDao.save(detail);
			}
		}
	}
	
	@Override
	public void doTransApplyAudit(String id, int status) {
		ApplyExpertFee applyExpertFee = baseDao.findObject(ApplyExpertFee.class, id);
		applyExpertFee.setStatus(status);
		baseDao.update(applyExpertFee);
	}
}
