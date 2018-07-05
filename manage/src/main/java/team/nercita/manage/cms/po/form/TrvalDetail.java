package team.nercita.manage.cms.po.form;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "trval_detail_t")
public class TrvalDetail implements java.io.Serializable {

	private static final long serialVersionUID = -148371820805122801L;
	private String id;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date outDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date arriveDate;
	private String outAddr;
	private String arriveAddr;
	private String vehicle;
	private Integer trafficSum;
	private Integer trafficAmount;
	private Integer liveSum;
	private Integer liveAmount;
	private Integer trafficSubsidyDays;
	private Integer trafficSubsidyAmount;
	private Integer foodSubsidyDays;
	private Integer foodSubsidyAmount;
	private Integer otherSum;
	private Integer otherAmount;
	private ApplyTrval applyTrval;

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

	@Column(name = "out_date", length = 19)
	public Date getOutDate() {
		return this.outDate;
	}

	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}

	@Column(name = "arrive_date", length = 19)
	public Date getArriveDate() {
		return this.arriveDate;
	}

	public void setArriveDate(Date arriveDate) {
		this.arriveDate = arriveDate;
	}

	@Column(name = "out_addr", length = 50)
	public String getOutAddr() {
		return this.outAddr;
	}

	public void setOutAddr(String outAddr) {
		this.outAddr = outAddr;
	}

	@Column(name = "arrive_addr", length = 50)
	public String getArriveAddr() {
		return this.arriveAddr;
	}

	public void setArriveAddr(String arriveAddr) {
		this.arriveAddr = arriveAddr;
	}

	@Column(name = "vehicle", length = 20)
	public String getVehicle() {
		return this.vehicle;
	}

	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}

	@Column(name = "traffic_sum")
	public Integer getTrafficSum() {
		return this.trafficSum;
	}

	public void setTrafficSum(Integer trafficSum) {
		this.trafficSum = trafficSum;
	}

	@Column(name = "traffic_amount")
	public Integer getTrafficAmount() {
		return this.trafficAmount;
	}

	public void setTrafficAmount(Integer trafficAmount) {
		this.trafficAmount = trafficAmount;
	}

	@Column(name = "live_sum")
	public Integer getLiveSum() {
		return this.liveSum;
	}

	public void setLiveSum(Integer liveSum) {
		this.liveSum = liveSum;
	}

	@Column(name = "live_amount")
	public Integer getLiveAmount() {
		return this.liveAmount;
	}

	public void setLiveAmount(Integer liveAmount) {
		this.liveAmount = liveAmount;
	}

	@Column(name = "traffic_subsidy_days")
	public Integer getTrafficSubsidyDays() {
		return this.trafficSubsidyDays;
	}

	public void setTrafficSubsidyDays(Integer trafficSubsidyDays) {
		this.trafficSubsidyDays = trafficSubsidyDays;
	}

	@Column(name = "traffic_subsidy_amount")
	public Integer getTrafficSubsidyAmount() {
		return this.trafficSubsidyAmount;
	}

	public void setTrafficSubsidyAmount(Integer trafficSubsidyAmount) {
		this.trafficSubsidyAmount = trafficSubsidyAmount;
	}

	@Column(name = "food_subsidy_days")
	public Integer getFoodSubsidyDays() {
		return this.foodSubsidyDays;
	}

	public void setFoodSubsidyDays(Integer foodSubsidyDays) {
		this.foodSubsidyDays = foodSubsidyDays;
	}

	@Column(name = "food_subsidy_amount")
	public Integer getFoodSubsidyAmount() {
		return this.foodSubsidyAmount;
	}

	public void setFoodSubsidyAmount(Integer foodSubsidyAmount) {
		this.foodSubsidyAmount = foodSubsidyAmount;
	}

	@Column(name = "other_sum")
	public Integer getOtherSum() {
		return this.otherSum;
	}

	public void setOtherSum(Integer otherSum) {
		this.otherSum = otherSum;
	}

	@Column(name = "other_amount")
	public Integer getOtherAmount() {
		return this.otherAmount;
	}

	public void setOtherAmount(Integer otherAmount) {
		this.otherAmount = otherAmount;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "apply_id")
	public ApplyTrval getApplyTrval() {
		return applyTrval;
	}

	public void setApplyTrval(ApplyTrval applyTrval) {
		this.applyTrval = applyTrval;
	}
}