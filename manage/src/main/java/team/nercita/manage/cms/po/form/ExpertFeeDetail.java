package team.nercita.manage.cms.po.form;

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
@Table(name = "expert_fee_detail_t")
public class ExpertFeeDetail implements java.io.Serializable {

	private static final long serialVersionUID = 2094168518333299330L;
	private String id;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private String name;
	private String idCard;
	private String unit;
	private String title;
	private Integer days;
	private String bankCard;
	private String baneName;
	private Integer amount;
	private User user;
	private Date feeDate;
	private ApplyExpertFee applyExpertFee;

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Column(name = "name", length = 10)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "id_card", length = 30)
	public String getIdCard() {
		return this.idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	@Column(name = "unit", length = 50)
	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "title", length = 30)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "days")
	public Integer getDays() {
		return this.days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

	@Column(name = "bank_card", length = 20)
	public String getBankCard() {
		return this.bankCard;
	}

	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
	}

	@Column(name = "bane_name", length = 50)
	public String getBaneName() {
		return this.baneName;
	}

	public void setBaneName(String baneName) {
		this.baneName = baneName;
	}

	@Column(name = "amount")
	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "fee_date", length = 19)
	public Date getFeeDate() {
		return this.feeDate;
	}

	public void setFeeDate(Date feeDate) {
		this.feeDate = feeDate;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "apply_id")
	public ApplyExpertFee getApplyExpertFee() {
		return applyExpertFee;
	}

	public void setApplyExpertFee(ApplyExpertFee applyExpertFee) {
		this.applyExpertFee = applyExpertFee;
	}
}