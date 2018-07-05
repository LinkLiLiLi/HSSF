/*
 * ChangeDeptService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月9日 下午10:04:03
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply;

import java.util.Map;

import team.nercita.manage.cms.po.form.ApplyChangeDept;

/**
 *
 * @author L
 * @date 2017年8月9日 下午10:04:03
 */
public interface ChangeDeptService {
	public Map<String, Object> doJoinTransFindApplyChangeDeptList(Integer goPage, Map<String, Object> paramMap);
	 
	public void doTransSaveApplyChangeDept(ApplyChangeDept applyChangeDept);
	 
	public ApplyChangeDept doJoinTransFindApplyChangeDept(String id);
	 
	public void doTransUpdateApplyChangeDept(ApplyChangeDept applyChangeDept);
}
