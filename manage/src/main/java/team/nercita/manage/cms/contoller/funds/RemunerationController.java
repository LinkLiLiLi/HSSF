/*
 * ApplyRemunerationController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月8日 下午4:35:35
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.funds;

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
import team.nercita.manage.cms.po.form.ApplyRemuneration;
import team.nercita.manage.cms.po.form.RemunerationDetail;
import team.nercita.manage.cms.service.apply.RemunerationService;
import team.nercita.manage.cms.util.NumberToCN;

/**
 * 劳务
 * @author L
 * @date 2017年11月8日 下午4:35:35
 */
@Controller
@RequestMapping("/funds/remuneration")
public class RemunerationController {
	@Autowired
	RemunerationService remunerationService; 
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="title") String title , @ModelAttribute(value="keyWords") String keyWords){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("keyWords", keyWords);
		paramMap.put("title", title);
		
		ModelAndView view = new ModelAndView("funds/remuneration/list");
		view.addAllObjects(remunerationService.doJoinTransFindApplyRemunerationList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "funds/remuneration/add";
	}
	
	@RequestMapping("/add")
	public String add(ApplyRemuneration applyRemuneration, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		remunerationService.doTransSaveApplyRemuneration(applyRemuneration, user);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/funds/remuneration/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("funds/remuneration/edit");
		
		view.addObject("remuneration", remunerationService.doJoinTransFindApplyRemuneration(id));
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ApplyRemuneration applyRemuneration, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		ApplyRemuneration oldApplyRemuneration = remunerationService.doJoinTransFindApplyRemunerationById(applyRemuneration.getId());
		
		applyRemuneration.setCreateTime(oldApplyRemuneration.getCreateTime());
		applyRemuneration.setCreator(oldApplyRemuneration.getCreator());
		remunerationService.doTransUpdateApplyRemuneration(applyRemuneration, user);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/funds/remuneration/list";
	}
	
	@RequestMapping("/toprint/{id}")
	public ModelAndView toprint(@PathVariable String id){
		ModelAndView view = new ModelAndView("funds/remuneration/print");
		
		ApplyRemuneration fee = remunerationService.doJoinTransFindApplyRemuneration(id);
		
		int amount = 0;
		
		if(fee.getDetailList() != null) {
			for (RemunerationDetail detail : fee.getDetailList()) {
				if(detail.getPayAmount() != null) {
					amount += detail.getPayAmount();
				}
			}
		}
		view.addObject("CN", NumberToCN.number2CNMontrayUnit(new BigDecimal(amount)));
		view.addObject("EN", amount);
		view.addObject("remuneration", fee);
		
		return view;
	}
	
	@RequestMapping("/toaudit/{id}")
	public ModelAndView toaudit(@PathVariable String id){
		ModelAndView view = new ModelAndView("funds/remuneration/audit");
		
		view.addObject("remuneration", remunerationService.doJoinTransFindApplyRemuneration(id));
		return view;
	}

	@RequestMapping("/audit")
	public String audit(String id, int status, RedirectAttributes attr){
		remunerationService.doTransApplyAudit(id, status);
		attr.addFlashAttribute("msg", "审核成功！");
		return "redirect:/funds/remuneration/list";
	}
	
	@RequestMapping("/sub/{id}")
	public String sub(@PathVariable String id, RedirectAttributes attr){
		remunerationService.doTransApplyAudit(id, 0);
		attr.addFlashAttribute("msg", "提交成功！");
		return "redirect:/funds/remuneration/list";
	}
}
