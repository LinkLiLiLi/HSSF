/*
 * OutStoreService.java
 * 创建者：L
 * 创建日期：2017年12月25日 上午9:54:46
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.service.jxc;

import java.util.Map;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.jxc.OutStoreApply;

/**
 * 
 * @author L
 * @date： 2017年12月25日 上午9:54:46
 */
public interface OutStoreService {
	public void doTransSaveOutStoreApply(OutStoreApply outStoreApply);
	
	public Map<String, Object> doJoinTransFindOutStoreList(Integer goPage,User user, Map<String, Object> paramMap);
	
	public OutStoreApply doJoinTransFindOutStoreApply(String id);
	
	public void doTransUpdateOutStoreApply(OutStoreApply outStoreApply);
	
	public void doTransSubAuditStoreApply(String id);
	
	public void doTransAuditOutStore(String id, int status, User user, String auditMsg);
	
	public void doTransOutStore(String id, User user);
}
