/*
 * WorkPlanController.java
 * 创建者：L
 * 创建日期：2017年12月18日 上午11:44:21
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.contoller.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.nercita.manage.cms.contoller.BaseAPPController;
import team.nercita.manage.cms.model.Result;
import team.nercita.manage.cms.model.WorkPlanVo;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.service.usermanage.WorkPlanService;

/**
 * 
 * @author L
 * @date： 2017年12月18日 上午11:44:21
 */
@Controller
@RequestMapping("/app")
public class AppWorkPlanController extends BaseAPPController {
	
	@Autowired
	WorkPlanService workPlanService;
	
	@RequestMapping("/v1.0/plan")
	@ResponseBody
	public Result<List<WorkPlanVo>> plan(@RequestParam(value="openid",required=false) String openid, @RequestParam(value="startindex",required=false) Integer startindex, @RequestParam(value="maxresult",required=false) Integer maxresult) {
		User user = checkLogin(openid);
		if(user == null) {
			return new Result<>(1000000, "登录超时，请重新登录！");
		}
		
		Result<List<WorkPlanVo>> result = new Result<>();
		
		if(startindex == null) {
			result.setResult(workPlanService.doJoinTransFindWorkPlan(user.getId(), 0, -1));
		} else {
			result.setResult(workPlanService.doJoinTransFindWorkPlan(user.getId(), startindex, maxresult));
		}
		return result;
	}
}
