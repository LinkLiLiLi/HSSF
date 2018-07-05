package team.nercita.manage.cms.po.jxc;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import team.nercita.manage.cms.po.projectmanage.Project;

@Entity
@Table(name = "out_store_apply_t")
public class OutStoreApply implements java.io.Serializable {

	private static final long serialVersionUID = 4813539663804377741L;
	
	private String id;
	private ProductType productType;
	private String model;
	private Integer amount;
	private String outNo;
	private Date outTime;
	private String purpose;
	private Project project;
	private String useMan;
	private String outMan;
	private String remark;
	private Integer status;
	private Date createTime;
	private String creator;
	private Date modifyTime;
	private String modifier;
	private ProductStore productStore;
	private String auditMsg;

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_type_id", nullable = false)
	public ProductType getProductType() {
		return this.productType;
	}

	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

	@Column(name = "model", nullable = false, length = 200)
	public String getModel() {
		return this.model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Column(name = "amount")
	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Column(name = "out_no", length = 20)
	public String getOutNo() {
		return this.outNo;
	}

	public void setOutNo(String outNo) {
		this.outNo = outNo;
	}

	@Column(name = "out_time", length = 19)
	public Date getOutTime() {
		return this.outTime;
	}

	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}

	@Column(name = "purpose", length = 200)
	public String getPurpose() {
		return this.purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	@Column(name = "use_man", length = 20)
	public String getUseMan() {
		return this.useMan;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "project_id")
	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public void setUseMan(String useMan) {
		this.useMan = useMan;
	}

	@Column(name = "out_man", length = 20)
	public String getOutMan() {
		return this.outMan;
	}

	public void setOutMan(String outMan) {
		this.outMan = outMan;
	}

	@Column(name = "remark", length = 200)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "status")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "create_time", length = 19)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "creator", length = 30)
	public String getCreator() {
		return this.creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	@Column(name = "modify_time", length = 19)
	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	@Column(name = "modifier", length = 32)
	public String getModifier() {
		return this.modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_store_id")
	public ProductStore getProductStore() {
		return productStore;
	}

	public void setProductStore(ProductStore productStore) {
		this.productStore = productStore;
	}

	@Column(name = "audit_msg")
	public String getAuditMsg() {
		return auditMsg;
	}

	public void setAuditMsg(String auditMsg) {
		this.auditMsg = auditMsg;
	}
	
}