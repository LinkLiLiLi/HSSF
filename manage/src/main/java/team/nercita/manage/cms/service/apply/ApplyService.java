/*
 * ApplyService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月5日 上午8:59:50
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply;

import java.util.Map;

import team.nercita.manage.cms.po.form.CommonForms;

/**
 *
 * @author L
 * @date 2017年8月5日 上午8:59:50
 */
public interface ApplyService {
	 public Map<String, Object> doJoinTransFindCommonFormList(Integer goPage, Map<String, Object> paramMap);
	 
	 public void doTransSaveCommonForm(CommonForms commonForms);
	 
	 public CommonForms doJoinTransFindCommonForms(String id);
	 
	 public void doTransUpdateCommonForms(CommonForms commonForms);
}
