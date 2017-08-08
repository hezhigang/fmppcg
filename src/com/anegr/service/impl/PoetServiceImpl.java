/**
 * @author hezhigang
 */
package com.anegr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.anegr.dao.Paginator;
import com.anegr.dao.PaginatorEx;
import com.anegr.dao.PoetMapper;
import com.anegr.domain.Poet;
import com.anegr.domain.PoetExample;
import com.anegr.service.PoetService;


@Service
public class PoetServiceImpl implements PoetService {
	private static final Logger logger = Logger.getLogger(PoetServiceImpl.class);
	
	@Resource
	private PoetMapper dao;
	
	public int insert(Poet poet) {
		return dao.insertSelective(poet);
	}

	public Paginator paging(Paginator paginator) {
		paginator.setTotal(dao.getTotalCount());
		paginator.setRows(dao.pagingQuery(paginator));
		return paginator;
	}

	public Poet get(String id) {
	    Poet poet = null;
		Integer intobj = new Integer(id);
		poet = dao.selectByPrimaryKey(intobj);
		return poet;
	}

	public void update(Poet poet) {
		dao.updateByPrimaryKeySelective(poet);
	}

	public void deleteBatch(List list) {
		dao.deleteBatch(list);
	}
	
	public int delete(String id) {
		int r=0;
		r = dao.deleteByPrimaryKey(new Integer(id));
		return r;
	}	

	public Paginator search(Paginator paginator, Poet poet) {
		PoetExample example = new PoetExample();
		String name = poet.getName();
		if (name!=null && !"".equals(name))
			example.or().andNameLike("%"+poet.getName()+"%");
		example.setOrderByClause("id asc");
		PaginatorEx paginatorex = new PaginatorEx(paginator.getPage(),paginator.getRowsperpage());
		paginatorex.setExample(example);
		
		paginator.setTotal(dao.countForSearch(example));
		paginator.setRows(dao.pagingQueryForSearch(paginatorex));
		return paginator;		
	}
}
