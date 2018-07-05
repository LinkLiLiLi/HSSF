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

@Entity
@Table(name = "cost_t")
public class Cost implements java.io.Serializable {

	private static final long serialVersionUID = 7102655234295154418L;

	private String id;
	private ProgramCost programCost;
	private Long costAmount;
	private String costUnit;
	private Date costDate;
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
	@JoinColumn(name = "program_cost_id")
	public ProgramCost getProgramCost() {
		return this.programCost;
	}

	public void setProgramCost(ProgramCost programCost) {
		this.programCost = programCost;
	}

	@Column(name = "cost_amount")
	public Long getCostAmount() {
		return this.costAmount;
	}

	public void setCostAmount(Long costAmount) {
		this.costAmount = costAmount;
	}

	@Column(name = "cost_unit", length = 50)
	public String getCostUnit() {
		return this.costUnit;
	}

	public void setCostUnit(String costUnit) {
		this.costUnit = costUnit;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "cost_date", length = 10)
	public Date getCostDate() {
		return this.costDate;
	}

	public void setCostDate(Date costDate) {
		this.costDate = costDate;
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