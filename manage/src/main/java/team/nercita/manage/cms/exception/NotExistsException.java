/*
 * NotExistsException.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年6月17日 下午3:49:51
 * 创业小团队-后台
 */
package team.nercita.manage.cms.exception;

/**
 * 不存在异常
 * @author L
 * @date 2017年6月17日 下午3:49:51
 */
public class NotExistsException extends Exception{

	private static final long serialVersionUID = 4098218583049719574L;
	
	public NotExistsException(String msg) {
		super(msg);
	}
}
