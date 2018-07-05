/*
 * AssetsController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月26日 下午9:00:05
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.assets;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.assets.Assets;
import team.nercita.manage.cms.service.assets.AssetsService;

/**
 * 固定资产控制器
 * @author L
 * @date 2017年7月26日 下午9:00:05
 */
@Controller
@RequestMapping("/assets")
public class AssetsController {
	
	@Autowired
	AssetsService assetsService;
	
	@RequestMapping("/list")
	public ModelAndView list(Integer goPage, @ModelAttribute(value="assetsName") String assetsName, @ModelAttribute(value="assetsNumber") String assetsNumber){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("assetsName", assetsName);
		paramMap.put("assetsNumber", assetsNumber);
		
		ModelAndView view = new ModelAndView("assets/list");
		view.addAllObjects(assetsService.doJoinTransAssetsList(goPage, paramMap));
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "assets/add";
	}
	
	@RequestMapping("/add")
	public String add(Assets assets, RedirectAttributes attr){
		assetsService.doTransSaveAssets(assets);
		attr.addFlashAttribute("msg", "添加成功!");
		return "redirect:/assets/list";
	}
	
	@RequestMapping("/toedit/{id}")
	public ModelAndView toedit(@PathVariable String id){
		ModelAndView view = new ModelAndView("assets/edit");
		view.addObject("assets", assetsService.doJoinTransFindAssetsById(id));
		
		return view;
	}
	
	@RequestMapping("/detail/{id}")
	public ModelAndView detail(@PathVariable String id){
		ModelAndView view = new ModelAndView("assets/detail");
		view.addObject("assets", assetsService.doJoinTransFindAssetsById(id));
		
		return view;
	}
	
	@RequestMapping("/edit")
	public String edit(Assets assets, RedirectAttributes attr){
		assetsService.doTransUpdateAssets(assets);
		attr.addFlashAttribute("msg", "修改成功!");
		return "redirect:/assets/list";
	}
}
