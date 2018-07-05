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
@Table(name = "apply_register_t")
public class ApplyRegister implements java.io.Serializable {

	private static final long serialVersionUID = -1380953397925822820L;
	private String id;
	private User user;
	private String userName;
	private Integer gender;
	private String nation;
	private String place;
	private String education;
	private Integer readingStudent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String email;
	private String phone;
	private String major;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date entranceTime;
	private String school;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date graduationTime;
	private String firstMentor;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date centerTime;
	private String secondMentor;
	private String centerMentor;
	private String projectGroup;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date departureTime;
	private String projectGroupPerson;
	private String hobby;
	private String idCard;
	private String mobile;
	private String contacts;
	private String contactsPhone;
	private String relationship;
	private Integer cadres;
	private String post;
	private Integer mode;
	private String selfInfo;
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

	@Column(name = "nation", length = 20)
	public String getNation() {
		return this.nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	@Column(name = "place", length = 100)
	public String getPlace() {
		return this.place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	@Column(name = "education", length = 10)
	public String getEducation() {
		return this.education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	@Column(name = "reading_student")
	public Integer getReadingStudent() {
		return this.readingStudent;
	}

	public void setReadingStudent(Integer readingStudent) {
		this.readingStudent = readingStudent;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "birth", length = 10)
	public Date getBirth() {
		return this.birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	@Column(name = "email", length = 100)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "phone", length = 20)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "major", length = 100)
	public String getMajor() {
		return this.major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "entrance_time", length = 10)
	public Date getEntranceTime() {
		return this.entranceTime;
	}

	public void setEntranceTime(Date entranceTime) {
		this.entranceTime = entranceTime;
	}

	@Column(name = "school", length = 100)
	public String getSchool() {
		return this.school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "graduation_time", length = 10)
	public Date getGraduationTime() {
		return this.graduationTime;
	}

	public void setGraduationTime(Date graduationTime) {
		this.graduationTime = graduationTime;
	}

	@Column(name = "first_mentor", length = 20)
	public String getFirstMentor() {
		return this.firstMentor;
	}

	public void setFirstMentor(String firstMentor) {
		this.firstMentor = firstMentor;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "center_time", length = 10)
	public Date getCenterTime() {
		return this.centerTime;
	}

	public void setCenterTime(Date centerTime) {
		this.centerTime = centerTime;
	}

	@Column(name = "second_mentor", length = 20)
	public String getSecondMentor() {
		return this.secondMentor;
	}

	public void setSecondMentor(String secondMentor) {
		this.secondMentor = secondMentor;
	}

	@Column(name = "center_mentor", length = 20)
	public String getCenterMentor() {
		return this.centerMentor;
	}

	public void setCenterMentor(String centerMentor) {
		this.centerMentor = centerMentor;
	}

	@Column(name = "project_group", length = 100)
	public String getProjectGroup() {
		return this.projectGroup;
	}

	public void setProjectGroup(String projectGroup) {
		this.projectGroup = projectGroup;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "departure_time", length = 10)
	public Date getDepartureTime() {
		return this.departureTime;
	}

	public void setDepartureTime(Date departureTime) {
		this.departureTime = departureTime;
	}

	@Column(name = "project_group_person", length = 20)
	public String getProjectGroupPerson() {
		return this.projectGroupPerson;
	}

	public void setProjectGroupPerson(String projectGroupPerson) {
		this.projectGroupPerson = projectGroupPerson;
	}

	@Column(name = "hobby", length = 50)
	public String getHobby() {
		return this.hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	@Column(name = "id_card", length = 30)
	public String getIdCard() {
		return this.idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	@Column(name = "mobile", length = 20)
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "contacts", length = 20)
	public String getContacts() {
		return this.contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	@Column(name = "contacts_phone", length = 20)
	public String getContactsPhone() {
		return this.contactsPhone;
	}

	public void setContactsPhone(String contactsPhone) {
		this.contactsPhone = contactsPhone;
	}

	@Column(name = "relationship", length = 50)
	public String getRelationship() {
		return this.relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	@Column(name = "cadres")
	public Integer getCadres() {
		return this.cadres;
	}

	public void setCadres(Integer cadres) {
		this.cadres = cadres;
	}

	@Column(name = "post", length = 50)
	public String getPost() {
		return this.post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	@Column(name = "mode")
	public Integer getMode() {
		return this.mode;
	}

	public void setMode(Integer mode) {
		this.mode = mode;
	}

	@Column(name = "self_info", length = 500)
	public String getSelfInfo() {
		return this.selfInfo;
	}

	public void setSelfInfo(String selfInfo) {
		this.selfInfo = selfInfo;
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