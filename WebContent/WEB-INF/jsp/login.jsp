<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录系统</title>
	<script src=""></script>
    <!-- Bootstrap -->
   <!--  <link type="text/css" rel="stylesheet" media="all" href="/css/bootstrap.css" />
    <script type="text/javascript" src="../js/bootstrap.js"></script>
    <script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script> -->
   	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <body>
  	<br><br><br><br><br><br><br><br><br><br>
  	<div class="container">
	<div class="row clearfix">
		<div class="col-md-4 column">
		</div>
		<div class="col-md-3 column">
			<form role="form" action="<c:url value="loginCheck.html"/>" method="post">
				<div class="form-group">
					 <label for="exampleInputEmail1">用户名</label><input name="adminCode" type="text" class="form-control" id="exampleInputEmail1" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">密码</label><input name="password" type="password" class="form-control" id="exampleInputPassword1" />
				</div>
				<div class="checkbox">
					 <label><input type="checkbox" />记住密码</label>
					 <c:if test="${!empty error}">
					 	<p class="text-danger"><c:out value="${error}"/></p>
					 </c:if>
				</div> <button type="submit" class="btn btn-default">登录</button>
			</form>
		</div>
		<div class="col-md-5 column">
		</div>
	</div>
</div>
  </body>
</html>
