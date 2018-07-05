package team.nercita.manage.cms.po.projectmanage;

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
@Table(name = "project_enter_info_t")
public class ProjectEnterInfo implements java.io.Serializable {

	private static final long serialVersionUID = -478448601781386219L;
	private String id;
	private Project project;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date enterTime;
	private Integer amount;
	private Integer payInfo;
	private Integer billInfo;
	private Integer dfutyFree;
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
	@JoinColumn(name = "project_id")
	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "enter_time", length = 10)
	public Date getEnterTime() {
		return this.enterTime;
	}

	public void setEnterTime(Date enterTime) {
		this.enterTime = enterTime;
	}

	@Column(name = "amount")
	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Column(name = "pay_info")
	public Integer getPayInfo() {
		return this.payInfo;
	}

	public void setPayInfo(Integer payInfo) {
		this.payInfo = payInfo;
	}

	@Column(name = "bill_info")
	public Integer getBillInfo() {
		return this.billInfo;
	}

	public void setBillInfo(Integer billInfo) {
		this.billInfo = billInfo;
	}

	@Column(name = "dfuty_free")
	public Integer getDfutyFree() {
		return this.dfutyFree;
	}

	public void setDfutyFree(Integer dfutyFree) {
		this.dfutyFree = dfutyFree;
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