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
@Table(name = "apply_salary_t")
public class ApplySalary implements java.io.Serializable {

	private static final long serialVersionUID = 481420579995876235L;

	private String id;
	private User user;
	private String dept;
	private String userName;
	private String education;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date centerTime;
	private String organization;
	private String titleName;
	private Integer beforeAmount;
	private Integer beforeWages;
	private Integer afterAmount;
	private Integer afterWages;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date changeTime;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date applyTime;

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

	@Column(name = "dept", length = 50)
	public String getDept() {
		return this.dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	@Column(name = "user_name", length = 20)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "education", length = 100)
	public String getEducation() {
		return this.education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "center_time", length = 10)
	public Date getCenterTime() {
		return this.centerTime;
	}

	public void setCenterTime(Date centerTime) {
		this.centerTime = centerTime;
	}

	@Column(name = "organization", length = 50)
	public String getOrganization() {
		return this.organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

	@Column(name = "title_name", length = 50)
	public String getTitleName() {
		return this.titleName;
	}

	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}

	@Column(name = "before_amount")
	public Integer getBeforeAmount() {
		return this.beforeAmount;
	}

	public void setBeforeAmount(Integer beforeAmount) {
		this.beforeAmount = beforeAmount;
	}

	@Column(name = "before_wages")
	public Integer getBeforeWages() {
		return this.beforeWages;
	}

	public void setBeforeWages(Integer beforeWages) {
		this.beforeWages = beforeWages;
	}

	@Column(name = "after_amount")
	public Integer getAfterAmount() {
		return this.afterAmount;
	}

	public void setAfterAmount(Integer afterAmount) {
		this.afterAmount = afterAmount;
	}

	@Column(name = "after_wages")
	public Integer getAfterWages() {
		return this.afterWages;
	}

	public void setAfterWages(Integer afterWages) {
		this.afterWages = afterWages;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "change_time", length = 10)
	public Date getChangeTime() {
		return this.changeTime;
	}

	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
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
	
	@Temporal(TemporalType.DATE)
	@Column(name = "apply_time", length = 10)
	public Date getApplyTime() {
		return this.applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
}