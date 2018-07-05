/*
 * TrvalServiceImpl.java
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
import team.nercita.manage.cms.po.form.ApplyTrval;
import team.nercita.manage.cms.po.form.TrvalDetail;
import team.nercita.manage.cms.service.apply.TrvalService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年11月8日 下午4:43:19
 */
@Component
public class TrvalServiceImpl extends BaseService implements TrvalService {

	@Override
	public Map<String, Object> doJoinTransFindApplyTrvalList(Integer goPage, Map<String, Object> paramMap) {
		String name = MapUtils.getString(paramMap, "name");
		String reason = MapUtils.getString(paramMap, "reason");
		
		String sql = "select a from ApplyTrval a left join fetch a.detailList where 1=1 ";
		String countSql = "select count(a) from ApplyTrval a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(name)){
			sql += " and a.name like :NAME";
			countSql += " and a.name like :NAME";
			queryMap.put("NAME", "%" + name + "%");
		}
		
		if(StringUtils.isNotBlank(reason)){
			sql += " and a.reason like :REASON";
			countSql += " and a.reason like :REASON";
			queryMap.put("REASON", "%" + reason + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("trvalList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveApplyTrval(ApplyTrval applyTrval, User user) {
		applyTrval.setId(Generator.getUUID());
		List<TrvalDetail> detailList = applyTrval.getDetailList();
		applyTrval.setAddUser(user);
		applyTrval.setDetailList(null);
		baseDao.save(applyTrval);
		
		if(detailList != null) {
			for (TrvalDetail detail : detailList) {
				detail.setApplyTrval(applyTrval);
				detail.setId(Generator.getUUID());
				baseDao.save(detail);
			}
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public ApplyTrval doJoinTransFindApplyTrval(String id) {
		ApplyTrval Trval = baseDao.findObject(ApplyTrval.class, id);
		
		String sql = "select a from TrvalDetail a where a.applyTrval.id=:AID";
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("AID", id);
		
		List<TrvalDetail> detailList = (List<TrvalDetail>) baseDao.findObjectList(sql, resultMap);
		
		Trval.setDetailList(detailList);
		return Trval;
	}

	@Override
	public ApplyTrval doJoinTransFindApplyTrvalById(String id) {
		return baseDao.findObject(ApplyTrval.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void doTransUpdateApplyTrval(ApplyTrval applyTrval, User user) {
		List<TrvalDetail> newDetailList = applyTrval.getDetailList();
		
		String sql = "select a from TrvalDetail a where a.applyTrval.id=:AID";
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("AID", applyTrval.getId());
		
		List<TrvalDetail> detailList = (List<TrvalDetail>) baseDao.findObjectList(sql, resultMap);
		
		for (TrvalDetail TrvalDetail : detailList) {
			baseDao.delete(TrvalDetail);
		}
		
		applyTrval.setDetailList(null);
		applyTrval.setAddUser(user);
		baseDao.update(applyTrval);
		
		if(newDetailList != null){
			for (TrvalDetail detail : newDetailList) {
				detail.setApplyTrval(applyTrval);
				detail.setId(Generator.getUUID());
				baseDao.save(detail);
			}
		}
	}
	
	@Override
	public void doTransApplyAudit(String id, int status) {
		ApplyTrval applyTrval = baseDao.findObject(ApplyTrval.class, id);
		applyTrval.setStatus(status);
		baseDao.update(applyTrval);
	}
}
