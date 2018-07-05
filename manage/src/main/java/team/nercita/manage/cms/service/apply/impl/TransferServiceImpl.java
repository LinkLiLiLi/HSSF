/*
 * TransferServiceImpl.java
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

import team.nercita.manage.cms.po.form.ApplyTransfer;
import team.nercita.manage.cms.service.apply.TransferService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年8月9日 下午8:45:57
 */
@Component
public class TransferServiceImpl extends BaseService implements TransferService {

	@Override
	public Map<String, Object> doJoinTransFindApplyTransferList(Integer goPage, Map<String, Object> paramMap) {
		String use = MapUtils.getString(paramMap, "use");
		String unit = MapUtils.getString(paramMap, "unit");
		String project = MapUtils.getString(paramMap, "project");
		String status = MapUtils.getString(paramMap, "status");
		
		String sql = "select a from ApplyTransfer a left join fetch a.project where 1=1 ";
		String countSql = "select count(a) from ApplyTransfer a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(use)){
			sql += " and a.useInfo like :USE";
			countSql += " and a.useInfo like :USE";
			queryMap.put("USE", "%" + use + "%");
		}
		
		if(StringUtils.isNotBlank(status)){
			sql += " and a.status = :STATUS";
			countSql += " and a.status = :STATUS";
			queryMap.put("STATUS", Integer.parseInt(status));
		}
		
		if(StringUtils.isNotBlank(unit)){
			sql += " and a.payUnit like :UNIT";
			countSql += " and a.payUnit like :UNIT";
			queryMap.put("UNIT", "%" + unit + "%");
		}
		
		if(StringUtils.isNotBlank(project)){
			sql += " and a.project.projectName like :PROJECT";
			countSql += " and a.project.projectName like :PROJECT";
			queryMap.put("PROJECT", "%" + project + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("transferList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveApplyTransfer(ApplyTransfer applyTransfer) {
		applyTransfer.setId(Generator.getUUID());
		
		baseDao.save(applyTransfer);
	}

	@Override
	public ApplyTransfer doJoinTransFindApplyTransfer(String id) {
		String sql = "select a from ApplyTransfer a left join fetch a.project where a.id=:ID";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("ID", id);
		return baseDao.findObject(sql, queryMap);
	}

	@Override
	public void doTransUpdateApplyTransfer(ApplyTransfer applyTransfer) {
		baseDao.update(applyTransfer);
	}
	
	@Override
	public void doTransApplyAudit(String id, int auditStatus) {
		ApplyTransfer applyTransfer = baseDao.findObject(ApplyTransfer.class, id);
		applyTransfer.setAuditStatus(auditStatus);
		baseDao.update(applyTransfer);
	}
}
