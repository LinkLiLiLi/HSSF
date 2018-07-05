package team.nercita.manage.cms.po.jxc;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import team.nercita.manage.cms.vo.ProductVo;

@Entity
@Table(name = "consume_item_t")
public class ConsumeItem implements java.io.Serializable {

	private static final long serialVersionUID = 1496011321518433796L;

	private String id;
	private Date modifyTime;
	private ProductType productType;
	private ProductStore productStore;
	private Integer amount;
	private String creator;
	private Date createTime;
	private String modifier;
	private Production production;
	private String model;
	
	private ProductVo productVo;

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "modify_time", length = 19)
	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
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
	
	@Column(name = "amount")
	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "production_id")
	public Production getProduction() {
		return this.production;
	}

	public void setProduction(Production production) {
		this.production = production;
	}

	@Transient
	public ProductVo getProductVo() {
		return productVo;
	}

	public void setProductVo(ProductVo productVo) {
		this.productVo = productVo;
	}
}