/*
 * AssetsService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月26日 下午9:06:49
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.assets;

import java.util.Map;

import team.nercita.manage.cms.po.assets.Assets;

/**
 *
 * @author L
 * @date 2017年7月26日 下午9:06:49
 */
public interface AssetsService {
	/**
	 * 查询固定资产
	 * @param goPage
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> doJoinTransAssetsList(Integer goPage, Map<String, Object> paramMap);
	
	/**
	 * 保存固定资产
	 * @param assets
	 */
	public void doTransSaveAssets(Assets assets);
	
	/**
	 * 修改固定资产
	 * @param assets
	 */
	public void doTransUpdateAssets(Assets assets);
	
	/**
	 * 查询固定资产
	 * @param id
	 * @return
	 */
	public Assets doJoinTransFindAssetsById(String id);
}
