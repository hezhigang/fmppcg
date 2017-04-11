package com.anegr.dao;

import java.util.List;

public interface BaseDAO {

	/**
	 * 
	 * @return
	 */
	public abstract int getTotalCount();

	/**
	 * 
	 * @param paginator
	 * @return
	 */
	public abstract List pagingQuery(Paginator paginator);
	
}