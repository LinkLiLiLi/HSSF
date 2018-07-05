package team.nercita.manage.cms.model;

import java.io.Serializable;
import java.util.Date;

public class Result<T> implements Serializable {

	private static final long serialVersionUID = 5019800281816303893L;

	private boolean success = true;

	private int ec = 200;
	private String em = "success";

	private T result;

	private Date requesttime = new Date();

	public Result() {
	}
	
	public Result(int ec, String em, boolean success) {
		this.ec = ec;
		this.em = em;
		this.success = success;
	}
	
	public Result(int ec, String em, boolean success, T result) {
		this.ec = ec;
		this.em = em;
		this.success = success;
		this.result = result;
	}
	public Result(int ec, String em) {
		this.ec = ec;
		this.em = em;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public int getEc() {
		return ec;
	}

	public void setEc(int ec) {
		this.ec = ec;
	}

	public String getEm() {
		return em;
	}

	public void setEm(String em) {
		this.em = em;
	}

	public T getResult() {
		return result;
	}

	public void setResult(T result) {
		this.result = result;
	}

	public Date getRequesttime() {
		return this.requesttime;
	}

	public void setRequesttime(Date requesttime) {
		this.requesttime = requesttime;
	}

}
