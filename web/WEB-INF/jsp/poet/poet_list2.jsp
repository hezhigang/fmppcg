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
          <h2 class="sub-header">诗人</h2>
		<a class="btn btn-primary btn-md" href="../poet/add2.do"><span class="glyphicon glyphicon-plus"></span>添加</a>
          <div class="table-responsive">
            <table class="table table-condensed table-striped table-bordered table-hover">
              <thead>
                <tr>
					<th>序号</th>
					<th>姓名</th>
					<th>创建时间</th>
					<th>修改时间</th>
                  <th>&nbsp;</th>
                </tr>
              </thead>
              <tbody>            
<c:forEach items="${pg.rows}" var="a" varStatus="status">
<tr>
						<td>${a.id}</td>
						<td>${a.name}</td>
						<td><fmt:formatDate value="${a.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${a.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<a href="../poet/edit2.do?id=<c:out value="${a.id}"/>">
							<button type="button" class="btn btn-warning btn-sm">修改</button>
						</a>						
					</td>				
</tr>
</c:forEach>
</tbody>
</table>
</div>
<form method="post" id="poet_pagingForm" action="<%=path%>/poet/list2.do"></form>
<pager:pagingbar pageSize="${pg.rowsperpage}" totalCount="${pg.total}" curPage="${pg.page}" barStyle="complex" formId="poet_pagingForm"/>
        </div>
      </div>
    </div>
<script src="../bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
