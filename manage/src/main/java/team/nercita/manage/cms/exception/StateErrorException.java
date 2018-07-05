/*
 * StateErrorException.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年6月17日 下午3:55:18
 * 创业小团队-后台
 */
package team.nercita.manage.cms.exception;

/**
 * 状态错误异常
 * @author L
 * @date 2017年6月17日 下午3:55:18
 */
public class StateErrorException extends Exception{
	
	private static final long serialVersionUID = 7621362103199914317L;
	
	public StateErrorException() {
	}
	
	public StateErrorException(String msg) {
		super(msg);
	}

}
