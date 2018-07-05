/*
 * ChequeController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2018年1月1日 下午8:38:32
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
import team.nercita.manage.cms.po.form.ApplyCheque;
import team.nercita.manage.cms.service.apply.ChequeService;
import team.nercita.manage.cms.service.project.ProjectService;

/**
 *
 * @author L
 * @date 2018年1月1日 下午8:38:32
 */
@Controller
@RequestMapping("/funds/cheque")
public class ChequeController {
	@Autowired
	ChequeService chequeService; 
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="title") String title , @ModelAttribute(value="keyWords") String keyWords){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("keyWords", keyWords);
		paramMap.put("title", title);
		
		ModelAndView view = new ModelAndView("funds/cheque/list");
		view.addAllObjects(chequeService.doJoinTransFindApplyChequeList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView view = new ModelAndView("funds/cheque/add");
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		return view;
		
	}
	
	@RequestMapping("/add")
	public String add(ApplyCheque applyCheque, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		chequeService.doTransSaveApplyCheque(applyCheque, user);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/funds/cheque/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("funds/cheque/edit");
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
		return "redirect:/funds/cheque/list";
	}
	
	@RequestMapping("/toprint/{id}")
	public ModelAndView toprint(@PathVariable String id){
		ModelAndView view = new ModelAndView("funds/cheque/print");
		view.addObject("cheque", chequeService.doJoinTransFindApplyCheque(id));
		return view;
	}
	
	@RequestMapping("/toaudit/{id}")
	public ModelAndView toaudit(@PathVariable String id){
		ModelAndView view = new ModelAndView("funds/cheque/audit");
		
		view.addObject("cheque", chequeService.doJoinTransFindApplyChequeById(id));
		return view;
	}

	@RequestMapping("/audit")
	public String audit(String id, int status, RedirectAttributes attr){
		chequeService.doTransApplyAudit(id, status);
		attr.addFlashAttribute("msg", "审核成功！");
		return "redirect:/funds/cheque/list";
	}
	
	@RequestMapping("/sub/{id}")
	public String sub(@PathVariable String id, RedirectAttributes attr){
		chequeService.doTransApplyAudit(id, 0);
		attr.addFlashAttribute("msg", "提交成功！");
		return "redirect:/funds/cheque/list";
	}
}
