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


@Entity
@Table(name = "work_experience_t")
public class WorkExperience implements java.io.Serializable {

	private static final long serialVersionUID = 7623692611584857018L;

	private String id;
	private ApplyTurnUp applyTurnUp;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date beginTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date endTime;
	private String unit;
	private Integer insurance;
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
	@JoinColumn(name = "turn_up_id")
	public ApplyTurnUp getApplyTurnUp() {
		return this.applyTurnUp;
	}

	public void setApplyTurnUp(ApplyTurnUp applyTurnUp) {
		this.applyTurnUp = applyTurnUp;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "begin_time", length = 10)
	public Date getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "end_time", length = 10)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "unit", length = 100)
	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "insurance")
	public Integer getInsurance() {
		return this.insurance;
	}

	public void setInsurance(Integer insurance) {
		this.insurance = insurance;
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