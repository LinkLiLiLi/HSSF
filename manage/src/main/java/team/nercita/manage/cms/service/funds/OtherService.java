/*
 * OtherService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2018年1月1日 下午12:48:49
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.funds;

import java.util.Map;

import team.nercita.manage.cms.po.projectmanage.OtherFund;

/**
 *
 * @author L
 * @date 2018年1月1日 下午12:48:49
 */
public interface OtherService {
	public Map<String, Object> doJoinTransQueryFundsList(Integer goPage, Map<String, Object> paramMap);
	
	public void doTransSaveOther(OtherFund OtherFund);
	
	public OtherFund doJoinTransFindOtherById(String id);
	
	public void doTransUpdateOther(OtherFund OtherFund);
}
