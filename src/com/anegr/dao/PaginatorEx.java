/**
 * 作者: 和志刚
 * 日期: 2012-2-14
 * 时间: 下午4:24:06
 */
package com.anegr.dao;

import java.util.List;

/**
 * 
 */
public class PaginatorEx extends Paginator {
	private Object example;

	public PaginatorEx(Object example) {
		super();
		this.example = example;
	}

	public PaginatorEx() {
		super();
	}

	public PaginatorEx(int page, int rowsperpage, int total, List rows) {
		super(page, rowsperpage, total, rows);
	}

	public PaginatorEx(int page, int rowsperpage) {
		super(page, rowsperpage);
	}

	public Object getExample() {
		return example;
	}

	public void setExample(Object example) {
		this.example = example;
	}	
}
