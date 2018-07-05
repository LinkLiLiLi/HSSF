/*
 * UserGroupController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月9日 下午2:37:25
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.deptmanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.deptmanage.UserGroup;
import team.nercita.manage.cms.service.usermanage.UserGroupService;
import team.nercita.manage.cms.vo.ChartVo;

/**
 *
 * @author L
 * @date 2017年7月9日 下午2:37:25
 */
@Controller
@RequestMapping("/usergroup")
public class UserGroupController {
	
	@Autowired
	UserGroupService userGroupService;
	
	@RequestMapping("/list")
	public ModelAndView list(){
		ModelAndView view = new ModelAndView("deptmanage/userGroup/view");
		view.addObject("groupList", userGroupService.doJoinTransFindUserGroup());
		return view;
	}
	
	@RequestMapping("/json")
	@ResponseBody
	public Map<String, List<ChartVo>> json(){
		Map<String, List<ChartVo>> resultMap = new HashMap<>();
		resultMap.put("data", userGroupService.doJoinTransFindTreeGroup(""));
		return resultMap;
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public UserGroup detail(String id){
		return userGroupService.doJoinTransFindUserGroupById(id);
	}
	
	@RequestMapping("/toadd/{pid}")
	public ModelAndView toadd(@PathVariable String pid){
		ModelAndView view = new ModelAndView("deptmanage/userGroup/add");
		view.addObject("group", userGroupService.doJoinTransFindUserGroupById(pid));
		return view;
	}
	
	@RequestMapping("/toedit/{pid}")
	public ModelAndView toedit(@PathVariable String pid){
		ModelAndView view = new ModelAndView("deptmanage/userGroup/edit");
		view.addObject("group", userGroupService.doJoinTransFindUserGroupById(pid));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(String id, String name, String content, RedirectAttributes attr){
		userGroupService.doJoinTransUpdateGroup(id, name, content);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/usergroup/list";
	}
	
	@RequestMapping("/add")
	public String add(String pid, String name , String content, RedirectAttributes attr){
		userGroupService.doTransSaveUserGroup(pid, name, content);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/usergroup/list";
	}
	
	@RequestMapping("/del/{id}")
	public String del(@PathVariable String id, RedirectAttributes attr){
		try {
			userGroupService.doJoinTransDelGroup(id);
			attr.addFlashAttribute("msg", "删除成功！");
		} catch (Exception e) {
			attr.addFlashAttribute("msg", "删除失败，该小组下已产生数据，不可删除！");
		}
		return "redirect:/usergroup/list";
	}
}
