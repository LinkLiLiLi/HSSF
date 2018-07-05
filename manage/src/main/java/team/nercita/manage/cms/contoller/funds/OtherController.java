/*
 * DialotherController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2018年1月1日 下午12:44:43
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.funds;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.projectmanage.OtherFund;
import team.nercita.manage.cms.service.funds.OtherService;

/**
 *
 * @author L
 * @date 2018年1月1日 下午12:44:43
 */
@Controller
@RequestMapping("/funds/other")
public class OtherController {
	@Autowired
	OtherService otherService;
	
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="unit") String unit){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("unit", unit);
		
		ModelAndView view = new ModelAndView("funds/other/list");
		view.addAllObjects(otherService.doJoinTransQueryFundsList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView view = new ModelAndView("funds/other/add");
		return view;
	}
	
	@RequestMapping("/add")
	public String add(OtherFund otherFund, RedirectAttributes attr){
		otherService.doTransSaveOther(otherFund);
		attr.addFlashAttribute("msg", "添加成功!");
		return "redirect:/funds/other/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("funds/other/edit");
		view.addObject("other",otherService.doJoinTransFindOtherById(id));
		return view;
	} 
	
	@RequestMapping("/edit")
	public String edit(OtherFund otherFund, RedirectAttributes attr){
		
		otherService.doTransUpdateOther(otherFund);
		attr.addFlashAttribute("msg", "修改成功!");
		return "redirect:/funds/other/list";
	}
}
