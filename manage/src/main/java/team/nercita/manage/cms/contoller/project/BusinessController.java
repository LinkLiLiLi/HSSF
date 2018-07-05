/*
 * BusniessController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月19日 上午8:57:36
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

import team.nercita.manage.cms.po.project.BusinessDetail;
import team.nercita.manage.cms.po.project.ProjectBusniess;
import team.nercita.manage.cms.po.project.ProjectFile;
import team.nercita.manage.cms.service.project.BusinessService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.vo.AlertWinVo;
import team.nercita.manage.cms.vo.FileVO;

/**
 * 
 * @author L
 * @date 2017年11月19日 上午8:57:36
 */
@Controller
@RequestMapping("/project/business")
public class BusinessController {
	@Autowired
	BusinessService businessService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="busniessName") String busniessName, @ModelAttribute(value="unit") String unit, @ModelAttribute(value="contact") String contact){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("busniessName", busniessName);
		paramMap.put("unit", unit);
		paramMap.put("contact", contact);
		
		ModelAndView view = new ModelAndView("project/business/list");
		view.addAllObjects(businessService.doJoinTransQueryBusiness(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "project/business/add";
	}
	
	@RequestMapping("/toaddnode/{id}")
	public ModelAndView toaddnode(@PathVariable String id){
		ModelAndView view = new ModelAndView("project/business/node");
		view.addObject("id", id);
		
		return view;
	}
	
	@RequestMapping("/add")
	public String add(ProjectBusniess projectBusniess, FileVO fileVO, MultipartHttpServletRequest request, RedirectAttributes attr){
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
		
		businessService.doTransSaveProJectBusniess(projectBusniess, fileVO.getFileList());
		
		attr.addFlashAttribute("msg", "添加成功!");
		return "redirect:/project/business/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("project/business/edit");
		view.addObject("business",businessService.doJoinTransFindProjectBusniessById(id));
		
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ProjectBusniess projectBusniess, FileVO fileVO, MultipartHttpServletRequest request, RedirectAttributes attr){
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
		businessService.doTransUpdateProjectBusniess(projectBusniess, fileVO.getFileList());
		
		attr.addFlashAttribute("msg", "修改成功!");
		return "redirect:/project/business/list";
	}
	
	@RequestMapping("/addnode")
	public String addnode(String id, String content, String nodeDate,String progress, RedirectAttributes attr){
		ProjectBusniess business = new ProjectBusniess();
		business.setId(id);
		
		BusinessDetail detail = new BusinessDetail();
		detail.setProjectBusniess(business);
		detail.setLastProgress(progress);
		detail.setNoteDate(DateTime.parse(nodeDate).toDate());
		detail.setDetail(content);
		
		businessService.doTransSaveProjectNode(detail);
		
		attr.addFlashAttribute("msg", "节点添加成功!");
		return "redirect:/project/business/list";
	}
	
	@RequestMapping("/del/{id}")
	public String del(@PathVariable String id, RedirectAttributes attr){
		businessService.doTransDelBusiness(id);
		attr.addFlashAttribute("msg", "删除成功!");
		return "redirect:/project/business/list";
	}
	
	@ResponseBody
	@RequestMapping("/progress/{id}")
	public List<AlertWinVo> progress(@PathVariable String id){
		List<AlertWinVo> voList = new ArrayList<>();
		
		List<BusinessDetail> logList = businessService.doJoinTransQueryNode(id);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		if(logList != null && !logList.isEmpty()) {
			for (BusinessDetail planLog : logList) {
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
