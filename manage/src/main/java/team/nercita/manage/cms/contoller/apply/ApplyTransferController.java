/*
 * ApplyTransferController.java
 * 创建者：L
 * 创建日期：2017年11月4日 上午11:03:40
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.contoller.apply;

import java.math.BigDecimal;
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
import team.nercita.manage.cms.po.form.ApplyTransfer;
import team.nercita.manage.cms.service.apply.TransferService;
import team.nercita.manage.cms.service.project.ProjectService;
import team.nercita.manage.cms.util.NumberToCN;

/**
 * 
 * @author L
 * @date： 2017年11月4日 上午11:03:40
 */
@Controller
@RequestMapping("/apply/online/transfer")
public class ApplyTransferController {
	@Autowired
	TransferService transferService; 
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="unit") String unit, @ModelAttribute(value="use") String use, @ModelAttribute(value="project") String project){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("unit", unit);
		paramMap.put("use", use);
		paramMap.put("project", project);
		
		ModelAndView view = new ModelAndView("apply/online/transfer/list");
		view.addAllObjects(transferService.doJoinTransFindApplyTransferList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView view = new ModelAndView("apply/online/transfer/add");
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		return view;
	}
	
	@RequestMapping("/add")
	public String add(ApplyTransfer applyTransfer, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		applyTransfer.setUser(user);
		transferService.doTransSaveApplyTransfer(applyTransfer);

		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/apply/online/transfer/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/transfer/edit");
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		view.addObject("transfer", transferService.doJoinTransFindApplyTransfer(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ApplyTransfer applyTransfer, RedirectAttributes attr){
		ApplyTransfer oldApplyTransfer = transferService.doJoinTransFindApplyTransfer(applyTransfer.getId());
		
		applyTransfer.setUser(oldApplyTransfer.getUser());
		applyTransfer.setCreator(oldApplyTransfer.getCreator());
		applyTransfer.setCreateTime(oldApplyTransfer.getCreateTime());
		
		transferService.doTransUpdateApplyTransfer(applyTransfer);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/apply/online/transfer/list";
	}
	
	@RequestMapping("/toprint/{id}")
	public ModelAndView toprint(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/transfer/print");
		
		ApplyTransfer transfer = transferService.doJoinTransFindApplyTransfer(id);
		view.addObject("transfer", transfer);
		
		if(transfer.getAmount() != null) {
			view.addObject("CN", NumberToCN.number2CNMontrayUnit(new BigDecimal(transfer.getAmount())));
		}
		return view;
	}
}
