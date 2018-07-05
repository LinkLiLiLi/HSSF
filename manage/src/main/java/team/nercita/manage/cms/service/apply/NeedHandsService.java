/*
 * NeedHandsService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月8日 下午9:53:47
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply;

import java.util.Map;

import team.nercita.manage.cms.po.form.ApplyNeedHands;

/**
 * 用人service
 * @author L
 * @date 2017年8月8日 下午9:53:47
 */
public interface NeedHandsService {
	 public Map<String, Object> doJoinTransFindApplyNeedHandsList(Integer goPage, Map<String, Object> paramMap);
	 
	 public void doTransSaveApplyNeedHands(ApplyNeedHands applyNeedHands);
	 
	 public ApplyNeedHands doJoinTransFindApplyNeedHands(String id);
	 
	 public void doTransUpdateApplyNeedHands(ApplyNeedHands applyNeedHands);
}
