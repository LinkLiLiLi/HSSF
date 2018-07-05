/*
 * UserServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年6月17日 下午2:33:16
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;

import team.nercita.manage.cms.po.deptmanage.Permission;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.deptmanage.UserGroup;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.usermanage.UserService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年6月17日 下午2:33:16
 */
public class UserServiceImpl extends BaseService implements UserService {

	@Override
	public User doJoinTransFindUserByUserName(String userName) {
		String sql = "select u from User u left join fetch u.role left join fetch u.userGroup where u.userName = :USERNAME";
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("USERNAME", userName);
		
		return baseDao.findObject(sql, paramMap);
	}

	@Override
	public void doTransSaveUser(User user, String operator) {
		user.setBuildType(User.BuildType.create.getValue());
		user.setId(Generator.getUUID());
		
		if(user.getUserGroup() != null && user.getUserGroup().getId() != null){
			UserGroup userGroup = baseDao.findObject(UserGroup.class, user.getUserGroup().getId());
			user.setUserGroupName(userGroup.getGroupName());
		}
		
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		baseDao.save(user);
	}
	
	@Override
	public void doTransUpdateUser(User user) {
		user.setBuildType(User.BuildType.create.getValue());
		
		User oldUser = baseDao.findObject(User.class, user.getId());
		oldUser.setName(user.getName());
		oldUser.setSex(user.getSex());
		oldUser.setUserName(user.getUserName());
		oldUser.setPost(user.getPost());
		oldUser.setRole(user.getRole());
		oldUser.setIdCard(user.getIdCard());
		oldUser.setPhoneNumber(user.getPhoneNumber());
		oldUser.setInductionTime(user.getInductionTime());
		oldUser.setDepartureTime(user.getDepartureTime());
		
		if(user.getUserGroup() != null && user.getUserGroup().getId() != null){
			UserGroup userGroup = baseDao.findObject(UserGroup.class, user.getUserGroup().getId());
			oldUser.setUserGroupName(userGroup.getGroupName());
			oldUser.setUserGroup(userGroup);
		}
		
		if(user.getPost() == 3){//学生
			oldUser.setSchool(user.getSchool());
			oldUser.setEntranceTime(user.getEntranceTime());
			oldUser.setGraduationTime(user.getGraduationTime());
			oldUser.setEducation(user.getEducation());
			oldUser.setTutor(user.getTutor());
		} else {
			oldUser.setTitles(user.getTitles());
			oldUser.setStatus(user.getStatus());
		}
		
		baseDao.update(oldUser);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> doJoinTransFindUserRolePermission(String userName) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		User user = doJoinTransFindUserByUserName(userName);
		resultMap.put("role", user.getRole());
		
		String sql = "select p from Permission p left join fetch p.function where p.role.id = :ROLEID";
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ROLEID", user.getRole().getId());
		
		List<Permission> permissionList = (List<Permission>) baseDao.findObjectList(sql, paramMap);
		resultMap.put("permissionList", permissionList);
		
		return resultMap;
	}
	
	@Override
	public void doTransUpdateUserPwd(String userId, String oldPassword, String newPassword) {
		User user = baseDao.findObject(User.class, userId);
		
		if(!user.getPassword().equals(oldPassword)){
			throw new IllegalArgumentException("旧密码不正确！");
		}
		
		user.setPassword(newPassword);
		baseDao.update(user);
	}
	
	@Override
	public Map<String, Object> doJoinTransFindUserList(Integer goPage, Map<String, Object> paramMap) {
		Integer userType = MapUtils.getInteger(paramMap, "userType");
		String name = MapUtils.getString(paramMap, "name");
		String userGroupId = MapUtils.getString(paramMap, "userGroupId");
		
		String sql = "select ug from UserGroup ug order by ug.groupDesc ";
		paramMap.clear();//用作存储结果集
		
		String countSql =new String();
		List<UserGroup> userGroupList = (List<UserGroup>) baseDao.findObjectList(sql, null);
		paramMap.put("userGroupList", userGroupList);
		Map<String , Object> queryMap = new HashMap<>();
		if(StringUtils.isBlank(userGroupId))	{
			userGroupId=userGroupList.get(0).getId();
		}
		sql = "select ug from UserGroup ug where ug.id=:USERGROUPID";
		queryMap.put("USERGROUPID", userGroupId);
		
		UserGroup userGroup = baseDao.findObject(sql,queryMap);
		if (StringUtils.isBlank(userGroup.getParentGroupId())) {
			sql="select u from User u left join fetch u.userGroup where u.buildType=:BUILDTYPE";
			countSql = "select count(u) from User u where u.buildType=:BUILDTYPE";
			queryMap.clear();
			queryMap.put("BUILDTYPE", User.BuildType.create.getValue());
		
		if(userType != null){
			sql += " and u.userType = :USERTYPE";
			countSql += " and u.userType = :USERTYPE";
			queryMap.put("USERTYPE", userType);
		}
		
		if(StringUtils.isNotBlank(name)){
			sql += " and u.name like :REALNAME";
			countSql += " and u.name like :REALNAME";
			queryMap.put("REALNAME", "%" + name + "%");
			
		}
	     sql+=" order by u.post,u.status";
		
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("userList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		return paramMap;
		}
		sql="select u from User u left join fetch u.userGroup where u.buildType=:BUILDTYPE";
		countSql = "select count(u) from User u where u.buildType=:BUILDTYPE";
		queryMap.clear();
		queryMap.put("BUILDTYPE", User.BuildType.create.getValue());
		
		if(StringUtils.isNotBlank(userGroupId)){
			sql += " and u.userGroup.id = :USERGROUPID";
			countSql += " and u.userGroup.id = :USERGROUPID";
			queryMap.put("USERGROUPID", userGroupId);
		}
		sql+=" order by u.post";
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("userList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		return paramMap;
		
	
	}
	
	
	@Override
	public User doJoinTransFindUserById(String id) {
		String sql = "select u from User u left join fetch u.role left join fetch u.userGroup where u.id = :USERID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("USERID", id);
		
		return baseDao.findObject(sql, paramMap);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> doJoinTransFindUserList(String userId) {
		String sql = "select u from User u left join fetch u.userGroup where u.id = :USERID ";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("USERID", userId);
		
		User user  = baseDao.findObject(sql ,paramMap);
		
		List<User> userList = new ArrayList<User>();
		userList.add(user);
		
		sql = "select u from User u";
		
		if(user.getPost() == 0){//主任
			sql += " where u.post<3 and u.id <> :USERID and u.status=1 order by u.post";
		} else if(user.getPost() == 1){
			sql += " where 1=1 and u.userGroup.id = :USERGROUPID and u.id <> :USERID order by u.post";
			paramMap.put("USERGROUPID", user.getUserGroup().getId());
		} else {
			return userList;
		}
		userList.addAll((List<User>) baseDao.findObjectList(sql, paramMap));
		
		return userList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> doJoinTransQueryUserList() {
		String sql = "select u from User u where u.useStatus = :USERSTATUS and u.buildType = :BUILDTYPE";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("USERSTATUS", User.UseStatus.normal.getValue());
		paramMap.put("BUILDTYPE", User.BuildType.create.getValue());
		return (List<User>) baseDao.findObjectList(sql, paramMap);
	}
	
	@Override
	public User doJoinTransCheckLoginApp(String openId) {
		String sql = "select u from User u where u.openId = :OPENID and u.useStatus = :USESTATUS";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("USESTATUS", User.UseStatus.normal.getValue());
		paramMap.put("OPENID", openId);
		
		User user = baseDao.findObject(sql, paramMap);
		
		return user;
	}
	
	@Override
	public User doTransLoginApp(String username, String password, String openid) {
		String sql = "select u from User u where u.userName = :USERNAME and u.password = :PASSWORD and u.useStatus = :USESTATUS";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("USESTATUS", User.UseStatus.normal.getValue());
		paramMap.put("USERNAME", username);
		paramMap.put("PASSWORD", DigestUtils.md5Hex(password));
		
		User user = baseDao.findObject(sql, paramMap);
		
		if(user == null) {
			return null;
		}
		
		user.setOpenId(openid);
		
		baseDao.update(user);
		return user;
	}
	
	@Override
	public void doTransUpdatePassword(String id, String oldpass, String newpass) {
		User user = baseDao.findObject(User.class, id);
		
		String oldpassword = DigestUtils.md5Hex(oldpass);
		
		if(!oldpassword.equals(user.getPassword())) {
			throw new IllegalArgumentException("旧密码输入错误！");
		}
		
		user.setPassword(DigestUtils.md5Hex(newpass));
		baseDao.update(user);
	}
}
