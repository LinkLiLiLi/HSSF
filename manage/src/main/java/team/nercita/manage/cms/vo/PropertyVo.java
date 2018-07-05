/*
 * PropertyVo.java
 * 创建者：L
 * 创建日期：2017年12月20日 下午5:04:26
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @author L 
 * @date： 2017年12月20日 下午5:04:26
 */
public class PropertyVo implements Serializable {
	private static final long serialVersionUID = 7944005175459090825L;
	private String pid;
	private String pname;
	private Integer type;
	
	private List<ValueVo> voList;

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public List<ValueVo> getVoList() {
		return voList;
	}

	public void setVoList(List<ValueVo> voList) {
		this.voList = voList;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
}
