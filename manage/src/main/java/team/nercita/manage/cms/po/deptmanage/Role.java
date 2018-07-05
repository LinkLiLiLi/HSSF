package team.nercita.manage.cms.po.deptmanage;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role_t")
public class Role implements java.io.Serializable {

	private static final long serialVersionUID = 6589122166023342249L;
	private String id;
	private String roleName;
	private String roleCode;
	private String roleDesc;
	private Integer status;
	private Integer buildType;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	
	public static enum Status {
        /** 状态:正常 */        normal(0),
        /** 状态:禁用 */        disable(1);

        private int value;

        public int getValue() {
            return value;
        }

        private Status(int value) {
            this.value = value;
        }
    }
	
	public static enum BuildType {
        /** 创建类型:内置 */        internal(0),
        /** 创建类型:新建*/        create(1);

        private int value;

        public int getValue() {
            return value;
        }

        private BuildType(int value) {
            this.value = value;
        }
    }
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "role_name", length = 20)
	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Column(name = "role_code", length = 32)
	public String getRoleCode() {
		return this.roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	@Column(name = "role_desc", length = 200)
	public String getRoleDesc() {
		return this.roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	@Column(name = "status")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "build_type")
	public Integer getBuildType() {
		return this.buildType;
	}

	public void setBuildType(Integer buildType) {
		this.buildType = buildType;
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