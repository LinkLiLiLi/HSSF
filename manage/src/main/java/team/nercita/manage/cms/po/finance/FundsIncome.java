package team.nercita.manage.cms.po.finance;

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

import team.nercita.manage.cms.po.projectmanage.Project;

@Entity
@Table(name = "funds_income_t")
public class FundsIncome implements java.io.Serializable {

	private static final long serialVersionUID = -5653874343877757825L;
	private String id;
	private Project project;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private String addUser;
	private Integer incomeAmount;
	private Integer amount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date changeTime;
	private Integer billInfo;
	private String remark;
	private String financialNumber;

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

	@Column(name = "add_user", length = 32)
	public String getAddUser() {
		return this.addUser;
	}

	public void setAddUser(String addUser) {
		this.addUser = addUser;
	}

	@Column(name = "income_amount")
	public Integer getIncomeAmount() {
		return this.incomeAmount;
	}

	public void setIncomeAmount(Integer incomeAmount) {
		this.incomeAmount = incomeAmount;
	}

	@Column(name = "amount")
	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "change_time", length = 10)
	public Date getChangeTime() {
		return this.changeTime;
	}

	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}

	@Column(name = "bill_info")
	public Integer getBillInfo() {
		return this.billInfo;
	}

	public void setBillInfo(Integer billInfo) {
		this.billInfo = billInfo;
	}

	@Column(name = "remark", length = 200)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "financial_number", length = 200)
	public String getFinancialNumber() {
		return financialNumber;
	}

	public void setFinancialNumber(String financialNumber) {
		this.financialNumber = financialNumber;
	}
	
}