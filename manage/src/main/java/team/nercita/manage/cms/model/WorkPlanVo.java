/*
 * WorkPaln.java
 * 创建者：L
 * 创建日期：2017年12月18日 上午11:45:57
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
 * @date： 2017年12月18日 上午11:45:57
 */
public class WorkPlanVo implements Serializable {

	private static final long serialVersionUID = 2573571143409629203L;

	private Date startDate;
	private Date endDate;
	private String content;
	private int status;

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
