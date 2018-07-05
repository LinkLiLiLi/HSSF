/*
 * PurchaseController.java
 * 创建者：L
 * 创建日期：2017年12月22日 上午10:53:26
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.contoller.jxc;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.jxc.ProductStore;
import team.nercita.manage.cms.po.jxc.ProductStoreItem;
import team.nercita.manage.cms.po.jxc.ProductType;
import team.nercita.manage.cms.po.jxc.PurchaseApply;
import team.nercita.manage.cms.po.jxc.PurchaseAuditLog;
import team.nercita.manage.cms.po.jxc.PurchaseDetail;
import team.nercita.manage.cms.service.jxc.ProductStoreService;
import team.nercita.manage.cms.service.jxc.PurchaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.vo.ValueVo;

/**
 * 
 * @author L
 * @date： 2017年12月22日 上午10:53:26
 */
@Controller
@RequestMapping("/jxc/purchase")
public class JxcPurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	@Autowired
	ProductStoreService productStoreService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="productName") String productName, @ModelAttribute(value="purpose") String purpose){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("purpose", purpose);
		paramMap.put("productName", productName);
		
		ModelAndView view = new ModelAndView("jxc/purchase/list");
		view.addAllObjects(purchaseService.doJoinTransFindStoreList(goPage, user, paramMap));
		return view;
	}
	
	@RequestMapping("/toaddapply")
	public ModelAndView toaddapply(){
		ModelAndView view = new ModelAndView("jxc/purchase/addapply");
		view.addObject("typeList", productStoreService.doJoinTransFindProductType());
		return view;
	}
	
	@RequestMapping("/type")
	@ResponseBody
	public List<ValueVo> type(){
		List<ProductType> productTypeList = productStoreService.doJoinTransFindProductType();
		
		List<ValueVo> voList = new ArrayList<>();
		
		for (ProductType productType : productTypeList) {
			ValueVo vo = new ValueVo();
			vo.setPid(productType.getId());
			vo.setPname(productType.getTypeName());
			
			voList.add(vo);
		}
		
		return voList;
	}
	
	@RequestMapping("/model/{id}")
	@ResponseBody
	public List<ValueVo> model(@PathVariable String id){
		List<ProductStore> productStoreList = productStoreService.doJoinTransFindStoreByTypeId(id);
		
		List<ValueVo> voList = new ArrayList<>();
		
		for (ProductStore productStore : productStoreList) {
			ValueVo vo = new ValueVo();
			vo.setPid(productStore.getId());
			
			String value = "";
			for (ProductStoreItem item : productStore.getItemList()) {
				value += item.getPropertyName() + "-" + item.getPropertyValue();
			}
			
			vo.setPname(value);
			
			voList.add(vo);
		}
		
		return voList;
	}
	
	@RequestMapping("/addapply")
	public String addapply(PurchaseApply purchaseApply, MultipartHttpServletRequest request, RedirectAttributes attr){
		List<MultipartFile> files = request.getFiles("file");
		LinkedList<String> filePathList = new LinkedList<>();
		if(files.size() > 0) {
			for (MultipartFile multipartFile : files) {
				if(multipartFile != null && multipartFile.getOriginalFilename() != null && multipartFile.getSize() > 0){
					String fileName = multipartFile.getOriginalFilename();
					String newFileName = Generator.getUUID() + fileName.substring(fileName.lastIndexOf("."));
					File uploadFile = new File(request.getSession().getServletContext().getRealPath("/upload"), newFileName);
					try {
						multipartFile.transferTo(uploadFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					filePathList.add(newFileName);
				} else {
					filePathList.add(null);
				}
			}
		}
		
		List<PurchaseDetail> detailList = purchaseApply.getDetailList();
		List<PurchaseDetail> resultList =  new ArrayList<>();
		
		for (PurchaseDetail purchaseDetail : detailList) {
			if(purchaseDetail != null && purchaseDetail.getProductStore() != null) {
				resultList.add(purchaseDetail);
			}
		}
		
		for (PurchaseDetail purchaseDetail : resultList) {
			purchaseDetail.setImage(filePathList.poll());
		}
		purchaseApply.setDetailList(resultList);
		
		purchaseService.doTransSavePurchaseApply(purchaseApply);
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/jxc/purchase/list";
	}
	
	@RequestMapping("/toaudit/{id}")
	public ModelAndView toaudit(@PathVariable String id){
		ModelAndView view = new ModelAndView("jxc/purchase/audit");
		view.addObject("apply", purchaseService.doTransFindPurchaseApplyById(id));
		return view;
	}
	
	@RequestMapping("/toeditapply/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("jxc/purchase/editapply");
		PurchaseApply purchaseApply = purchaseService.doTransFindPurchaseApplyById(id);
		
		List<ProductType> productTypeList = productStoreService.doJoinTransFindProductType();
		
		List<ValueVo> typeList = new ArrayList<>();
		
		for (ProductType productType : productTypeList) {
			ValueVo vo = new ValueVo();
			vo.setPid(productType.getId());
			vo.setPname(productType.getTypeName());
			
			typeList.add(vo);
		}
		
		for (PurchaseDetail detail : purchaseApply.getDetailList()) {
			detail.setTypeList(typeList);
			
			List<ProductStore> productStoreList = productStoreService.doJoinTransFindStoreByTypeId(detail.getProductType().getId());
			
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
			detail.setValueList(valueList);
		}
		
		view.addObject("apply", purchaseApply);
		return view;
	}
	
	@RequestMapping("/editapply")
	public String editapply(PurchaseApply purchaseApply, MultipartHttpServletRequest request, RedirectAttributes attr){
		List<MultipartFile> files = request.getFiles("file");
		LinkedList<String> filePathList = new LinkedList<>();
		if(files.size() > 0) {
			for (MultipartFile multipartFile : files) {
				if(multipartFile != null && multipartFile.getOriginalFilename() != null && multipartFile.getSize() > 0){
					String fileName = multipartFile.getOriginalFilename();
					String newFileName = Generator.getUUID() + fileName.substring(fileName.lastIndexOf("."));
					File uploadFile = new File(request.getSession().getServletContext().getRealPath("/upload"), newFileName);
					try {
						multipartFile.transferTo(uploadFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					filePathList.add(newFileName);
				} else {
					filePathList.add(null);
				}
			}
		}
		
		List<PurchaseDetail> detailList = purchaseApply.getDetailList();
		List<PurchaseDetail> resultList =  new ArrayList<>();
		
		for (PurchaseDetail purchaseDetail : detailList) {
			if(purchaseDetail != null && purchaseDetail.getProductStore() != null) {
				resultList.add(purchaseDetail);
			}
		}
		
		for (PurchaseDetail purchaseDetail : resultList) {
			purchaseDetail.setImage(filePathList.poll());
		}
		purchaseApply.setDetailList(resultList);
		purchaseService.doTransUpdatePurchaseApply(purchaseApply);
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/jxc/purchase/list";
	}
	
	@RequestMapping("/audit")
	public String audit(PurchaseAuditLog purchaseAuditLog, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		purchaseAuditLog.setUser(user);
		purchaseService.doTransAuditPurchase(purchaseAuditLog);
		attr.addFlashAttribute("msg", "审核成功！");
		return "redirect:/jxc/purchase/list";
	}
	
	@RequestMapping("/subaudit/{id}")
	public String subaudit(@PathVariable String id, RedirectAttributes attr){
		purchaseService.doTransSubPurchaseApply(id);
		attr.addFlashAttribute("msg", "提交成功！");
		return "redirect:/jxc/purchase/list";
	}
	
	
}
