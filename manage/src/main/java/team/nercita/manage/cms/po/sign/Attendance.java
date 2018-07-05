/*
 * Attendance.java
 * 创建者：L
 * 创建日期：2017年12月18日 下午3:47:18
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.po.sign;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import team.nercita.manage.cms.po.deptmanage.User;

/**
 * 
 * @author L
 * @date： 2017年12月18日 下午3:47:18
 */
@Entity
@Table(name = "attendance_t")
public class Attendance implements java.io.Serializable {

	private static final long serialVersionUID = -5650934545828885680L;
	
	private String id;
	private Date attendanceTime;
	private int times;
	private String addr;
	private User user;
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
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Column(name = "times")
	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}
	
	@Column(name = "attendance_time", length = 19)
	public Date getAttendanceTime() {
		return attendanceTime;
	}

	public void setAttendanceTime(Date attendanceTime) {
		this.attendanceTime = attendanceTime;
	}

	@Column(name = "addr", length = 200)
	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
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
