/*
 * ProductDealerServiceImpl.java
 * 创建者：L
 * 创建日期：2017年12月20日 下午2:28:55
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.jxc.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.jxc.ProductDealer;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.jxc.ProductDealerService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 * 
 * @author L
 * @date： 2017年12月20日 下午2:28:55
 */
@Component
public class ProductDealerServiceImpl extends BaseService implements ProductDealerService {

	@Override
	public void doTransSaveProductDealer(ProductDealer productDealer) {
		productDealer.setId(Generator.getUUID());
		baseDao.save(productDealer);
	}
	
	@Override
	public Map<String, Object> doJoinTransFindDealerList(Integer goPage, Map<String, Object> paramMap) {
		String dealerName = MapUtils.getString(paramMap, "dealerName");
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		String sql = "select a from ProductDealer a where 1=1 ";
		String countSql = "select count(a) from ProductDealer a where 1=1 ";
		
		if(StringUtils.isNotBlank(dealerName)) {
			sql += " and a.dealerName like :DEALERNAME";
			countSql += " and a.dealerName like :DEALERNAME";
			queryMap.put("DEALERNAME", "%" + dealerName + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("dealerList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}
	
	@Override
	public ProductDealer doJoinTransFindDealerById(String id) {
		
		return baseDao.findObject(ProductDealer.class, id);
	}
	
	@Override
	public void doTransUpdateDealer(ProductDealer productDealer) {
		baseDao.update(productDealer);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductDealer> doJoinTransFindDealer() {
		String sql = "select p from ProductDealer p";
		
		return (List<ProductDealer>) baseDao.findObjectList(sql, null);
	}
	
	
}
