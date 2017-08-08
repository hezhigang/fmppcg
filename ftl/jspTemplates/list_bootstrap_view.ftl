<@pp.dropOutputFile />
<#list model.htmls.htmlui as webpage>
<@pp.changeOutputFile name="/${webpage.pojoName?lower_case}/${webpage.pojoName?lower_case}_list2.jsp" />
<#assign moduleNameEn=webpage.pojoName?lower_case>
<#assign fieldlist=webpage.fields.field>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="pager" uri="/WEB-INF/tld/pager.tld"%>
<%@ include file="/common/header.jsp" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>demo</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/dashboard.css" rel="stylesheet">
  </head>
<body>
<%@ include file="/common/navbar.jsp" %>
    
    <div class="container-fluid">
      <div class="row">
        <div class="main">
          <h2 class="sub-header">${webpage.moduleName}</h2>
		<a class="btn btn-primary btn-md" href="../${moduleNameEn}/add2.do"><span class="glyphicon glyphicon-plus"></span>添加</a>
          <div class="table-responsive">
            <table class="table table-condensed table-striped table-bordered table-hover">
              <thead>
                <tr>
				<#list fieldlist as f>
					<th>${f.@title}</th>
				</#list>                  
                  <th>&nbsp;</th>
                </tr>
              </thead>
              <tbody>            
<c:forEach items="${r"$"}{pg.rows}" var="a" varStatus="status">
<tr>
<#list fieldlist as f>
					    <#if f.@type != "datetime" && f.@type != "date">
						<td>${r"$"}{a.${f.@name}}</td>
						</#if>
					    <#if f.@type == "date">
						<td><fmt:formatDate value="${r"$"}{a.${f.@name}}" pattern="yyyy-MM-dd"/></td>
						</#if>
					    <#if f.@type == "datetime">
						<td><fmt:formatDate value="${r"$"}{a.${f.@name}}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</#if>												
</#list>
					<td>
						<a href="../${moduleNameEn}/edit2.do?${webpage.idField}=<c:out value="${r"$"}{a.${webpage.idField}}"/>">
							<button type="button" class="btn btn-warning btn-sm">修改</button>
						</a>						
					</td>				
</tr>
</c:forEach>
</tbody>
</table>
</div>
<form method="post" id="${moduleNameEn}_pagingForm" action="<%=path%>/${moduleNameEn}/list2.do"></form>
<pager:pagingbar pageSize="${r"$"}{pg.rowsperpage}" totalCount="${r"$"}{pg.total}" curPage="${r"$"}{pg.page}" formId="${moduleNameEn}_pagingForm"/>
        </div>
      </div>
    </div>
<script src="../bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
</#list>