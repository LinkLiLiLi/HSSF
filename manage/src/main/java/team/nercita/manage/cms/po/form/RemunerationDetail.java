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
@Table(name = "remuneration_detail_t")
public class RemunerationDetail implements java.io.Serializable {

	private static final long serialVersionUID = -8993715973901962938L;

	private String id;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private User addUser;
	private String name;
	private String idCard;
	private String bankCard;
	private String bankName;
	private Integer allAmount;
	private Integer taxAmount;
	private Integer payAmount;
	
	private ApplyRemuneration applyRemuneration;
	

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

	@Column(name = "modify_time", length = 19)
	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "add_user")
	public User getAddUser() {
		return this.addUser;
	}

	public void setAddUser(User addUser) {
		this.addUser = addUser;
	}

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "id_card", length = 20)
	public String getIdCard() {
		return this.idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	@Column(name = "bank_card", length = 20)
	public String getBankCard() {
		return this.bankCard;
	}

	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
	}

	@Column(name = "bank_name", length = 50)
	public String getBankName() {
		return this.bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	@Column(name = "all_amount")
	public Integer getAllAmount() {
		return this.allAmount;
	}

	public void setAllAmount(Integer allAmount) {
		this.allAmount = allAmount;
	}

	@Column(name = "tax_amount")
	public Integer getTaxAmount() {
		return this.taxAmount;
	}

	public void setTaxAmount(Integer taxAmount) {
		this.taxAmount = taxAmount;
	}

	@Column(name = "pay_amount")
	public Integer getPayAmount() {
		return this.payAmount;
	}

	public void setPayAmount(Integer payAmount) {
		this.payAmount = payAmount;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "apply_id")
	public ApplyRemuneration getApplyRemuneration() {
		return applyRemuneration;
	}

	public void setApplyRemuneration(ApplyRemuneration applyRemuneration) {
		this.applyRemuneration = applyRemuneration;
	}
	
}