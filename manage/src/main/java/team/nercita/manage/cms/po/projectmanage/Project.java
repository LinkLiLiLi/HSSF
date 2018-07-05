package team.nercita.manage.cms.po.projectmanage;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.po.deptmanage.UserGroup;

@Entity
@Table(name = "project_t")
public class Project implements java.io.Serializable {

	private static final long serialVersionUID = 476546621342637856L;
	private String id;
	private User user;
	private String financialNumber;
	private String resource;
	private String projectName;
	private Integer unit;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date beginTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date endTime;
	private Double totalMoney;
	private Double fundMoney;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private Integer projectType;
	private Integer type;
	private UserGroup userGroup;
	private String fileNumber;
	private int status;
	private String deputeUnit;
	private String remark;
	private List<FundsDetail> fundList;
	private List<DialOutFund> outList;
	private List<ProjectEnterInfo> enterList;
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "financial_number", length = 50)
	public String getFinancialNumber() {
		return this.financialNumber;
	}

	public void setFinancialNumber(String financialNumber) {
		this.financialNumber = financialNumber;
	}

	@Column(name = "resource", length = 50)
	public String getResource() {
		return this.resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

	@Column(name = "project_name", length = 100)
	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Column(name = "unit")
	public Integer getUnit() {
		return this.unit;
	}

	public void setUnit(Integer unit) {
		this.unit = unit;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "begin_time", length = 10)
	public Date getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "end_time", length = 10)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "total_money")
	public Double getTotalMoney() {
		return this.totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}

	@Column(name = "fund_money")
	public Double getFundMoney() {
		return fundMoney;
	}

	public void setFundMoney(Double fundMoney) {
		this.fundMoney = fundMoney;
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

	@Column(name = "project_type")
	public Integer getProjectType() {
		return projectType;
	}

	public void setProjectType(Integer projectType) {
		this.projectType = projectType;
	}

	@Column(name = "type")
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "group_id")
	public UserGroup getUserGroup() {
		return userGroup;
	}

	public void setUserGroup(UserGroup userGroup) {
		this.userGroup = userGroup;
	}
	
	@Column(name = "file_number", length = 30)
	public String getFileNumber() {
		return fileNumber;
	}

	public void setFileNumber(String fileNumber) {
		this.fileNumber = fileNumber;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "project")
	public List<FundsDetail> getFundList() {
		return fundList;
	}

	public void setFundList(List<FundsDetail> fundList) {
		this.fundList = fundList;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "project")
	public List<DialOutFund> getOutList() {
		return outList;
	}

	public void setOutList(List<DialOutFund> outList) {
		this.outList = outList;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "project")
	public List<ProjectEnterInfo> getEnterList() {
		return enterList;
	}

	public void setEnterList(List<ProjectEnterInfo> enterList) {
		this.enterList = enterList;
	}

	@Column(name = "status")
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	@Column(name = "depute_unit", length = 50)
	public String getDeputeUnit() {
		return deputeUnit;
	}

	public void setDeputeUnit(String deputeUnit) {
		this.deputeUnit = deputeUnit;
	}

	@Column(name = "remark", length = 200)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}