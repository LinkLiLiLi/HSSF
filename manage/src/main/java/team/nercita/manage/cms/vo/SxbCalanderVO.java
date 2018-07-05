/*
 * SxbCalanderVO.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月16日 下午11:51:08
 * 创业小团队-后台
 */
package team.nercita.manage.cms.vo;

import java.util.List;

/**
 *
 * @author L
 * @date 2017年7月16日 下午11:51:08
 */
public class SxbCalanderVO {
	private String userId;
	private String userName;
	private String groupName;
	private List<AbnormalItem> itemList;

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

	public List<AbnormalItem> getItemList() {
		return itemList;
	}

	public void setItemList(List<AbnormalItem> itemList) {
		this.itemList = itemList;
	}

}
