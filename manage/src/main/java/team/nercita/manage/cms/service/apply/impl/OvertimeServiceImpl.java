/*
 * OvertimeServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月13日 上午10:32:49
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.form.ApplyOvertime;
import team.nercita.manage.cms.service.apply.OvertimeService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年8月13日 上午10:32:49
 */
@Component
public class OvertimeServiceImpl extends BaseService implements OvertimeService {

	@Override
	public Map<String, Object> doJoinTransFindApplyOvertimeList(Integer goPage, Map<String, Object> paramMap) {
		String userName = MapUtils.getString(paramMap, "userName");
		
		String sql = "select a from ApplyOvertime a left join fetch a.user where 1=1 ";
		String countSql = "select count(a) from ApplyOvertime a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(userName)){
			sql += " and a.user.name like :USERNAME";
			countSql += " and a.user.name like :USERNAME";
			queryMap.put("USERNAME", "%" + userName + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("overtimeList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveApplyOvertime(ApplyOvertime applyOvertime) {
		applyOvertime.setId(Generator.getUUID());
		
		baseDao.save(applyOvertime);
	}

	@Override
	public ApplyOvertime doJoinTransFindApplyOvertime(String id) {
		String sql = "select a from ApplyOvertime a left join fetch a.user where a.id = :OVERTIMEID";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("OVERTIMEID", id);
		
		return baseDao.findObject(sql, queryMap);
	}

	@Override
	public void doTransUpdateApplyOvertime(ApplyOvertime applyOvertime) {
		baseDao.update(applyOvertime);
	}

}
