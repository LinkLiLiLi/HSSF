/*
 * AssetsServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月26日 下午9:09:58
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.assets.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.assets.Assets;
import team.nercita.manage.cms.service.assets.AssetsService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年7月26日 下午9:09:58
 */
@Component
public class AssetsServiceImpl extends BaseService implements AssetsService {

	@Override
	public Map<String, Object> doJoinTransAssetsList(Integer goPage, Map<String, Object> paramMap) {
		String assetsName = MapUtils.getString(paramMap, "assetsName");
		String assetsNumber = MapUtils.getString(paramMap, "assetsNumber");
		
		String sql = "select a from Assets a where 1=1 ";
		String countSql = "select count(a) from Assets a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(assetsName)){
			sql += " and a.assetsName like :ASSETSNAME";
			countSql += " and a.assetsName like :ASSETSNAME";
			queryMap.put("ASSETSNAME", "%" + assetsName + "%");
		}
		
		if(StringUtils.isNotBlank(assetsNumber)){
			sql += " and a.assetsNumber like :ASSETSNUMBER";
			countSql += " and a.assetsNumber like :ASSETSNUMBER";
			queryMap.put("ASSETSNUMBER", "%" + assetsNumber + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("assetsList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}
	
	@Override
	public void doTransSaveAssets(Assets assets) {
		assets.setId(Generator.getUUID());
		baseDao.save(assets);
	}
	
	@Override
	public Assets doJoinTransFindAssetsById(String id) {
		return baseDao.findObject(Assets.class, id);
	}
	
	@Override
	public void doTransUpdateAssets(Assets assets) {
		Assets oldAssets = baseDao.findObject(Assets.class, assets.getId());
		oldAssets.setAssetsName(assets.getAssetsName());
		oldAssets.setAssetsNumber(assets.getAssetsNumber());
		oldAssets.setBuyDate(assets.getBuyDate());
		oldAssets.setCharge(assets.getCharge());
		oldAssets.setFixedAssets(assets.getFixedAssets());
		oldAssets.setLocation(assets.getLocation());
		oldAssets.setPrize(assets.getPrize());
		oldAssets.setStatus(assets.getStatus());
		oldAssets.setType(assets.getType());
		
		baseDao.update(oldAssets);
	}
}
