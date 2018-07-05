package team.nercita.manage.cms.vo;

import java.util.List;

/**
 * 
 * @author L 
 * @date： 2017年7月10日 下午8:30:07
 */
public class TreeVo {
	private String name;
	private String icon;
	private String code;
	private String parentCode;
	private List<TreeVo> child;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public List<TreeVo> getChild() {
		return child;
	}

	public void setChild(List<TreeVo> child) {
		this.child = child;
	}

}
