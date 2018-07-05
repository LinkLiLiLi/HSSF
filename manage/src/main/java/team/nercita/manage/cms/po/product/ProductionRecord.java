package team.nercita.manage.cms.po.product;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "production_record_t")
public class ProductionRecord implements java.io.Serializable {

	private static final long serialVersionUID = 8900189318620475827L;

	private String id;
	private String taskName;
	private String taskNumber;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date taskDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String problem;
	private String lastProgress;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	
	private List<ProductionNode> modeList;
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "task_name", length = 50)
	public String getTaskName() {
		return this.taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	@Column(name = "task_number", length = 50)
	public String getTaskNumber() {
		return this.taskNumber;
	}

	public void setTaskNumber(String taskNumber) {
		this.taskNumber = taskNumber;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "task_date", length = 10)
	public Date getTaskDate() {
		return this.taskDate;
	}

	public void setTaskDate(Date taskDate) {
		this.taskDate = taskDate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "end_date", length = 10)
	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Column(name = "problem", length = 200)
	public String getProblem() {
		return this.problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	@Column(name = "last_progress", length = 200)
	public String getLastProgress() {
		return lastProgress;
	}

	public void setLastProgress(String lastProgress) {
		this.lastProgress = lastProgress;
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

	@OneToMany(mappedBy = "productionRecord")
	public List<ProductionNode> getModeList() {
		return modeList;
	}

	public void setModeList(List<ProductionNode> modeList) {
		this.modeList = modeList;
	}

	
}