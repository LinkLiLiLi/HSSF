/*
 * ValueVo.java
 * 创建者：L
 * 创建日期：2017年12月20日 下午5:20:36
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.vo;

import java.io.Serializable;

/**
 * 
 * @author L 
 * @date： 2017年12月20日 下午5:20:36
 */
public class ValueVo implements Serializable {
	private static final long serialVersionUID = -4418837020590033845L;
	private String pid;
	private String pname;

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

}
