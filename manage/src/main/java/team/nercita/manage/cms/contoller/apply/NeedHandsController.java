/*
 * NeedHandsController.java
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
import team.nercita.manage.cms.po.form.ApplyNeedHands;
import team.nercita.manage.cms.service.apply.NeedHandsService;

/**
 *
 * @author L
 * @date 2017年8月8日 下午10:01:29
 */
@Controller
@RequestMapping("/apply/online/needhands")
public class NeedHandsController {
	
	@Autowired
	NeedHandsService needHandsService; 
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="userName") String userName){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userName", userName);
		
		ModelAndView view = new ModelAndView("apply/online/needhands/list");
		view.addAllObjects(needHandsService.doJoinTransFindApplyNeedHandsList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "apply/online/needhands/add";
	}
	
	@RequestMapping("/add")
	public String add(ApplyNeedHands applyNeedHands, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		applyNeedHands.setUser(user);
		needHandsService.doTransSaveApplyNeedHands(applyNeedHands);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/apply/online/needhands/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/needhands/edit");
		
		view.addObject("needhands", needHandsService.doJoinTransFindApplyNeedHands(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ApplyNeedHands applyNeedHands, RedirectAttributes attr){
		ApplyNeedHands oldApplyneedhands = needHandsService.doJoinTransFindApplyNeedHands(applyNeedHands.getId());
		
		applyNeedHands.setUser(oldApplyneedhands.getUser());
		applyNeedHands.setCreator(oldApplyneedhands.getCreator());
		applyNeedHands.setCreateTime(oldApplyneedhands.getCreateTime());
		
		needHandsService.doTransUpdateApplyNeedHands(applyNeedHands);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/apply/online/needhands/list";
	}
	
	@RequestMapping("/toprint/{id}")
	public ModelAndView toprint(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/needhands/print");
		
		view.addObject("needhands", needHandsService.doJoinTransFindApplyNeedHands(id));
		return view;
	}
}
