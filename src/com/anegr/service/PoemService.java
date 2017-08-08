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
	
	void deleteBatch(List list);
	
	int delete(String id);
	
	Paginator search(Paginator paginator,Poem poem);
}
