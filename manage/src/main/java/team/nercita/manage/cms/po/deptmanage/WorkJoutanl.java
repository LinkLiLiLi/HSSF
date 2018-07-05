package team.nercita.manage.cms.po.deptmanage;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "work_joutanl_t")
public class WorkJoutanl implements java.io.Serializable {

	private static final long serialVersionUID = 7503652772271334914L;
	private String id;
	private User user;
	private Date joutanlDate;
	private String workContent;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private String remark;

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

	@Column(name = "joutanl_date", length = 19)
	public Date getJoutanlDate() {
		return this.joutanlDate;
	}

	public void setJoutanlDate(Date joutanlDate) {
		this.joutanlDate = joutanlDate;
	}

	@Column(name = "work_content", length = 500)
	public String getWorkContent() {
		return this.workContent;
	}

	public void setWorkContent(String workContent) {
		this.workContent = workContent;
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

	@Column(name = "remark", length = 500)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}