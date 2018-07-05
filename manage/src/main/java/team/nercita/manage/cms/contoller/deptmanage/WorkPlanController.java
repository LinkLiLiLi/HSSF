/*
 * WorkPlanController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月16日 下午3:20:59
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.deptmanage;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.deptmanage.PlanLog;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.deptmanage.WorkPlan;
import team.nercita.manage.cms.service.usermanage.UserService;
import team.nercita.manage.cms.service.usermanage.WorkPlanService;
import team.nercita.manage.cms.vo.AlertWinVo;

/**
 * 工作计划
 * @author L
 * @date 2017年7月16日 下午3:20:59
 */
@Controller
@RequestMapping("/workplan")
public class WorkPlanController {
	
	@Autowired
	WorkPlanService workPlanService;
	@Autowired
	UserService userService;
	
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="content") String content,@ModelAttribute(value="userName") String userName, @ModelAttribute(value="startTime") String startTime, @ModelAttribute(value="endTime") String endTime, @ModelAttribute(value="status") String status){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("content", content);
		paramMap.put("userName", userName);
		paramMap.put("startTime", StringUtils.isBlank(startTime) ? null : DateTime.parse(startTime).toDate());
		paramMap.put("endTime", StringUtils.isBlank(endTime) ? null : DateTime.parse(endTime).toDate());
		paramMap.put("status", StringUtils.isBlank(status) ? null : Integer.parseInt(status));
		
		paramMap.put("ownId", user.getId());
		
		ModelAndView view  = new ModelAndView("deptmanage/workplan/list");
		view.addAllObjects(workPlanService.doJoinTransFindWorkPlan(goPage, paramMap));
		
		return view;
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		ModelAndView view  = new ModelAndView("deptmanage/workplan/add");
		view.addObject("userList", userService.doJoinTransFindUserList(user.getId()));
		return view;
	}
	
	@RequestMapping("/add")
	public String add(WorkPlan workPlan, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		workPlan.setDistUser(user);
		workPlanService.doTransSaveWorkPlan(workPlan);
		attr.addFlashAttribute("msg", "添加成功!");
		return "redirect:/workplan/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		ModelAndView view  = new ModelAndView("deptmanage/workplan/edit");
		view.addObject("userList", userService.doJoinTransFindUserList(user.getId()));
		view.addObject("workPlan",workPlanService.doJoinTransFindWorkPlanById(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(WorkPlan workPlan, RedirectAttributes attr){
		
		workPlanService.doJoinTransUpdateWorkPlan(workPlan);
		attr.addFlashAttribute("msg", "修改成功!");
		return "redirect:/workplan/list";
	}
	
	@RequestMapping("/tocheck/{id}")
	public ModelAndView tocheck(@PathVariable String id){
		ModelAndView view  = new ModelAndView("deptmanage/workplan/check");
		view.addObject("workPlan",workPlanService.doJoinTransFindWorkPlanById(id));
		return view;
	}
	
	@RequestMapping("/check")
	public String check(WorkPlan workPlan, RedirectAttributes attr){
		workPlanService.doJoinTransCheckWorkPlan(workPlan);
		
		attr.addFlashAttribute("msg", "审核成功!");
		return "redirect:/workplan/list";
	}
	
	@RequestMapping("/addlog")
	public String addlog(PlanLog planLog, String content, RedirectAttributes attr){
		planLog.setProgress(content);
		workPlanService.doTransSavePlanLog(planLog);
		attr.addFlashAttribute("msg", "添加成功!");
		return "redirect:/workplan/list";
	}
	
	@RequestMapping("/tolog/{id}")
	public ModelAndView tolog(@PathVariable String id){
		ModelAndView view  = new ModelAndView("deptmanage/workplan/log");
		view.addObject("id", id);
		return view;
	}
	
	@ResponseBody
	@RequestMapping("/progress/{id}")
	public List<AlertWinVo> progress(@PathVariable String id){
		List<AlertWinVo> voList = new ArrayList<>();
		
		List<PlanLog> logList = workPlanService.doJoinTransQeuryLogById(id);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		if(logList != null && !logList.isEmpty()) {
			for (PlanLog planLog : logList) {
				AlertWinVo vo = new AlertWinVo();
				vo.setStr1(df.format(planLog.getCreateTime()));
				vo.setStr2(planLog.getProgress());
				
				voList.add(vo);
			}
		}
		
		return voList;
	}
	
}
