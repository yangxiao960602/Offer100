<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/userlogin.css">

<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />

<style>

</style>
</head>
<body>

	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>

	<!-- ----------------------------------------------- -->


	<!-- <input type="hidden" name="method" value="login"> -->
	<div class="login">
		<p class="mytitle">欢迎登录Offer100系统！</p>
		<div class="content">
			<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/user">
			
				<input type="hidden" name="method" value="login">
			
				<table style="text-align: center;">
					<tr>
						<td>登录名：</td>
						<!-- <td colspan="2"><input type="text" placeholder="用户名/邮箱" /></td> -->
						<td colspan="2"><input type="text" class="form-control" id="username" name="username"
							placeholder="用户名/邮箱"></td>
						<td></td>
					</tr>
					<tr>
						<td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
						<!-- <td colspan="2"><input type="text" /></td> -->
						<td colspan="2"><input type="password" class="form-control" id="inputPassword3"
							name="password" placeholder="请输入密码"></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2" >
							<label class="radio-inline"> 
								<input type="radio" name="usertype" id="user" value="user" >普通用户
							</label> 
							<label class="radio-inline"> 
								<input type="radio" name="usertype" id="enterprise" value="enterprise">企业用户
							</label>
							<label class="error" for="sex" style="display:none ">请选择一种登录类型</label>
						</td>
						
					</tr>
					<!-- <tr>
						<td>验证码：</td>
						<td><input type="text" style="width:80px;" /></td>
						<td style="width:80px;"><img src="/i/eg_tulip.jpg" /></td>
					</tr> -->
				</table>
				<div align="center" >
					<!-- <input type="submit" width="100" value="登录" name="submit"
					style="background: url('./images/login.gif') no-repeat scroll 0 0 
					rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;"> -->
					<input type="submit" value="登录" name="submit" class="loginbutton" />
				</div>
			</form>
			<p></p>
			<p style="text-align: center;">
				没有账号？立即<a href="#">注册</a>
			</p>
		</div>
	</div>

	<!-- ----------------------------------------------- -->

	<!-- <form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/user">
	
		<input type="hidden" name="method" value="login">
	
		<div class="form-group">
			<label for="username" class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="inputPassword3" name="password"
					placeholder="请输入密码">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">验证码</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="inputPassword3" placeholder="请输入验证码">
			</div>
			<div class="col-sm-3">
				<img src="./image/captcha.jhtml" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<div class="checkbox">
					<label> <input type="checkbox" name="autoLogin" value="autoLogin"> 自动登录
					</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input type="checkbox"> 记住用户名
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" width="100" value="登录" name="submit"
					style="background: url('./images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
			</div>
		</div>
	</form> -->

	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>