/*
 * UserGroupService.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月9日 下午2:06:21
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage;

import java.util.List;

import team.nercita.manage.cms.po.deptmanage.UserGroup;
import team.nercita.manage.cms.vo.ChartVo;

/**
 *	用户组service
 * @author L
 * @date 2017年7月9日 下午2:06:21
 */
public interface UserGroupService {
	public List<UserGroup> doJoinTransFindUserGroup();
	
	public List<ChartVo> doJoinTransFindTreeGroup(String parentGrouopId);
	
	public UserGroup doJoinTransFindUserGroupById(String id);
	
	public void doJoinTransDelGroup(String id);
	
	public void doJoinTransUpdateGroup(String id, String name, String content);
	
	public void doTransSaveUserGroup(String pid, String groupName, String groupDesc);
}
