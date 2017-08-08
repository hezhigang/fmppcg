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
	
	void deleteBatch(List list);
	
	int delete(String id);
	
	Paginator search(Paginator paginator,Poet poet);
}
