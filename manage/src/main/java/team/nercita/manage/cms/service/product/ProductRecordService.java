/*
 * ProductRecordService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月27日 下午10:03:09
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.product;

import java.util.List;
import java.util.Map;

import team.nercita.manage.cms.po.product.ProductionNode;
import team.nercita.manage.cms.po.product.ProductionRecord;

/**
 * 生产记录service
 * @author L
 * @date 2017年7月27日 下午10:03:09
 */
public interface ProductRecordService {
	
	public Map<String, Object> doJoinTransQueryProductRecord(Integer goPage, Map<String, Object> paramMap);
	
	public void doTransSaveProductRecord(ProductionRecord productionRecord);
	
	public ProductionRecord doJoinTransFindProductRecordById(String id);
	
	public void doTransUpdateProductRecord(ProductionRecord productionRecord);
	
	public void doTransSaveProductNode(ProductionNode productionNode);
	
	public List<ProductionNode> doJoinTransQueryNode(String id);
}
