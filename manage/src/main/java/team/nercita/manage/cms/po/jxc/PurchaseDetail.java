package team.nercita.manage.cms.po.jxc;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import team.nercita.manage.cms.vo.ValueVo;

@Entity
@Table(name = "purchase_detail_t")
public class PurchaseDetail implements java.io.Serializable {

	private static final long serialVersionUID = -6941796717833984891L;

	private String id;
	private PurchaseApply purchaseApply;
	private ProductType productType;
	private String model;
	private String manufacturer;
	private Integer amount;
	private String remark;
	private Integer status;
	private String image;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private ProductStore productStore;
	
	private List<ValueVo> typeList;
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
	@JoinColumn(name = "purchase_apply_id", nullable = false)
	public PurchaseApply getPurchaseApply() {
		return this.purchaseApply;
	}

	public void setPurchaseApply(PurchaseApply purchaseApply) {
		this.purchaseApply = purchaseApply;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_type_id", nullable = false)
	public ProductType getProductType() {
		return this.productType;
	}

	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

	@Column(name = "model", nullable = false, length = 100)
	public String getModel() {
		return this.model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Column(name = "manufacturer", length = 100)
	public String getManufacturer() {
		return this.manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	@Column(name = "amount", nullable = false)
	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Column(name = "remark", length = 100)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "image", length = 100)
	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
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

	@Column(name = "status")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_store_id", nullable = false)
	public ProductStore getProductStore() {
		return productStore;
	}

	public void setProductStore(ProductStore productStore) {
		this.productStore = productStore;
	}

	@Transient
	public List<ValueVo> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<ValueVo> typeList) {
		this.typeList = typeList;
	}

	@Transient
	public List<ValueVo> getValueList() {
		return valueList;
	}

	public void setValueList(List<ValueVo> valueList) {
		this.valueList = valueList;
	}
	
}