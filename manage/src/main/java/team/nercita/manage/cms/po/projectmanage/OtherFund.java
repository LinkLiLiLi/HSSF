package team.nercita.manage.cms.po.projectmanage;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "other_fund_t")
public class OtherFund implements java.io.Serializable {

	private static final long serialVersionUID = -7557093104436466172L;
	private String id;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	
	private String unit;
	private Long amount;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date changeTime;
	private String dealMan;
	private String remark;
	private String content;

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Column(name = "unit", length = 50)
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Column(name = "amount")
	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}
	
	@Column(name = "deal_man", length = 20)
	public String getDealMan() {
		return dealMan;
	}

	@Column(name = "change_time", length = 19)
	public Date getChangeTime() {
		return changeTime;
	}

	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}

	public void setDealMan(String dealMan) {
		this.dealMan = dealMan;
	}

	@Column(name = "remark", length = 200)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "content", length = 200)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}