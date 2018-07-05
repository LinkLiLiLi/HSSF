/*
 * CommonController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2018年1月7日 上午8:03:09
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import team.nercita.manage.cms.service.common.CommonService;

/**
 *
 * @author L
 * @date 2018年1月7日 上午8:03:09
 */
@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	CommonService commonService;
	
	@RequestMapping("/del")
	@ResponseBody
	public String del(String id, String entry){
		try {
			commonService.doTransCommonDel(id, entry);
			return "0";
		} catch (Exception e) {
			return "1";
		}
	}
}
