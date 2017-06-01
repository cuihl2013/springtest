<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title></title>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
   <body>
  	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-1 column">
		</div>
		<div class="col-md-10 column">
			<ul class="nav nav-tabs">
				<li class="disabled">
					 <a href="#">主页</a>
				</li>
				<li>
					 <a href="#">角色管理</a>
				</li>
				<li class="disabled">
					 <a href="#">管理员</a>
				</li>
				<li class="active">
					 <a href="#">资费管理</a>
				</li>
				<li class="disabled">
					 <a href="./login.jsp">账务账号</a>
				</li>
				<li class="disabled">
					 <a href="#">业务账号</a>
				</li>
				<li class="disabled">
					 <a href="#">账单管理</a>
				</li>
				<li class="disabled">
					 <a href="#">报表</a>
				</li>
				<li class="disabled">
					 <a href="#">个人信息</a>
				</li>
				<li class="disabled">
					 <a href="#">修改密码</a>
				</li>
			</ul>
		</div>
		<br><br><br>
		<!-- 新增资费 -->
		<div class="container">
			<div class="row clearfix">
			<div class="col-md-4 column">
			</div>
			<div class="col-md-4 column">
			<form role="form">
				<div class="form-group">
					 <label>资费名称</label><input type="text" name="cost.name" class="form-control" id="" />
				</div>
				<div class="form-group">
					 <label>资费类型</label>
					 <input type="radio" name="cost.name" value="0"/><label>包月</label>
					 <input type="radio" name="cost.name" value="1"/><label>套餐</label>
					 <input type="radio" name="cost.name" value="2"/><label>计时</label>
				</div>
				<div class="form-group">
					 <label>基本时长</label><input name="cost.baseDuration" type="text" class="form-control" id="" />
				</div>
				<div class="form-group">
					 <label>基本费用</label><input name="cost.baseCost" type="text" class="form-control" id="" />
				</div>
				<div class="form-group">
					 <label>单位时长</label><input name="cost.unitCost" type="text" class="form-control" id="" />
				</div>
				<div class="form-group">
					 <label>资费说明</label><textarea name="cost.descr" class="form-control" rows="3"></textarea>
				</div>
				 <button type="submit" class="btn btn-default">保存</button>
				  <button type="button" class="btn btn-default">取消</button>
			</form>
		</div>
		<div class="col-md-4 column">
		</div>
		</div>
	</div>
  </body>
</html>