/*
 * RoleService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年6月18日 上午8:57:28
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage;

import java.util.List;

import team.nercita.manage.cms.po.deptmanage.Permission;
import team.nercita.manage.cms.po.deptmanage.Role;
import team.nercita.manage.cms.vo.FunctionVO;
import team.nercita.manage.cms.vo.RoleVO;

/**
 * 角色服务
 * @author L
 * @date 2017年6月18日 上午8:57:28
 */
public interface RoleService {
	/**
	 * 查询角色列表
	 * 查询参数可以如下：
	 * @return
	 */
	public List<RoleVO> doJoinTransFindRoleVOList();
	
	/**
	 * 查询所有角色集合
	 * @return
	 */
	public List<Role> doJoinTransFindRoleList();
	
	public List<FunctionVO> doJoinTransFindFunctionList(String perentId);
	
	public void doTransSaveRole(Role role);
	
	public void doTransUpdateRole(String id, String roleName, String content);
	
	public void doTransSaveRolePermission(Role role, List<String> FunctionIds);
	
	public List<Permission> doJoinTransFindPermissionList(String roleId);
	
	public Role doJoinTransFindRoleById(String roleId);
	
	public void doTransUpdateRolePermissionList(Role role, List<String> functionIds);
}
