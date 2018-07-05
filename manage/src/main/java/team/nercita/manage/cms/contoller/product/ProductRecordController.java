/*
 * ProductRecordController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月27日 下午9:58:40
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.product;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.product.ProductionNode;
import team.nercita.manage.cms.po.product.ProductionRecord;
import team.nercita.manage.cms.service.product.ProductRecordService;
import team.nercita.manage.cms.vo.AlertWinVo;

/**
 * 生产记录
 * @author L
 * @date 2017年7月27日 下午9:58:40
 */
@Controller
@RequestMapping("/product")
public class ProductRecordController {
	
	@Autowired
	ProductRecordService productRecordService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="taskName") String taskName, @ModelAttribute(value="taskNumber") String taskNumber){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("taskName", taskName);
		paramMap.put("taskNumber", taskNumber);
		
		ModelAndView view = new ModelAndView("productmanage/product/list");
		view.addAllObjects(productRecordService.doJoinTransQueryProductRecord(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "productmanage/product/add";
	}
	
	@RequestMapping("/toaddnode/{id}")
	public ModelAndView toaddnode(@PathVariable String id){
		ModelAndView view = new ModelAndView("productmanage/product/node");
		view.addObject("id", id);
		
		return view;
	}
	
	@RequestMapping("/add")
	public String add(ProductionRecord productRecord, String content, RedirectAttributes attr){
		productRecord.setProblem(content);
		productRecordService.doTransSaveProductRecord(productRecord);
		
		attr.addFlashAttribute("msg", "添加成功!");
		return "redirect:/product/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("productmanage/product/edit");
		view.addObject("productRecord",productRecordService.doJoinTransFindProductRecordById(id));
		
		return view;
	} 
	
	@RequestMapping("/edit")
	public String edit(ProductionRecord productRecord, String content, RedirectAttributes attr){
		productRecord.setProblem(content);
		productRecordService.doTransUpdateProductRecord(productRecord);
		
		attr.addFlashAttribute("msg", "修改成功!");
		return "redirect:/product/list";
	}
	
	@RequestMapping("/addnode")
	public String addnode(String id, String content, String nodeDate, RedirectAttributes attr){
		ProductionRecord productionRecord = new ProductionRecord();
		productionRecord.setId(id);
		ProductionNode productNode = new ProductionNode();
		productNode.setProductionRecord(productionRecord);
		productNode.setProgress(content);
		productNode.setNoteDate(DateTime.parse(nodeDate).toDate());
		
		productRecordService.doTransSaveProductNode(productNode);
		
		attr.addFlashAttribute("msg", "节点添加成功!");
		return "redirect:/product/list";
	}
	
	@ResponseBody
	@RequestMapping("/progress/{id}")
	public List<AlertWinVo> progress(@PathVariable String id){
		List<AlertWinVo> voList = new ArrayList<>();
		
		List<ProductionNode> logList = productRecordService.doJoinTransQueryNode(id);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		if(logList != null && !logList.isEmpty()) {
			for (ProductionNode planLog : logList) {
				AlertWinVo vo = new AlertWinVo();
				vo.setStr1(df.format(planLog.getNoteDate()));
				vo.setStr2(planLog.getProgress());
				
				voList.add(vo);
			}
		}
		
		return voList;
	}
}
