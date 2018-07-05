/*
 * BackToSchoolServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月9日 下午8:45:57
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.form.ApplyBackToSchool;
import team.nercita.manage.cms.service.apply.BackToSchoolService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年8月9日 下午8:45:57
 */
@Component
public class BackToSchoolServiceImpl extends BaseService implements BackToSchoolService {

	@Override
	public Map<String, Object> doJoinTransFindApplyBackToSchoolList(Integer goPage, Map<String, Object> paramMap) {
		String userName = MapUtils.getString(paramMap, "userName");
		
		String sql = "select a from ApplyBackToSchool a where 1=1 ";
		String countSql = "select count(a) from ApplyBackToSchool a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(userName)){
			sql += " and a.userName like :USERNAME";
			countSql += " and a.userName like :USERNAME";
			queryMap.put("USERNAME", "%" + userName + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("backToSchoolList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveApplyBackToSchool(ApplyBackToSchool applyBackToSchool) {
		applyBackToSchool.setId(Generator.getUUID());
		
		baseDao.save(applyBackToSchool);
	}

	@Override
	public ApplyBackToSchool doJoinTransFindApplyBackToSchool(String id) {
		
		return baseDao.findObject(ApplyBackToSchool.class, id);
	}

	@Override
	public void doTransUpdateApplyBackToSchool(ApplyBackToSchool applyBackToSchool) {
		baseDao.update(applyBackToSchool);
	}

}
