package team.nercita.manage.cms.po.finance;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.projectmanage.Project;

@Entity
@Table(name = "program_cost_t")
public class ProgramCost implements java.io.Serializable {

	private static final long serialVersionUID = 1476422308522201313L;
	private String id;
	private Project project;
	private User user;
	private Long totalAmount;
	private Long totalCost;
	private Long lastCost;
	private Date lastCostDate;
	private String unit;
	private Integer type;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "project_id")
	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "add_user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "total_amount")
	public Long getTotalAmount() {
		return this.totalAmount;
	}

	public void setTotalAmount(Long totalAmount) {
		this.totalAmount = totalAmount;
	}

	@Column(name = "total_cost")
	public Long getTotalCost() {
		return this.totalCost;
	}

	public void setTotalCost(Long totalCost) {
		this.totalCost = totalCost;
	}

	@Column(name = "last_cost")
	public Long getLastCost() {
		return this.lastCost;
	}

	public void setLastCost(Long lastCost) {
		this.lastCost = lastCost;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "last_cost_date", length = 10)
	public Date getLastCostDate() {
		return this.lastCostDate;
	}

	public void setLastCostDate(Date lastCostDate) {
		this.lastCostDate = lastCostDate;
	}

	@Column(name = "unit", length = 50)
	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "type")
	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
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


}