/*
 * RegisterController.java
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
import team.nercita.manage.cms.po.form.ApplyRegister;
import team.nercita.manage.cms.service.apply.RegisterService;

/**
 *
 * @author L
 * @date 2017年8月6日 下午3:47:38
 */
@Controller
@RequestMapping("/apply/online/register")
public class RegisterController {
	@Autowired
	RegisterService registerService; 
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="userName") String userName){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userName", userName);
		
		ModelAndView view = new ModelAndView("apply/online/register/list");
		view.addAllObjects(registerService.doJoinTransFindApplyRegisterList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "apply/online/register/add";
	}
	
	@RequestMapping("/add")
	public String add(ApplyRegister applyRegister, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		applyRegister.setUser(user);
		registerService.doTransSaveApplyRegister(applyRegister);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/apply/online/register/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/register/edit");
		
		view.addObject("register", registerService.doJoinTransFindApplyRegister(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ApplyRegister applyRegister, RedirectAttributes attr){
		ApplyRegister oldApplyRegister = registerService.doJoinTransFindApplyRegister(applyRegister.getId());
		
		applyRegister.setUser(oldApplyRegister.getUser());
		applyRegister.setCreator(oldApplyRegister.getCreator());
		applyRegister.setCreateTime(oldApplyRegister.getCreateTime());
		
		registerService.doTransUpdateApplyRegister(applyRegister);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/apply/online/register/list";
	}
	
	@RequestMapping("/toprint/{id}")
	public ModelAndView toprint(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/register/print");
		
		view.addObject("register", registerService.doJoinTransFindApplyRegister(id));
		return view;
	}
}
