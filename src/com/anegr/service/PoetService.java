/**
 * @author hezhigang
 */
package com.anegr.service;

import java.util.List;
import com.anegr.dao.Paginator;
import com.anegr.domain.Poet;

public interface PoetService {
	int insert(Poet poet);
	
	Paginator paging(Paginator paginator);
	
	Poet get(String id);
	
	void update(Poet poet);
	
	void deleteBatch(List list);  //批量删除
	
	int delete(String id);
	
    /**
     * 组合条件查询
     * @param paginator 分页对象
     * @param poet 查询条件DTO对象
     * @return Paginator
     */	
	Paginator search(Paginator paginator,Poet poet);
}
