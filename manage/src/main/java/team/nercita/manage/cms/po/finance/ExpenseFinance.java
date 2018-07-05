package team.nercita.manage.cms.po.finance;

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
@Table(name = "expense_finance_t")
public class ExpenseFinance implements java.io.Serializable {

	private static final long serialVersionUID = 1383294813525603541L;
	private String id;
	private Project project;
	private User user;
	private Integer subjectType;
	private Long budgetAmount;
	private Long cost;
	private String invoiceDetail;
	private Long amount;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "handl_user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "subject_type")
	public Integer getSubjectType() {
		return this.subjectType;
	}

	public void setSubjectType(Integer subjectType) {
		this.subjectType = subjectType;
	}

	@Column(name = "budget_amount")
	public Long getBudgetAmount() {
		return this.budgetAmount;
	}

	public void setBudgetAmount(Long budgetAmount) {
		this.budgetAmount = budgetAmount;
	}

	@Column(name = "cost")
	public Long getCost() {
		return this.cost;
	}

	public void setCost(Long cost) {
		this.cost = cost;
	}

	@Column(name = "invoice_detail", length = 100)
	public String getInvoiceDetail() {
		return this.invoiceDetail;
	}

	public void setInvoiceDetail(String invoiceDetail) {
		this.invoiceDetail = invoiceDetail;
	}

	@Column(name = "amount")
	public Long getAmount() {
		return this.amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
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