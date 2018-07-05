/*
 * RoleManageController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年6月18日 上午8:54:12
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.deptmanage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.deptmanage.Permission;
import team.nercita.manage.cms.po.deptmanage.Role;
import team.nercita.manage.cms.service.usermanage.RoleService;
import team.nercita.manage.cms.shiro.ShiroStaticInfo;
import team.nercita.manage.cms.vo.FunctionVO;

/**
 *
 * @author L
 * @date 2017年6月18日 上午8:54:12
 */
@Controller
@RequestMapping("/role")
public class RoleManageController {
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping("/list")
	public ModelAndView list(){
		ModelAndView view = new ModelAndView("deptmanage/role/list");
		view.addObject("roleList", roleService.doJoinTransFindRoleVOList());
		return view;
	}
	
	@RequestMapping("/toAdd")
	public ModelAndView toAdd(){
		ModelAndView view = new ModelAndView("deptmanage/role/add");
		view.addObject("functionList", roleService.doJoinTransFindFunctionList(null));
		return view;
	}
	
	@RequestMapping("/add")
	public String add(String roleName, String content, RedirectAttributes attr){
		Role role = new Role();
		role.setRoleName(roleName);
		role.setRoleDesc(content);
		roleService.doTransSaveRole(role);
		attr.addFlashAttribute("msg", "添加成功！");
		
		ShiroStaticInfo.clear();
		return "redirect:/role/list";
	}
	
	@RequestMapping("/auth")
	public String auth(Role role, String [] functionIds, String [] functionFunIds, String[] functionBtnIds, RedirectAttributes attr){
		List<String> ids = new ArrayList<String>();
		ids.addAll(Arrays.asList(functionIds));
		ids.addAll(Arrays.asList(functionFunIds));
		ids.addAll(Arrays.asList(functionBtnIds));
		roleService.doTransUpdateRolePermissionList(role, ids);
		attr.addFlashAttribute("msg", "授权成功！");
		ShiroStaticInfo.clear();
		
		return "redirect:/role/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("deptmanage/role/edit");
		view.addObject("role", roleService.doJoinTransFindRoleById(id));
		return view;
	}
	
	@RequestMapping("/toauth/{id}")
	public ModelAndView toauth(@PathVariable String id){
		ModelAndView view = new ModelAndView("deptmanage/role/auth");
		
		List<FunctionVO> functionList = roleService.doJoinTransFindFunctionList(null);
		List<Permission> perList = roleService.doJoinTransFindPermissionList(id);
		
		List<String> roleFunctionList= new ArrayList<>();
		if(perList != null && !perList.isEmpty()) {
			for (Permission permission : perList) {
				roleFunctionList.add(permission.getFunction().getId());
			}
		}
		
		setFunFlag(functionList, roleFunctionList);
		
		view.addObject("functionList", functionList);
		view.addObject("role", roleService.doJoinTransFindRoleById(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(String id, String roleName, String content, RedirectAttributes attr){
		roleService.doTransUpdateRole(id, roleName, content);
		
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/role/list";
	}
	
	public String edit1(Role role, String [] functionIds, String [] functionFunIds, String[] functionBtnIds){
		List<String> ids = new ArrayList<String>();
		ids.addAll(Arrays.asList(functionIds));
		ids.addAll(Arrays.asList(functionFunIds));
		ids.addAll(Arrays.asList(functionBtnIds));
		roleService.doTransUpdateRolePermissionList(role, ids);
		return "redirect:/role/list";
	}
	
	private void setFunFlag(List<FunctionVO> functionList, List<String> perList){
		for (FunctionVO functionVO : functionList) {
			if(perList.contains(functionVO.getId())){
				functionVO.setFlag(1);
			}
			if(functionVO.getFunctionList() != null && !functionVO.getFunctionList().isEmpty()){
				setFunFlag(functionVO.getFunctionList(), perList);
			}
		}
	}
}
