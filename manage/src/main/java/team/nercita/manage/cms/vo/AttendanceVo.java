/*
 * AttendanceVo.java
 * 创建者：L
 * 创建日期：2018年1月3日 上午11:10:19
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.vo;

import java.io.Serializable;

/**
 * 
 * @author L
 * @date： 2018年1月3日 上午11:10:19
 */
public class AttendanceVo implements Serializable {

	private static final long serialVersionUID = 3334975366605557239L;
	
	private int count;
	private String name;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
