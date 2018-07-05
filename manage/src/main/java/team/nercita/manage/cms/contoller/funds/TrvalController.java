/*
 * TrvalController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2018年1月1日 下午9:20:47
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.funds;

import java.math.BigDecimal;
import java.util.ArrayList;
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
import team.nercita.manage.cms.po.form.ApplyTrval;
import team.nercita.manage.cms.po.form.TrvalDetail;
import team.nercita.manage.cms.service.apply.TrvalService;
import team.nercita.manage.cms.util.NumberToCN;

/**
 *
 * @author L
 * @date 2018年1月1日 下午9:20:47
 */
@Controller
@RequestMapping("/funds/trval")
public class TrvalController {
	@Autowired
	TrvalService trvalService; 
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="name") String name , @ModelAttribute(value="reason") String reason){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("name", name);
		paramMap.put("reason", reason);
		
		ModelAndView view = new ModelAndView("funds/trval/list");
		view.addAllObjects(trvalService.doJoinTransFindApplyTrvalList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "funds/trval/add";
	}
	
	@RequestMapping("/add")
	public String add(ApplyTrval applyTrval, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		trvalService.doTransSaveApplyTrval(applyTrval, user);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/funds/trval/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("funds/trval/edit");
		
		view.addObject("trval", trvalService.doJoinTransFindApplyTrval(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ApplyTrval applyTrval, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		ApplyTrval oldApplyTrval = trvalService.doJoinTransFindApplyTrvalById(applyTrval.getId());
		
		applyTrval.setCreateTime(oldApplyTrval.getCreateTime());
		applyTrval.setCreator(oldApplyTrval.getCreator());
		trvalService.doTransUpdateApplyTrval(applyTrval, user);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/funds/trval/list";
	}
	
	@RequestMapping("/toprint/{id}")
	public ModelAndView toprint(@PathVariable String id){
		ModelAndView view = new ModelAndView("funds/trval/print");
		
		ApplyTrval fee = trvalService.doJoinTransFindApplyTrval(id);
		
		int amount = 0;
		int trafficAmount = 0;
		int liveAmount = 0;
		int foodSubsidyAmount = 0;
		int trafficSubsidyAmount = 0;
		int otherAmount = 0;
		
		if(fee.getDetailList() != null) {
			for (TrvalDetail detail : fee.getDetailList()) {
				amount += getAmount(detail.getTrafficAmount()) + getAmount(detail.getLiveAmount())
					+ getAmount(detail.getFoodSubsidyAmount()) + getAmount(detail.getTrafficSubsidyAmount())
					+ getAmount(detail.getOtherAmount());
				
				trafficAmount += getAmount(detail.getTrafficAmount());
				liveAmount += getAmount(detail.getLiveAmount());
				foodSubsidyAmount += getAmount(detail.getFoodSubsidyAmount());
				trafficSubsidyAmount += getAmount(detail.getTrafficSubsidyAmount());
				otherAmount += getAmount(detail.getOtherAmount());
			}
		}
		
		int sum = 8 - (fee.getDetailList() != null ? fee.getDetailList().size() : 0);
		
		if(fee.getDetailList() == null) {
			fee.setDetailList(new ArrayList<TrvalDetail>());
		}
		for (int i = 0; i < sum; i++) {
			fee.getDetailList().add(new TrvalDetail());
		}
		
		view.addObject("trafficAmount", trafficAmount);
		view.addObject("liveAmount", liveAmount);
		view.addObject("foodSubsidyAmount", foodSubsidyAmount);
		view.addObject("trafficSubsidyAmount", trafficSubsidyAmount);
		view.addObject("otherAmount", otherAmount);
		
		view.addObject("CN", NumberToCN.number2CNMontrayUnit(new BigDecimal(amount)));
		view.addObject("EN", amount);
		view.addObject("trval", fee);
		
		return view;
	}
	
	private int getAmount(Integer amount){
		if(amount == null) {
			return 0;
		}
		
		return amount;
	}
	
	@RequestMapping("/toaudit/{id}")
	public ModelAndView toaudit(@PathVariable String id){
		ModelAndView view = new ModelAndView("funds/trval/audit");
		
		view.addObject("trval", trvalService.doJoinTransFindApplyTrval(id));
		return view;
	}

	@RequestMapping("/audit")
	public String audit(String id, int status, RedirectAttributes attr){
		trvalService.doTransApplyAudit(id, status);
		attr.addFlashAttribute("msg", "审核成功！");
		return "redirect:/funds/trval/list";
	}
	
	@RequestMapping("/sub/{id}")
	public String sub(@PathVariable String id, RedirectAttributes attr){
		trvalService.doTransApplyAudit(id, 0);
		attr.addFlashAttribute("msg", "提交成功！");
		return "redirect:/funds/trval/list";
	}
}
