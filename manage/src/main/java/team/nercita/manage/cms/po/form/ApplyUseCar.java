package team.nercita.manage.cms.po.form;

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

import org.springframework.format.annotation.DateTimeFormat;

import team.nercita.manage.cms.po.deptmanage.User;

@Entity
@Table(name = "apply_use_car_t")
public class ApplyUseCar implements java.io.Serializable {

	private static final long serialVersionUID = 7017820622144332819L;

	private String id;
	private User user;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private String applyDept;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date applyTime;
	private String specialInfo;
	private String reason;
	private String destination;
	private String carNumber;
	private String exceptionRecord;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date beginTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date endTime;
	private Integer stopCarPrice;
	private String driver;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date useTime;
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "apply_user", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
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

	@Column(name = "apply_dept", length = 50)
	public String getApplyDept() {
		return this.applyDept;
	}

	public void setApplyDept(String applyDept) {
		this.applyDept = applyDept;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "apply_time", length = 10)
	public Date getApplyTime() {
		return this.applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	@Column(name = "special_info", length = 50)
	public String getSpecialInfo() {
		return this.specialInfo;
	}

	public void setSpecialInfo(String specialInfo) {
		this.specialInfo = specialInfo;
	}

	@Column(name = "reason", length = 200)
	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Column(name = "destination", length = 200)
	public String getDestination() {
		return this.destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	@Column(name = "car_number", length = 20)
	public String getCarNumber() {
		return this.carNumber;
	}

	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}

	@Column(name = "exception_record", length = 200)
	public String getExceptionRecord() {
		return this.exceptionRecord;
	}

	public void setExceptionRecord(String exceptionRecord) {
		this.exceptionRecord = exceptionRecord;
	}
	
	@Temporal(TemporalType.DATE)
	@Column(name = "begin_time", length = 19)
	public Date getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "end_time", length = 19)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "stop_car_price")
	public Integer getStopCarPrice() {
		return this.stopCarPrice;
	}

	public void setStopCarPrice(Integer stopCarPrice) {
		this.stopCarPrice = stopCarPrice;
	}

	@Column(name = "driver", length = 20)
	public String getDriver() {
		return this.driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "use_time", length = 19)
	public Date getUseTime() {
		return useTime;
	}

	public void setUseTime(Date useTime) {
		this.useTime = useTime;
	}
	
}