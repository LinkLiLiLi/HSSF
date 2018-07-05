/*
 * LeaveServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月6日 下午3:39:08
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.form.ApplyLeave;
import team.nercita.manage.cms.service.apply.LeaveService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年8月6日 下午3:39:08
 */
@Component
public class LeaveServiceImpl extends BaseService implements LeaveService {

	@Override
	public Map<String, Object> doJoinTransFindApplyLeaveList(Integer goPage, Map<String, Object> paramMap) {
		String userName = MapUtils.getString(paramMap, "userName");
		Integer applyType = MapUtils.getInteger(paramMap, "applyType");
		String sql = "select a from ApplyLeave a left join fetch a.user where 1=1 ";
		String countSql = "select count(a) from ApplyLeave a  where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(userName)){
			sql += " and a.user.name like :USERNAME";
			countSql += " and a.user.name like :USERNAME";
			queryMap.put("USERNAME", "%" + userName + "%");
		}
		
		if (applyType != null) {
			sql += " and a.applyType = :APPLYTYPE";
			countSql += " and a.applyType = :APPLYTYPE";
			queryMap.put("APPLYTYPE", applyType);
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("leaveList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveApplyLeave(ApplyLeave applyLeave) {
		applyLeave.setId(Generator.getUUID());
		
		baseDao.save(applyLeave);
	}

	@Override
	public ApplyLeave doJoinTransFindApplyLeave(String id) {
		ApplyLeave Leave = baseDao.findObject(ApplyLeave.class, id);
		Leave.getUser().getName();
		
		return Leave;
	}

	@Override
	public void doTransUpdateApplyLeave(ApplyLeave applyLeave) {
		baseDao.update(applyLeave);
	}
	
}
