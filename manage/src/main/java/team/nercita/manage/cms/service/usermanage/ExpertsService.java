/*
 * ExpertsService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月15日 下午12:31:33
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage;

import java.util.Map;

import team.nercita.manage.cms.po.deptmanage.Experts;

/**
 * 专家service
 * @author L
 * @date 2017年7月15日 下午12:31:33
 */
public interface ExpertsService {
	public Map<String, Object> doJoinTransFindExperts(Integer goPage, Map<String, Object> paramMap);
	
	public void doTransSaveExperts(Experts experts);
	
	public Experts doJoinTransFindExperts(String id);
	
	public void doTransUpdateExperts(Experts experts);
}
