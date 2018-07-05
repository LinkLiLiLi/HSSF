/*
 * AttendanceStat.java
 * 创建者：L
 * 创建日期：2018年1月4日 上午11:02:50
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.po.deptmanage;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 
 * @author L
 * @date： 2018年1月4日 上午11:02:50
 */
@Entity
@Table(name = "attendance_stat_t")
public class AttendanceStat implements java.io.Serializable{

	private static final long serialVersionUID = 3410941855774175436L;
	private String id;
	private User user;
	private Integer zaodaka;
	private Integer wandaka;
	private Integer qingjia;
	private Integer waichu;
	private Integer chuchai;
	private Integer jiaban;
	private Integer kuanggong;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private Date statTime;
	
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

	@Column(name = "zaodaka")
	public Integer getZaodaka() {
		return zaodaka;
	}

	public void setZaodaka(Integer zaodaka) {
		this.zaodaka = zaodaka;
	}

	@Column(name = "wandaka")
	public Integer getWandaka() {
		return wandaka;
	}

	public void setWandaka(Integer wandaka) {
		this.wandaka = wandaka;
	}

	@Column(name = "qingjia")
	public Integer getQingjia() {
		return qingjia;
	}

	public void setQingjia(Integer qingjia) {
		this.qingjia = qingjia;
	}
	
	@Column(name = "waichu")
	public Integer getWaichu() {
		return waichu;
	}

	public void setWaichu(Integer waichu) {
		this.waichu = waichu;
	}
	
	@Column(name = "chuchai")
	public Integer getChuchai() {
		return chuchai;
	}

	public void setChuchai(Integer chuchai) {
		this.chuchai = chuchai;
	}

	@Column(name = "jiaban")
	public Integer getJiaban() {
		return jiaban;
	}

	public void setJiaban(Integer jiaban) {
		this.jiaban = jiaban;
	}

	@Column(name = "kuanggong")
	public Integer getKuanggong() {
		return kuanggong;
	}

	public void setKuanggong(Integer kuanggong) {
		this.kuanggong = kuanggong;
	}
	
	@Column(name = "stat_time")
	public Date getStatTime() {
		return statTime;
	}

	public void setStatTime(Date statTime) {
		this.statTime = statTime;
	}
	
	
}
