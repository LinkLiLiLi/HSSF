/*
 * RegisterServiceImpl.java
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

import team.nercita.manage.cms.po.form.ApplyRegister;
import team.nercita.manage.cms.service.apply.RegisterService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年8月6日 下午3:39:08
 */
@Component
public class RegisterServiceImpl extends BaseService implements RegisterService {

	@Override
	public Map<String, Object> doJoinTransFindApplyRegisterList(Integer goPage, Map<String, Object> paramMap) {
		String userName = MapUtils.getString(paramMap, "userName");
		
		String sql = "select a from ApplyRegister a where 1=1 ";
		String countSql = "select count(a) from ApplyRegister a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(userName)){
			sql += " and a.userName like :USERNAME";
			countSql += " and a.userName like :USERNAME";
			queryMap.put("USERNAME", "%" + userName + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("registerList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveApplyRegister(ApplyRegister applyRegister) {
		applyRegister.setId(Generator.getUUID());
		
		baseDao.save(applyRegister);
	}

	@Override
	public ApplyRegister doJoinTransFindApplyRegister(String id) {
		ApplyRegister register = baseDao.findObject(ApplyRegister.class, id);
		register.getUser().getName();
		
		return register;
	}

	@Override
	public void doTransUpdateApplyRegister(ApplyRegister applyRegister) {
		baseDao.update(applyRegister);
	}
	
}
