/*
 * FundsService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月26日 上午11:14:30
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.funds;

import java.util.Map;

import team.nercita.manage.cms.po.finance.FundsIncome;

/**
 *
 * @author L
 * @date 2017年11月26日 上午11:14:30
 */
public interface FundsService {
	public Map<String, Object> doJoinTransQueryFundsList(Integer goPage, Map<String, Object> paramMap);
	
	public void doTransSaveFundsIncome(FundsIncome fundsIncome);
	
	public FundsIncome doJoinTransFindFundsIncomeById(String id);
	
	public void doTransUpdateFundsIncome(FundsIncome fundsIncome);
}
