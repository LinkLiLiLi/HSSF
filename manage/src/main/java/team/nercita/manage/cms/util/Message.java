/*
 * Message.java
 * 创建者：L
 * 创建日期：2017年6月16日 下午4:12:12
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.util;

import java.io.Serializable;

/**
 * 消息提示
 * @author L
 * @date： 2017年6月16日 下午4:12:12
 */
public class Message implements Serializable {
	
	private static final long serialVersionUID = 2534021857527568365L;
	
	private String code;
	private String desc;
	
	public Message() {
	}
	
	public Message(String code, String desc) {
		super();
		this.code = code;
		this.desc = desc;
	}

	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getDesc() {
		return desc;
	}
	
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
}
