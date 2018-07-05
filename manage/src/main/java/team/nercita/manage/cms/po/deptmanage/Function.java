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
@Table(name = "function_t")
public class Function implements java.io.Serializable {

	private static final long serialVersionUID = -388681159752480396L;
	
	private String id;
	private Function function;
	private String functionCode;
	private String functionName;
	private Integer functionType;
	private Integer sort;
	private Integer status;
	private String creator;
	private Date createTime;
	private String modifier;
	private Date modifyTime;
	
	/**
	 * 
	 */
	public Function() {
		// TODO Auto-generated constructor stub
	}
	
	public Function (String id) {
		this.id = id;
	}
	
	public static enum FunctionType {
        /** 功能类型:菜单 */        menu(0),
        /** 功能类型:操作 */        action(1),
        /** 功能类型:操作 */        button(2);

        private int value;

        public int getValue() {
            return value;
        }

        private FunctionType(int value) {
            this.value = value;
        }
    }
	
	public static enum Status {
        /** 状态:正常 */        normal(0),
        /** 状态:冻结 */        frezon(1);

        private int value;

        public int getValue() {
            return value;
        }

        private Status(int value) {
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_function_id")
	public Function getFunction() {
		return this.function;
	}

	public void setFunction(Function function) {
		this.function = function;
	}

	@Column(name = "function_code", length = 20)
	public String getFunctionCode() {
		return this.functionCode;
	}

	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}

	@Column(name = "function_name", length = 20)
	public String getFunctionName() {
		return this.functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	@Column(name = "function_type")
	public Integer getFunctionType() {
		return this.functionType;
	}

	public void setFunctionType(Integer functionType) {
		this.functionType = functionType;
	}

	@Column(name = "sort")
	public Integer getSort() {
		return this.sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
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

}