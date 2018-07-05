/*
 * JxcProductionController.java
 * 创建者：L
 * 创建日期：2017年12月26日 下午2:50:17
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.contoller.jxc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.jxc.ConsumeItem;
import team.nercita.manage.cms.po.jxc.ProductStore;
import team.nercita.manage.cms.po.jxc.ProductStoreItem;
import team.nercita.manage.cms.po.jxc.Production;
import team.nercita.manage.cms.service.jxc.ProductStoreService;
import team.nercita.manage.cms.service.jxc.ProductionService;
import team.nercita.manage.cms.vo.ProductVo;
import team.nercita.manage.cms.vo.ValueVo;

/**
 * 
 * @author L
 * @date： 2017年12月26日 下午2:50:17
 */
@Controller
@RequestMapping("/jxc/production")
public class JxcProductionController {
	
	@Autowired
	ProductStoreService productStoreService;
	
	@Autowired
	ProductionService productionService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="typeid") String typeid, @ModelAttribute(value="purpose") String purpose){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("typeid", typeid);
		paramMap.put("purpose", purpose);
		
		ModelAndView view = new ModelAndView("jxc/production/list");
		view.addObject("typeList", productStoreService.doJoinTransFindProductType());
		view.addAllObjects(productionService.doJoinTransFindProductionList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView view = new ModelAndView("jxc/production/add");
		view.addObject("typeList", productStoreService.doJoinTransFindProductType());
		return view;
	}
	
	@RequestMapping("/data/{id}")
	@ResponseBody
	public List<ProductVo> data(@PathVariable String id){
		return productStoreService.doJoinTransFindOutProduct(id);
	}
	
	@RequestMapping("/add")
	public String add(Production production, RedirectAttributes attr){
		productionService.doTransSaveProduction(production);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/jxc/production/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("jxc/production/edit");
		
		Production production = productionService.doJoinTransProductionById(id);
		
		List<ProductStore> productStoreList = productStoreService.doJoinTransFindStoreByTypeId(production.getProductType().getId());
		
		List<ValueVo> valueList = new ArrayList<>();
		
		for (ProductStore productStore : productStoreList) {
			ValueVo vo = new ValueVo();
			vo.setPid(productStore.getId());
			
			String value = "";
			for (ProductStoreItem item : productStore.getItemList()) {
				value += item.getPropertyName() + "-" + item.getPropertyValue();
			}
			vo.setPname(value);
			valueList.add(vo);
		}
		production.setValueList(valueList);
		
		for (ConsumeItem item : production.getItemList()) {
			item.setProductVo(productStoreService.doJoinTransFindOutData(production.getProductType().getId(), item.getProductType().getId(), item.getProductStore().getId()));
		}
		view.addObject("production", production);
		view.addObject("typeList", productStoreService.doJoinTransFindProductType());
		
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(Production production, RedirectAttributes attr){
		productionService.doTransUpdateProduction(production);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/jxc/production/list";
	}
	
	@RequestMapping("/outstore/{id}")
	public String outstore(@PathVariable String id, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		try {
			productionService.doTransOutStore(id, user);
			attr.addFlashAttribute("msg", "出库成功！");
		} catch (Exception e) {
			attr.addFlashAttribute("msg", e.getMessage());
		}
		return "redirect:/jxc/production/list";
	}
	
	@RequestMapping("/incomestore/{id}")
	public String incomestore(@PathVariable String id, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		productionService.doTransIncomeStore(id, user);
		attr.addFlashAttribute("msg", "入库成功！");
		return "redirect:/jxc/production/list";
	}
}
