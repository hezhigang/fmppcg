/**
 * @author hezhigang
 */
package com.anegr.service;

import java.util.List;
import com.anegr.dao.Paginator;
import com.anegr.domain.Poem;

public interface PoemService {
	int insert(Poem poem);
	
	Paginator paging(Paginator paginator);
	
	Poem get(String id);
	
	void update(Poem poem);
	
	void deleteBatch(List list);  //批量删除
	
	int delete(String id);
	
    /**
     * 组合条件查询
     * @param paginator 分页对象
     * @param poem 查询条件DTO对象
     * @return Paginator
     */	
	Paginator search(Paginator paginator,Poem poem);
}
