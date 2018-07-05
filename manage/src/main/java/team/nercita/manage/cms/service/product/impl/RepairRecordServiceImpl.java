/*
 * RepairRecordServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月30日 下午1:28:52
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.product.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.product.RepairRecord;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.product.RepairRecordService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年7月30日 下午1:28:52
 */
@Component
public class RepairRecordServiceImpl extends BaseService implements RepairRecordService {
	
	@Override
	public Map<String, Object> doJoinTransQeuryRepair(Integer goPage, Map<String, Object> paramMap) {
		String productName = MapUtils.getString(paramMap, "productName");
		
		String sql = "select a from RepairRecord a where 1=1 ";
		String countSql = "select count(a) from RepairRecord a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(productName)){
			sql += " and a.productName like :PRODUCTNAME";
			countSql += " and a.productName like :PRODUCTNAME";
			queryMap.put("PRODUCTNAME", "%" + productName + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("repairList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveRepairRecord(RepairRecord repairRecord) {
		repairRecord.setId(Generator.getUUID());
		
		baseDao.save(repairRecord);
	}

	@Override
	public RepairRecord doJoinTransRepairRecord(String id) {
		return baseDao.findObject(RepairRecord.class, id);
	}

	@Override
	public void doTransUpdateRepairRecord(RepairRecord repairRecord) {
		RepairRecord oldRepair = baseDao.findObject(RepairRecord.class, repairRecord.getId());
		
		oldRepair.setProductName(repairRecord.getProductName());
		oldRepair.setUnit(repairRecord.getUnit());
		oldRepair.setAmount(repairRecord.getAmount());
		oldRepair.setProductionDate(repairRecord.getProductionDate());
		oldRepair.setProcessLog(repairRecord.getProcessLog());
		oldRepair.setRemark(repairRecord.getRemark());
		
		baseDao.update(oldRepair);
	}

}
