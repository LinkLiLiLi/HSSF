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
@Table(name = "apply_need_hands_t")
public class ApplyNeedHands implements java.io.Serializable {

	private static final long serialVersionUID = 2236951954909155343L;
	private String id;
	private User user;
	private String dept;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date applyDate;
	private Integer post;
	private Integer employType;
	private String userName;
	private Integer gender;
	private Integer age;
	private String education;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date joinDate;
	private Integer termAmount;
	private Integer amount;
	private Integer trialAmount;
	private Integer trialAmountSubsidy;
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

	@Column(name = "dept", length = 50)
	public String getDept() {
		return this.dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "apply_date", length = 10)
	public Date getApplyDate() {
		return this.applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	@Column(name = "post")
	public Integer getPost() {
		return this.post;
	}

	public void setPost(Integer post) {
		this.post = post;
	}

	@Column(name = "employ_type")
	public Integer getEmployType() {
		return this.employType;
	}

	public void setEmployType(Integer employType) {
		this.employType = employType;
	}

	@Column(name = "userName", length = 20)
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

	@Column(name = "age")
	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Column(name = "education", length = 20)
	public String getEducation() {
		return this.education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "join_date", length = 10)
	public Date getJoinDate() {
		return this.joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	@Column(name = "term_amount")
	public Integer getTermAmount() {
		return termAmount;
	}

	public void setTermAmount(Integer termAmount) {
		this.termAmount = termAmount;
	}

	@Column(name = "amount")
	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Column(name = "trial_amount")
	public Integer getTrialAmount() {
		return this.trialAmount;
	}

	public void setTrialAmount(Integer trialAmount) {
		this.trialAmount = trialAmount;
	}

	@Column(name = "trial_amount_subsidy")
	public Integer getTrialAmountSubsidy() {
		return this.trialAmountSubsidy;
	}

	public void setTrialAmountSubsidy(Integer trialAmountSubsidy) {
		this.trialAmountSubsidy = trialAmountSubsidy;
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