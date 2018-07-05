/*
 * FundsDetailChange.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2018年1月7日 下午9:59:03
 * 创业小团队-后台
 */
package team.nercita.manage.cms.po.projectmanage;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author L
 * @date 2018年1月7日 下午9:59:03
 */
@Entity
@Table(name = "funds_detail_change_t")
public class FundsDetailChange implements java.io.Serializable{

	private static final long serialVersionUID = 1315732704015761393L;
	
	private String id;
	private Project project;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	private FundsDetail fundsDetail;
	private Long originalBudget;
	private Long newBudget;
	
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "funds_detail_id")
	public FundsDetail getFundsDetail() {
		return fundsDetail;
	}

	public void setFundsDetail(FundsDetail fundsDetail) {
		this.fundsDetail = fundsDetail;
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
}
