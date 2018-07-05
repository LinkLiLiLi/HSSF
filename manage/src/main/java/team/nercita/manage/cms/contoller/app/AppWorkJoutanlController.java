/*
 * AppWorkJoutanlController.java
 * 创建者：L
 * 创建日期：2017年12月18日 下午2:26:26
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.contoller.app;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.nercita.manage.cms.contoller.BaseAPPController;
import team.nercita.manage.cms.model.Result;
import team.nercita.manage.cms.model.WorkJoutanlVo;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.deptmanage.WorkJoutanl;
import team.nercita.manage.cms.service.usermanage.WorkJoutanlService;

/**
 * 
 * @author L
 * @date： 2017年12月18日 下午2:26:26
 */
@Controller
@RequestMapping("/app")
public class AppWorkJoutanlController extends BaseAPPController{
	@Autowired
	WorkJoutanlService workJoutanlService;
	
	@RequestMapping("/v1.0/joutanl/list")
	@ResponseBody
	public Result<List<WorkJoutanlVo>> plan(@RequestParam(value="openid",required=false) String openid, @RequestParam(value="startindex",required=false) Integer startindex, @RequestParam(value="maxresult",required=false) Integer maxresult) {
		User user = checkLogin(openid);
		if(user == null) {
			new Result<>(1000000, "登录超时，请重新登录！");
		}
		
		Result<List<WorkJoutanlVo>> result = new Result<>();
		
		if(startindex == null) {
			result.setResult(workJoutanlService.doJoinTransFindWorkJoutanlApp(user.getId(), 0, -1));
		} else {
			result.setResult(workJoutanlService.doJoinTransFindWorkJoutanlApp(user.getId(), startindex, maxresult));
		}
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("/v1.0/joutanl/add")
	@ResponseBody
	public Result add(@RequestParam(value="openid",required=false) String openid, @RequestParam(value="content",required=false) String content){
		User user = checkLogin(openid);
		if(user == null) {
			new Result<>(1000000, "登录超时，请重新登录！");
		}
		
		WorkJoutanl workJoutanl = new WorkJoutanl();
		workJoutanl.setJoutanlDate(new Date());
		workJoutanl.setUser(user);
		workJoutanl.setWorkContent(content);
		
		workJoutanlService.doTransSaveWorkJoutanl(workJoutanl);
		
		return new Result<>();
	}
	
	@RequestMapping("/v1.0/joutanl/detail")
	@ResponseBody
	public Result<WorkJoutanlVo> detail(@RequestParam(value="openid",required=false) String openid, @RequestParam(value="id",required=false) String id) {
		User user = checkLogin(openid);
		if(user == null) {
			new Result<>(1000000, "登录超时，请重新登录！");
		}
		
		WorkJoutanl joutanl = workJoutanlService.doJoinTransFindWorkJoutanlById(id);
		
		WorkJoutanlVo vo = new WorkJoutanlVo();
		vo.setId(joutanl.getId());
		vo.setJoutanlDate(joutanl.getJoutanlDate());
		vo.setContent(joutanl.getWorkContent());
		
		return new Result<WorkJoutanlVo>(200, "success", true, vo);
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("/v1.0/joutanl/edit")
	@ResponseBody
	public Result edit(@RequestParam(value="openid",required=false) String openid, @RequestParam(value="content",required=false) String content, @RequestParam(value="id",required=false) String id){
		User user = checkLogin(openid);
		if(user == null) {
			new Result<>(1000000, "登录超时，请重新登录！");
		}
		
		WorkJoutanl workJoutanl = new WorkJoutanl();
		workJoutanl.setWorkContent(content);
		workJoutanl.setId(id);
		workJoutanlService.doTransUpdateWorkJoutanl(workJoutanl);
		
		return new Result<>();
	}
}
