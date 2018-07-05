/*
 * JxcProductDealerController.java
 * 创建者：L
 * 创建日期：2017年12月20日 下午2:05:58
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.contoller.jxc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.jxc.ProductDealer;
import team.nercita.manage.cms.service.jxc.ProductDealerService;
import team.nercita.manage.cms.service.jxc.ProductStoreService;

/**
 * 
 * @author L
 * @date： 2017年12月20日 下午2:05:58
 */
@Controller
@RequestMapping("/jxc/dealer")
public class JxcProductDealerController {
	
	@Autowired
	ProductDealerService productDealerService;
	
	@Autowired
	ProductStoreService productStoreService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="dealerName") String dealerName){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("dealerName", dealerName);
		
		ModelAndView view = new ModelAndView("jxc/dealer/list");
		view.addAllObjects(productDealerService.doJoinTransFindDealerList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadddealer")
	public String toadddealer(){
		return "jxc/dealer/adddealer";
	}
	
	@RequestMapping("/adddealer")
	public String adddealer(ProductDealer productDealer, RedirectAttributes attr){
		productDealerService.doTransSaveProductDealer(productDealer);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/jxc/dealer/list";
	}
	
	@RequestMapping("/toeditdealer/{id}")
	public ModelAndView toeditdealer(@PathVariable String id){
		ModelAndView view = new ModelAndView("jxc/dealer/editdealer");
		view.addObject("dealer", productDealerService.doJoinTransFindDealerById(id));
		return view;
	}
	
	@RequestMapping("/editdealer")
	public String editdealer(ProductDealer productDealer, RedirectAttributes attr){
		productDealerService.doTransUpdateDealer(productDealer);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/jxc/dealer/list";
	}
	
	@RequestMapping("/showproduct/{id}")
	public ModelAndView showproduct(@PathVariable String id){
		ModelAndView view = new ModelAndView("jxc/dealer/productlist");
		
		view.addObject("storeList", productStoreService.doJoinTransFindStoreByDealerId(id));
		return view;
	}
}
