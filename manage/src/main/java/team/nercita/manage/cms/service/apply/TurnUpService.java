/*
 * TurnUpService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月6日 下午7:32:08
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply;

import java.util.List;
import java.util.Map;

import team.nercita.manage.cms.po.form.ApplyTurnUp;
import team.nercita.manage.cms.po.form.WorkExperience;

/**
 *
 * @author L
 * @date 2017年8月6日 下午7:32:08
 */
public interface TurnUpService {
	 public Map<String, Object> doJoinTransFindApplyTurnUpList(Integer goPage, Map<String, Object> paramMap);
	 
	 public void doTransSaveApplyTurnUp(ApplyTurnUp applyTurnUp, List<WorkExperience> experiences);
	 
	 public ApplyTurnUp doJoinTransFindApplyTurnUp(String id);
	 
	 public void doTransUpdateApplyTurnUp(ApplyTurnUp applyTurnUp, List<WorkExperience> experiences);
}
