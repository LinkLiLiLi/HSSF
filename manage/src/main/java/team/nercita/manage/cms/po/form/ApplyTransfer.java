package team.nercita.manage.cms.po.form;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.projectmanage.Project;

@Entity
@Table(name = "apply_transfer_t")
public class ApplyTransfer implements java.io.Serializable {

	private static final long serialVersionUID = 6576070594047512576L;
	private String id;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date transDate;
	private String receiveUnit;
	private String accountId;
	private String bank;
	private Integer amount;
	private String useInfo;
	private String payUnit;
	private String number;
	private String detail;
	private Integer pact;
	private Integer status;
	private String workDay;
	private String remark;
	private User user;
	private Project project;
	private Integer auditStatus;

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Column(name = "trans_date", length = 19)
	public Date getTransDate() {
		return this.transDate;
	}

	public void setTransDate(Date transDate) {
		this.transDate = transDate;
	}

	@Column(name = "receive_unit", length = 50)
	public String getReceiveUnit() {
		return this.receiveUnit;
	}

	public void setReceiveUnit(String receiveUnit) {
		this.receiveUnit = receiveUnit;
	}

	@Column(name = "account_id")
	public String getAccountId() {
		return this.accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	@Column(name = "bank", length = 100)
	public String getBank() {
		return this.bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
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

	@Column(name = "pay_unit", length = 50)
	public String getPayUnit() {
		return this.payUnit;
	}

	public void setPayUnit(String payUnit) {
		this.payUnit = payUnit;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "project_id")
	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
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

	@Column(name = "pact")
	public Integer getPact() {
		return this.pact;
	}

	public void setPact(Integer pact) {
		this.pact = pact;
	}

	@Column(name = "status")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	@Column(name = "work_day", length = 5)
	public String getWorkDay() {
		return this.workDay;
	}

	@Column(name = "audit_status")
	public Integer getAuditStatus() {
		return auditStatus;
	}

	public void setAuditStatus(Integer auditStatus) {
		this.auditStatus = auditStatus;
	}

	public void setWorkDay(String workDay) {
		this.workDay = workDay;
	}

	@Column(name = "remark", length = 200)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}