package team.nercita.manage.cms.po.form;

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

import org.springframework.format.annotation.DateTimeFormat;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.projectmanage.Project;

@Entity
@Table(name = "apply_reimbursement_t")
public class ApplyReimbursement implements java.io.Serializable {

	private static final long serialVersionUID = 7588210255920500529L;
	private String id;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private User addUser;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reDate;
	private String payUnit;
	private Project project;
	private String number;
	private String detail;
	private Integer sum;
	private Integer status;
	private String reason;
	private String applyUser;
	
	private List<ReimbursementDetail> detailList;
	
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
	@JoinColumn(name = "add_user")
	public User getAddUser() {
		return this.addUser;
	}

	public void setAddUser(User addUser) {
		this.addUser = addUser;
	}

	@Column(name = "re_date", length = 19)
	public Date getReDate() {
		return this.reDate;
	}

	public void setReDate(Date reDate) {
		this.reDate = reDate;
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
		return project;
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

	@Column(name = "detail", length = 50)
	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Column(name = "sum")
	public Integer getSum() {
		return this.sum;
	}

	public void setSum(Integer sum) {
		this.sum = sum;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "applyReimbursement")
	public List<ReimbursementDetail> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<ReimbursementDetail> detailList) {
		this.detailList = detailList;
	}
	
	@Column(name = "status")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "reason")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Column(name = "apply_user")
	public String getApplyUser() {
		return applyUser;
	}

	public void setApplyUser(String applyUser) {
		this.applyUser = applyUser;
	}
	
}