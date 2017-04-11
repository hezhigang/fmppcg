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
import com.anegr.dao.PoemMapper;
import com.anegr.domain.Poem;
import com.anegr.domain.PoemExample;
import com.anegr.service.PoemService;


@Service
public class PoemServiceImpl implements PoemService {
	private static final Logger logger = Logger.getLogger(PoemServiceImpl.class);
	
	@Resource
	private PoemMapper dao;
	
	public int insert(Poem poem) {
		return dao.insertSelective(poem);
	}

	public Paginator paging(Paginator paginator) {
		paginator.setTotal(dao.getTotalCount());
		paginator.setRows(dao.pagingQuery(paginator));
		return paginator;
	}

	public Poem get(String id) {
	    Poem poem = null;
		Integer intobj = new Integer(id);
		poem = dao.selectByPrimaryKey(intobj);
		return poem;
	}

	public void update(Poem poem) {
		dao.updateByPrimaryKeySelective(poem);
	}

	public void deleteBatch(List list) {
	    //MyBatis的DAO接口PoemMapper需要实现以下方法
		dao.deleteBatch(list);
	}
	
	public int delete(String id) {
		int r=0;
		r = dao.deleteByPrimaryKey(new Integer(id));
		return r;
	}	

	public Paginator search(Paginator paginator, Poem poem) {
	    //进行查询条件处理
		PoemExample example = new PoemExample();
		String title = poem.getTitle();
		if (title!=null && !"".equals(title))
			example.or().andTitleLike("%"+poem.getTitle()+"%");
//		String content = poem.getContent();
//		if (content!=null && !"".equals(content))
//			example.or().andc("%"+poem.getContent()+"%");
		example.setOrderByClause("id desc");
		PaginatorEx paginatorex = new PaginatorEx(paginator.getPage(),paginator.getRowsperpage());
		paginatorex.setExample(example);
		
		//MyBatis的DAO接口PoemMapper需要实现以下方法
		paginator.setTotal(dao.countForSearch(example));
		paginator.setRows(dao.pagingQueryForSearch(paginatorex));
		return paginator;		
	}
}
