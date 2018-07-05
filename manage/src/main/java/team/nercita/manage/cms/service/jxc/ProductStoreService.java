/*
 * ProjectStoreService.java
 * 创建者：L
 * 创建日期：2017年12月20日 上午11:13:15
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.jxc;

import java.util.List;
import java.util.Map;

import team.nercita.manage.cms.po.jxc.ProductProperty;
import team.nercita.manage.cms.po.jxc.ProductStore;
import team.nercita.manage.cms.po.jxc.ProductType;
import team.nercita.manage.cms.vo.ProductVo;

/**
 * 
 * @author L
 * @date： 2017年12月20日 上午11:13:15
 */
public interface ProductStoreService {
	public void doTransSaveProductType(ProductType productType);
	
	public List<ProductType> doJoinTransFindProductType();
	
	public List<ProductProperty> doJoinTransFindPorductProperty(String typeid);
	
	public void doTransSaveProductStore(ProductStore productStore);
	
	public Map<String, Object> doJoinTransFindStoreList(Integer goPage, Map<String, Object> paramMap);
	
	public List<ProductStore> doJoinTransFindStoreByDealerId(String dealerid);
	
	public List<ProductType> doJoinTransFindProductTypeByManageId(String manageid);
	
	public List<ProductStore> doJoinTransFindStoreByTypeId(String typeid);
	
	public ProductStore doJoinTransFindStoreById(String id);
	
	public List<ProductVo> doJoinTransFindOutProduct(String id);
	
	public ProductVo doJoinTransFindOutData(String pid, String typeid, String storeid);
}
