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
		<div class="col-md-1 column">
		</div>
	</div>
</div>
	<br>
	<!--展示cost-->
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-1 column">
		</div>
		<div class="col-md-1 column">
			 <button type="button" class="btn btn-default">启用</button>
		</div>
		<div class="col-md-1 column">
			 <button type="button" class="btn btn-default">修改</button>
		</div>
		<div class="col-md-7 column">
		
		</div>
		<div class="col-md-1 column">
			 <button type="button" class="btn btn-default" onclick="location.href='to_add_cost.html';">新增</button>
		</div>
		<div class="col-md-1 column">
		</div>
	</div>
	<br>
	<div class="row clearfix">
		<div class="col-md-1 column">
		</div>
		<div class="col-md-10 column">
			<table class="table table-bordered table-hover table-condensed">
				<tbody>
					<tr>
						<td>
							资费ID
						</td>
						<td>
							资费名称
						</td>
						<td>
							基本时长
						</td>
						<td>
							基本费用
						</td>
						<td>
							单位费用
						</td>
						<td>
							创建时间
						</td>
						<td>
							开通时间
						</td>
						<td>
							状态
						</td>
						<td>
							
						</td>
					</tr>
					<c:set value="1" var="tmp"></c:set>
				<c:forEach items="${costs}" var="cost">
				<c:set value="${tmp+1 }" var="tmp"></c:set>
					<c:choose>
						<c:when test="${tmp%2==1}">
						<tr class="success">
						
						</c:when>
						<c:otherwise><tr><tr></c:otherwise>
					</c:choose>
				
					
					
				<!-- 	<tr class="success"> -->
						<td>
							${cost.id}
						</td>
						<td>
							${cost.name }
						</td>
						<td>
							${cost.baseDuration }
						</td>
						<td>
							${cost.baseCost }
						</td>
						<td>
							${cost.unitCost }
						</td>
						<td>
							${cost.createTime }
						</td>
						<td>
							${cost.startTime }
						</td>
						<td>
							${cost.costType }
						</td>
						<td>
							<input type="button" value="启用" class="btn btn-sm btn-success" />
							<input type="button" value="修改" class="btn btn-sm btn-success" />
							<input type="button" value="删除" class="btn btn-sm btn-success" />
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-1 column">
		</div>
	</div>
</div>
	<!--  分页显示-->
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-4 column">
		</div>
		<div class="col-md-4 column">
		</div>
		<div class="col-md-4 column">
			<ul class="pagination">
				<c:choose>
					<c:when test="${page==1 }">
						<li class="disabled">
						 <a href="#">首页</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
						 <a href="cost_list.html?page=1">首页</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${page==1 }">
						<li class="disabled">
						 <a href="#">上一页</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
						 <a href="cost_list.html?page=${page-1 }">上一页</a>
						</li>
					</c:otherwise>
				</c:choose>
				

				<li>
					  <a href="cost_list.html?page=${page }">${page }</a>
				</li>
				<c:choose>
					<c:when test="${page==pageNum }">
						<li class="disabled">
						 <a href="#">下一页</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
						 <a href="cost_list.html?page=${page+1 }">下一页</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${page==pageNum }">
						<li class="disabled">
						 <a href="#">尾页</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
						 <a href="cost_list.html?page=${pageNum }">尾页</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>
  </body>
</html>