<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="pager" uri="/WEB-INF/tld/pager.tld"%>
<%@ include file="/common/header.jsp" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>demo - 诗人</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/dashboard.css" rel="stylesheet">
  </head>
<body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">demo</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a></li>
            <li><a href="../logout">注销</a></li>
          </ul>
        </div>
      </div>
    </nav>
    
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li ><a href="../poem/list2.do">诗歌</a></li>
            <li class="active"><a href="#">诗人</a></li>
            <li><a href="#">功能模块3</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
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
<pager:pagingbar barStyle="complex" pageSize="${pg.rowsperpage}" totalCount="${pg.total}" curPage="${pg.page}" formId="poet_pagingForm"/>
        </div>
      </div>
    </div>
<script src="../bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
