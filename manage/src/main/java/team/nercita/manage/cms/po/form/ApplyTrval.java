package team.nercita.manage.cms.po.form;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import team.nercita.manage.cms.po.deptmanage.User;
@Entity
@Table(name = "apply_trval_t")
public class ApplyTrval implements java.io.Serializable {

	private static final long serialVersionUID = 462054875410370495L;

	private String id;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private User addUser;
	private String name;
	private String reason;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date travelDate;
	private Integer card;
	private Integer money;
	private Integer cheque;
	private Integer status;
	private String remark;
	private List<TrvalDetail> detailList;
	
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
	@JoinColumn(name = "user_id")
	public User getAddUser() {
		return this.addUser;
	}

	public void setAddUser(User addUser) {
		this.addUser = addUser;
	}

	@Column(name = "name", length = 10)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "reason", length = 50)
	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Column(name = "travel_date", length = 19)
	public Date getTravelDate() {
		return this.travelDate;
	}

	public void setTravelDate(Date travelDate) {
		this.travelDate = travelDate;
	}

	@Column(name = "card")
	public Integer getCard() {
		return this.card;
	}

	public void setCard(Integer card) {
		this.card = card;
	}

	@Column(name = "money")
	public Integer getMoney() {
		return this.money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	@Column(name = "cheque")
	public Integer getCheque() {
		return this.cheque;
	}

	public void setCheque(Integer cheque) {
		this.cheque = cheque;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "applyTrval")
	public List<TrvalDetail> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<TrvalDetail> detailList) {
		this.detailList = detailList;
	}
	
	@Column(name = "status")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "remark", length = 200)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}