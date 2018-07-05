/*
 * StartUpController.java
 * 创建者：L
 * 创建日期：2017年12月28日 下午3:31:28
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
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

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.project.ProjectFile;
import team.nercita.manage.cms.po.project.ProjectStartup;
import team.nercita.manage.cms.po.project.StartUpDetail;
import team.nercita.manage.cms.service.project.ProjectService;
import team.nercita.manage.cms.service.project.StartUpService;
import team.nercita.manage.cms.service.usermanage.UserService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.vo.AlertWinVo;
import team.nercita.manage.cms.vo.FileVO;

/**
 * 项目实施
 * @author L
 * @date： 2017年12月28日 下午3:31:28
 */
@Controller
@RequestMapping("/project/startup")
public class StartUpController {
	@Autowired
	StartUpService startUpService;
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="projectid") String projectid, @ModelAttribute(value="userid") String userid){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("projectid", projectid);
		paramMap.put("userid", userid);
		
		ModelAndView view = new ModelAndView("project/startup/list");
		view.addAllObjects(startUpService.doJoinTransQueryStartUp(goPage, paramMap));
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		view.addObject("userList", userService.doJoinTransQueryUserList());
		return view;
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView view = new ModelAndView("project/startup/add");
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		return view;
	}
	
	@RequestMapping("/toaddnode/{id}")
	public ModelAndView toaddnode(@PathVariable String id){
		ModelAndView view = new ModelAndView("project/startup/node");
		view.addObject("id", id);
		return view;
	}
	
	@RequestMapping("/add")
	public String add(ProjectStartup projectStartup, FileVO fileVO, MultipartHttpServletRequest request, RedirectAttributes attr){
		List<MultipartFile> files = request.getFiles("file");
		List<String> fileNameList = new ArrayList<String>();
		List<String> filePathList = new ArrayList<>();
		if(files.size() > 0) {
			for (MultipartFile multipartFile : files) {
				if(multipartFile != null && multipartFile.getOriginalFilename() != null && multipartFile.getSize() > 0){
					String fileName = multipartFile.getOriginalFilename();
					String newFileName = Generator.getUUID() + fileName.substring(fileName.lastIndexOf("."));
					File uploadFile = new File(request.getSession().getServletContext().getRealPath("/upload"), newFileName);
					try {
						multipartFile.transferTo(uploadFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					filePathList.add(newFileName);
					fileNameList.add(fileName);
				}
			}
		}
		
		if(!fileNameList.isEmpty()) {
			for (int i=0; i <fileVO.getFileList().size(); i++) {
				ProjectFile file = fileVO.getFileList().get(i);
				file.setFilePath(filePathList.get(i));
				file.setFileName(fileNameList.get(i));
				file.setType(1);
			}
		}
		
		startUpService.doTransSaveProJectStartUp(projectStartup, fileVO.getFileList());
		
		attr.addFlashAttribute("msg", "添加成功!");
		return "redirect:/project/startup/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("project/startup/edit");
		view.addObject("startup",startUpService.doJoinTransFindProjectStartUpById(id));
		view.addObject("projectList", projectService.doJoinTransQueryProject());
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ProjectStartup projectStartup, FileVO fileVO, MultipartHttpServletRequest request, RedirectAttributes attr){
		List<MultipartFile> files = request.getFiles("file");
		List<String> fileNameList = new ArrayList<String>();
		List<String> filePathList = new ArrayList<>();
		if(files.size() > 0) {
			for (MultipartFile multipartFile : files) {
				if(multipartFile != null && multipartFile.getOriginalFilename() != null && multipartFile.getSize() > 0){
					String fileName = multipartFile.getOriginalFilename();
					String newFileName = Generator.getUUID() + fileName.substring(fileName.lastIndexOf("."));
					File uploadFile = new File(request.getSession().getServletContext().getRealPath("/upload"), newFileName);
					try {
						multipartFile.transferTo(uploadFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					filePathList.add(newFileName);
					fileNameList.add(fileName);
				}
			}
		}
		
		if(!fileNameList.isEmpty()) {
			for (int i=0; i <fileVO.getFileList().size(); i++) {
				ProjectFile file = fileVO.getFileList().get(i);
				file.setFilePath(filePathList.get(i));
				file.setFileName(fileNameList.get(i));
				file.setType(1);
			}
		}
		
		startUpService.doTransUpdateProjectStartUp(projectStartup, fileVO.getFileList());
		
		attr.addFlashAttribute("msg", "修改成功!");
		return "redirect:/project/startup/list";
	}
	
	@RequestMapping("/addnode")
	public String addnode(String id, String content, String nodeDate,String progress, RedirectAttributes attr){
		ProjectStartup startup = new ProjectStartup();
		startup.setId(id);
		
		StartUpDetail detail = new StartUpDetail();
		detail.setProjectStartup(startup);
		detail.setLastProgress(progress);
		detail.setNoteDate(DateTime.parse(nodeDate).toDate());
		detail.setDetail(content);
		
		startUpService.doTransSaveProjectNode(detail);
		
		attr.addFlashAttribute("msg", "节点添加成功!");
		return "redirect:/project/startup/list";
	}
	
	@RequestMapping("/del/{id}")
	public String del(@PathVariable String id, RedirectAttributes attr){
		startUpService.doTransDelStartup(id);
		attr.addFlashAttribute("msg", "删除成功!");
		return "redirect:/project/startup/list";
	}
	
	@ResponseBody
	@RequestMapping("/progress/{id}")
	public List<AlertWinVo> progress(@PathVariable String id){
		List<AlertWinVo> voList = new ArrayList<>();
		
		List<StartUpDetail> logList = startUpService.doJoinTransFindDetailList(id);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		if(logList != null && !logList.isEmpty()) {
			for (StartUpDetail planLog : logList) {
				AlertWinVo vo = new AlertWinVo();
				vo.setStr1(df.format(planLog.getNoteDate()));
				vo.setStr2(planLog.getLastProgress());
				vo.setStr3(planLog.getDetail());
				
				voList.add(vo);
			}
		}
		
		return voList;
	}
}
