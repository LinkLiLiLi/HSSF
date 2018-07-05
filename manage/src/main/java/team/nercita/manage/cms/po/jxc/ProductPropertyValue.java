package team.nercita.manage.cms.po.jxc;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product_property_value_t")
public class ProductPropertyValue implements java.io.Serializable {

	private static final long serialVersionUID = 5095424368484565035L;
	private String id;
	private ProductProperty productProperty;
	private Date modifyTime;
	private String creator;
	private Date createTime;
	private String modifier;
	private String vals;

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_property_id", nullable = false)
	public ProductProperty getProductProperty() {
		return this.productProperty;
	}

	public void setProductProperty(ProductProperty productProperty) {
		this.productProperty = productProperty;
	}

	@Column(name = "modify_time", length = 19)
	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
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

	@Column(name = "vals", nullable = false, length = 50)
	public String getVals() {
		return this.vals;
	}

	public void setVals(String vals) {
		this.vals = vals;
	}

}