/*
 * StorageServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月21日 下午9:23:32
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.form.ApplyStorage;
import team.nercita.manage.cms.po.form.StorageItem;
import team.nercita.manage.cms.service.apply.StorageService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年8月21日 下午9:23:32
 */
@Component
public class StorageServiceImpl extends BaseService implements StorageService{

	@Override
	public Map<String, Object> doJoinTransFindApplyStorageList(Integer goPage, Map<String, Object> paramMap) {
		String titleName = MapUtils.getString(paramMap, "titleName");
		String type = MapUtils.getString(paramMap, "type");
		
		String sql = "select a from ApplyStorage a where 1=1 ";
		String countSql = "select count(a) from ApplyStorage a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(titleName)){
			sql += " and a.titleName like :TITLENAME";
			countSql += " and a.titleName like :TITLENAME";
			queryMap.put("TITLENAME", "%" + titleName + "%");
		}
		
		if(StringUtils.isNotBlank(type)){
			sql += " and a.type = :TYPE";
			countSql += " and a.type = :TYPE";
			queryMap.put("TYPE", type);
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("storageList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		return paramMap;
	}

	@Override
	public void doTransSaveApplyStorage(ApplyStorage applyStorage, List<StorageItem> storageItems) {
		applyStorage.setId(Generator.getUUID());
		applyStorage.setItemList(null);
		
		baseDao.save(applyStorage);
		
		for (StorageItem storageItem : storageItems) {
			if(StringUtils.isNotBlank(storageItem.getGoodsNumber()) || StringUtils.isNotBlank(storageItem.getGoodsName()) 
					|| StringUtils.isNotBlank(storageItem.getSpecification()) || StringUtils.isNotBlank(storageItem.getUnit())
					|| storageItem.getAmount() != null || storageItem.getPrice()  != null || storageItem.getSignPrice() != null 
					|| StringUtils.isNotBlank(storageItem.getRemark())){
				storageItem.setApplyStorage(applyStorage);
				storageItem.setId(Generator.getUUID());
				
				baseDao.save(storageItem);
			}
		}
	}

	@Override
	public ApplyStorage doJoinTransFindApplyStorage(String id) {
		String sql = "select a from ApplyStorage a left join fetch a.itemList where a.id = :STORAGEID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("STORAGEID", id);
		
		return baseDao.findObject(sql, paramMap);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void doTransUpdateApplyStorage(ApplyStorage applyStorage, List<StorageItem> storageItems) {
		
		String sql = "select si from StorageItem si where si.applyStorage.id = :APPLYID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("APPLYID", applyStorage.getId());
		
		List<StorageItem> oldList = (List<StorageItem>) baseDao.findObjectList(sql, paramMap);
		
		for (StorageItem storageItem : oldList) {
			baseDao.delete(storageItem);
		}
		
		for (StorageItem storageItem : storageItems) {
			if(StringUtils.isNotBlank(storageItem.getGoodsNumber()) || StringUtils.isNotBlank(storageItem.getGoodsName()) 
					|| StringUtils.isNotBlank(storageItem.getSpecification()) || StringUtils.isNotBlank(storageItem.getUnit())
					|| storageItem.getAmount() != null || storageItem.getPrice()  != null || storageItem.getSignPrice() != null 
					|| StringUtils.isNotBlank(storageItem.getRemark())){
				storageItem.setApplyStorage(applyStorage);
				storageItem.setId(Generator.getUUID());
				
				baseDao.save(storageItem);
			}
		}
		
		applyStorage.setItemList(null);
		
		baseDao.update(applyStorage);
	}
	
}

