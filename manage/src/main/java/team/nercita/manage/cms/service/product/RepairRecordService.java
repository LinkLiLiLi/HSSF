/*
 * RepairRecordService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月30日 下午1:26:14
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.product;

import java.util.Map;

import team.nercita.manage.cms.po.product.RepairRecord;

/**
 * 返修记录
 * @author L
 * @date 2017年7月30日 下午1:26:14
 */
public interface RepairRecordService {
	public Map<String, Object> doJoinTransQeuryRepair(Integer goPage, Map<String, Object> paramMap);
	
	public void doTransSaveRepairRecord(RepairRecord repairRecord);
	
	public RepairRecord doJoinTransRepairRecord(String id);
	
	public void doTransUpdateRepairRecord(RepairRecord repairRecord);
	
}
