/*
 * ExpertsServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月15日 下午12:32:57
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.deptmanage.Experts;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.usermanage.ExpertsService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年7月15日 下午12:32:57
 */
@Component
public class ExpertsServiceImpl extends BaseService implements ExpertsService {

	@Override
	public Map<String, Object> doJoinTransFindExperts(Integer goPage, Map<String, Object> paramMap) {
		String userName = MapUtils.getString(paramMap, "userName");
		
		String sql = "select e from Experts e where 1=1 ";
		String countSql = "select count(e) from Experts e where 1=1 ";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(userName)){
			sql += " and e.userName like :USERNAME";
			countSql += " and e.userName like :USERNAME";
			queryMap.put("USERNAME", "%" + userName + "%");
		}
		
		sql +=" order by e.unit";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("expertsList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}
	
	@Override
	public void doTransSaveExperts(Experts experts) {
		experts.setId(Generator.getUUID());
		
		baseDao.save(experts);
	}
	
	
	@Override
	public Experts doJoinTransFindExperts(String id) {
		return baseDao.findObject(Experts.class, id);
	}
	
	@Override
	public void doTransUpdateExperts(Experts experts) {
		baseDao.update(experts);
	}
}
