/*
 * OtherServiceImpl.java
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

import team.nercita.manage.cms.po.projectmanage.OtherFund;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.funds.OtherService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2018年1月1日 下午12:51:12
 */
@Component
public class OtherServiceImpl extends BaseService implements OtherService {

	@Override
	public Map<String, Object> doJoinTransQueryFundsList(Integer goPage, Map<String, Object> paramMap) {
		String unit = MapUtils.getString(paramMap, "unit");
		
		String sql = "select a from OtherFund a where 1=1 ";
		String countSql = "select count(a) from OtherFund a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(unit)){
			sql += " and a.unit like :UNIT";
			countSql += " and a.unit like :UNIT";
			queryMap.put("UNIT", "%" + unit + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("otherList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveOther(OtherFund otherFund) {
		otherFund.setId(Generator.getUUID());
		baseDao.save(otherFund);
	}

	@Override
	public OtherFund doJoinTransFindOtherById(String id) {
		return baseDao.findObject(OtherFund.class, id);
	}

	@Override
	public void doTransUpdateOther(OtherFund otherFund) {
		baseDao.update(otherFund);
	}

}
