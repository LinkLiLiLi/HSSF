package team.nercita.manage.cms.po.jxc;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import team.nercita.manage.cms.vo.ValueVo;

@Entity
@Table(name = "production_t")
public class Production implements java.io.Serializable {

	private static final long serialVersionUID = -3615824260498167848L;

	private String id;
	private ProductType productType;
	private ProductStore productStore;
	private String model;
	private Integer incomeStatus;
	private Integer outStatus;
	private String purpose;
	private Integer amount;
	private String useMan;
	private String outMan;
	private String remark;
	private Date useTime;
	private Date outTime;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private List<ConsumeItem> itemList;
	
	private List<ValueVo> valueList;
	
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_store_id")
	public ProductStore getProductStore() {
		return productStore;
	}

	public void setProductStore(ProductStore productStore) {
		this.productStore = productStore;
	}

	@Column(name = "model", length = 200)
	public String getModel() {
		return this.model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Column(name = "income_status")
	public Integer getIncomeStatus() {
		return this.incomeStatus;
	}

	public void setIncomeStatus(Integer incomeStatus) {
		this.incomeStatus = incomeStatus;
	}

	@Column(name = "out_status")
	public Integer getOutStatus() {
		return this.outStatus;
	}

	public void setOutStatus(Integer outStatus) {
		this.outStatus = outStatus;
	}

	@Column(name = "purpose", length = 100)
	public String getPurpose() {
		return this.purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	@Column(name = "amount")
	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Column(name = "use_man", length = 20)
	public String getUseMan() {
		return this.useMan;
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

	@Column(name = "use_time", length = 19)
	public Date getUseTime() {
		return this.useTime;
	}

	public void setUseTime(Date useTime) {
		this.useTime = useTime;
	}

	@Column(name = "out_time", length = 19)
	public Date getOutTime() {
		return this.outTime;
	}

	public void setOutTime(Date outTime) {
		this.outTime = outTime;
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

	@OneToMany(mappedBy = "production")
	public List<ConsumeItem> getItemList() {
		return itemList;
	}

	public void setItemList(List<ConsumeItem> itemList) {
		this.itemList = itemList;
	}

	@Transient
	public List<ValueVo> getValueList() {
		return valueList;
	}

	public void setValueList(List<ValueVo> valueList) {
		this.valueList = valueList;
	}
	
	
}