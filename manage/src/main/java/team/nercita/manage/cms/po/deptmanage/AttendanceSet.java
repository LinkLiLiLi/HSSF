/*
 * AttendanceSet.java
 * 创建者：L
 * 创建日期：2018年1月3日 上午9:18:52
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.po.deptmanage;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * @author L
 * @date： 2018年1月3日 上午9:18:52
 */
@Entity
@Table(name = "attendance_set_t")
public class AttendanceSet implements java.io.Serializable {

	private static final long serialVersionUID = 2057547644631900291L;
	
	private String id;
	@DateTimeFormat(pattern = "HH:mm:ss")
	private Date startTime;
	@DateTimeFormat(pattern = "HH:mm:ss")
	private Date endTime;
	@DateTimeFormat(pattern = "HH:mm:ss")
	private Date lunchStartTime;
	@DateTimeFormat(pattern = "HH:mm:ss")
	private Date lunchEndTime;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "start_time")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@Column(name = "end_time")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	@Column(name = "lunch_start_time")
	public Date getLunchStartTime() {
		return lunchStartTime;
	}

	public void setLunchStartTime(Date lunchStartTime) {
		this.lunchStartTime = lunchStartTime;
	}

	@Column(name = "lunch_end_time")
	public Date getLunchEndTime() {
		return lunchEndTime;
	}

	public void setLunchEndTime(Date lunchEndTime) {
		this.lunchEndTime = lunchEndTime;
	}

	@Column(name = "creator", length = 20)
	public String getCreator() {
		return this.creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	@Column(name = "create_time", length = 19)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "modifier", length = 20)
	public String getModifier() {
		return this.modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	@Column(name = "modify_time", length = 19)
	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
}

