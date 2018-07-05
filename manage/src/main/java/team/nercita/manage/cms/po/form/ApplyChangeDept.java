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
@Table(name = "apply_change_dept_t")
public class ApplyChangeDept implements java.io.Serializable {

	private static final long serialVersionUID = -372826568471315830L;
	private String id;
	private User user;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date applyTime;
	private String userName;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date centerTime;
	private String beforeDept;
	private String afterDept;
	private Integer changeType;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date changeEndTime;
	private String otherInfo;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private Integer beforeAmount;
	private Integer afterAmount;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date changeTime;
	

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

	@Temporal(TemporalType.DATE)
	@Column(name = "center_time", length = 10)
	public Date getCenterTime() {
		return this.centerTime;
	}

	public void setCenterTime(Date centerTime) {
		this.centerTime = centerTime;
	}

	@Column(name = "before_dept", length = 50)
	public String getBeforeDept() {
		return this.beforeDept;
	}

	public void setBeforeDept(String beforeDept) {
		this.beforeDept = beforeDept;
	}

	@Column(name = "after_dept", length = 50)
	public String getAfterDept() {
		return this.afterDept;
	}

	public void setAfterDept(String afterDept) {
		this.afterDept = afterDept;
	}

	@Column(name = "change_type")
	public Integer getChangeType() {
		return this.changeType;
	}

	public void setChangeType(Integer changeType) {
		this.changeType = changeType;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "change_end_time", length = 10)
	public Date getChangeEndTime() {
		return this.changeEndTime;
	}

	public void setChangeEndTime(Date changeEndTime) {
		this.changeEndTime = changeEndTime;
	}

	@Column(name = "other_info", length = 50)
	public String getOtherInfo() {
		return this.otherInfo;
	}

	public void setOtherInfo(String otherInfo) {
		this.otherInfo = otherInfo;
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

	@Column(name = "modify_time",  length = 19)
	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	@Column(name = "before_amount")
	public Integer getBeforeAmount() {
		return beforeAmount;
	}

	public void setBeforeAmount(Integer beforeAmount) {
		this.beforeAmount = beforeAmount;
	}
	
	@Column(name = "after_amount")
	public Integer getAfterAmount() {
		return afterAmount;
	}

	public void setAfterAmount(Integer afterAmount) {
		this.afterAmount = afterAmount;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "change_time", length = 10)
	public Date getChangeTime() {
		return changeTime;
	}

	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}
	
	
}