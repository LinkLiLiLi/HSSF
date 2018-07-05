package team.nercita.manage.cms.po.knowlage;

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

import team.nercita.manage.cms.po.deptmanage.User;

@Entity
@Table(name = "award_t")
public class Award implements java.io.Serializable {

	private static final long serialVersionUID = 3696973345458133796L;
	private String id;
	private User user;
	private String awardName;
	private Integer unit;
	private String number;
	private String gaveUnit;
	private String grade;
	private Date awardDate;
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
	@JoinColumn(name = "awardee")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "award_name", length = 50)
	public String getAwardName() {
		return this.awardName;
	}

	public void setAwardName(String awardName) {
		this.awardName = awardName;
	}

	@Column(name = "unit")
	public Integer getUnit() {
		return this.unit;
	}

	public void setUnit(Integer unit) {
		this.unit = unit;
	}

	@Column(name = "number", length = 20)
	public String getNumber() {
		return this.number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	@Column(name = "gave_unit", length = 50)
	public String getGaveUnit() {
		return this.gaveUnit;
	}

	public void setGaveUnit(String gaveUnit) {
		this.gaveUnit = gaveUnit;
	}

	@Column(name = "grade", length = 20)
	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "award_date", length = 10)
	public Date getAwardDate() {
		return this.awardDate;
	}

	public void setAwardDate(Date awardDate) {
		this.awardDate = awardDate;
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