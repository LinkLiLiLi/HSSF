/*
 * UserService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年6月17日 下午1:36:03
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage;

import java.util.List;
import java.util.Map;

import team.nercita.manage.cms.po.deptmanage.User;

/**
 * 用户service
 * @author L
 * @date 2017年6月17日 下午1:36:03
 */
public interface UserService {
	/**
	 * 根据用户名查询用户信息
	 * @param userName 登录名
	 * @return 如果不存在 返回null
	 */
	public User doJoinTransFindUserByUserName(String userName);
	
	/**
	 * 保存用户信息
	 * @param user 用户信息
	 * @param operator 操作中
	 */
	public void doTransSaveUser(User user, String operator);
	
	
	public void doTransUpdateUser(User user);
	/**
	 * 根据用户名查询用户角色和权限信息
	 * Map返回结果如下
	 * <pre>
	 * 		role           角色信息
	 * 		permissionList 权限集合
	 * </pre>
	 * @param userName 登录用户名
	 * @return 
	 */
	public Map<String, Object> doJoinTransFindUserRolePermission(String userName);
	
	/**
	 * 修改密码
	 * @param userId 用户id
	 * @param oldPassword 旧密码
	 * @param newPassword 新密码
	 */
	public void doTransUpdateUserPwd(String userId, String oldPassword, String newPassword);
	
	/**
	 * 查询人员列表
	 * 查询参数条件如下
	 * <pre>
	 * 		userType     int类型，用户类型，根据此参数精确查找
	 * 		userGroupId  String类型，用户分组id
	 * 		name  		 String类型，姓名
	 * </pre>
	 * @param goPage
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> doJoinTransFindUserList(Integer goPage, Map<String, Object> paramMap);
	
	public User doJoinTransFindUserById(String id);
	
	public List<User> doJoinTransFindUserList(String userId);
	
	public List<User> doJoinTransQueryUserList();
	
	public User doJoinTransCheckLoginApp(String openId);
	
	public User doTransLoginApp(String username, String password, String openid);
	
	public void doTransUpdatePassword(String id, String oldpass, String newpass);


}
