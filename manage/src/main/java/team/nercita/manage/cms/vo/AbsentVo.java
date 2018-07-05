/*
 * AbsentVo.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2018年1月21日 上午9:58:29
 * 创业小团队-后台
 */
package team.nercita.manage.cms.vo;

import java.io.Serializable;

/**
 *
 * @author L
 * @date 2018年1月21日 上午9:58:29
 */
public class AbsentVo implements Serializable {

	private static final long serialVersionUID = -4527731852856471095L;
	private String username;
	private String reason;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}
