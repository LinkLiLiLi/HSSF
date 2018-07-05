/*
 * UserManageController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年6月17日 下午8:49:46
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.deptmanage;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.junit.Test;
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
import team.nercita.manage.cms.service.usermanage.RoleService;
import team.nercita.manage.cms.service.usermanage.UserGroupService;
import team.nercita.manage.cms.service.usermanage.UserService;
import team.nercita.manage.cms.util.Generator;

/**
 * 人员管理
 * @author L
 * @date 2017年6月17日 下午8:49:46
 */
@Controller
@RequestMapping("/user")
public class UserManageController {
	
	@Autowired
	UserService userService;
	@Autowired
	UserGroupService userGroupService;
	@Autowired
	RoleService roleService;

	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="userGroupId") String userGroupId, @ModelAttribute(value="name") String name, @ModelAttribute(value="userType") String userType){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userGroupId", userGroupId);
		paramMap.put("name", name);
		paramMap.put("userType", StringUtils.isBlank(userType) ? null : Integer.parseInt(userType));
		
		ModelAndView view = new ModelAndView("deptmanage/user/list");
		
		view.addAllObjects(userService.doJoinTransFindUserList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView view = new ModelAndView("deptmanage/user/add");
		view.addObject("userGroupList", userGroupService.doJoinTransFindUserGroup());
		view.addObject("roleList", roleService.doJoinTransFindRoleList());
		
		return view;
	}
	
	@RequestMapping("/add")
	public String add(User user, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, RedirectAttributes attr){
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
			user.setImageUrl(newFileName);
		}
		userService.doTransSaveUser(user, "api");
		
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/user/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("deptmanage/user/edit");
		view.addObject("userGroupList", userGroupService.doJoinTransFindUserGroup());
		view.addObject("roleList", roleService.doJoinTransFindRoleList());
		view.addObject("user", userService.doJoinTransFindUserById(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(User user, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, RedirectAttributes attr){
		if(file != null && file.getOriginalFilename() != null  && file.getSize() > 0){
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

			user.setImageUrl(newFileName);
		}
		userService.doTransUpdateUser(user);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/user/list";
	}
	
	@RequestMapping("/detail/{id}")
	public ModelAndView detail(@PathVariable String id){
		ModelAndView view = new ModelAndView("deptmanage/user/detail");
		view.addObject("user", userService.doJoinTransFindUserById(id));
		return view;
	}
	
	@RequestMapping("/pass")
	public String pass(){
		return "deptmanage/user/pass";
	}
	
	@RequestMapping("/editpass")
	public ModelAndView update(String oldpass, String newpass){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		ModelAndView view = new ModelAndView("deptmanage/user/pass");
		
		try {
			userService.doTransUpdatePassword(user.getId(), oldpass, newpass);
			view.addObject("msg", "修改成功！");
		} catch (Exception e) {
			view.addObject("msg", e.getMessage());
		}
		
		return view;
	}
}
