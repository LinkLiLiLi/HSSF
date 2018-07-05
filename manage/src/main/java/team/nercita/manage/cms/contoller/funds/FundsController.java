/*
 * FundsController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月26日 上午11:13:30
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.funds;

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
import team.nercita.manage.cms.po.finance.FundsIncome;
import team.nercita.manage.cms.service.funds.FundsService;
import team.nercita.manage.cms.service.project.ProjectService;

/**
 * 经费到账
 * @author L
 * @date 2017年11月26日 上午11:13:30
 */
@Controller
@RequestMapping("/funds")
public class FundsController {
	@Autowired
	FundsService fundsService;
	
	@Autowired 
	ProjectService projectService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="projectId") String projectId, @ModelAttribute(value="financialNumber") String financialNumber){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("projectId", projectId);
		paramMap.put("financialNumber", financialNumber);
		
		ModelAndView view = new ModelAndView("funds/income/list");
		view.addAllObjects(fundsService.doJoinTransQueryFundsList(goPage, paramMap));
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		return view;
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView view = new ModelAndView("funds/income/add");
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		return view;
	}
	
	@RequestMapping("/add")
	public String add(FundsIncome fundsIncome, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		fundsIncome.setAddUser(user.getId());
		
		fundsService.doTransSaveFundsIncome(fundsIncome);
		attr.addFlashAttribute("msg", "添加成功!");
		return "redirect:/funds/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("funds/income/edit");
		view.addObject("fundsIncome",fundsService.doJoinTransFindFundsIncomeById(id));
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		return view;
	} 
	
	@RequestMapping("/edit")
	public String edit(FundsIncome fundsIncome, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		fundsIncome.setAddUser(user.getId());
		
		fundsService.doTransUpdateFundsIncome(fundsIncome);
		attr.addFlashAttribute("msg", "修改成功!");
		return "redirect:/funds/list";
	}
	
}
