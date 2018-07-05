/*
 * ProjectController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月10日 上午10:12:00
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.project;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.finance.FundsIncome;
import team.nercita.manage.cms.po.projectmanage.Attachment;
import team.nercita.manage.cms.po.projectmanage.FundsDetail;
import team.nercita.manage.cms.po.projectmanage.FundsDetailChange;
import team.nercita.manage.cms.po.projectmanage.Project;
import team.nercita.manage.cms.service.project.ProjectService;
import team.nercita.manage.cms.service.usermanage.UserGroupService;
import team.nercita.manage.cms.service.usermanage.UserService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.vo.AlertWinVo;
import team.nercita.manage.cms.vo.ValueVo;

/**
 *
 * @author L
 * @date 2017年11月10日 上午10:12:00
 */
@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserGroupService userGroupService;
	
	@RequestMapping("{type}/list")
	public ModelAndView list(@PathVariable int type,Integer goPage, @ModelAttribute(value="userName") String userName, @ModelAttribute(value="projectName") String projectName, @ModelAttribute(value="resource") String resource){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userName", userName);
		paramMap.put("resource", resource);
		paramMap.put("projectName", projectName);
		paramMap.put("type", type);
		
		ModelAndView view = new ModelAndView("project/"+type+"/list");
		view.addAllObjects(projectService.doJoinTransFindProjectList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("{type}/toadd")
	public ModelAndView toadd(@PathVariable int type){
		ModelAndView view = new ModelAndView("project/"+type+"/add");
		view.addObject("userList", userService.doJoinTransQueryUserList());
		view.addObject("groupList", userGroupService.doJoinTransFindUserGroup());
		return view;
	}
	@RequestMapping("/tofundadd/{id}")
	public ModelAndView tofundadd(@PathVariable String id){
		ModelAndView view = new ModelAndView("project/fundadd");
		view.addObject("detailList", projectService.doJoinTransQueryDetail(id));
		view.addObject("project", projectService.doJoinTransFindProject(id));
		return view;
	}
	
	@ResponseBody
	@RequestMapping("/fund/{id}")
	public Long fund(@PathVariable String id){
		FundsDetail detail = projectService.doJoinTransQueryDetailById(id);
		return detail.getOriginalBalance();
	}
	
	@RequestMapping("/fundlist/{id}")
	public ModelAndView list(@PathVariable String id){
		ModelAndView view = new ModelAndView("project/fundlist");
		view.addObject("changeList", projectService.doJoinTransFindFundsDetailList(id));
		view.addObject("project", projectService.doJoinTransFindProject(id));
		return view;
	}
	
	@RequestMapping("/fundadd")
	public String fundadd(FundsDetailChange fundsDetailChange, RedirectAttributes attr){
		projectService.doTransSaveChange(fundsDetailChange);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/project/fundlist/" + fundsDetailChange.getProject().getId();
	}
	
	@RequestMapping("{type}/add")
	public String add(@PathVariable int type, Project project, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, RedirectAttributes attr){
		Attachment attachment = null;
		project.setType(type);
		
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
			attachment = new Attachment();
			attachment.setFileName(fileName);
			attachment.setFilePath(newFileName);
		}
		
		projectService.doTransSaveProject(project, attachment);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/project/"+type+"/list";
	}
	
	@RequestMapping("/{type}/toedit/{id}")
	public ModelAndView toedit(@PathVariable int type, @PathVariable String id){
		ModelAndView view = new ModelAndView("project/" + type + "/edit");
		view.addObject("userList", userService.doJoinTransQueryUserList());
		view.addObject("groupList", userGroupService.doJoinTransFindUserGroup());
		view.addObject("project", projectService.doJoinTransFindProject(id));
		return view;
	}
	
	@RequestMapping("{type}/edit")
	public String edit(@PathVariable int type, Project project, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, RedirectAttributes attr){
		Attachment attachment = null;
		project.setType(type);
		
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
			attachment = new Attachment();
			attachment.setFileName(fileName);
			attachment.setFilePath(newFileName);
		}
		
		projectService.doTransUpdateProject(project, attachment);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/project/"+type+"/list";
	}
	
	@RequestMapping("/{type}/del/{id}")
	public String del(@PathVariable int type, @PathVariable String id, RedirectAttributes attr){
		projectService.doTransDelProject(id);
		attr.addFlashAttribute("msg", "删除成功！");
		return "redirect:/project/"+type+"/list";
	}
	
	@RequestMapping("/{type}/detail/{id}")
	public ModelAndView detail(@PathVariable int type, @PathVariable String id){
		ModelAndView view = new ModelAndView("project/" + type + "/detail");
		
		view.addObject("project", projectService.doJoinTransFindProject(id));
		view.addObject("attachment", projectService.doJoinTransAttachment(id));
		return view;
	}
	
	@RequestMapping("/view/{id}")
	@ResponseBody
	public Project view(@PathVariable String id){
		Project project = projectService.doJoinTransFindProject(id);
		Project viewproject = new Project();
		viewproject.setTotalMoney(project.getTotalMoney());
		viewproject.setFundMoney(project.getFundMoney());
		return viewproject;
	}
	
	@RequestMapping("/json")
	@ResponseBody
	public List<ValueVo> json(){
		List<ValueVo> valueList = new ArrayList<>();
		
		List<Project> peojectList = projectService.doJoinTransQueryProject();
		
		if(peojectList != null && !peojectList.isEmpty()) {
			for (Project project : peojectList) {
				ValueVo vo = new ValueVo();
				vo.setPid(project.getId());
				vo.setPname(project.getProjectName());
				
				valueList.add(vo);
			}
		}
		
		return valueList;
	}
	
	@RequestMapping("/incomce/{id}")
	@ResponseBody
	public List<AlertWinVo> dz(@PathVariable String id){
		List<AlertWinVo> valueList = new ArrayList<>();
		
		List<FundsIncome> fundList = projectService.doJoinTransQueryFundsIncode(id);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		if(fundList != null && !fundList.isEmpty()) {
			for (FundsIncome fundsIncome : fundList) {
				AlertWinVo vo = new AlertWinVo();
				vo.setStr2(df.format(fundsIncome.getChangeTime()));
				vo.setStr1(fundsIncome.getFinancialNumber());
				vo.setStr3(fundsIncome.getAmount() + "");
				
				valueList.add(vo);
			}
		}
		
		return valueList;
	}
}
