/*
 * ChartVo.java
 * 创建者：L
 * 创建日期：2017年10月30日 上午8:13:14
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.vo;

import java.util.List;

/**
 * 
 * @author L 
 * @date： 2017年10月30日 上午8:13:14
 */
public class ChartVo {
	private String id;
	private String name;
	private String pid;
	private List<ChartVo> childrens;

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

	public List<ChartVo> getChildrens() {
		return childrens;
	}

	public void setChildrens(List<ChartVo> childrens) {
		this.childrens = childrens;
	}

}
