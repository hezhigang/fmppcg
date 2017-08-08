<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>demo - 诗歌</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <link href="../css/dashboard.css" rel="stylesheet">
  </head>
  
  <body>
  <%@ include file="/common/navbar.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <div class="main">
<form id="poemForm" name="poemForm" class="form-horizontal" method="post" action="../poem/post.do">
<input id="poem_id" type="hidden" name="id" <c:if test="${not empty poem}">value='<c:out value="${poem.id}"/>'</c:if> />
<div class="form-group">
	<div class="input-group">
	   <span class="input-group-addon">诗人id：</span>
	   <input type="text" class="form-control" name="poetId" id="poem_poetId" placeholder="诗人id">
	</div>
</div>
<div class="form-group">
	<div class="input-group">
	   <span class="input-group-addon">标题：</span>
	   <input type="text" class="form-control" name="title" id="poem_title" placeholder="标题">
	</div>
</div>
<div class="form-group">
	<label>内容</label>
	<textarea class="form-control" id="poem_content" name="content" rows="3"></textarea>
</div>
<div class="form-group">
	<div class="input-group">
			<div class="input-group date form_date" data-date=""
				data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="poem_createdAt"
				data-link-format="yyyy-mm-dd hh:ii:ss">	
	   <span class="input-group-addon">创建时间：</span>
	   <input type="text" class="form-control" name="createdAt" id="poem_createdAt" readonly>
	   <span class="input-group-addon">
	     <span class="glyphicon glyphicon-calendar"></span>
	   </span>
	   </div>
	</div>
</div>
<div class="form-group">
	<div class="input-group">
			<div class="input-group date form_date" data-date=""
				data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="poem_updatedAt"
				data-link-format="yyyy-mm-dd hh:ii:ss">	
	   <span class="input-group-addon">修改时间：</span>
	   <input type="text" class="form-control" name="updatedAt" id="poem_updatedAt" readonly>
	   <span class="input-group-addon">
	     <span class="glyphicon glyphicon-calendar"></span>
	   </span>
	   </div>
	</div>
</div>
<div class="form-group">
	<button type="button" class="btn btn-primary btn-block" id="submitBtn">submit</button>
	<br/>
	<button type="button" class="btn btn-default btn-block" id="resetBtn">reset</button>
</div>
</form>        
        </div>
      </div>
    </div>
    
<script src="../bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="//cdn.ckeditor.com/4.5.6/basic/ckeditor.js"></script>
<%
request.setAttribute("vEnter", "\r\n");
%>
<script type="text/javascript">
function initForm() {
	<c:if test="${not empty poem}">
		$('#poem_id').val('<c:out value="${poem.id}"/>');
		$('#poem_poetId').val('<c:out value="${poem.poetId}"/>');
		$('#poem_title').val('<c:out value="${poem.title}"/>');
		$('#poem_content').val('<c:out value="${fn:replace(poem.content,vEnter,\"<br>\")}"/>');
		$('#poem_createdAt').val('<fmt:formatDate value="${poem.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/>');
		$('#poem_updatedAt').val('<fmt:formatDate value="${poem.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/>');
	</c:if>
}

$(function(){
	<c:if test="${not empty poem}">
	initForm();
	</c:if>
	$('#submitBtn').click(function() {
		$('#poemForm').submit();
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
	
		CKEDITOR.replace('poem_content');
});
</script>
</html>
