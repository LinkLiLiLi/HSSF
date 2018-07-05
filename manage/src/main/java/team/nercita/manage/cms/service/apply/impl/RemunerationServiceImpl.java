/*
 * RemunerationServiceImpl.java
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
import team.nercita.manage.cms.po.form.ApplyRemuneration;
import team.nercita.manage.cms.po.form.RemunerationDetail;
import team.nercita.manage.cms.service.apply.RemunerationService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年11月8日 下午4:43:19
 */
@Component
public class RemunerationServiceImpl extends BaseService implements RemunerationService {

	@Override
	public Map<String, Object> doJoinTransFindApplyRemunerationList(Integer goPage, Map<String, Object> paramMap) {
		String title = MapUtils.getString(paramMap, "title");
		String keyWords = MapUtils.getString(paramMap, "keyWords");
		
		String sql = "select a from ApplyRemuneration a left join fetch a.detailList where 1=1 ";
		String countSql = "select count(a) from ApplyRemuneration a where 1=1";
		
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
		paramMap.put("remunerationList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveApplyRemuneration(ApplyRemuneration applyRemuneration, User user) {
		applyRemuneration.setId(Generator.getUUID());
		List<RemunerationDetail> detailList = applyRemuneration.getDetailList();
		String keyWords = "";
		if(detailList != null) {
			for (RemunerationDetail remunerationDetail : detailList) {
				keyWords += remunerationDetail.getName() + "|" + remunerationDetail.getIdCard() 
					+ "|" +remunerationDetail.getBankName() + "|" + remunerationDetail.getBankCard();
			}
		}
		
		applyRemuneration.setDetailList(null);
		applyRemuneration.setKeyWords(keyWords);
		baseDao.save(applyRemuneration);
		
		if(detailList != null) {
			for (RemunerationDetail detail : detailList) {
				detail.setApplyRemuneration(applyRemuneration);
				detail.setAddUser(user);
				detail.setId(Generator.getUUID());
				baseDao.save(detail);
			}
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public ApplyRemuneration doJoinTransFindApplyRemuneration(String id) {
		ApplyRemuneration Remuneration = baseDao.findObject(ApplyRemuneration.class, id);
		
		String sql = "select a from RemunerationDetail a where a.applyRemuneration.id=:AID";
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("AID", id);
		
		List<RemunerationDetail> detailList = (List<RemunerationDetail>) baseDao.findObjectList(sql, resultMap);
		
		Remuneration.setDetailList(detailList);
		return Remuneration;
	}

	@Override
	public ApplyRemuneration doJoinTransFindApplyRemunerationById(String id) {
		return baseDao.findObject(ApplyRemuneration.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void doTransUpdateApplyRemuneration(ApplyRemuneration applyRemuneration, User user) {
		List<RemunerationDetail> newDetailList = applyRemuneration.getDetailList();
		String keyWords = "";
		
		String sql = "select a from RemunerationDetail a where a.applyRemuneration.id=:AID";
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("AID", applyRemuneration.getId());
		
		List<RemunerationDetail> detailList = (List<RemunerationDetail>) baseDao.findObjectList(sql, resultMap);
		
		for (RemunerationDetail remunerationDetail : detailList) {
			baseDao.delete(remunerationDetail);
		}
		
		if(newDetailList != null){
			for (RemunerationDetail remunerationDetail : newDetailList) {
				keyWords += remunerationDetail.getName() + "|" + remunerationDetail.getIdCard() 
					+ "|" +remunerationDetail.getBankName() + "|" + remunerationDetail.getBankCard();
			}
		}
		
		applyRemuneration.setDetailList(null);
		applyRemuneration.setKeyWords(keyWords);
		baseDao.update(applyRemuneration);
		
		if(newDetailList != null){
			for (RemunerationDetail detail : newDetailList) {
				detail.setApplyRemuneration(applyRemuneration);
				detail.setId(Generator.getUUID());
				detail.setAddUser(user);
				baseDao.save(detail);
			}
		}
	}
	
	@Override
	public void doTransApplyAudit(String id, int status) {
		ApplyRemuneration applyRemuneration = baseDao.findObject(ApplyRemuneration.class, id);
		applyRemuneration.setStatus(status);
		baseDao.update(applyRemuneration);
	}
}
