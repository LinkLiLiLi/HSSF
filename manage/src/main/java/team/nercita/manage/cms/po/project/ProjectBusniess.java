package team.nercita.manage.cms.po.project;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "project_busniess_t")
public class ProjectBusniess implements java.io.Serializable {

	private static final long serialVersionUID = 8117763370395979430L;
	private String id;
	private String bussName;
	private String unit;
	private String contact;
	private String phoneNumber;
	private String salesman;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date contactDate;
	private String lastProgress;
	private Integer status;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private String bussContent;

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "buss_name", length = 100)
	public String getBussName() {
		return this.bussName;
	}

	public void setBussName(String bussName) {
		this.bussName = bussName;
	}

	@Column(name = "unit", length = 50)
	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "contact", length = 20)
	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	@Column(name = "phone_number", length = 20)
	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Column(name = "salesman", length = 20)
	public String getSalesman() {
		return this.salesman;
	}

	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "contact_date", length = 10)
	public Date getContactDate() {
		return this.contactDate;
	}

	public void setContactDate(Date contactDate) {
		this.contactDate = contactDate;
	}

	@Column(name = "last_progress", length = 200)
	public String getLastProgress() {
		return this.lastProgress;
	}

	public void setLastProgress(String lastProgress) {
		this.lastProgress = lastProgress;
	}

	@Column(name = "status")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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

	@Column(name = "buss_content", length = 200)
	public String getBussContent() {
		return bussContent;
	}

	public void setBussContent(String bussContent) {
		this.bussContent = bussContent;
	}
	
	
	
}