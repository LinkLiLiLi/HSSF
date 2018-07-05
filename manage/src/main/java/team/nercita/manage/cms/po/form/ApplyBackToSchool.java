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
@Table(name = "apply_back_to_school_t")
public class ApplyBackToSchool implements java.io.Serializable {

	private static final long serialVersionUID = 5699175886064875858L;

	private String id;
	private User user;
	private String deptName;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date applyTime;
	private String userName;
	private Integer gender;
	private String school;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date entranceTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date centerTime;
	private String cultivationMode;
	private String tutor;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date leaveTime;
	private String reason;
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
	@JoinColumn(name = "add_user")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "dept_name", length = 50)
	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "apply_time", length = 10)
	public Date getApplyTime() {
		return this.applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	@Column(name = "user_name", length = 20)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "gender")
	public Integer getGender() {
		return this.gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	@Column(name = "school", length = 100)
	public String getSchool() {
		return this.school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "entrance_time", length = 10)
	public Date getEntranceTime() {
		return this.entranceTime;
	}

	public void setEntranceTime(Date entranceTime) {
		this.entranceTime = entranceTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "center_time", length = 10)
	public Date getCenterTime() {
		return this.centerTime;
	}

	public void setCenterTime(Date centerTime) {
		this.centerTime = centerTime;
	}

	@Column(name = "cultivation_mode", length = 20)
	public String getCultivationMode() {
		return this.cultivationMode;
	}

	public void setCultivationMode(String cultivationMode) {
		this.cultivationMode = cultivationMode;
	}

	@Column(name = "tutor", length = 20)
	public String getTutor() {
		return this.tutor;
	}

	public void setTutor(String tutor) {
		this.tutor = tutor;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "leave_time", length = 10)
	public Date getLeaveTime() {
		return this.leaveTime;
	}

	public void setLeaveTime(Date leaveTime) {
		this.leaveTime = leaveTime;
	}

	@Column(name = "reason", length = 100)
	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
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