/*
 * SalaryService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月8日 下午11:14:34
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply;

import java.util.Map;

import team.nercita.manage.cms.po.form.ApplySalary;

/**
 * 调薪service
 * @author L
 * @date 2017年8月8日 下午11:14:34
 */
public interface SalaryService {
	public Map<String, Object> doJoinTransFindApplySalaryList(Integer goPage, Map<String, Object> paramMap);
	 
	 public void doTransSaveApplySalary(ApplySalary applySalary);
	 
	 public ApplySalary doJoinTransFindApplySalary(String id);
	 
	 public void doTransUpdateApplySalary(ApplySalary applySalary);
}
