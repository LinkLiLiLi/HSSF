/*
 * ApplyServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月6日 上午8:12:10
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.form.CommonForms;
import team.nercita.manage.cms.service.apply.ApplyService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年8月6日 上午8:12:10
 */
@Component
public class ApplyServiceImpl extends BaseService implements ApplyService {

	@Override
	public Map<String, Object> doJoinTransFindCommonFormList(Integer goPage, Map<String, Object> paramMap) {
		String fileName = MapUtils.getString(paramMap, "fileName");
		String formName = MapUtils.getString(paramMap, "formName");
		
		String sql = "select a from CommonForms a left join fetch a.user where 1=1 ";
		String countSql = "select count(a) from CommonForms a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(formName)){
			sql += " and a.formName like :FORMNAME";
			countSql += " and a.formName like :FORMNAME";
			queryMap.put("FORMNAME", "%" + formName + "%");
		}
		
		if(StringUtils.isNotBlank(fileName)){
			sql += " and a.fileName like :FILENAME";
			countSql += " and a.fileName like :FILENAME";
			queryMap.put("FILENAME", "%" + fileName + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("formList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveCommonForm(CommonForms commonForms) {
		commonForms.setId(Generator.getUUID());
		
		baseDao.save(commonForms);
	}

	@Override
	public CommonForms doJoinTransFindCommonForms(String id) {
		return baseDao.findObject(CommonForms.class, id);
	}

	@Override
	public void doTransUpdateCommonForms(CommonForms commonForms) {
		CommonForms oldCommonForms = baseDao.findObject(CommonForms.class, commonForms.getId());
		oldCommonForms.setFormName(commonForms.getFormName());
		oldCommonForms.setContent(commonForms.getContent());
		if(StringUtils.isNotBlank(commonForms.getFileName())){
			oldCommonForms.setFileName(commonForms.getFileName());
			oldCommonForms.setFilePath(commonForms.getFilePath());
		}
		
		baseDao.update(oldCommonForms);
	}

}
