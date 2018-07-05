/*
 * ProductTypeController.java
 * 创建者：L
 * 创建日期：2017年12月20日 上午9:47:29
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.contoller.jxc;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.jxc.ProductProperty;
import team.nercita.manage.cms.po.jxc.ProductPropertyValue;
import team.nercita.manage.cms.po.jxc.ProductStore;
import team.nercita.manage.cms.po.jxc.ProductType;
import team.nercita.manage.cms.service.jxc.ProductDealerService;
import team.nercita.manage.cms.service.jxc.ProductStoreService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.vo.PropertyVo;
import team.nercita.manage.cms.vo.ValueVo;

/**
 * 
 * @author L
 * @date： 2017年12月20日 上午9:47:29
 */
@Controller
@RequestMapping("/jxc/store")
public class JxcProductStoreController {
	
	@Autowired
	ProductStoreService productStoreService;
	
	@Autowired
	ProductDealerService productDealerService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="typeid") String typeid, @ModelAttribute(value="dealerid") String dealerid){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("typeid", typeid);
		paramMap.put("dealerid", dealerid);
		
		ModelAndView view = new ModelAndView("jxc/store/list");
		view.addAllObjects(productStoreService.doJoinTransFindStoreList(goPage, paramMap));
		view.addObject("dealerList", productDealerService.doJoinTransFindDealer());
		view.addObject("typeList", productStoreService.doJoinTransFindProductType());
		return view;
	}
	
	@RequestMapping("/addtype")
	public String addtype(ProductType productType, RedirectAttributes attr){
		productStoreService.doTransSaveProductType(productType);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/jxc/store/list";
	}
	
	@RequestMapping("/toaddtype")
	public String toaddtype(){
		return "jxc/store/addtype";
	}
	
	@RequestMapping("/toaddstore")
	public ModelAndView toaddstore(ProductStore productStore){
		ModelAndView view = new ModelAndView("jxc/store/addstore");
		view.addObject("typeList", productStoreService.doJoinTransFindProductType());
		view.addObject("dealerList", productDealerService.doJoinTransFindDealer());
		return view;
	}
	
	@RequestMapping("/addstore")
	public String addstore(ProductStore productStore, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, RedirectAttributes attr){
		
		if(file != null && file.getOriginalFilename() != null  && file.getSize() > 0){
			String fileName = file.getOriginalFilename();
			String newFileName = Generator.getUUID() + fileName.substring(fileName.lastIndexOf("."));
			File uploadFile = new File(request.getSession().getServletContext().getRealPath("/productImage"), newFileName);
			try {
				file.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			productStore.setImage(newFileName);
		}
		attr.addFlashAttribute("msg", "添加成功！");
		productStoreService.doTransSaveProductStore(productStore);
		
		return "redirect:/jxc/store/list";
	}
	
	@RequestMapping("/property/{id}")
	@ResponseBody
	public List<PropertyVo> typeinfo(@PathVariable String id){
		
		List<ProductProperty> propertyList = productStoreService.doJoinTransFindPorductProperty(id);
		List<PropertyVo> voList = new ArrayList<>();
		
		for (ProductProperty productProperty : propertyList) {
			List<ValueVo> vList = new ArrayList<>();
			for (ProductPropertyValue value : productProperty.getValueList()) {
				ValueVo v = new ValueVo();
				v.setPid(value.getId());
				v.setPname(value.getVals());
				
				vList.add(v);
			}
			
			PropertyVo vo = new PropertyVo();
			vo.setPid(productProperty.getId());
			vo.setType(productProperty.getType());
			vo.setPname(productProperty.getPropertyName());
			vo.setVoList(vList);
			
			voList.add(vo);
			
		}
		return voList;
	}
}
