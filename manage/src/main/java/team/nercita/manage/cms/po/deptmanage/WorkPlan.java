package team.nercita.manage.cms.po.deptmanage;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "work_plan_t")
public class WorkPlan implements java.io.Serializable {

	private static final long serialVersionUID = -2458621811040821123L;
	
	private String id;
	private User user;
	private User distUser;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date beginTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date endTime;
	private String lastProgress;
	private String content;
	private String arrangement;
	private Integer setbacks;
	private String progress;
	private Integer evaluate;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private UserGroup userGroup;
	private List<PlanLog> logList;
	
	@SuppressWarnings("unused")
	private int status;
	
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
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "dist_user_id")
	public User getDistUser() {
		return this.distUser;
	}

	public void setDistUser(User distUser) {
		this.distUser = distUser;
	}

	@Column(name = "begin_time", length = 19)
	public Date getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	@Column(name = "end_time", length = 19)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "content", length = 200)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "arrangement", length = 20)
	public String getArrangement() {
		return this.arrangement;
	}

	public void setArrangement(String arrangement) {
		this.arrangement = arrangement;
	}

	@Column(name = "setbacks")
	public Integer getSetbacks() {
		return this.setbacks;
	}

	public void setSetbacks(Integer setbacks) {
		this.setbacks = setbacks;
	}

	@Column(name = "progress", length = 200)
	public String getProgress() {
		return this.progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	@Column(name = "evaluate")
	public Integer getEvaluate() {
		return this.evaluate;
	}

	public void setEvaluate(Integer evaluate) {
		this.evaluate = evaluate;
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
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_group_id")
	public UserGroup getUserGroup() {
		return this.userGroup;
	}

	public void setUserGroup(UserGroup userGroup) {
		this.userGroup = userGroup;
	}

	@Column(name = "last_progress", length = 500)
	public String getLastProgress() {
		return lastProgress;
	}

	public void setLastProgress(String lastProgress) {
		this.lastProgress = lastProgress;
	}

	@OneToMany(mappedBy = "workPlan")
	public List<PlanLog> getLogList() {
		return logList;
	}

	public void setLogList(List<PlanLog> logList) {
		this.logList = logList;
	}

	@Transient
	public int getStatus() {
		if(this.evaluate != null && this.evaluate == 0) {//已完成
			return 1;
		} else {
			if(this.endTime.before(new Date())) {//逾期
				return 2;
			} else {//进行中
				return 0;
			}
		}
	}
}