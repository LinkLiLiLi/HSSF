/*
 * ProductDealerService.java
 * 创建者：L
 * 创建日期：2017年12月20日 下午2:28:09
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.jxc;

import java.util.List;
import java.util.Map;

import team.nercita.manage.cms.po.jxc.ProductDealer;

/**
 * 
 * @author L
 * @date： 2017年12月20日 下午2:28:09
 */
public interface ProductDealerService {
	public void doTransSaveProductDealer(ProductDealer productDealer);
	
	public Map<String, Object> doJoinTransFindDealerList(Integer goPage, Map<String, Object> paramMap);
	
	public ProductDealer doJoinTransFindDealerById(String id);
	
	public void doTransUpdateDealer(ProductDealer productDealer);
	
	public List<ProductDealer> doJoinTransFindDealer();
}
