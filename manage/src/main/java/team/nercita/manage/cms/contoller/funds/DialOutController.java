/*
 * DialOutController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2018年1月1日 下午12:44:43
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.funds;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.projectmanage.DialOutFund;
import team.nercita.manage.cms.service.funds.DialOutService;
import team.nercita.manage.cms.service.project.ProjectService;

/**
 *
 * @author L
 * @date 2018年1月1日 下午12:44:43
 */
@Controller
@RequestMapping("/funds/out")
public class DialOutController {
	@Autowired
	DialOutService dialOutService;
	
	@Autowired 
	ProjectService projectService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="projectId") String projectId){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("projectId", projectId);
		
		ModelAndView view = new ModelAndView("funds/out/list");
		view.addAllObjects(dialOutService.doJoinTransQueryFundsList(goPage, paramMap));
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		return view;
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView view = new ModelAndView("funds/out/add");
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		return view;
	}
	
	@RequestMapping("/add")
	public String add(DialOutFund dialOutFund, RedirectAttributes attr){
		dialOutService.doTransSaveDialOut(dialOutFund);
		attr.addFlashAttribute("msg", "添加成功!");
		return "redirect:/funds/out/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("funds/out/edit");
		view.addObject("fundsout",dialOutService.doJoinTransFindDialOutById(id));
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		return view;
	} 
	
	@RequestMapping("/edit")
	public String edit(DialOutFund dialOutFund, RedirectAttributes attr){
		
		dialOutService.doTransUpdateDialOut(dialOutFund);
		attr.addFlashAttribute("msg", "修改成功!");
		return "redirect:/funds/out/list";
	}
}
