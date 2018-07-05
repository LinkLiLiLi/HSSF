/*
 * TurnUpController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月6日 下午8:52:21
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.apply;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.form.ApplyTurnUp;
import team.nercita.manage.cms.po.form.WorkExperience;
import team.nercita.manage.cms.service.apply.TurnUpService;
import team.nercita.manage.cms.util.Generator;

/**
 *
 * @author L
 * @date 2017年8月6日 下午8:52:21
 */
@Controller
@RequestMapping("/apply/online/turnup")
public class TurnUpController {
	@Autowired
	TurnUpService turnUpService; 
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="userName") String userName){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userName", userName);
		
		ModelAndView view = new ModelAndView("apply/online/turnup/list");
		view.addAllObjects(turnUpService.doJoinTransFindApplyTurnUpList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "apply/online/turnup/add";
	}
	
	@RequestMapping("/add")
	public String add(ApplyTurnUp applyTurnUp, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, RedirectAttributes attr){
		if(file != null && file.getOriginalFilename() != null && file.getSize() > 0){
			String fileName = file.getOriginalFilename();
			String newFileName = Generator.getUUID() + fileName.substring(fileName.lastIndexOf("."));
			File uploadFile = new File(request.getSession().getServletContext().getRealPath("/upload"), newFileName);
			try {
				file.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			applyTurnUp.setHeadPath(newFileName);
		}
		
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		applyTurnUp.setUser(user);
		turnUpService.doTransSaveApplyTurnUp(applyTurnUp, applyTurnUp.getWorkExperienceList());
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/apply/online/turnup/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/turnup/edit");
		ApplyTurnUp applyTurnUp = turnUpService.doJoinTransFindApplyTurnUp(id);
		int size = applyTurnUp.getWorkExperienceList() == null ? 0 : applyTurnUp.getWorkExperienceList().size();
		
		for (int i = 0; i < 5 - size; i++) {
			WorkExperience w = new WorkExperience();
			w.setInsurance(0);
			applyTurnUp.getWorkExperienceList().add(w);
		}
		
		view.addObject("turnup", applyTurnUp);
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ApplyTurnUp applyTurnUp, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, RedirectAttributes attr){
		ApplyTurnUp oldApplyTurnUp = turnUpService.doJoinTransFindApplyTurnUp(applyTurnUp.getId());
		
		if(file != null && file.getOriginalFilename() != null && file.getSize() > 0){
			String fileName = file.getOriginalFilename();
			String newFileName = Generator.getUUID() + fileName.substring(fileName.lastIndexOf("."));
			File uploadFile = new File(request.getSession().getServletContext().getRealPath("/upload"), newFileName);
			try {
				file.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			applyTurnUp.setHeadPath(newFileName);
		} else {
			applyTurnUp.setHeadPath(oldApplyTurnUp.getHeadPath());
		}
		
		
		applyTurnUp.setUser(oldApplyTurnUp.getUser());
		applyTurnUp.setCreator(oldApplyTurnUp.getCreator());
		applyTurnUp.setCreateTime(oldApplyTurnUp.getCreateTime());
		
		turnUpService.doTransUpdateApplyTurnUp(applyTurnUp, applyTurnUp.getWorkExperienceList());
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/apply/online/turnup/list";
	}
	
	@RequestMapping("/toprint/{id}")
	public ModelAndView toprint(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/turnup/print");
		
		view.addObject("turnup", turnUpService.doJoinTransFindApplyTurnUp(id));
		return view;
	}
}
