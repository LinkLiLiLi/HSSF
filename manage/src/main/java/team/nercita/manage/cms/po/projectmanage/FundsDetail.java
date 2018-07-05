package team.nercita.manage.cms.po.projectmanage;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "funds_detail_t")
public class FundsDetail implements java.io.Serializable {

	private static final long serialVersionUID = -7557093104436466172L;
	private String id;
	private Project project;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	
	private String name;
	private Long originalBudget;
	private Long newBudget;
	private Long pay;
	private Long originalBalance;
	private Long newBalance;

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

	@Column(name = "original_budget")
	public Long getOriginalBudget() {
		return originalBudget;
	}

	public void setOriginalBudget(Long originalBudget) {
		this.originalBudget = originalBudget;
	}

	@Column(name = "new_budget")
	public Long getNewBudget() {
		return newBudget;
	}

	public void setNewBudget(Long newBudget) {
		this.newBudget = newBudget;
	}
	
	@Column(name = "pay")
	public Long getPay() {
		return pay;
	}

	public void setPay(Long pay) {
		this.pay = pay;
	}

	@Column(name = "original_balance")
	public Long getOriginalBalance() {
		return originalBalance;
	}

	public void setOriginalBalance(Long originalBalance) {
		this.originalBalance = originalBalance;
	}

	@Column(name = "new_balance")
	public Long getNewBalance() {
		return newBalance;
	}

	public void setNewBalance(Long newBalance) {
		this.newBalance = newBalance;
	}

	@Column(name = "name", length = 20)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}