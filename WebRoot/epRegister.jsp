 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8">
<title>企业注册</title>
<link rel="stylesheet" type="text/css" href="css/userRegister.css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/epRegister.css">
<script src="js/epRegister.js"></script>
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
					"from" : "enterprise",
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
		    for(var i=0;i<value.length;i++){  
		         specialStr += value.substr(i, 1).replace(pattern, '');  
		    }  
		    if( specialStr == value){  
		        return true;  
		    }   
		    return false;  
		}
	);


	$(function() {
		$("#myform").validate({
			rules : {
				"en_city" : {
					"required" : true,
				},
				"en_name" : {
					"required" : true,
				},
				"en_username" : {
					"required" : true,
					"specialcharacter" : true,
					"checkUsername" : true
				},
				"en_password" : {
					"required" : true,
					"rangelength" : [ 6, 12 ]
				},
				"repassword" : {
					"required" : true,
					"rangelength" : [ 6, 12 ],
					"equalTo" : "#en_password"
				},
				"en_email" : {
					"required" : true,
					"email" : true
				}
			},
			messages : {
				"en_city" : {
					"required" : "城市名不能为空",
				},
				"en_name" : {
					"required" : "公司名不能为空",
				},
				"en_username" : {
					"required" : "用户名不能为空",
					"specialcharacter" : "不允许包含特殊字符",
					"checkUsername" : "用户名已存在"
				},
				"en_password" : {
					"required" : "密码不能为空",
					"rangelength" : "密码长度6-12位"
				},
				"repassword" : {
					"required" : "密码不能为空",
					"rangelength" : "密码长度6-12位",
					"equalTo" : "两次密码不一致"
				},
				"en_email" : {
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

	<%-- <div class="userReg">
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
						<td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
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
					<input type="submit" value="注册" name="submit" class="registerbutton">
					<!-- <input type="button" value="注册" name="" class="registerbutton"/> -->
				</div>

			</form>
			<p></p>

			<p style="text-align: center;">
				已有账号？立即<a href="#">登录</a>
			</p>
		</div>
	</div> --%>



	<form id="myform" class="form-horizontal"
		action="${pageContext.request.contextPath }/ERegisterServlet" method="post">
		<div class="epReg" id="DivReg">
			<div class="content">
				<p class="mytitle">企业注册</p>
				<table style="text-align: center;">
					<!-- <tr>
						<td>用户名：</td>
							<td><input type="text" class="form-control" id="user_name" name="user_name"
								placeholder="请输入用户名" value="u1"></td>
							<td>
						</td>
					</tr> -->
					<tr>
						<td>城&nbsp;&nbsp;&nbsp;&nbsp;市：</td>
						<td><input type="text" value="武汉" name="en_city" id="en_city" class="form-control"
							onclick="displayCity()"></td>
						<td></td>
					</tr>
					<tr>
						<td>公司名称：</td>
						<td><input type="text" class="form-control" id="en_name" name="en_name"
							placeholder="请输入用户名" value="u1"></td>
						<td></td>
					</tr>
					<tr>
						<td>用户名：</td>
						<td><input type="text" class="form-control" id="en_username" name="en_username"
							placeholder="请输入用户名" value="u1"></td>
						<td></td>
					</tr>
					<tr>
						<td>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
						<td><input type="email" class="form-control" id="inputEmail3" name="en_email"
							placeholder="Email" value="604737964@qq.com"></td>
						<td></td>
					</tr>
					<tr>
						<td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
						<td><input type="password" class="form-control" id="en_password" name="en_password"
							placeholder="请输入密码" value="123456"></td>
						<td></td>
					</tr>
					<tr>
						<td>确认密码：</td>
						<td><input type="password" class="form-control" id="confirmpwd" name="repassword"
							placeholder="请输入确认密码" value="123456"></td>
						<td></td>
					</tr>
				</table>
				<p></p>
				<div align="center">
					<input type="submit" value="注册" name="submit" class="registerbutton">
				</div>
			</div>
		</div>
	</form>
	<p></p>

	<p style="text-align: center;">
		已有账号？立即<a href="#">登录</a>
	</p>


	<!--divCity1为灰色背景div，divCity2为选择城市的弹框div-->
	<div class="divCity1" id="DivCity1"></div>
	<div class="divCity2" id="DivCity2">
		<div class="divCity2Close">
			<input type="button" name="关闭" onclick="closeCity()" />
		</div>
		<div class="divCity2Title">
			<div class="Title1">
				<h3>省份/直辖市</h3>
			</div>
			<div class="Title2">
				<h3>城市</h3>
			</div>
		</div>
		<div class="divProvince">
			<ul class="provinceUl" id="ProvinceUl">
				<li class="selected1">北京市</li>
				<li>天津市</li>
				<li>上海市</li>
				<li>重庆市</li>
				<li>河北省</li>
				<li>山西省</li>
				<li>台湾省</li>
				<li>辽宁省</li>
				<li>吉林省</li>
				<li>黑龙江省</li>
				<li>江苏省</li>
				<li>浙江省</li>
				<li>安徽省</li>
				<li>福建省</li>
				<li>江西省</li>
				<li>山东省</li>
				<li>河南省</li>
				<li>湖北省</li>
				<li>湖南省</li>
				<li>广东省</li>
				<li>甘肃省</li>
				<li>四川省</li>
				<li>贵州省</li>
				<li>海南省</li>
				<li>云南省</li>
				<li>青海省</li>
				<li>陕西省</li>
				<li>广西壮族自治区</li>
				<li>西藏自治区</li>
				<li>宁夏回族自治区</li>
				<li>新疆维吾尔自治区</li>
				<li>内蒙古自治区</li>
				<li>澳门特别行政区</li>
				<li>香港特别行政区</li>
			</ul>
		</div>
		<div class="divCityAndBut">
			<div class="divCity" id="DivCity">
				<div>
					<ul>
						<li>北京市</li>
					</ul>
				</div>
				<div class="cityHide">
					<ul>
						<li>天津市</li>
					</ul>
				</div>
				<div class="cityHide">
					<ul>
						<li>上海市</li>
					</ul>
				</div>
				<div class="cityHide">
					<ul>
						<li>重庆市</li>
					</ul>
				</div>
				<div class="cityHide">
					<ul>
						<li>石家庄市</li>
						<li>唐山市</li>
						<li>秦皇岛市</li>
						<li>邯郸市</li>
						<li>邢台市</li>
						<li>保定市</li>
						<li>张家口市</li>
						<li>承德市</li>
						<li>沧州市</li>
						<li>廊坊市</li>
						<li>衡水市</li>
					</ul>
				</div>
				<div class="cityHide">
					<ul>
						<li>太原市</li>
						<li>大同市</li>
						<li>阳泉市</li>
						<li>长治市</li>
						<li>晋城市</li>
						<li>朔州市</li>
						<li>晋中市</li>
						<li>运城市</li>
						<li>沂州市</li>
						<li>临汾市</li>
						<li>吕梁市</li>
					</ul>
				</div>
			</div>
			<div class="cityButton">
				<input type="button" name="" value="确定" onclick="chooseCity()" /> <input type="button" name=""
					value="取消" onclick="closeCity()" />
			</div>
		</div>
	</div>

	<!-- ------------------------------------------------- -->



	<!-- 引入footer.jsp -->
	<%-- <jsp:include page="/footer.jsp"></jsp:include> --%>
</body>
</html>




