/*
 * ManageVo.java
 * 创建者：L
 * 创建日期：2017年12月21日 下午2:18:17
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.vo;

import java.util.List;

/**
 * 
 * @author L
 * @date： 2017年12月21日 下午2:18:17
 */
public class ManageVo {
	private String id;
	private String name;
	private String pid;
	private int amount;
	private List<ManageVo> childrens;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public List<ManageVo> getChildrens() {
		return childrens;
	}

	public void setChildrens(List<ManageVo> childrens) {
		this.childrens = childrens;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
