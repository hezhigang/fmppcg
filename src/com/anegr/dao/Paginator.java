/**
 * author: 和志刚
 */
package com.anegr.dao;

import java.util.List;

public class Paginator {
	private int page;  //页号,第几页
	private int rowsperpage;  //每页行数
	private int total;  //总行数
	private List rows;  //返回的列表
	private int offset;  //针对mysql分页

	public Paginator() {
		super();
	}
	
	public Paginator(int page, int rowsperpage) {
		super();
		this.page = page;
		this.rowsperpage = rowsperpage;
		this.offset = rowsperpage*(page-1);
	}

	public Paginator(int page, int rowsperpage, int total, List rows) {
		super();
		this.page = page;
		this.rowsperpage = rowsperpage;
		this.total = total;
		this.rows = rows;
		this.offset = rowsperpage*(page-1);
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRowsperpage() {
		return rowsperpage;
	}

	public void setRowsperpage(int rowsperpage) {
		this.rowsperpage = rowsperpage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}
}