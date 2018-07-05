/*
 * BaseAPPController.java
 * 创建者：L
 * 创建日期：2017年12月18日 上午9:39:49
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.contoller;

import org.springframework.beans.factory.annotation.Autowired;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.service.usermanage.UserService;

/**
 * 
 * @author L
 * @date： 2017年12月18日 上午9:39:49
 */
public class BaseAPPController {
	public static final double LAT = 39.949535;
	public static final double LNG = 116.293876;
	
	public static final double distance = 50d;
	
	@Autowired
	private UserService userService;
	
	public User checkLogin(String openId){
		return userService.doJoinTransCheckLoginApp(openId);
	}
	
	public User loginapp(String username, String password, String openid) {
		return userService.doTransLoginApp(username, password, openid);
	}
}
