/*
 * ApplyExpertFeeController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月8日 下午4:35:35
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.apply;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.form.ApplyExpertFee;
import team.nercita.manage.cms.po.form.ExpertFeeDetail;
import team.nercita.manage.cms.service.apply.ExpertFeeService;
import team.nercita.manage.cms.util.NumberToCN;

/**
 * 专家费
 * @author L
 * @date 2017年11月8日 下午4:35:35
 */
@Controller
@RequestMapping("/apply/online/expertfee")
public class ApplyExpertFeeController {
	@Autowired
	ExpertFeeService expertFeeService; 
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="title") String title , @ModelAttribute(value="keyWords") String keyWords){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("keyWords", keyWords);
		paramMap.put("title", title);
		
		ModelAndView view = new ModelAndView("apply/online/expertFee/list");
		view.addAllObjects(expertFeeService.doJoinTransFindApplyExpertFeeList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "apply/online/expertFee/add";
	}
	
	@RequestMapping("/add")
	public String add(ApplyExpertFee applyExpertFee, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		expertFeeService.doTransSaveApplyExpertFee(applyExpertFee, user);
		
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/apply/online/expertfee/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/expertFee/edit");
		
		view.addObject("expertFee", expertFeeService.doJoinTransFindApplyExpertFee(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ApplyExpertFee applyExpertFee, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		ApplyExpertFee oldApplyExpertFee = expertFeeService.doJoinTransFindApplyExpertFeeById(applyExpertFee.getId());
		
		applyExpertFee.setCreateTime(oldApplyExpertFee.getCreateTime());
		applyExpertFee.setCreator(oldApplyExpertFee.getCreator());
		expertFeeService.doTransUpdateApplyExpertFee(applyExpertFee, user);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/apply/online/expertfee/list";
	}
	
	@RequestMapping("/toprint/{id}")
	public ModelAndView toprint(@PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/expertFee/print");
		
		ApplyExpertFee fee = expertFeeService.doJoinTransFindApplyExpertFee(id);
		
		int amount = 0;
		
		if(fee.getDetailList() != null) {
			for (ExpertFeeDetail detail : fee.getDetailList()) {
				if(detail.getAmount() != null) {
					amount += detail.getAmount();
				}
			}
		}
		view.addObject("CN", NumberToCN.number2CNMontrayUnit(new BigDecimal(amount)));
		view.addObject("expertFee", fee);
		
		return view;
	}
}
