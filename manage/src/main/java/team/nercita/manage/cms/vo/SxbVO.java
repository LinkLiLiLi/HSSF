/*
 * SxbVO.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月16日 下午8:33:25
 * 创业小团队-后台
 */
package team.nercita.manage.cms.vo;

/**
 * 上下班VO
 * 
 * @author L
 * @date 2017年7月16日 下午8:33:25
 */
public class SxbVO {
	private String userId;
	private String userName;
	private String groupName;
	private int allDays;
	private int lateDays;
	private int earlyDays;
	private int absenteeismDays;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public int getAllDays() {
		return allDays;
	}

	public void setAllDays(int allDays) {
		this.allDays = allDays;
	}

	public int getLateDays() {
		return lateDays;
	}

	public void setLateDays(int lateDays) {
		this.lateDays = lateDays;
	}

	public int getEarlyDays() {
		return earlyDays;
	}

	public void setEarlyDays(int earlyDays) {
		this.earlyDays = earlyDays;
	}

	public int getAbsenteeismDays() {
		return absenteeismDays;
	}

	public void setAbsenteeismDays(int absenteeismDays) {
		this.absenteeismDays = absenteeismDays;
	}

}
