/*
 * BgsController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月20日 下午7:18:00
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.apply;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.form.ApplyStorage;
import team.nercita.manage.cms.po.form.StorageItem;
import team.nercita.manage.cms.service.apply.StorageService;

/**
 * 办公室出入库
 * @author L
 * @date 2017年8月20日 下午7:18:00
 */
@Controller
@RequestMapping("/apply/online/storage")
public class StorageController {
	@Autowired
	StorageService storageService; 
	
	@RequestMapping("/list")
	public ModelAndView list( Integer goPage, @ModelAttribute(value="titleName") String titleName){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("titleName", titleName);
		
		ModelAndView view = new ModelAndView("apply/online/storage/list");
		view.addAllObjects(storageService.doJoinTransFindApplyStorageList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "apply/online/storage/add";
	}
	
	@RequestMapping("/add")
	public String add(ApplyStorage applyStorage, RedirectAttributes attr){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		
		applyStorage.setUser(user);
		storageService.doTransSaveApplyStorage(applyStorage, applyStorage.getItemList());
		attr.addFlashAttribute("msg", "添加成功！");
		return "redirect:/apply/online/storage/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit( @PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/storage/edit");
		ApplyStorage applyStorage = storageService.doJoinTransFindApplyStorage(id);
		
		view.addObject("storage", applyStorage);
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(ApplyStorage applyStorage, RedirectAttributes attr){
		ApplyStorage oldApplyStorage = storageService.doJoinTransFindApplyStorage(applyStorage.getId());
		
		applyStorage.setUser(oldApplyStorage.getUser());
		applyStorage.setCreator(oldApplyStorage.getCreator());
		applyStorage.setCreateTime(oldApplyStorage.getCreateTime());
		
		storageService.doTransUpdateApplyStorage(applyStorage, applyStorage.getItemList());
		attr.addFlashAttribute("msg", "修改成功！");
		return "redirect:/apply/online/storage/list";
	}
	
	@RequestMapping("/toprint/{id}")
	public ModelAndView toprint( @PathVariable String id){
		ModelAndView view = new ModelAndView("apply/online/storage/print");
		List<String> titleList = new ArrayList<String>();
		titleList.add("第一联库房留存");
		titleList.add("第二联财务留存");
		titleList.add("第三联库房记账");
		titleList.add("第四联领用人留存");
		
		view.addObject("titleList", titleList);
		int price = 0;
		ApplyStorage storage = storageService.doJoinTransFindApplyStorage(id);
		for (StorageItem item : storage.getItemList()) {
			price += item.getPrice();
		}
		
		StorageItem item = new StorageItem();
		item.setGoodsNumber("合计");
		item.setPrice(price);
		storage.getItemList().add(item);
		
		view.addObject("storage", storage);
		return view;
	}
}