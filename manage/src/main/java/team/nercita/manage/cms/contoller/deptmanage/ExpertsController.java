/*
 * ExpertsController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月15日 下午12:28:23
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.deptmanage;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.deptmanage.Experts;
import team.nercita.manage.cms.service.usermanage.ExpertsService;

/**
 * 专家管理
 * @author L
 * @date 2017年7月15日 下午12:28:23
 */
@Controller
@RequestMapping("/experts")
public class ExpertsController{
	@Autowired
	ExpertsService expertsService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="userName") String userName){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userName", userName);
		
		ModelAndView view = new ModelAndView("deptmanage/experts/list");
		view.addAllObjects(expertsService.doJoinTransFindExperts(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toAdd")
	public String list(){
		return "deptmanage/experts/add";
	}
	
	@RequestMapping("/add")
	public String add(Experts experts, RedirectAttributes attr){
		expertsService.doTransSaveExperts(experts);
		attr.addFlashAttribute("msg", "添加成功!");
		return "redirect:/experts/list";
	}
	
	@RequestMapping("/detail/{id}")
	public ModelAndView detail(@PathVariable String id){
		
		ModelAndView view = new ModelAndView("deptmanage/experts/detail");
		view.addObject("experts", expertsService.doJoinTransFindExperts(id));
		return view;
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		
		ModelAndView view = new ModelAndView("deptmanage/experts/edit");
		view.addObject("experts", expertsService.doJoinTransFindExperts(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(Experts experts, RedirectAttributes attr){
		expertsService.doTransUpdateExperts(experts);
		attr.addFlashAttribute("msg", "修改成功!");
		return "redirect:/experts/list";
	}
}
