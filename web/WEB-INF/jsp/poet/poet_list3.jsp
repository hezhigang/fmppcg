<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="pager" uri="/WEB-INF/tld/pager.tld"%>
<%@ include file="/common/header.jsp" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet" type="text/css">
<title>诗人</title>
<script type="text/javascript" src="../vendors/iscroll/iscroll.js"></script>
<script type="text/javascript" src="../js/util.js"></script>
<script type="text/javascript">
var start=<%=com.anegr.Constants.PullSize.POET%>,count=<%=com.anegr.Constants.PullSize.POET%>;
var hasLoadAll = false;
var myScroll;
//var viewportHeight = window.innerHeight;
//var bottomY = 0-viewportHeight;

function pullUpAction() {
	var el, li;
	el = document.getElementById('thelist');
	$.ajax({
	 type: "GET",
	 async: true,
	 url: "../poet/more.do",
	 data: {start:start,count:count},
	 dataType: "json",
	 success: function (jsonData) {
		 if (jsonData!=null && jsonData.length>0) {
			  var s = '';
			  var arr = [];
			  $(jsonData).each(function () {
			   li = document.createElement('li');
			   s = this.name;
			   li.innerHTML = s;
			   //li.innerText = s;
			   el.appendChild(li);
			  });
			  setTimeout(function () {myScroll.refresh();}, 500);
			  start+=count;			  
		 }
		 else {
			 hasLoadAll = true;
		 }
	 }
	});
}

function loaded() {
	myScroll = new IScroll('#wrapper', {
		preventDefault: false,
		mouseWheel: true,
		keyBindings: true,
		click: true,
		scrollbars: false,
		probeType: 1,
		momentum: true,
		snap: false,
		bindToWrapper: false
	});
	myScroll.on('scrollEnd', function() {
		if (this.directionY>0 && !hasLoadAll) {
			pullUpAction();
		}
	});
}

document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
</script>
<style type="text/css">
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

html {
	-ms-touch-action: none;	
}

body,ul,li {
	padding: 0;
	margin: 0;
	border: 0;	
}

body {
	font-size: 12px;
	font-family: ubuntu, helvetica, arial;
	overflow: hidden;	
}

#wrapper {
	position: absolute;
	z-index: 1;
	top: 0px;
	bottom: 0px;
	left: 0;
	width: 100%;
	background-repeat: round;
	background-size:100% 100%;
	overflow: hidden;
}

#scroller {
	position: absolute;
	z-index: 1;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	width: 100%;
	-webkit-transform: translateZ(0);
	-moz-transform: translateZ(0);
	-ms-transform: translateZ(0);
	-o-transform: translateZ(0);
	transform: translateZ(0);
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-text-size-adjust: none;
	-moz-text-size-adjust: none;
	-ms-text-size-adjust: none;
	-o-text-size-adjust: none;
	text-size-adjust: none;
}

#scroller ul {
	list-style: none;
	padding: 0;
	margin: 0;
	width: 100%;
	text-align: left;	
}

#scroller li {
	padding: 0px 10px;
	height: auto;
	/*
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	*/
	border-style: none;
	/*background-image:url('../img/sky3.jpg');*/
	/*background-repeat:no-repeat;*/
	font-size: 14px;
}

.row {
	margin-bottom: 5px;
}
</style>
</head>
<body onload="loaded()">
	<div id="wrapper">
		<div id="scroller">
			<ul id="thelist">
				<c:forEach items="${poetlist}" var="a" varStatus="status">
					<li>
					${a.name}
					</li>
				</c:forEach>
			</ul>					
		</div>
	</div>
<script src="../bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>