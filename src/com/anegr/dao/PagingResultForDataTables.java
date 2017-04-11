/**
 * 作者: 和志刚
 * 日期: 2016-4-12
 * 时间: 上午10:26:28
 */
package com.anegr.dao;

import java.util.List;

/**
 * 针对DataTables分页表格jquery插件
 */
public class PagingResultForDataTables {
	private int draw;   //The draw counter
	private int recordsTotal;  //the total number of records in the database
	private int recordsFiltered;  //Total records, after filtering
	private List data;   //The data to be displayed in the table.
//	private String error;
	
	public PagingResultForDataTables() {
		super();
	}
	
	public PagingResultForDataTables(int draw, int recordsTotal,
			int recordsFiltered, List data) {
		super();
		this.draw = draw;
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsFiltered;
		this.data = data;
	}

	public int getDraw() {
		return draw;
	}
	public void setDraw(int draw) {
		this.draw = draw;
	}
	public int getRecordsTotal() {
		return recordsTotal;
	}
	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}
	public int getRecordsFiltered() {
		return recordsFiltered;
	}
	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}
	public List getData() {
		return data;
	}
	public void setData(List data) {
		this.data = data;
	}
}