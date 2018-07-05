package team.nercita.manage.cms.po.jxc;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "purchase_apply_t")
public class PurchaseApply implements java.io.Serializable {

	private static final long serialVersionUID = -9103167882820666025L;
	private String id;
	private String productName;
	private String purpose;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date applyTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endTime;
	private Integer purchaseStatus;
	private Integer status;
	private String auditMsg;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private List<PurchaseDetail> detailList;
	private List<PurchaseAuditLog> logList;

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "product_name", nullable = false, length = 100)
	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Column(name = "purpose", nullable = false, length = 100)
	public String getPurpose() {
		return this.purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	@Column(name = "apply_time", nullable = false, length = 19)
	public Date getApplyTime() {
		return this.applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	@Column(name = "end_time", length = 19)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "purchase_status")
	public Integer getPurchaseStatus() {
		return this.purchaseStatus;
	}

	public void setPurchaseStatus(Integer purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
	}

	@Column(name = "status", nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "audit_msg", length = 100)
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

	@OneToMany(mappedBy = "purchaseApply")
	public List<PurchaseDetail> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<PurchaseDetail> detailList) {
		this.detailList = detailList;
	}

	@OneToMany(mappedBy = "purchaseApply")
	public List<PurchaseAuditLog> getLogList() {
		return logList;
	}

	public void setLogList(List<PurchaseAuditLog> logList) {
		this.logList = logList;
	}
	
	
}