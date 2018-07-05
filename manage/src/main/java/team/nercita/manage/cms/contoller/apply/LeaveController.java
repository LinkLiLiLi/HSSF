/*
 * LeaveController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月6日 下午3:47:38
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.apply;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.form.ApplyLeave;
import team.nercita.manage.cms.service.apply.LeaveService;

/**
 *
 * @author L
 * @date 2017年8月6日 下午3:47:38
 */
@Controller
@RequestMapping("/apply/online/leave")
public class LeaveController {
	@Autowired
	LeaveService leaveService; 
	
	@RequestMapping("/{applyType}/list")
	public ModelAndView list(@PathVariable int applyType, Integer goPage, @ModelAttribute(value="userName") String userName){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userName", userName);
		paramMap.put("applyType", applyType);
		
		ModelAndView view = new ModelAndView("apply/online/leave/" + applyType + "/list");
		view.addAllObjects(leaveService.doJoinTransFindApplyLeaveList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/{applyType}/toadd")
	public String toadd(@PathVariable int applyType){
		return "apply/online/leave/" + applyType + "/add";
	}
	
	@RequestMapping("/add")
	public String add(ApplyLeave applyLeave, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		applyLeave.setUser(user);
		leaveService.doTransSaveApplyLeave(applyLeave);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/apply/online/leave/" + applyLeave.getApplyType() + "/list";
	}
	
	@RequestMapping("/{applyType}/toedit/{id}")
	public ModelAndView toedit(@PathVariable int applyType, @PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/leave/" + applyType + "/edit");
		
		view.addObject("leave", leaveService.doJoinTransFindApplyLeave(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ApplyLeave applyLeave, RedirectAttributes attr){
		ApplyLeave oldApplyLeave = leaveService.doJoinTransFindApplyLeave(applyLeave.getId());
		
		applyLeave.setUser(oldApplyLeave.getUser());
		applyLeave.setCreator(oldApplyLeave.getCreator());
		applyLeave.setCreateTime(oldApplyLeave.getCreateTime());
		
		leaveService.doTransUpdateApplyLeave(applyLeave);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/apply/online/leave/" + applyLeave.getApplyType() + "/list";
	}
	
	@RequestMapping("/{applyType}/toprint/{id}")
	public ModelAndView toprint(@PathVariable int applyType, @PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/leave/" + applyType + "/print");
		
		view.addObject("leave", leaveService.doJoinTransFindApplyLeave(id));
		return view;
	}
}
