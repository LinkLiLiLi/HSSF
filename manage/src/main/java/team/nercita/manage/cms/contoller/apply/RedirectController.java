/*
 * RedirectController.java
 * 创建者：L
 * 创建日期：2017年12月29日 下午2:18:24
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.contoller.apply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author L
 * @date： 2017年12月29日 下午2:18:24
 */
@Controller
@RequestMapping("apply/online")
public class RedirectController {
	@RequestMapping("/index")
	public String index(){
		return "apply/online/index";
	}
}
