/*
 * UserGroupServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月9日 下午2:08:00
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.usermanage.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.hash.format.HexFormat;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.deptmanage.UserGroup;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.service.usermanage.UserGroupService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.vo.ChartVo;

/**
 *
 * @author L
 * @date 2017年7月9日 下午2:08:00
 */
@Component
public class UserGroupServiceImpl extends BaseService implements UserGroupService{

	@SuppressWarnings("unchecked")
	@Override
	public List<UserGroup> doJoinTransFindUserGroup() {
		return (List<UserGroup>) baseDao.findObjectList("select ug from UserGroup ug order by ug.groupDesc", null);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ChartVo> doJoinTransFindTreeGroup(String parentGrouopId) {
		String sql = "select ug from UserGroup ug where ug.parentGroupId = :PARENTGROUPID";
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("PARENTGROUPID", parentGrouopId);
		List<UserGroup> userGroupList = (List<UserGroup>) baseDao.findObjectList(sql, paramMap);
		
		List<ChartVo> nodeList = new ArrayList<>();
		
		if(userGroupList != null){
			for (UserGroup userGroup : userGroupList) {
				ChartVo vo = new ChartVo();
				vo.setId(userGroup.getId());
				vo.setPid(userGroup.getParentGroupId());
				vo.setName(userGroup.getGroupName());
				vo.setChildrens(doJoinTransFindTreeGroup(userGroup.getId()));
				
				nodeList.add(vo);
			}
		}
		return nodeList;
	}
	
	@Override
	public UserGroup doJoinTransFindUserGroupById(String id) {
		return baseDao.findObject(UserGroup.class, id);
	}
	
	@Override
	public void doJoinTransUpdateGroup(String id, String name, String content) {
		UserGroup group = baseDao.findObject(UserGroup.class, id);
		group.setGroupName(name);
		group.setGroupDesc(content);
		
		baseDao.update(group);
	}
	
	@Override
	public void doTransSaveUserGroup(String pid, String groupName, String groupDesc) {
		UserGroup userGroup = new UserGroup();
		userGroup.setGroupName(groupName);
		userGroup.setGroupDesc(groupDesc);
		userGroup.setId(Generator.getUUID());
		userGroup.setParentGroupId(pid);
		baseDao.save(userGroup);
	}
	
	@Override
	public void doJoinTransDelGroup(String id) {
		UserGroup group = baseDao.findObject(UserGroup.class, id);
		
		baseDao.delete(group);
	}

}
