<@pp.dropOutputFile />
<#list model.classes.class as class>
<@pp.changeOutputFile name="${class.name}ServiceImpl.java" />
/**
 * @author ${class.author}
 */
package com.anegr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.anegr.dao.Paginator;
import com.anegr.dao.PaginatorEx;
import com.anegr.dao.${class.name}Mapper;
import com.anegr.domain.${class.name};
import com.anegr.domain.${class.name}Example;
import com.anegr.service.${class.name}Service;


@Service
public class ${class.name}ServiceImpl implements ${class.name}Service {
	private static final Logger logger = Logger.getLogger(${class.name}ServiceImpl.class);
	
	@Resource
	private ${class.name}Mapper dao;
	
	public int insert(${class.name} ${class.name?lower_case}) {
		return dao.insertSelective(${class.name?lower_case});
	}

	public Paginator paging(Paginator paginator) {
		paginator.setTotal(dao.getTotalCount());
		paginator.setRows(dao.pagingQuery(paginator));
		return paginator;
	}

	public ${class.name} get(String ${class.oid?lower_case}) {
	    ${class.name} ${class.name?lower_case} = null;
	    <#if class.oid.@type == "Integer">
		Integer intobj = new Integer(${class.oid?lower_case});
		${class.name?lower_case} = dao.selectByPrimaryKey(intobj);
		<#elseif class.oid.@type == "Long">
		Long intobj = new Long(${class.oid?lower_case});
		${class.name?lower_case} = dao.selectByPrimaryKey(intobj);
		<#elseif class.oid.@type == "String">
		${class.name?lower_case} = dao.selectByPrimaryKey(${class.oid?lower_case});
		<#else>
		//${class.name?lower_case} = dao.selectByPrimaryKey(${class.oid?lower_case});
		</#if>
		return ${class.name?lower_case};
	}

	public void update(${class.name} ${class.name?lower_case}) {
		dao.updateByPrimaryKeySelective(${class.name?lower_case});
	}

	public void deleteBatch(List list) {
		dao.deleteBatch(list);
	}
	
	public int delete(String id) {
		int r=0;
		<#if class.oid.@type == "Integer">
		r = dao.deleteByPrimaryKey(new Integer(id));
		<#elseif class.oid.@type == "Long">
		r = dao.deleteByPrimaryKey(new Long(id));
		<#elseif class.oid.@type == "String">
		r = dao.deleteByPrimaryKey(id);
		<#else>
		//r = dao.deleteByPrimaryKey(id);
		</#if>
		return r;
	}	

	public Paginator search(Paginator paginator, ${class.name} ${class.name?lower_case}) {
		${class.name}Example example = new ${class.name}Example();
<#list class.queryfields.field as f>
		${f.@type} ${f.@name} = ${class.name?lower_case}.get${f.@name?cap_first}();
	<#switch f.@type>
		<#case "String">
		if (${f.@name}!=null && !"".equals(${f.@name}))
			example.or().and${f.@name?cap_first}Like("%"+${class.name?lower_case}.get${f.@name?cap_first}()+"%");
			<#break>	
		<#case "java.util.Date">
		if (${f.@name}!=null)
			example.or().and${f.@name?cap_first}Between(${class.name?lower_case}.get${f.@name?cap_first}(),${class.name?lower_case}.get${f.@name?cap_first}());		
			<#break>
		<#default>
		if (${f.@name}!=null)
			example.or().and${f.@name?cap_first}EqualTo(${class.name?lower_case}.get${f.@name?cap_first}());
	</#switch>		
</#list>
		example.setOrderByClause("${class.tbkey} asc");
		PaginatorEx paginatorex = new PaginatorEx(paginator.getPage(),paginator.getRowsperpage());
		paginatorex.setExample(example);
		
		paginator.setTotal(dao.countForSearch(example));
		paginator.setRows(dao.pagingQueryForSearch(paginatorex));
		return paginator;		
	}
}
</#list>