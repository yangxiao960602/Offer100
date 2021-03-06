<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>普通用户注册</title>
<link rel="stylesheet" type="text/css" href="css/userRegister.css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<!-- 引入表单校验jquery插件 -->
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}

.error {
	color: red
}
</style>



<script type="text/javascript">

	//自定义校验规则
	$.validator.addMethod(
		//规则的名称
		"checkUsername",
		//校验的函数
		function(value, element, params) {

			//定义一个标志
			var flag = false;

			//value:输入的内容
			//element:被校验的元素对象
			//params：规则对应的参数值
			//目的：对输入的username进行ajax校验
			$.ajax({
				"async" : false,
				"url" : "${pageContext.request.contextPath}/checkUsername",
				"data" : {
					"from" : "user",
					"username" : value
				},
				"type" : "POST",
				"dataType" : "json",
				"success" : function(data) {
					flag = data.isExist;
				}
			});
			//返回false代表该校验器不通过
			return !flag;
		}
	);

	$.validator.addMethod(
		//规则的名称
		"specialcharacter",

		//校验的函数
		function(value, element, params) {
			//value:输入的内容
			//element:被校验的元素对象
			//params：规则对应的参数值
			//目的：对输入的username进行ajax校验
			var pattern = new RegExp("[`~!@#$^&*()=|{}':;,.<>/?~！@#￥……&*（）——|【】‘；：”“'。，、？%+ 　\"\\\\]");
			var specialStr = "";
			for (var i = 0; i < value.length; i++) {
				specialStr += value.substr(i, 1).replace(pattern, '');
			}
			if (specialStr == value) {
				return true;
			}
			return false;
		}
	);


	$(function() {
		$("#myform").validate({
			rules : {
				"user_name" : {
					"required" : true,
					"specialcharacter" : true,
					"checkUsername" : true
				},
				"user_password" : {
					"required" : true,
					"rangelength" : [ 6, 12 ]
				},
				"repassword" : {
					"required" : true,
					"rangelength" : [ 6, 12 ],
					"equalTo" : "#user_password"
				},
				"user_email" : {
					"required" : true,
					"email" : true
				}
			},
			messages : {
				"user_name" : {
					"required" : "用户名不能为空",
					"specialcharacter" : "不允许包含特殊字符",
					"checkUsername" : "用户名已存在"
				},
				"user_password" : {
					"required" : "密码不能为空",
					"rangelength" : "密码长度6-12位"
				},
				"repassword" : {
					"required" : "密码不能为空",
					"rangelength" : "密码长度6-12位",
					"equalTo" : "两次密码不一致"
				},
				"email" : {
					"required" : "邮箱不能为空",
					"email" : "邮箱格式不正确"
				}
			}
		});
	});
</script>

</head>
<body>

	<!-- 引入header.jsp -->
	<%-- <jsp:include page="/header.jsp"></jsp:include> --%>

	<%-- <div class="container" style="width: 100%; background: url('image/regist_bg.jpg');">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8"
				style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<font>会员注册</font>USER REGISTER
				<form id="myform" class="form-horizontal"
					action="${pageContext.request.contextPath }/URegisterServlet" method="post"
					style="margin-top: 5px;">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="user_name" name="user_name" placeholder="请输入用户名"
								value="u1">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="user_password" name="user_password"
								placeholder="请输入密码" value="123456">
						</div>
					</div>
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="confirmpwd" name="repassword"
								placeholder="请输入确认密码" value="123456">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="inputEmail3" name="user_email"
								placeholder="Email" value="604737964@qq.com">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" width="100" value="注册" name="submit"
								style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
						</div>
					</div>
				</form>
			</div>

			<div class="col-md-2"></div>

		</div>
	</div> --%>



	<!-- ------------------------------------------------- -->

	<div class="userReg">
		<div class="content">
			<p class="mytitle">用户注册</p>
			<form id="myform" class="form-horizontal"
				action="${pageContext.request.contextPath }/URegisterServlet" method="post"
				style="margin-top: 5px;">
				<table style="text-align: center;">
					<tr>
						<td>用户名：</td>
						<td><input type="text" class="form-control" id="user_name" name="user_name"
							placeholder="请输入用户名" value="u1"></td>
						<td></td>
					</tr>
					<tr>
						<td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
						<td><input type="password" class="form-control" id="user_password" name="user_password"
							placeholder="请输入密码" value="123456"></td>
						<td></td>
					</tr>
					<tr>
						<td>确认密码：</td>
						<td><input type="password" class="form-control" id="confirmpwd" name="repassword"
							placeholder="请输入确认密码" value="123456"></td>
						<td></td>
					</tr>


					<tr>
						<td>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
						<td><input type="email" class="form-control" id="inputEmail3" name="user_email"
							placeholder="Email" value="604737964@qq.com"></td>
						<td></td>
					</tr>
				</table>

				<div align="center">
					<input type="submit" value="普通用户注册" name="submit" class="registerbutton">
					<!-- <input type="button" value="注册" name="" class="registerbutton"/> -->
				</div>

			</form>
			<p></p>

			<p style="text-align: center;">
				已有账号？立即<a href="#">登录</a>
			</p>
		</div>
	</div>

	<!-- ------------------------------------------------- -->



	<!-- 引入footer.jsp -->
	<%-- <jsp:include page="/footer.jsp"></jsp:include> --%>
</body>
</html>




