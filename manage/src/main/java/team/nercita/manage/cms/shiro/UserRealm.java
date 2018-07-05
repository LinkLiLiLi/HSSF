package team.nercita.manage.cms.shiro;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import team.nercita.manage.cms.po.deptmanage.Permission;
import team.nercita.manage.cms.po.deptmanage.Role;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.service.usermanage.UserService;

public class UserRealm extends AuthorizingRealm {
	
	UserService userService;
	
	@SuppressWarnings("unchecked")
	@Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
        String username = (String)principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        
        if(ShiroStaticInfo.getRoleSet(username) != null) {
        	authorizationInfo.setRoles(ShiroStaticInfo.getRoleSet(username));//添加角色
        	authorizationInfo.setStringPermissions(ShiroStaticInfo.getPermissionSet(username));//添加权限
        	
        	return authorizationInfo;
        }
        
        Map<String, Object> resultMap = userService.doJoinTransFindUserRolePermission(username);
        
        Role role = (Role) resultMap.get("role");
        List<Permission> permissionList = (List<Permission>) resultMap.get("permissionList");
        
        Set<String> roles = new HashSet<>();
        roles.add(role.getRoleCode());
        
        Set<String> permissions = new HashSet<>();
        
        for (Permission permission : permissionList) {
        	permissions.add(permission.getFunction().getFunctionCode());
		}
        
        ShiroStaticInfo.setPermissionSet(username, permissions);
        ShiroStaticInfo.setRoleSet(username, roles);
        
        authorizationInfo.setRoles(roles);//添加角色
        authorizationInfo.setStringPermissions(permissions);//添加权限

        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        String username = (String)token.getPrincipal();
        
        User user = userService.doJoinTransFindUserByUserName(username);
        
        if(user == null){
        	throw new UnknownAccountException("用户名不存在！");
        }
        
        if(user.getUseStatus() == User.UseStatus.disable.getValue()){
        	throw new UnknownAccountException("账号已禁用，请联系管理员！");
        }
        
        if(user.getRole().getStatus() == Role.Status.disable.getValue()){
        	throw new UnknownAccountException("账号角色已禁用，请联系管理员！");
        }
        
        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
        		user.getUserName(), //用户名
                user.getPassword(),//密码
                ByteSource.Util.bytes(token.getPrincipal()),
                getName()  //realm name
        );
        
        SecurityUtils.getSubject().getSession().setAttribute("user", user);
        
        return authenticationInfo;
    }

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
    
    
}