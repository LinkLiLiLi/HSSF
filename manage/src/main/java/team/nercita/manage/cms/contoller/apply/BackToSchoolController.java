/*
 * BackToSchoolController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月8日 下午10:01:29
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
import team.nercita.manage.cms.po.form.ApplyBackToSchool;
import team.nercita.manage.cms.service.apply.BackToSchoolService;

/**
 *
 * @author L
 * @date 2017年8月8日 下午10:01:29
 */
@Controller
@RequestMapping("/apply/online/backToSchool")
public class BackToSchoolController {
	
	@Autowired
	BackToSchoolService backToSchoolService; 
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="userName") String userName){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userName", userName);
		
		ModelAndView view = new ModelAndView("apply/online/backToSchool/list");
		view.addAllObjects(backToSchoolService.doJoinTransFindApplyBackToSchoolList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "apply/online/backToSchool/add";
	}
	
	@RequestMapping("/add")
	public String add(ApplyBackToSchool applyBackToSchool, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		applyBackToSchool.setUser(user);
		backToSchoolService.doTransSaveApplyBackToSchool(applyBackToSchool);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/apply/online/backToSchool/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/backToSchool/edit");
		
		view.addObject("backToSchool", backToSchoolService.doJoinTransFindApplyBackToSchool(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ApplyBackToSchool applyBackToSchool, RedirectAttributes attr){
		ApplyBackToSchool oldApplyBackToSchool = backToSchoolService.doJoinTransFindApplyBackToSchool(applyBackToSchool.getId());
		
		applyBackToSchool.setUser(oldApplyBackToSchool.getUser());
		applyBackToSchool.setCreator(oldApplyBackToSchool.getCreator());
		applyBackToSchool.setCreateTime(oldApplyBackToSchool.getCreateTime());
		
		backToSchoolService.doTransUpdateApplyBackToSchool(applyBackToSchool);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/apply/online/backToSchool/list";
	}
	
	@RequestMapping("/toprint/{id}")
	public ModelAndView toprint(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/backToSchool/print");
		
		view.addObject("backToSchool", backToSchoolService.doJoinTransFindApplyBackToSchool(id));
		return view;
	}
}
