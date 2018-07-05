/*
 * WorkJoutanlVo.java
 * 创建者：L
 * 创建日期：2017年12月18日 下午2:27:46
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author L 
 * @date： 2017年12月18日 下午2:27:46
 */
public class WorkJoutanlVo implements Serializable {

	private static final long serialVersionUID = -7869041252176904153L;

	private String id;
	private String titile;
	private String content;
	private Date joutanlDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitile() {
		return titile;
	}

	public void setTitile(String titile) {
		this.titile = titile;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getJoutanlDate() {
		return joutanlDate;
	}

	public void setJoutanlDate(Date joutanlDate) {
		this.joutanlDate = joutanlDate;
	}

}
