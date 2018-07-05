/*
 * AppSignController.java
 * 创建者：L
 * 创建日期：2017年12月18日 下午3:19:08
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.contoller.app;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.nercita.manage.cms.contoller.BaseAPPController;
import team.nercita.manage.cms.model.Result;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.service.sign.SignService;
import team.nercita.manage.cms.util.DistanceUtil;

/**
 * 
 * @author L
 * @date： 2017年12月18日 下午3:19:08
 */
@Controller
@RequestMapping("/app")
public class AppSignController extends BaseAPPController{
	
	@Autowired
	SignService signService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("/v1.0/sign")
	@ResponseBody
	public Result plan(@RequestParam(value="openid",required=false) String openid, @RequestParam(value="lat",required=false) double lat, @RequestParam(value="lng",required=false) double lng, @RequestParam(value="addr",required=false) String addr) {
		User user = checkLogin(openid);
		if(user == null) {
			new Result<>(1000000, "登录超时，请重新登录！");
		}
		
		double dis = DistanceUtil.GetDistance(LAT, LNG, lat, lng);
		
		if(distance > dis) {
			signService.doTransSaveSign(user, addr);
		} else {
			return new Result<>(1300000, "不在可打卡范围内，不允许打卡！");
		}
		
		
		return new Result<>();
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("/v1.0/absent")
	@ResponseBody
	public Result absent(@RequestParam(value="openid",required=false) String openid, @RequestParam(value="reason",required=false) String reason, @RequestParam(value="type",required=false) int type, @RequestParam(value="startTime",required=false) long startTime, @RequestParam(value="endTime",required=false) long endTime,  @RequestParam(value="duration",required=false) String duration){
		User user = checkLogin(openid);
		if(user == null) {
			new Result<>(1000000, "登录超时，请重新登录！");
		}
		
		try {
			signService.doTransSaveAbsent(user, reason, type, new Date(startTime), new Date(endTime), duration);
		} catch (Exception e) {
			new Result<>(1000001, "系统或网络错误，请稍后尝试！");
		}
		
		return new Result<>();
	}
}
