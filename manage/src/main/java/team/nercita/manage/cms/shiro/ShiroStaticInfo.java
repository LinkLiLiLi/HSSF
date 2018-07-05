/*
 * ShiroStaticInfo.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2018年3月8日 下午2:18:22
 * 创业小团队-后台
 */
package team.nercita.manage.cms.shiro;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author L
 * @date 2018年3月8日 下午2:18:22
 */
public class ShiroStaticInfo {
	private static Map<String, Set<String>> roleMap = new HashMap<String, Set<String>>();
	private static Map<String, Set<String>> permissionMap = new HashMap<String, Set<String>>();
	
	public static Set<String> getRoleSet(String key){
		if(roleMap.containsKey(key)){
			return roleMap.get(key);
		}
		return null;
	}
	
	public static void setRoleSet(String key, Set<String> roleSet) {
		roleMap.put(key, roleSet);
	}
	
	public static Set<String> getPermissionSet(String key){
		if(permissionMap.containsKey(key)){
			return permissionMap.get(key);
		}
		return null;
	}
	
	public static void setPermissionSet(String key, Set<String> permissionSet) {
		permissionMap.put(key, permissionSet);
	}
	
	public static void clear(){
		roleMap.clear();
		permissionMap.clear();
	}
}
