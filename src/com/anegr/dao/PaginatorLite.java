/**
 * 作者: 和志刚
 * 日期: 2016-1-28
 * 时间: 下午4:14:50
 */
package com.anegr.dao;

/**
 * 
 */
public class PaginatorLite {
	private int start;  //开始
	private int count;  //条数
	
	public PaginatorLite() {
		super();
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
