/*
 * JxcProductManageController.java
 * 创建者：L
 * 创建日期：2017年12月21日 上午9:53:25
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.contoller.jxc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.jxc.ProductManage;
import team.nercita.manage.cms.service.jxc.ProductManageService;
import team.nercita.manage.cms.service.jxc.ProductStoreService;
import team.nercita.manage.cms.vo.ManageVo;

/**
 * 
 * @author L
 * @date： 2017年12月21日 上午9:53:25
 */
@Controller
@RequestMapping("/jxc/manage")
public class JxcProductManageController {
	
	@Autowired
	ProductManageService productManageService;
	
	@Autowired
	ProductStoreService productStoreService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="typeid") String typeid){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("typeid", typeid);
		
		ModelAndView view = new ModelAndView("jxc/manage/list");
		view.addAllObjects(productManageService.doJoinTransFindManageList(goPage, paramMap));
		view.addObject("typeList", productStoreService.doJoinTransFindProductType());
		return view;
	}
	
	@RequestMapping("/toaddparent")
	public ModelAndView toaddparent(){
		ModelAndView view = new ModelAndView("jxc/manage/addparent");
		view.addObject("typeList", productStoreService.doJoinTransFindProductType());
		return view;
	}
	
	@RequestMapping("/addparent")
	public String addparent(ProductManage productManage, RedirectAttributes attr){
		try {
			productManageService.doTransSaveParentProduct(productManage);
			attr.addFlashAttribute("msg", "添加成功!");
		} catch (Exception e) {
			attr.addFlashAttribute("msg", e.getMessage());
		}
		return "redirect:/jxc/manage/list";
	}
	
	@RequestMapping("/show/{id}")
	public ModelAndView show(@PathVariable String id){
		ModelAndView view = new ModelAndView("jxc/manage/show");
		view.addObject("id", id);
		return view;
	}
	
	@RequestMapping("/json/{id}")
	@ResponseBody
	public Map<String, List<ManageVo>> json(@PathVariable String id){
		Map<String, List<ManageVo>> resultMap = new HashMap<>();
		resultMap.put("data", productManageService.doJoinTransFindManageVo(id));
		return resultMap;
	}
	
	@RequestMapping("/toaddchild/{id}/{baseid}")
	public ModelAndView toaddchild(@PathVariable String id, @PathVariable String baseid){
		ModelAndView view = new ModelAndView("jxc/manage/addchild");
		
		view.addObject("manage", productManageService.doJoinTransFindManageById(id));
		view.addObject("baseid", baseid);
		view.addObject("typeList", productStoreService.doJoinTransFindProductTypeByManageId(id));
		return view;
	}
	
	@RequestMapping("/addchild")
	public String addchild(ProductManage productManage, String baseid, RedirectAttributes attr){
		productManageService.doTransSaveChildProduct(productManage);
		attr.addFlashAttribute("msg", "添加成功!");
		return "redirect:/jxc/manage/show/" + baseid;
	}
	
}
