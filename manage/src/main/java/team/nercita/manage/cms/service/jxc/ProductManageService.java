/*
 * ProductManageService.java
 * 创建者：L
 * 创建日期：2017年12月21日 上午9:56:23
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.jxc;

import java.util.List;
import java.util.Map;

import team.nercita.manage.cms.po.jxc.ProductManage;
import team.nercita.manage.cms.vo.ManageVo;

/**
 * 
 * @author L
 * @date： 2017年12月21日 上午9:56:23
 */
public interface ProductManageService {
	public Map<String, Object> doJoinTransFindManageList(Integer goPage, Map<String, Object> paramMap);
	
	public void doTransSaveParentProduct(ProductManage productManage);
	
	public List<ManageVo> doJoinTransFindManageVo(String id);
	
	public ProductManage doJoinTransFindManageById(String id);
	
	public void doTransSaveChildProduct(ProductManage productManage);
}
