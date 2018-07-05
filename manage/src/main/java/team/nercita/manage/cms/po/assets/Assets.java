package team.nercita.manage.cms.po.assets;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * AssetsT entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "assets_t")
public class Assets implements java.io.Serializable {

	private static final long serialVersionUID = 2547929043560790671L;
	private String id;
	private String assetsName;
	private Long prize;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date buyDate;
	private String type;
	private String location;
	private String charge;
	private Integer status;
	private Integer fixedAssets;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private String assetsNumber;

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "assets_name", length = 50)
	public String getAssetsName() {
		return this.assetsName;
	}

	public void setAssetsName(String assetsName) {
		this.assetsName = assetsName;
	}

	@Column(name = "prize")
	public Long getPrize() {
		return this.prize;
	}

	public void setPrize(Long prize) {
		this.prize = prize;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "buy_date", length = 10)
	public Date getBuyDate() {
		return this.buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	@Column(name = "type", length = 50)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "location", length = 200)
	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Column(name = "charge", length = 20)
	public String getCharge() {
		return this.charge;
	}

	public void setCharge(String charge) {
		this.charge = charge;
	}

	@Column(name = "status")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "fixed_assets")
	public Integer getFixedAssets() {
		return this.fixedAssets;
	}

	public void setFixedAssets(Integer fixedAssets) {
		this.fixedAssets = fixedAssets;
	}

	@Column(name = "creator", length = 20)
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

	@Column(name = "modifier", length = 20)
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

	@Column(name = "assets_number", length = 50)
	public String getAssetsNumber() {
		return assetsNumber;
	}

	public void setAssetsNumber(String assetsNumber) {
		this.assetsNumber = assetsNumber;
	}
	
}