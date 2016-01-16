/*
 * author:linyuan
 * date:20160116
 * 
 * 返回Json对象的基类
 */
package com.likits.model;

public class ReturnBaseJsonObject {
	private int status;
	private String tips;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTips() {
		return tips;
	}
	public void setTips(String tips) {
		this.tips = tips;
	}
}
