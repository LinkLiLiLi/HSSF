/*
 * ApplyChequeController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月8日 下午4:35:35
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
import team.nercita.manage.cms.po.form.ApplyCheque;
import team.nercita.manage.cms.service.apply.ChequeService;
import team.nercita.manage.cms.service.project.ProjectService;

/**
 * 支票领用
 * @author L
 * @date 2017年11月8日 下午4:35:35
 */
@Controller
@RequestMapping("/apply/online/cheque")
public class ApplyChequeController {
	@Autowired
	ChequeService chequeService; 
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="title") String title , @ModelAttribute(value="keyWords") String keyWords){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("keyWords", keyWords);
		paramMap.put("title", title);
		
		ModelAndView view = new ModelAndView("apply/online/cheque/list");
		view.addAllObjects(chequeService.doJoinTransFindApplyChequeList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView view = new ModelAndView("apply/online/cheque/add");
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		return view;
		
	}
	
	@RequestMapping("/add")
	public String add(ApplyCheque applyCheque, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		chequeService.doTransSaveApplyCheque(applyCheque, user);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/apply/online/cheque/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/cheque/edit");
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		view.addObject("cheque", chequeService.doJoinTransFindApplyCheque(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ApplyCheque applyCheque, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		ApplyCheque oldApplyCheque = chequeService.doJoinTransFindApplyChequeById(applyCheque.getId());
		
		applyCheque.setCreateTime(oldApplyCheque.getCreateTime());
		applyCheque.setCreator(oldApplyCheque.getCreator());
		chequeService.doTransUpdateApplyCheque(applyCheque, user);
		
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/apply/online/cheque/list";
	}
	
	@RequestMapping("/toprint/{id}")
	public ModelAndView toprint(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/cheque/print");
		view.addObject("cheque", chequeService.doJoinTransFindApplyCheque(id));
		return view;
	}
}
