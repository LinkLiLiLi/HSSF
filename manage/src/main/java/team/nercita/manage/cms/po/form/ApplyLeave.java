package team.nercita.manage.cms.po.form;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import team.nercita.manage.cms.po.deptmanage.User;

@Entity
@Table(name = "apply_leave_t")
public class ApplyLeave implements java.io.Serializable {

	private static final long serialVersionUID = 3551648853441122458L;

	private String id;
	private User user;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date applyTime;
	private String userGroupId;
	private Integer leaveType;
	private String reason;
	private String phoneNumber;
	private String contactUser;
	private String contactMobile;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") 
	private Date beginTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") 
	private Date endTime;
	private Integer applyType;
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

	@Temporal(TemporalType.DATE)
	@Column(name = "apply_time", length = 10)
	public Date getApplyTime() {
		return this.applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	@Column(name = "user_group_id", length = 32)
	public String getUserGroupId() {
		return this.userGroupId;
	}

	public void setUserGroupId(String userGroupId) {
		this.userGroupId = userGroupId;
	}

	@Column(name = "leave_type")
	public Integer getLeaveType() {
		return this.leaveType;
	}

	public void setLeaveType(Integer leaveType) {
		this.leaveType = leaveType;
	}

	@Column(name = "reason", length = 200)
	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Column(name = "phone_number", length = 20)
	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Column(name = "contact_user", length = 20)
	public String getContactUser() {
		return this.contactUser;
	}

	public void setContactUser(String contactUser) {
		this.contactUser = contactUser;
	}

	@Column(name = "contact_mobile", length = 20)
	public String getContactMobile() {
		return this.contactMobile;
	}

	public void setContactMobile(String contactMobile) {
		this.contactMobile = contactMobile;
	}

	@Column(name = "beginTime", length = 19)
	public Date getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	@Column(name = "endTime", length = 19)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "apply_type")
	public Integer getApplyType() {
		return this.applyType;
	}

	public void setApplyType(Integer applyType) {
		this.applyType = applyType;
	}

	@Column(name = "creator", length = 32)
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

	@Column(name = "modifier", length = 32)
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