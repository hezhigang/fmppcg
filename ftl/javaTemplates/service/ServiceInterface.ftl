<@pp.dropOutputFile />
<#list model.classes.class as class>
<@pp.changeOutputFile name="${class.name}Service.java" />
/**
 * @author ${class.author}
 */
package com.anegr.service;

import java.util.List;
import com.anegr.dao.Paginator;
import com.anegr.domain.${class.name};

public interface ${class.name}Service {
	int insert(${class.name} ${class.name?lower_case});
	
	Paginator paging(Paginator paginator);
	
	${class.name} get(String ${class.oid?lower_case});
	
	void update(${class.name} ${class.name?lower_case});
	
	void deleteBatch(List list);
	
	int delete(String id);
	
	Paginator search(Paginator paginator,${class.name} ${class.name?lower_case});
}
</#list>