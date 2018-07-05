/*
 * RoleServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年6月18日 上午9:02:14
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.deptmanage.Function;
import team.nercita.manage.cms.po.deptmanage.Permission;
import team.nercita.manage.cms.po.deptmanage.Role;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.usermanage.RoleService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.vo.FunctionVO;
import team.nercita.manage.cms.vo.RoleVO;

/**
 *
 * @author L
 * @date 2017年6月18日 上午9:02:14
 */
@Component
public class RoleServiceImpl extends BaseService implements RoleService {

	@SuppressWarnings("unchecked")
	@Override
	public List<RoleVO> doJoinTransFindRoleVOList() {
		String sql = "select r from Role r where r.buildType = :BUILDTYPE order by r.createTime desc";
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("BUILDTYPE", Role.BuildType.create.getValue());
		
		List<Role> roleList = (List<Role>) baseDao.findObjectList(sql, paramMap);
		
		List<RoleVO> resultList = new ArrayList<RoleVO>();
		
		for (Role role : roleList) {
			sql = "select count(u) from User u where u.role.id =:ROLEID";
			
			paramMap.clear();
			paramMap.put("ROLEID", role.getId());
			int userAmount = baseDao.queryObjectCount(sql, paramMap);
			
			sql = "select u from User u where u.role.id =:ROLEID";
			List<User> userList = (List<User>) baseDao.findObjectList(sql, paramMap);
			
			String userNames = "";
			
			if(userList != null){
				for (int i = 0; i < userList.size(); i++) {
					userNames += userList.get(i).getName();
					
					if(i != userList.size() - 1){
						userNames += ",";
					}
				}
			}
			
			RoleVO vo = new RoleVO();
			vo.setId(role.getId());
			vo.setRoleName(role.getRoleName());
			vo.setRoleCode(role.getRoleCode());
			vo.setRoleDesc(role.getRoleDesc());
			vo.setStatus(role.getStatus());
			vo.setUserAmount(userAmount);
			vo.setUserNames(userNames);
			
			resultList.add(vo);
		}
		return resultList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Role> doJoinTransFindRoleList() {
		String sql = "select r from Role r where r.status = :STATUS and r.buildType = :BUILDTYPE";
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("STATUS", Role.Status.normal.getValue());
		paramMap.put("BUILDTYPE", Role.BuildType.create.getValue());
		
		return (List<Role>) baseDao.findObjectList(sql, paramMap);
	}
	
	@SuppressWarnings("unchecked")
	public List<FunctionVO> doJoinTransFindFunctionList(String parentId){
		String sql = "select f from Function f where f.status = :STATUS ";

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("STATUS", Function.Status.normal.getValue());
		
		if(StringUtils.isNotBlank(parentId)){
			sql += " and f.function.id = :PARENTID";
			paramMap.put("PARENTID", parentId);
		} else {
			sql += " and f.function.id is null";
		}
		
		sql += " order by f.sort";
		List<Function> functionList = (List<Function>) baseDao.findObjectList(sql, paramMap);
		
		List<FunctionVO> resultList = new ArrayList<>();
		for (Function function : functionList) {
			FunctionVO vo = new FunctionVO();
			vo.setId(function.getId());
			vo.setFunctionName(function.getFunctionName());
			vo.setFunctionList(doJoinTransFindFunctionList(function.getId()));
			
			resultList.add(vo);
		}
		
		return resultList;	
	}
	
	@Override
	public void doTransSaveRole(Role role) {
		role.setId(Generator.getUUID());
		role.setRoleCode(role.getId());
		role.setStatus(Role.Status.normal.getValue());
		role.setBuildType(Role.BuildType.create.getValue());
		
		baseDao.save(role);
	}
	
	@Override
	public void doTransUpdateRole(String id, String roleName, String content) {
		Role oldRole = baseDao.findObject(Role.class, id);
		
		oldRole.setRoleName(roleName);
		oldRole.setRoleDesc(content);
		
		baseDao.update(oldRole);
	}
	
	@Override
	public void doTransSaveRolePermission(Role role, List<String> FunctionIds) {
		role.setId(Generator.getUUID());
		role.setRoleCode(role.getId());
		role.setStatus(Role.Status.normal.getValue());
		role.setBuildType(Role.BuildType.create.getValue());
		
		baseDao.save(role);
		
		for (String id : FunctionIds) {
			Permission permission = new Permission();
			permission.setId(Generator.getUUID());
			permission.setFunction(new Function(id));
			permission.setRole(role);
			
			baseDao.save(permission);
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Permission> doJoinTransFindPermissionList(String roleId) {
		String sql = "select p from Permission p where p.role.id = :ROLEID";
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ROLEID", roleId);
		
		List<Permission> perList = (List<Permission>) baseDao.findObjectList(sql, paramMap);
		
		return perList;
	}
	
	@Override
	public Role doJoinTransFindRoleById(String roleId) {
		return baseDao.findObject(Role.class, roleId);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void doTransUpdateRolePermissionList(Role role, List<String> functionIds) {
		Role oldRole = baseDao.findObject(Role.class, role.getId());
		baseDao.update(oldRole);
		
		//删除之前关系，建立新关系
		
		String sql = "select p from Permission p where p.role.id = :ROLEID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("ROLEID", oldRole.getId());
		
		List<Permission> perList = (List<Permission>) baseDao.findObjectList(sql, paramMap);
		
		if(perList != null){
			for (Permission permission : perList) {
				baseDao.delete(permission);
			}
		}
		
		//建立关系
		for (String id : functionIds) {
			Permission permission = new Permission();
			permission.setId(Generator.getUUID());
			permission.setFunction(new Function(id));
			permission.setRole(oldRole);
			
			baseDao.save(permission);
		}
	}
}
