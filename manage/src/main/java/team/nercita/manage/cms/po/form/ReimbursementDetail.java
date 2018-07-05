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

@Entity
@Table(name = "reimbursement_detail_t")
public class ReimbursementDetail implements java.io.Serializable {

	private static final long serialVersionUID = 2082107544494671001L;
	private String id;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private User addUser;
	private ApplyReimbursement applyReimbursement;
	private String detail;
	private Integer amount;
	
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


	@Column(name = "detail", length = 50)
	public String getDetail() {
		return this.detail;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "apply_id")
	public ApplyReimbursement getApplyReimbursement() {
		return applyReimbursement;
	}

	public void setApplyReimbursement(ApplyReimbursement applyReimbursement) {
		this.applyReimbursement = applyReimbursement;
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
	
	
}