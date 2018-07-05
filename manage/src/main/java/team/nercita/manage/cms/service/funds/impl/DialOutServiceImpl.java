/*
 * DialOutServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2018年1月1日 下午12:51:12
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.funds.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.projectmanage.DialOutFund;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.funds.DialOutService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2018年1月1日 下午12:51:12
 */
@Component
public class DialOutServiceImpl extends BaseService implements DialOutService {

	@Override
	public Map<String, Object> doJoinTransQueryFundsList(Integer goPage, Map<String, Object> paramMap) {
		String projectId = MapUtils.getString(paramMap, "projectId");
		
		String sql = "select a from DialOutFund a left join fetch a.project where 1=1 ";
		String countSql = "select count(a) from DialOutFund a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(projectId)){
			sql += " and a.project.id = :PROJECTID";
			countSql += " and a.project.id = :PROJECTID";
			queryMap.put("PROJECTID", projectId);
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("outList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveDialOut(DialOutFund dialOutFund) {
		dialOutFund.setId(Generator.getUUID());
		baseDao.save(dialOutFund);
	}

	@Override
	public DialOutFund doJoinTransFindDialOutById(String id) {
		return baseDao.findObject(DialOutFund.class, id);
	}

	@Override
	public void doTransUpdateDialOut(DialOutFund dialOutFund) {
		baseDao.update(dialOutFund);
	}

}
