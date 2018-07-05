package team.nercita.manage.cms.po.deptmanage;

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

@Entity
@Table(name = "user_t")
public class User implements java.io.Serializable {

	private static final long serialVersionUID = 5684512842377904014L;
	private String id;
	private Role role;
	private UserGroup userGroup;
	private String name;
	private Integer sex;
	private String userName;
	private String password;
	private String userGroupName;
	private Integer buildType;
	private Integer useStatus;
	private Integer post;
	private String idCard;
	private String titles;
	private String phoneNumber;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date inductionTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date departureTime;
	private String imageUrl;
	private Integer status;
	private String school;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date entranceTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date graduationTime;
	private Integer education;
	private String tutor;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private String openId;
	
	public User() {
	}
	
	public User(String id) {
		this.id = id;
	}
	
	public static enum Sex {
        /** 性别:男 */        man(0),
        /** 性别:女*/        woman(1);

        private int value;

        public int getValue() {
            return value;
        }

        private Sex(int value) {
            this.value = value;
        }
    }
	
	public static enum UserType {
        /** 用户类型:学生*/        student(0),
        /** 用户类型:员工*/        staff(1);

        private int value;

        public int getValue() {
            return value;
        }

        private UserType(int value) {
            this.value = value;
        }
    }
	
	public static enum BuildType {
        /** 创建类型:内置 */        internal(0),
        /** 创建类型:新建*/        create(1);

        private int value;

        public int getValue() {
            return value;
        }

        private BuildType(int value) {
            this.value = value;
        }
    }
	
	public static enum UseStatus {
        /** 使用状态:正常 */        normal(0),
        /** 使用状态:禁用 */        disable(1);

        private int value;

        public int getValue() {
            return value;
        }

        private UseStatus(int value) {
            this.value = value;
        }
    }
	
	public static enum Status {
        /** 员工状态:在职 */        ongoing(1),
        /** 员工状态:离职 */        quit(2),
		/** 员工状态:辞退  */        dismiss(3),
		/** 员工状态:换岗 */        changing(4);

        private int value;

        public int getValue() {
            return value;
        }

        private Status(int value) {
            this.value = value;
        }
    }
	
	public static enum Education {
		/** 学历:硕士  */        master(1),
		/** 学历:博士 */        doctor(2),
		/** 学历:学士 */        bachelor(3);
		
        private int value;

        public int getValue() {
            return value;
        }

        private Education(int value) {
            this.value = value;
        }
    }
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id")
	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_group_id")
	public UserGroup getUserGroup() {
		return this.userGroup;
	}

	public void setUserGroup(UserGroup userGroup) {
		this.userGroup = userGroup;
	}

	@Column(name = "name", length = 10)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "sex")
	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	@Column(name = "user_name", length = 20)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "password", length = 32)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "user_group_name", length = 30)
	public String getUserGroupName() {
		return this.userGroupName;
	}

	public void setUserGroupName(String userGroupName) {
		this.userGroupName = userGroupName;
	}

	@Column(name = "build_type")
	public Integer getBuildType() {
		return this.buildType;
	}

	public void setBuildType(Integer buildType) {
		this.buildType = buildType;
	}

	@Column(name = "use_status")
	public Integer getUseStatus() {
		return this.useStatus;
	}

	public void setUseStatus(Integer useStatus) {
		this.useStatus = useStatus;
	}

	@Column(name = "post")
	public Integer getPost() {
		return this.post;
	}

	public void setPost(Integer post) {
		this.post = post;
	}

	@Column(name = "id_card", length = 30)
	public String getIdCard() {
		return this.idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	@Column(name = "titles", length = 50)
	public String getTitles() {
		return this.titles;
	}

	public void setTitles(String titles) {
		this.titles = titles;
	}

	@Column(name = "phone_number", length = 20)
	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "induction_time", length = 10)
	public Date getInductionTime() {
		return this.inductionTime;
	}

	public void setInductionTime(Date inductionTime) {
		this.inductionTime = inductionTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "departure_time", length = 10)
	public Date getDepartureTime() {
		return this.departureTime;
	}

	public void setDepartureTime(Date departureTime) {
		this.departureTime = departureTime;
	}

	@Column(name = "image_url", length = 100)
	public String getImageUrl() {
		return this.imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Column(name = "status")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "school", length = 30)
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
	@Column(name = "graduation_time", length = 10)
	public Date getGraduationTime() {
		return this.graduationTime;
	}

	public void setGraduationTime(Date graduationTime) {
		this.graduationTime = graduationTime;
	}

	@Column(name = "education")
	public Integer getEducation() {
		return this.education;
	}

	public void setEducation(Integer education) {
		this.education = education;
	}

	@Column(name = "tutor", length = 10)
	public String getTutor() {
		return this.tutor;
	}

	public void setTutor(String tutor) {
		this.tutor = tutor;
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

	@Column(name = "open_id", length = 50)
	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}
	
}