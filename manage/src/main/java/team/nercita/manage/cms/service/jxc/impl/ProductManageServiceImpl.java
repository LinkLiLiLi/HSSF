/*
 * ProductManageServiceImpl.java
 * 创建者：L
 * 创建日期：2017年12月21日 上午9:57:13
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.jxc.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.jxc.ProductManage;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.jxc.ProductManageService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;
import team.nercita.manage.cms.vo.ManageVo;

/**
 * 
 * @author L
 * @date： 2017年12月21日 上午9:57:13
 */
@Component
public class ProductManageServiceImpl extends BaseService implements ProductManageService {

	@Override
	public Map<String, Object> doJoinTransFindManageList(Integer goPage, Map<String, Object> paramMap) {
		String typeid = MapUtils.getString(paramMap, "typeid");
		
		Map<String, Object> queryMap = new HashMap<>();
		
		String sql = "select p from ProductManage p left join fetch p.productType where 1=1 and p.parentId is null ";
		String countSql = "select count(p) from ProductManage p where 1=1 and p.parentId is null ";
		
		if(StringUtils.isNotBlank(typeid)) {
			sql += " and p.productType.id = :TYPEID";
			countSql += " and p.productType.id = :TYPEID";
			
			queryMap.put("TYPEID", typeid);
		}
		
		sql += " order by p.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("manageList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}
	
	@Override
	public void doTransSaveParentProduct(ProductManage productManage) {
		String sql = "select count(p) from ProductManage p where p.productType.id = :TYPEID and p.parentId is null";
		Map<String, Object> queryMap = new HashMap<>();
		queryMap.put("TYPEID", productManage.getProductType().getId());
		
		int count = baseDao.queryObjectCount(sql, queryMap);
		if(count > 0) {
			throw new IllegalArgumentException("该产品关系已建立！");
		}
			
		productManage.setId(Generator.getUUID());
		productManage.setAmount(1);
		
		baseDao.save(productManage);
		
		doTransCopy(productManage.getId(), productManage.getProductType().getId());
	}
	
	@Override
	public List<ManageVo> doJoinTransFindManageVo(String id) {
		String sql = "select p from ProductManage p left join fetch p.productType where p.id = :ID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ID", id);
		
		ProductManage productManage = baseDao.findObject(sql, paramMap);
		List<ManageVo> nodeList = new ArrayList<>();
		ManageVo vo = new ManageVo();
		vo.setId(productManage.getId());
		vo.setPid(productManage.getParentId());
		vo.setName(productManage.getProductType().getTypeName());
		vo.setAmount(productManage.getAmount());
		vo.setChildrens(doJoinTransFindManageChild(productManage.getId()));
		
		nodeList.add(vo);
		return nodeList;
	}
	
	@SuppressWarnings("unchecked")
	private List<ManageVo> doJoinTransFindManageChild(String parentid) {
		String sql = "select p from ProductManage p left join fetch p.productType where p.parentId = :PARENTID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("PARENTID", parentid);
		
		List<ProductManage> manageList = (List<ProductManage>) baseDao.findObjectList(sql, paramMap);
		
		List<ManageVo> nodeList = new ArrayList<>();
		
		if(manageList != null){
			for (ProductManage productManage : manageList) {
				ManageVo vo = new ManageVo();
				vo.setId(productManage.getId());
				vo.setPid(productManage.getParentId());
				vo.setName(productManage.getProductType().getTypeName());
				vo.setAmount(productManage.getAmount());
				vo.setChildrens(doJoinTransFindManageChild(productManage.getId()));
				
				nodeList.add(vo);
			}
		}
		return nodeList;
	
	}
	
	@Override
	public ProductManage doJoinTransFindManageById(String id) {
		String sql = "select p from ProductManage p left join fetch p.productType where p.id = :ID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ID", id);
		
		return baseDao.findObject(sql, paramMap);
	}
	
	@Override
	public void doTransSaveChildProduct(ProductManage productManage) {
		productManage.setId(Generator.getUUID());
		baseDao.save(productManage);
		
		//拷贝结构
		doTransCopy(productManage.getId(), productManage.getProductType().getId());
	}
	
	//递归复制
	@SuppressWarnings("unchecked")
	private void doTransCopy(String newId, String typeid){
		String sql = "select p from ProductManage p where p.productType.id = :ID and p.id <> :NEWID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ID", typeid);
		paramMap.put("NEWID", newId);
		ProductManage baseProductManage = baseDao.findObject(sql, paramMap);
		
		if(baseProductManage == null) {
			return;
		}

		sql = "select p from ProductManage p where p.parentId = :MANAGEID";
		
		paramMap.clear();
		paramMap.put("MANAGEID", baseProductManage.getId());
		List<ProductManage> manageList = (List<ProductManage>) baseDao.findObjectList(sql, paramMap);
		
		for (ProductManage productManage : manageList) {
			ProductManage manage = new ProductManage();
			manage.setId(Generator.getUUID());
			manage.setParentId(newId);
			manage.setProductType(productManage.getProductType());
			manage.setAmount(productManage.getAmount());
			
			baseDao.save(manage);
			
			doTransCopy(manage.getId(), manage.getProductType().getId());
		}
	}
	
}
