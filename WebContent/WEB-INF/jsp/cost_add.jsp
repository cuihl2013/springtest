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
	<script language="javascript" type="text/javascript">
	
		function checkName() {
			var costName = $("#costName").val();
			
			if (costName==null || costName=="") {
				$("#nameMsg").text("资费名称不能为空！");
				$("#nameMsg").addClass("text-danger");
				return;
			}
			
			$.post("checkCostName.html",{"name":costName},
					function(data){
				var repeat = data;
				if (repeat) {
					$("#nameMsg").text("资费名称重复请重新输入！");
					$("#nameMsg").addClass("text-danger");
				}else{
					$("#nameMsg").text("50长度的字母、数字、汉字和下划线的组合");
					$("#nameMsg").removeClass("text-danger");
				}
				
			});
		}
		
		function changeCostType(type){
			var inputArray = document.getElementById("cost_id").getElementsByTagName("input");
			 if (type == 1) {
                 inputArray[4].readOnly = true;
                 inputArray[4].value = "";
                 inputArray[4].className += " disabled";
                 inputArray[5].readOnly = false;
                 inputArray[6].readOnly = true;
                 inputArray[6].className += " disabled";
                 inputArray[6].value = "";
             }
             else if (type == 2) {
                 inputArray[4].readOnly = false;
                 inputArray[5].readOnly = false;
                 inputArray[6].readOnly = false;
             }
             else if (type == 3) {
                 inputArray[4].readOnly = true;
                 inputArray[4].value = "";
                 inputArray[4].className += " disabled";
                 inputArray[5].readOnly = true;
                 inputArray[5].value = "";
                 inputArray[5].className += " disabled";
                 inputArray[6].readOnly = false;
             }
		}
	
	</script>
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
		<div class="container" id="cost_id">
			<div class="row clearfix">
			<div class="col-md-4 column">
			</div>
			<div class="col-md-4 column">
			<form role="form" method="post" action="<c:url value="cost_add.html" />" >
				<div class="form-group">
					 <label>资费名称</label><input type="text" name="name" class="form-control" id="costName" onblur="checkName();" />
					<p id="nameMsg">50长度的字母、数字、汉字和下划线的组合</p>
				</div>
				<div class="form-group">
					 <label>资费类型</label>
					 <input type="radio" name="costType" value="1" onclick="changeCostType(1);" /><label>包月</label>
					 <input type="radio" name="costType" value="2" onclick="changeCostType(2);" /><label>套餐</label>
					 <input type="radio" name="costType" value="3" onclick="changeCostType(3);" /><label>计时</label>
				</div>
				<div class="form-group">
					 <label>基本时长</label><input name="baseDuration" type="text" class="form-control" id="" />
				</div>
				<div class="form-group">
					 <label>基本费用</label><input name="baseCost" type="text" class="form-control" id="" />
				</div>
				<div class="form-group">
					 <label>单位时长</label><input name="unitCost" type="text" class="form-control" id="" />
				</div>
				<div class="form-group">
					 <label>资费说明</label><textarea name="descr" class="form-control" rows="3"></textarea>
				</div>
				 <button type="submit" class="btn btn-default">保存</button>
				 <div class="validate_msg_short" id="nameMsg">50长度的字母、数字、汉字和下划线的组合</div>
				  <button type="button" class="btn btn-default">取消</button>
			</form>
		</div>
		<div class="col-md-4 column">
		</div>
		</div>
	</div>
  </body>
</html>