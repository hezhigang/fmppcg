<@pp.dropOutputFile />
<#list model.htmls.htmlui as webpage>
<@pp.changeOutputFile name="/${webpage.pojoName?lower_case}/${webpage.pojoName?lower_case}_form.jsp" />
<#assign moduleNameEn=webpage.pojoName?lower_case>
<#assign fieldlist=webpage.fields.field>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>demo - ${webpage.moduleName}</title>
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
            <li><a href="logout">logout</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="">module 1</a></li>
            <li><a href="">module 2</a></li>
            <li><a href="">module 3</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<form id="${moduleNameEn}Form" name="${moduleNameEn}Form" class="form-horizontal" method="post" action="../${moduleNameEn}/post.do">
<input id="${moduleNameEn}_${webpage.idField}" type="hidden" name="${webpage.idField}" <c:if test="${r"$"}{not empty ${moduleNameEn}}">value='<c:out value="${r"$"}{${moduleNameEn}.${webpage.idField}}"/>'</c:if> />
<#list fieldlist as f>
<#if f.@name != "${webpage.idField}">
<#switch f.@type>
<#case "text">
<div class="form-group">
	<div class="input-group">
	   <span class="input-group-addon">${f.@title}：</span>
	   <input type="text" class="form-control" name="${f.@name}" id="${moduleNameEn}_${f.@name}" placeholder="${f.@title}">
	</div>
</div>
<#break>
<#case "datetime">
<div class="form-group">
	<div class="input-group">
			<div class="input-group date form_date" data-date=""
				data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="${moduleNameEn}_${f.@name}"
				data-link-format="yyyy-mm-dd hh:ii:ss">	
	   <span class="input-group-addon">${f.@title}：</span>
	   <input type="text" class="form-control" name="${f.@name}" id="${moduleNameEn}_${f.@name}" readonly>
	   <span class="input-group-addon">
	     <span class="glyphicon glyphicon-calendar"></span>
	   </span>
	   </div>
	</div>
</div>
<#break>
<#case "date">
<div class="form-group">
	<div class="input-group">
			<div class="input-group date form_date" data-date=""
				data-date-format="yyyy-mm-dd" data-link-field="${moduleNameEn}_${f.@name}"
				data-link-format="yyyy-mm-dd">	
	   <span class="input-group-addon">${f.@title}：</span>
	   <input type="text" class="form-control" name="${f.@name}" id="${moduleNameEn}_${f.@name}" readonly>
	   <span class="input-group-addon">
	     <span class="glyphicon glyphicon-calendar"></span>
	   </span>
	   </div>
	</div>
</div>
<#break>
<#case "textarea">
<div class="form-group">
	<label>${f.@title}</label>
	<textarea class="form-control" id="${moduleNameEn}_${f.@name}" name="${f.@name}" rows="3"></textarea>
</div>
<#break>
<#default>
<div class="form-group">
	<div class="input-group">
	   <span class="input-group-addon">${f.@title}：</span>
	   <input type="text" class="form-control" name="${f.@name}" id="${moduleNameEn}_${f.@name}" placeholder="${f.@title}">
	</div>
</div>
</#switch>
</#if>
</#list>
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
	<c:if test="${r"$"}{not empty ${moduleNameEn}}">
	<#list fieldlist as f>
		<#switch f.@type>
			<#case "date">
		$('#${moduleNameEn}_${f.@name}').val('<fmt:formatDate value="${r"$"}{${moduleNameEn}.${f.@name}}" pattern="yyyy-MM-dd"/>');
			<#break>
			<#case "datetime">
		$('#${moduleNameEn}_${f.@name}').val('<fmt:formatDate value="${r"$"}{${moduleNameEn}.${f.@name}}" pattern="yyyy-MM-dd HH:mm:ss"/>');
			<#break>				
			<#case "textarea">
		$('#${moduleNameEn}_${f.@name}').val('<c:out value="${r"$"}{fn:replace(${moduleNameEn}.${f.@name},vEnter,\"<br>\")}"/>');
			<#break>
			<#default>
		$('#${moduleNameEn}_${f.@name}').val('<c:out value="${r"$"}{${moduleNameEn}.${f.@name}}"/>');
		</#switch>
	</#list>
	</c:if>
}

$(function(){
	<c:if test="${r"$"}{not empty ${moduleNameEn}}">
	initForm();
	</c:if>
	$('#submitBtn').click(function() {
		$('#${moduleNameEn}Form').submit();
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
	
	<#list fieldlist as f>
		<#if f.@type == "textarea">
		CKEDITOR.replace('${moduleNameEn}_${f.@name}');
		</#if>
	</#list>	
});
</script>
</html>
</#list>