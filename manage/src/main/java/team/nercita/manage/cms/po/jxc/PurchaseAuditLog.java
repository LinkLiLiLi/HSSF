package team.nercita.manage.cms.po.jxc;

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
@Table(name = "purchase_audit_log_t")
public class PurchaseAuditLog implements java.io.Serializable {

	private static final long serialVersionUID = -5541948413174408017L;
	private String id;
	private PurchaseApply purchaseApply;
	private User user;
	private Integer status;
	private String auditMsg;
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
	@JoinColumn(name = "purchase_apply_id", nullable = false)
	public PurchaseApply getPurchaseApply() {
		return this.purchaseApply;
	}

	public void setPurchaseApply(PurchaseApply purchaseApply) {
		this.purchaseApply = purchaseApply;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "audit_user_id", nullable = false)
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "status", nullable = false)
	public Integer getStatus() {
		return this.status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "audit_msg", nullable = false, length = 100)
	public String getAuditMsg() {
		return this.auditMsg;
	}

	public void setAuditMsg(String auditMsg) {
		this.auditMsg = auditMsg;
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

}