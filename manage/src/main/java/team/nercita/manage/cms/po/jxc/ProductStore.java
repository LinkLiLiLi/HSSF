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

@Entity
@Table(name = "product_store_t")
public class ProductStore implements java.io.Serializable {

	private static final long serialVersionUID = -1166366880934707660L;
	private String id;
	private ProductDealer productDealer;
	private ProductType productType;
	private Integer amount;
	private String storeAddr;
	private String brand;
	private Integer prize;
	private String content;
	private String image;
	private String creator;
	private String modifier;
	private Date modifyTime;
	private Date createTime;
	
	private List<ProductStoreItem> itemList;
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_dealer_id", nullable = false)
	public ProductDealer getProductDealer() {
		return this.productDealer;
	}

	public void setProductDealer(ProductDealer productDealer) {
		this.productDealer = productDealer;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_type_id", nullable = false)
	public ProductType getProductType() {
		return this.productType;
	}

	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

	@Column(name = "amount", nullable = false)
	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Column(name = "store_addr", nullable = false, length = 100)
	public String getStoreAddr() {
		return this.storeAddr;
	}

	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}

	@Column(name = "brand", nullable = false, length = 50)
	public String getBrand() {
		return this.brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	@Column(name = "prize", nullable = false)
	public Integer getPrize() {
		return this.prize;
	}

	public void setPrize(Integer prize) {
		this.prize = prize;
	}

	@Column(name = "content", length = 200)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "image", length = 50)
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

	@Column(name = "create_time", length = 19)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@OneToMany(mappedBy = "productStore")
	public List<ProductStoreItem> getItemList() {
		return itemList;
	}

	public void setItemList(List<ProductStoreItem> itemList) {
		this.itemList = itemList;
	}
	
	
}