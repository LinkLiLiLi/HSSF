/*
 * IndexController.java
 * 创建者：L
 * 创建日期：2017年6月16日 上午11:10:18
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.contoller.index;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.service.usermanage.UserService;
import team.nercita.manage.cms.util.Message;

/**
 * 
 * @author L
 * @date： 2017年6月16日 上午11:10:18
 */
@Controller
public class IndexController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/index")
	public String index(){
		return "/index";
	}
	
	
	
	@RequestMapping("/gotomodifypwd")
	public String gotomodifypwd(){
		return "modifypwd";
	}
	
	@RequestMapping("/modifypwd")
	public ModelAndView modifypwd(HttpServletRequest request,String oldPassword, String newPassword){
		User user = (User) request.getSession().getAttribute("user");
		ModelAndView view = new ModelAndView("modifypwd");
		try {
			userService.doTransUpdateUserPwd(user.getId(), DigestUtils.md5Hex(oldPassword), DigestUtils.md5Hex(newPassword));
			view.addObject("message", new Message("succ", "您已成功修改密码！"));
		} catch (Exception e) {
			view.addObject("message", new Message("fail", e.getMessage()));
		}
		return view;
	}
}
