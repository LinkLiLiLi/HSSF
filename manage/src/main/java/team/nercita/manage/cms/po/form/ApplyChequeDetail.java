package team.nercita.manage.cms.po.form;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.projectmanage.Project;

@Entity
@Table(name = "apply_cheque_detail_t")
public class ApplyChequeDetail implements java.io.Serializable {
	private static final long serialVersionUID = -2462099126475651795L;

	private String id;
	private User user;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private String payUnit;
	private Project project;
	private String payProject;
	private String number;
	private String detail;
	private Integer amount;
	private String useInfo;
	private String remark;
	
	private ApplyCheque applyCheque;

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "creator", nullable = false, length = 32)
	public String getCreator() {
		return this.creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	@Column(name = "create_time", nullable = false, length = 19)
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
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "project_id")
	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}
	@Column(name = "pay_unit", length = 50)
	public String getPayUnit() {
		return this.payUnit;
	}

	public void setPayUnit(String payUnit) {
		this.payUnit = payUnit;
	}

	@Column(name = "pay_project", length = 200)
	public String getPayProject() {
		return this.payProject;
	}

	public void setPayProject(String payProject) {
		this.payProject = payProject;
	}

	@Column(name = "number", length = 20)
	public String getNumber() {
		return this.number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	@Column(name = "detail", length = 100)
	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Column(name = "amount")
	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Column(name = "use_info", length = 50)
	public String getUseInfo() {
		return this.useInfo;
	}

	public void setUseInfo(String useInfo) {
		this.useInfo = useInfo;
	}

	@Column(name = "remark", length = 200)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cheque_id")
	public ApplyCheque getApplyCheque() {
		return applyCheque;
	}

	public void setApplyCheque(ApplyCheque applyCheque) {
		this.applyCheque = applyCheque;
	}
	
}