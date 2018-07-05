/*
 * BackToSchoolService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月9日 下午8:44:28
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply;

import java.util.Map;

import team.nercita.manage.cms.po.form.ApplyBackToSchool;

/**
 *
 * @author L
 * @date 2017年8月9日 下午8:44:28
 */
public interface BackToSchoolService {
	public Map<String, Object> doJoinTransFindApplyBackToSchoolList(Integer goPage, Map<String, Object> paramMap);
	 
	 public void doTransSaveApplyBackToSchool(ApplyBackToSchool applyBackToSchool);
	 
	 public ApplyBackToSchool doJoinTransFindApplyBackToSchool(String id);
	 
	 public void doTransUpdateApplyBackToSchool(ApplyBackToSchool applyBackToSchool);
}
