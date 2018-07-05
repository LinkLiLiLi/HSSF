package team.nercita.manage.cms.po.project;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "startup_detail_t")
public class StartUpDetail implements java.io.Serializable {

	private static final long serialVersionUID = 3610457814329074323L;
	private String id;
	private ProjectStartup projectStartup;
	private String lastProgress;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private String detail;
	private Date noteDate;

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "last_progress", length = 200)
	public String getLastProgress() {
		return this.lastProgress;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "startup_id", nullable = false)
	public ProjectStartup getProjectStartup() {
		return projectStartup;
	}

	public void setProjectStartup(ProjectStartup projectStartup) {
		this.projectStartup = projectStartup;
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

	@Column(name = "detail", length = 200)
	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Column(name = "note_date", length = 19)
	public Date getNoteDate() {
		return noteDate;
	}

	public void setNoteDate(Date noteDate) {
		this.noteDate = noteDate;
	}
}