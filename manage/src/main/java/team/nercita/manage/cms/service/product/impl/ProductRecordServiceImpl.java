/*
 * ProductRecordServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月30日 上午7:28:44
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.product.ProductionNode;
import team.nercita.manage.cms.po.product.ProductionRecord;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.product.ProductRecordService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年7月30日 上午7:28:44
 */
@Component
public class ProductRecordServiceImpl extends BaseService implements ProductRecordService {

	@Override
	public Map<String, Object> doJoinTransQueryProductRecord(Integer goPage, Map<String, Object> paramMap) {
		String taskName = MapUtils.getString(paramMap, "taskName");
		String taskNumber = MapUtils.getString(paramMap, "taskNumber");
		
		String sql = "select a from ProductionRecord a left join fetch a.modeList where 1=1 ";
		String countSql = "select count(a) from ProductionRecord a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(taskName)){
			sql += " and a.taskName like :TASKNAME";
			countSql += " and a.taskName like :TASKNAME";
			queryMap.put("TASKNAME", "%" + taskName + "%");
		}
		
		if(StringUtils.isNotBlank(taskNumber)){
			sql += " and a.taskNumber like :TASKNUMBER";
			countSql += " and a.taskNumber like :TASKNUMBER";
			queryMap.put("TASKNUMBER", "%" + taskNumber + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("productList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		
		return paramMap;
	}

	@Override
	public void doTransSaveProductRecord(ProductionRecord productionRecord) {
		productionRecord.setId(Generator.getUUID());
		
		baseDao.save(productionRecord);
	}

	@Override
	public ProductionRecord doJoinTransFindProductRecordById(String id) {
		return baseDao.findObject(ProductionRecord.class, id);
	}

	@Override
	public void doTransUpdateProductRecord(ProductionRecord productionRecord) {
		ProductionRecord oldRecord = baseDao.findObject(ProductionRecord.class, productionRecord.getId());
		oldRecord.setTaskName(productionRecord.getTaskName());
		oldRecord.setTaskNumber(productionRecord.getTaskNumber());
		oldRecord.setTaskDate(productionRecord.getTaskDate());
		oldRecord.setEndDate(productionRecord.getEndDate());
		oldRecord.setProblem(productionRecord.getProblem());
		
		baseDao.update(oldRecord);
	}

	@Override
	public void doTransSaveProductNode(ProductionNode productionNode) {
		ProductionRecord record = baseDao.findObject(ProductionRecord.class, productionNode.getProductionRecord().getId());
		record.setLastProgress(productionNode.getProgress());
		baseDao.update(record);
		
		productionNode.setId(Generator.getUUID());
		baseDao.save(productionNode);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductionNode> doJoinTransQueryNode(String id) {
		String sql = "select p from ProductionNode p where p.productionRecord.id = :ID order by p.noteDate desc";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("ID", id);
		return (List<ProductionNode>) baseDao.findObjectList(sql, queryMap);
	}
}
