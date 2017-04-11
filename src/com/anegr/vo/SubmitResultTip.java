/**
 * 作者: 和志刚
 * 日期: 2012-9-25
 * 时间: 下午9:03:40
 */
package com.anegr.vo;

import java.io.Serializable;

public class SubmitResultTip implements Serializable {
	private String status;
	private String tip;      //提示信息

	public SubmitResultTip(String status) {
		super();
		this.status = status;
	}

	public SubmitResultTip() {
		super();
	}

	public SubmitResultTip(String status, String tip) {
		super();
		this.status = status;
		this.tip = tip;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}
}