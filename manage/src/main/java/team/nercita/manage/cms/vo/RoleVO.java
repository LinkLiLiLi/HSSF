/*
 * RoleVO.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月15日 下午3:55:48
 * 创业小团队-后台
 */
package team.nercita.manage.cms.vo;

/**
 *
 * @author L
 * @date 2017年7月15日 下午3:55:48
 */
public class RoleVO {
	private String id;
	private String roleName;
	private String roleCode;
	private String roleDesc;
	private Integer status;

	private int userAmount;
	private String userNames;

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public int getUserAmount() {
		return userAmount;
	}

	public void setUserAmount(int userAmount) {
		this.userAmount = userAmount;
	}

	public String getUserNames() {
		return userNames;
	}

	public void setUserNames(String userNames) {
		this.userNames = userNames;
	}

}
