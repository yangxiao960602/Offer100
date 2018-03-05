<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>
<script src="js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/index.css">
<script src="js/bootstrap.min.js"></script>

</head>
<body>
	<div style="background-color:#ee2c2c;height:30px">
		<div class="row">
			<div class="col-sm-2 col-sm-offset-9" style="margin-top:5px">

				<button type="button" class="b" onclick="window.location.href = 'userRegister.jsp'">普通用户注册</button>
				<button type="button" class="b" onclick="window.location.href = 'epRegister.jsp'">企业注册</button>

			</div>
		</div>

		<%-- <jsp:include page="/header.jsp"></jsp:include> --%>
	</div>

	<!-- 导航栏 -->
	<div class="row">
		<div class="col-sm-offset-1 col-sm-1">
			<img src="img/lo.png" style="width:100px;margin-top:20px">
		</div>
		<div class="navg col-sm-offset-1 col-sm-7">
			<ul class="nav nav-pills nav-justified">
				<li><a href="index.jsp" style="color:#ee2c2c;border-bottom:solid 2px #ee2c2c"><h3>首页</h3></a></li>
				<li><a href="epCerti.jsp"><h3>职位搜索</h3></a></li>
				<li><a href="campus.jsp"><h3>校园招聘</h3></a></li>
				<li><a href="jobDetail.jsp"><h3>职场资讯</h3></a></li>
				<li><a href="#"><h3>
							个人中心<span class="caret"></span>
						</h3></a>
					<ul style="min-width:100%;margin-top:0px;z-index:10;">
						<li><a href="ucOffer.jsp">简历中心</a></li>
						<li><a href="ucCollection.jsp">我的收藏</a></li>
						<li><a href="#">我的申请</a></li>
						<li><a href="#">安全中心</a></li>
					</ul></li>
			</ul>
		</div>
	</div>

	<div class=row
		style="height:300px;margin-top:20px;background:url(img/index/index-bg.jpg)no-repeat;background-repeat:no-repeat;background-size:100% 100%;">
		<div class="col-sm-offset-2 col-sm-8">
			<div class="row img-bgcolor" style="margin-top:30px">
				<div class="col-sm-8" style="border:solid 1px grey;height:200px;margin-top:30px">
					<div class="row" style="margin-top:80px">
						<div class="col-sm-2">
							<div class="btn-group">
								<!--style ="position:absolute;top:40%;left:10%"  -->
								<select style="min-width:100%;margin-top:0px;height:33px;margin-left:10px;">
									<option>公司</option>
									<option>企业</option>
								</select>
							</div>
						</div>
						<input class="col-sm-8" type="text" placeholder="请输入公司或职位名称" style="height:35px" />
						<div class="col-sm-2">
							<button type="button" class="btn" style="background-color:#ee2c2c;color:#fff">搜索</button>
						</div>
					</div>
				</div>
				<div class="col-sm-offset-1 col-sm-3" style="border:solid 1px grey;height:200px;margin-top:30px">
					<div class="row">
						<img src="img/head.jpg" style="	border-radius:50%;width:50%;margin-left:50px;margin-top:10px">
						<!-- 保证图片是正方形 -->
					</div>
					<div class="row" style="margin-top:30px;">
						<c:if test="${empty user }">
							<c:if test="${empty enterprise }">
								<!-- <li><a href="login.jsp">登录</a></li>
								<li><a href="userRegister.jsp">求职者注册</a></li>
								<li><a href="epRegister.jsp">企业注册</a></li> -->
								<div class="col-sm-offset-1 col-sm-5">
									<button type="button" class="btn" style="background-color:#fff;border:solid 1px grey;"
										onclick="window.location.href = 'login.jsp'">登录</button>
								</div>
								<!-- <div class="col-sm-5">
									<button type="button" class="btn" style="background-color:#fff;border:solid 1px grey;" 
										onclick = "window.location.href = 'userRegister.jsp'">注册</button>
								</div> -->
							</c:if>
						</c:if>

						<c:choose>
							<c:when test="${!empty user}">
								<li style="color:red">欢迎您，${user.user_name}</li>
								<li><a href="${pageContext.request.contextPath }/user?method=logout">退出</a></li>
							</c:when>

							<c:when test="${!empty enterprise}">
								<li style="color:red">欢迎您，${enterprise.en_username}</li>
								<li><a href="${pageContext.request.contextPath }/user?method=logout">退出</a></li>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="col-sm-offset-2 col-sm-8" style="margin-top:60px">
		<div class="row" style="border:solid 1px grey;height:300px">
			<div class="col-sm-12">
				<h4>热门职位</h4>
				<hr style="border:solid 0.5px grey" />
			</div>
			<div class="col-sm-12">
				<div class="row">
					<div class="margin1">
						<div class="row" style="margin-top:10px;padding:0px;text-align:center;">互联网</div>
					</div>
					<div class="margin2">
						<div class="row" style="margin-top:10px;padding:0px;text-align:center;">金融/投资</div>
					</div>
					<div class="margin3">
						<div class="row" style="margin-top:10px;padding:0px;text-align:center;">房地产</div>
					</div>
				</div>
				<div class="row">
					<div class="margin4">
						<div class="row" style="margin-top:50px;">
							<div class="padd1">技术总监</div>
							<div class="padd2">美工设计</div>
						</div>
						<div class="row" style="margin-top:30px;">
							<div class="padd1">运营主管</div>
							<div class="padd2">行政文员</div>
						</div>
						<div class="row" style="margin-top:30px;">
							<div class="padd1">人事主管</div>
							<div class="padd2">文案策划</div>
						</div>
						<div class="row" style="margin-top:30px;">
							<div class="padd1">前&nbsp;&nbsp;端</div>
							<div class="padd2">平面设计</div>
						</div>
						<div class="row" style="margin-top:30px;">
							<div class="padd1">java后台</div>
							<div class="padd2">产品经理</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="margin6">
						<div class="row" style="margin-top:50px;">
							<div class="padd1">放映主管</div>
							<div class="padd2">人力资源</div>
						</div>
						<div class="row" style="margin-top:30px;">
							<div class="padd1">销售助理</div>
							<div class="padd2">置业顾问</div>
						</div>
						<div class="row" style="margin-top:30px;">
							<div class="padd1">会计主管</div>
							<div class="padd2">运营主管</div>
						</div>
						<div class="row" style="margin-top:30px;">
							<div class="padd1">行政主管</div>
							<div class="padd2">财务/会计</div>
						</div>
						<div class="row" style="margin-top:30px;">
							<div class="padd1">房产经理</div>
							<div class="padd2">主管会计</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="margin5">
						<div class="row" style="margin-top:50px;">
							<div class="padd1">新媒体运营</div>
							<div class="padd2">客户经理</div>
						</div>
						<div class="row" style="margin-top:30px;">
							<div class="padd1">投资顾问</div>
							<div class="padd2">经理助理</div>
						</div>
						<div class="row" style="margin-top:30px;">
							<div class="padd1">信贷销售</div>
							<div class="padd2">人事专员</div>
						</div>
						<div class="row" style="margin-top:30px;">
							<div class="padd1">市场总监</div>
							<div class="padd2">客服专员</div>
						</div>
						<div class="row" style="margin-top:30px;">
							<div class="padd1">行政前台</div>
							<div class="padd2">营销经理</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="border:solid 1px grey;margin-top:70px;height:300px;">
			<div class="col-sm-12">
				<h4>热门公司</h4>
				<hr style="border:solid 0.5px grey" />
			</div>
			<div class="col-sm-12">
				<div class="row">
					<div class="pic1">
						<div class="row">
							<a href="http://www.maigoo.com/maigoocms/special/it/170QQ.html"><img
								src="img/index/pic1.gif" style="border:solid 1px grey;"></a>
						</div>
					</div>
					<div class="pic2">
						<div class="row">
							<a href="http://www.alibabagroup.com/cn/global/home"><img src="img/index/pic2.gif"
								style="border:solid 1px grey;"></a>
						</div>
					</div>
					<div class="pic3">
						<div class="row">
							<a href="http://www.maigoo.com/maigoocms/special/it/170baidu.html"><img
								src="img/index/pic3.gif" style="border:solid 1px grey;"></a>
						</div>
					</div>
					<div class="pic4">
						<div class="row">
							<a href="http://www.maigoo.com/maigoocms/special/services/170jingdong.html"><img
								src="img/index/pic4.gif" style="border:solid 1px grey;"></a>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top:70px;">
					<div class="pic1">
						<div class="row">
							<a href="http://www.maigoo.com/maigoocms/special/it/125huawei.html"><img
								src="img/index/pic5.gif" style="border:solid 1px grey;"></a>
						</div>
					</div>
					<div class="pic2">
						<div class="row">
							<a href="http://www.maigoo.com/brand/15567.html"><img src="img/index/pic6.gif"
								style="border:solid 1px grey;"></a>
						</div>
					</div>
					<div class="pic3">
						<div class="row">
							<a href="http://www.maigoo.com/brand/12487.html"><img src="img/index/pic7.gif"
								style="border:solid 1px grey;"></a>
						</div>
					</div>
					<div class="pic4">
						<div class="row">
							<a href="http://www.maigoo.com/maigoocms/special/it/170meituan.html"><img
								src="img/index/pic8.gif" style="border:solid 1px grey;"></a>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top:70px;">
					<div class="pic1">
						<div class="row">
							<a href="https://www.antfin.com/"><img src="img/index/pic9.gif"
								style="border:solid 1px grey;"></a>
						</div>
					</div>
					<div class="pic2">
						<div class="row">
							<a href="http://www.maigoo.com/maigoocms/special/it/055qh.html"><img
								src="img/index/pic10.gif" style="border:solid 1px grey;"></a>
						</div>
					</div>
					<div class="pic3">
						<div class="row">
							<a href="http://www.china-10.com/brand/15766.html"><img src="img/index/pic11.gif"
								style="border:solid 1px grey;"></a>
						</div>
					</div>
					<div class="pic4">
						<div class="row">
							<a href="http://www.china-10.com/brand/11023.html"><img src="img/index/pic12.gif"
								style="border:solid 1px grey;"></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="border:solid 1px grey;margin-top:70px;height:300px">
			<div class="col-sm-7">
				<div class="row">
					<div class="col-sm-3"
						style="background-color:#ee2c2c;color:#fff;text-align:center;line-height:30px;margin-top:30px">
						<label>职场资讯</label>
					</div>
				</div>
				<div class="row" style="margin-top:30px">
					<div class="col-sm-2 col-sm-offset-1">
						<img src="img/campus/campus-3-1.jpg" style="width:50px">
					</div>
					<div class="col-sm-8">
						<p>多少年新的面试才值得你花钱去准备？</p>
					</div>
				</div>
				<div class="row" style="margin-top:20px">
					<div class="col-sm-2 col-sm-offset-1">
						<img src="img/campus/campus-3-1.jpg" style="width:50px">
					</div>
					<div class="col-sm-8">
						<p>41个问题帮你搞定面试官！</p>
					</div>
				</div>
				<div class="row" style="margin-top:20px">
					<div class="col-sm-2 col-sm-offset-1">
						<img src="img/campus/campus-3-1.jpg" style="width:50px">
					</div>
					<div class="col-sm-8">
						<p>外企不受求职者欢迎了？我不信！</p>
					</div>
				</div>
				<div class="row" style="margin-top:20px">
					<div class="col-sm-2 col-sm-offset-1">
						<img src="img/campus/campus-3-1.jpg" style="width:50px">
					</div>
					<div class="col-sm-8">
						<p>年初了，加薪了吗？</p>
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="col-sm-4"
					style="background-color:#ee2c2c;color:#fff;text-align:center;line-height:30px;margin-top:30px">
					<label>热门排行</label>
				</div>
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1" id="colee"
						style="overflow:hidden;behavior:scroll;height:200px;border:solid 1px grey;border-left:none;border-right:none;margin-top:20px">
						<div id="colee1">
							<ul style="margin-left:50px;margin-top:10px;line-height:30px; ">
								<li>全方位解答你的求职难题</li>
								<li>2017年薪资满意度全披露</li>
								<li>职场菜鸟修炼手册</li>
								<li>面试百题斩</li>
								<li>了解这些！提高面试成功率！</li>
								<li>职场菜鸟修炼手册</li>
								<li>你不知道的职场生存法则</li>
								<li>职场不可深交的五种人</li>
							</ul>
						</div>
						<div id="colee2"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
var speed=30;
var colee2=document.getElementById("colee2");
var colee1=document.getElementById("colee1");
var colee=document.getElementById("colee");
colee2.innerHTML=colee1.innerHTML; //克隆colee1为colee2



function Marquee1(){
//当滚动至colee1与colee2交界时
if(colee2.offsetTop-colee.scrollTop<=0){
colee.scrollTop-=colee1.offsetHeight; //colee跳到最顶端
}else{
colee.scrollTop++
}
}


var MyMar1=setInterval(Marquee1,speed)//设置定时器
//鼠标移上时清除定时器达到滚动停止的目的
colee.onmouseover=function() {clearInterval(MyMar1)}
//鼠标移开时重设定时器
colee.onmouseout=function(){MyMar1=setInterval(Marquee1,speed)}


</script>
</body>
</html>