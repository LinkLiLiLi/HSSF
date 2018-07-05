/*
 * TurnUpServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月6日 下午7:33:01
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.form.ApplyTurnUp;
import team.nercita.manage.cms.po.form.WorkExperience;
import team.nercita.manage.cms.service.apply.TurnUpService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年8月6日 下午7:33:01
 */
@Component
public class TurnUpServiceImpl extends BaseService implements TurnUpService {

	@Override
	public Map<String, Object> doJoinTransFindApplyTurnUpList(Integer goPage, Map<String, Object> paramMap) {
		String userName = MapUtils.getString(paramMap, "userName");
		
		String sql = "select a from ApplyTurnUp a left join fetch a.workExperienceList where 1=1 ";
		String countSql = "select count(a) from ApplyTurnUp a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(userName)){
			sql += " and a.userName like :USERNAME";
			countSql += " and a.userName like :USERNAME";
			queryMap.put("USERNAME", "%" + userName + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("turnUpList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		return paramMap;
	}

	@Override
	public void doTransSaveApplyTurnUp(ApplyTurnUp applyTurnUp, List<WorkExperience> experiences) {
		applyTurnUp.setId(Generator.getUUID());
		applyTurnUp.setWorkExperienceList(null);
		
		baseDao.save(applyTurnUp);
		
		if(experiences != null){
			for (WorkExperience workExperience : experiences) {
				if(workExperience.getBeginTime() != null || workExperience.getEndTime() != null || StringUtils.isNotBlank(workExperience.getUnit())){
					workExperience.setApplyTurnUp(applyTurnUp);
					workExperience.setId(Generator.getUUID());
					
					baseDao.save(workExperience);
				}
			}
		}
		
	}

	@Override
	public ApplyTurnUp doJoinTransFindApplyTurnUp(String id) {
		String sql = "select a from ApplyTurnUp a left join fetch a.workExperienceList where a.id = :TURNUPID";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("TURNUPID", id);
		
		return baseDao.findObject(sql, queryMap);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void doTransUpdateApplyTurnUp(ApplyTurnUp applyTurnUp, List<WorkExperience> experiences) {
		String sql = "select a from WorkExperience a where a.applyTurnUp.id = :TURNUPID";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("TURNUPID", applyTurnUp.getId());
		
		List<WorkExperience> workExperienceList = (List<WorkExperience>) baseDao.findObjectList(sql, queryMap);
		
		if(workExperienceList != null && !workExperienceList.isEmpty()){
			for (WorkExperience workExperience : workExperienceList) {
				baseDao.delete(workExperience);
			}
		}
		
		applyTurnUp.setWorkExperienceList(null);
		baseDao.update(applyTurnUp);
		
		for (WorkExperience workExperience : experiences) {
			if(workExperience.getBeginTime() != null || workExperience.getEndTime() != null || StringUtils.isNotBlank(workExperience.getUnit())){
				workExperience.setApplyTurnUp(applyTurnUp);
				workExperience.setId(Generator.getUUID());
				
				baseDao.save(workExperience);
			}
		}
	}
}
