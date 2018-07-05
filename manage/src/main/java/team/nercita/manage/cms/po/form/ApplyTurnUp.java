package team.nercita.manage.cms.po.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import team.nercita.manage.cms.po.deptmanage.User;

@Entity
@Table(name = "apply_turn_up_t")
public class ApplyTurnUp implements java.io.Serializable {

	private static final long serialVersionUID = 5988121500282507385L;
	private String id;
	private User user;
	private String userName;
	private Integer gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date birth;
	private String nation;
	private Integer marriage;
	private String outlook;
	private String place;
	private String homeAddress;
	private String dept;
	private String phoneNumber;
	private String idCard;
	private String school;
	private String major;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date graduationTime;
	private String education;
	private String degree;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date joinWorkTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date centerTime;
	private Integer workingYears;
	private String post;
	private String mobile;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private String headPath;
	private List<WorkExperience> workExperienceList = new ArrayList<WorkExperience>(0);


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

	@Temporal(TemporalType.DATE)
	@Column(name = "birth", length = 10)
	public Date getBirth() {
		return this.birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	@Column(name = "nation", length = 20)
	public String getNation() {
		return this.nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	@Column(name = "marriage")
	public Integer getMarriage() {
		return this.marriage;
	}

	public void setMarriage(Integer marriage) {
		this.marriage = marriage;
	}

	@Column(name = "outlook", length = 20)
	public String getOutlook() {
		return this.outlook;
	}

	public void setOutlook(String outlook) {
		this.outlook = outlook;
	}

	@Column(name = "place", length = 100)
	public String getPlace() {
		return this.place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	@Column(name = "home_address", length = 200)
	public String getHomeAddress() {
		return this.homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	@Column(name = "dept", length = 50)
	public String getDept() {
		return this.dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	@Column(name = "phone_number", length = 20)
	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Column(name = "id_card", length = 30)
	public String getIdCard() {
		return this.idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	@Column(name = "school", length = 200)
	public String getSchool() {
		return this.school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	@Column(name = "major", length = 200)
	public String getMajor() {
		return this.major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "graduation_time", length = 10)
	public Date getGraduationTime() {
		return this.graduationTime;
	}

	public void setGraduationTime(Date graduationTime) {
		this.graduationTime = graduationTime;
	}

	@Column(name = "education", length = 20)
	public String getEducation() {
		return this.education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	@Column(name = "degree", length = 50)
	public String getDegree() {
		return this.degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "join_work_time", length = 10)
	public Date getJoinWorkTime() {
		return this.joinWorkTime;
	}

	public void setJoinWorkTime(Date joinWorkTime) {
		this.joinWorkTime = joinWorkTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "center_time", length = 10)
	public Date getCenterTime() {
		return this.centerTime;
	}

	public void setCenterTime(Date centerTime) {
		this.centerTime = centerTime;
	}

	@Column(name = "working_years")
	public Integer getWorkingYears() {
		return this.workingYears;
	}

	public void setWorkingYears(Integer workingYears) {
		this.workingYears = workingYears;
	}

	@Column(name = "post", length = 50)
	public String getPost() {
		return this.post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	@Column(name = "mobile", length = 20)
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
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
	
	@Column(name = "head_path", length = 20)
	public String getHeadPath() {
		return headPath;
	}
	
	public void setHeadPath(String headPath) {
		this.headPath = headPath;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "applyTurnUp")
	public List<WorkExperience> getWorkExperienceList() {
		return workExperienceList;
	}

	public void setWorkExperienceList(List<WorkExperience> workExperienceList) {
		this.workExperienceList = workExperienceList;
	}

}