<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>demo - 诗人</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
            <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"> </span></a></li>
            <li><a href="../logout">注销</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="../poem/list2.do">诗歌</a></li>
            <li><a href="../poet/list2.do">诗人</a></li>
            <li><a href="">功能模块3</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<form id="poetForm" name="poetForm" class="form-horizontal" method="post" action="../poet/post.do">
<input id="poet_id" type="hidden" name="id" <c:if test="${not empty poet}">value='<c:out value="${poet.id}"/>'</c:if> />
<div class="form-group">
	<div class="input-group">
	   <span class="input-group-addon">姓名：</span>
	   <input type="text" class="form-control" name="name" id="poet_name" placeholder="姓名">
	</div>
</div>
<div class="form-group">
	<div class="input-group">
			<div class="input-group date form_date" data-date=""
				data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="poet_createdAt"
				data-link-format="yyyy-mm-dd hh:ii:ss">	
	   <span class="input-group-addon">创建时间：</span>
	   <input type="text" class="form-control" name="createdAt" id="poet_createdAt" readonly>
	   <span class="input-group-addon">
	     <span class="glyphicon glyphicon-calendar"></span>
	   </span>
	   </div>
	</div>
</div>
<div class="form-group">
	<div class="input-group">
			<div class="input-group date form_date" data-date=""
				data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="poet_updatedAt"
				data-link-format="yyyy-mm-dd hh:ii:ss">	
	   <span class="input-group-addon">修改时间：</span>
	   <input type="text" class="form-control" name="updatedAt" id="poet_updatedAt" readonly>
	   <span class="input-group-addon">
	     <span class="glyphicon glyphicon-calendar"></span>
	   </span>
	   </div>
	</div>
</div>
<div class="form-group">
	<button type="button" class="btn btn-primary btn-block" id="submitBtn">提交</button>
	<br/>
	<button type="button" class="btn btn-default btn-block" id="resetBtn">清空</button>
</div>
</form>        
        </div>
      </div>
    </div>
    
<script src="../bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<%
request.setAttribute("vEnter", "\r\n");
%>
<script type="text/javascript">
function initForm() {
	<c:if test="${not empty poet}">
		$('#poet_id').val('<c:out value="${poet.id}"/>');
		$('#poet_name').val('<c:out value="${poet.name}"/>');
		$('#poet_createdAt').val('<fmt:formatDate value="${poet.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/>');
		$('#poet_updatedAt').val('<fmt:formatDate value="${poet.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>');
	</c:if>
}

$(function(){
	<c:if test="${not empty poet}">
	initForm();
	</c:if>
	$('#submitBtn').click(function() {
		$('#poetForm').submit();
	});
	$('.form_date').datetimepicker({
		language : 'zh-CN',
		weekStart : 1,
		todayBtn : true,
		autoclose : true,
		todayHighlight : true,
		startView : 2,
		minView : 2,
		forceParse : false
	});
	$('#gl').click(function() {
		$('#datetimepicker4').datetimepicker({
			pickTime : false
		});
	});
	
});
</script>
</html>
