/*
 * StorageService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月20日 下午9:53:02
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply;

import java.util.List;
import java.util.Map;

import team.nercita.manage.cms.po.form.ApplyStorage;
import team.nercita.manage.cms.po.form.StorageItem;

/**
 * 出入库service
 * @author L
 * @date 2017年8月20日 下午9:53:02
 */
public interface StorageService {
	public Map<String, Object> doJoinTransFindApplyStorageList(Integer goPage, Map<String, Object> paramMap);
	 
	 public void doTransSaveApplyStorage(ApplyStorage applyStorage, List<StorageItem> storageItems);
	 
	 public ApplyStorage doJoinTransFindApplyStorage(String id);
	 
	 public void doTransUpdateApplyStorage(ApplyStorage applyStorage, List<StorageItem> storageItems);
}
