/*
 * ProductService.java
 * 创建者：L
 * 创建日期：2017年12月26日 下午5:16:26
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.jxc;

import java.util.Map;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.jxc.Production;

/**
 * 
 * @author L
 * @date： 2017年12月26日 下午5:16:26
 */
public interface ProductionService {
	public Map<String, Object> doJoinTransFindProductionList(Integer goPage, Map<String, Object> paramMap);
	
	public void doTransSaveProduction(Production production);
	
	public Production doJoinTransProductionById(String id);
	
	public void doTransUpdateProduction(Production production);
	
	public void doTransOutStore(String id, User user);
	
	public void doTransIncomeStore(String id, User user);
}
