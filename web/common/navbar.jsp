 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a href="../poem/list2.do" class="navbar-brand">唐诗</a>
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
          <ul class="nav navbar-nav">
            <li>
              <a href="../poem/list2.do">诗歌</a>
            </li>
            <li>
              <a href="../poet/list2.do">诗人</a>
            </li>                                  
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li>
	          <form class="navbar-form navbar-right">
				<div class="input-group">
					<input type="text" name="kw" class="form-control" value="" style="border-radius: 0px !important;">
					<span class="input-group-btn">
						<button id="queryBtn" class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> 搜索</button>
					</span>
				</div>
	          </form>
            </li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="my">我的帐号 <span class="caret"></span></a>
              <ul class="dropdown-menu" aria-labelledby="my">
	            <li><a href="#"><span class="glyphicon glyphicon-alert" aria-hidden="true"> 修改密码</a></li>
	            <li class="divider"></li>
	            <li><a href="#"><span class="glyphicon glyphicon-log-out" aria-hidden="true"> 注销</a></li>
              </ul>
            </li>
          </ul>          
        </div>        
      </div>
    </div>