/*
 * RepairRecordController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月30日 下午1:21:17
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.product;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.product.RepairRecord;
import team.nercita.manage.cms.service.product.RepairRecordService;

/**
 * 返修记录controller
 * @author L
 * @date 2017年7月30日 下午1:21:17
 */
@Controller
@RequestMapping("/repair")
public class RepairRecordController {
	
	@Autowired
	RepairRecordService repairRecordService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="productName") String productName){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("productName", productName);
		
		ModelAndView view = new ModelAndView("productmanage/repair/list");
		view.addAllObjects(repairRecordService.doJoinTransQeuryRepair(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "productmanage/repair/add";
	}
	
	@RequestMapping("/add")
	public String add(RepairRecord repairRecord, String content ,RedirectAttributes attr){
		repairRecord.setRemark(content);
		repairRecordService.doTransSaveRepairRecord(repairRecord);
		attr.addFlashAttribute("msg", "添加成功!");
		return "redirect:/repair/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("productmanage/repair/edit");
		view.addObject("repair", repairRecordService.doJoinTransRepairRecord(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(RepairRecord repairRecord, String content, RedirectAttributes attr){
		repairRecord.setRemark(content);
		repairRecordService.doTransUpdateRepairRecord(repairRecord);
		attr.addFlashAttribute("msg", "修改成功!");
		return "redirect:/repair/list";
	}
}
