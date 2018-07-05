/*
 * FunctionVO.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月15日 下午10:46:28
 * 创业小团队-后台
 */
package team.nercita.manage.cms.vo;

import java.util.List;

/**
 *
 * @author L
 * @date 2017年7月15日 下午10:46:28
 */
public class FunctionVO {
	private String id;
	private String functionName;
	private int flag;
	private List<FunctionVO> functionList;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public List<FunctionVO> getFunctionList() {
		return functionList;
	}

	public void setFunctionList(List<FunctionVO> functionList) {
		this.functionList = functionList;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}
	
}
