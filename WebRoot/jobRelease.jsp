<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发布职位</title>
<script src="js/jquery-1.9.1.min.js"></script> 
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/ucOffer.css">
<script src="js/bootstrap.min.js"></script> 
<link rel="stylesheet" type="text/css" href="css/epRegister.css">
<link rel="stylesheet" type="text/css" href="css/jobSearch.css">
<script src="js/epRegister.js"></script>
<script src="js/jobSearch.js"></script>
</head>
<body>
<div style="background-color:#ee2c2c;height:30px">
</div>

<div class="row" style="margin-top:20px">
	<div class="col-sm-offset-9 nava">
		<ul>
			<li><a href="index.jsp"><h4>返回首页</h4></a></li>
			<li><a href="ucOffer.jsp"><h4></h4></a></li>
		</ul>
	</div>
</div>
<hr style="border:solid 0.5px grey;margin-top:0px">	

<div class="row" style="margin-top:70px;" >
	<div class="col-sm-2 col-sm-offset-1" >
		<ul class="nav" style="margin-left:30px;">
			<li><a style="text-align:center;border:solid 0.5px grey;border-bottom:none;">查看职位</a></li>
			<li><a href="jobRelease.jsp" style="text-align:center;border:solid 0.5px grey;border-bottom:none;color:#ee2c2c">发布职位</a></li>
			<li><a href="epCerti.jsp" style="text-align:center;border:solid 0.5px grey;border-bottom:none;">企业认证</a></li>
			<li><a style="text-align:center;border:solid 0.5px grey">安全中心</a></li>
		</ul>
	</div>
	
	
	<!-- 
	  `en_id` int(11) DEFAULT NULL,
	  `jobinfo_id` int(11) NOT NULL AUTO_INCREMENT,
	  `jobinfo_name` varchar(50) NOT NULL,
	  `jobinfo_description` varchar(1000) NOT NULL,
	  `jobinfo_num` int(11) NOT NULL,
	  `jobinfo_category` varchar(50) NOT NULL,
	  `jobinfo_year` varchar(20) NOT NULL,
	  `jobinfo_qualification` varchar(20) NOT NULL,
	  `jobinfo_place` varchar(20) NOT NULL,
	  `jobinfo_salary` varchar(30) NOT NULL,
	  `jobinfo_time` date NOT NULL,
	 -->
	<div class="col-sm-6 col-sm-offset-1" style="border:solid 0.5px grey;height:530px">
		<form class="horizontal"
			action="${pageContext.request.contextPath}/JobServlet" method="post">
			<div class="form-group" style="margin-top:20px">
				<div class="row">
					<div class="col-sm-5" style="text-align:right;margin-left:40px;">
						<label>职位名称:</label>
						<input type="text" name=jobinfo_name id="jobinfo_name" value="测试名" />
						</div>
					<div class="col-sm-5" style="text-align:right">
						<label>行业类别:</label>
						<input type="text"name="jobinfo_category" id="jobinfo_category" value="测试类别" class="category" placeholder="请选择行业类别" readonly="readonly" onclick="displayIndustry()" style="width:161px;height:25px;background:none;border:solid 0.5px grey;"/>
					</div>
				</div>
				
			    <div class="row" style="margin-top:20px">
					<div class="col-sm-5" style="text-align:right;margin-left:40px">
						<label>学历要求:</label>
						 <select name="jobinfo_qualification" style="width:161px;height:25px;background:none;border:solid 0.5px grey;">
      						<option >所有</option>
      						<option>初中及以下</option>
      						<option>高中/中技/中专</option>
      						<option>大专</option>
      						<option>本科</option>
      						<option>硕士</option>
      						<option>博士</option>
    					</select>
					</div>
					<div class="col-sm-5" style="text-align:right">
						<label>工作年限:</label>
						<select name="jobinfo_year" style="width:161px;height:25px;background:none;border:solid 0.5px grey;">
      						<option >所有</option>
      						<option>无经验</option>
      						<option>1-3年</option>
      						<option>3-5年</option>
      						<option>5-10年</option>
      						<option>10年以上</option>
    					</select>
					</div>
			    </div>
			    <div class="row" style="margin-top:20px">
					<div class="col-sm-5" style="text-align:right;margin-left:40px">
						<label>工作地点:</label>
						<input type="text" value="武汉" name="jobinfo_place" id="jobinfo_place" class="epCity" onclick="displayCity()" style="width:161px;height:25px;background:none;border:solid 0.5px grey;"/>
					</div>
					<div class="col-sm-5" style="text-align:right">
						<label>薪资:</label>
						<select name="jobinfo_salary" style="width:161px;height:25px;background:none;border:solid 0.5px grey;">
      						<option >所有</option>
      						<option>5000-8000</option>
      						<option>2千以下</option>
      						<option>2-3千</option>
      						<option>3-4千</option>
      						<option>4-5千</option>
      						<option>5-6千</option>
      						<option>6-8千</option>
      						<option>0.8-1万</option>
      						<option>1-2万</option>
      						<option>2-3万</option>
      						<option>3-4万</option>
      						<option>4-5万</option>
      						<option>5万以上</option>
    					</select>
					</div>
			    </div>
			    <div class="row" style="margin-top:20px">
					<div class="col-sm-5" style="text-align:right;margin-left:42px">
						<label>招聘人数:</label>
						<input type="text" name="jobinfo_num" id="jobinfo_num" value="22" />
					</div>
			    </div>
			     <div class="row" style="margin-top:20px">
					<div class="col-sm-2" style="text-align:right;margin-left:42px">
						<label>职位详细描述:</label>
					</div>
			     </div>
			     <div class="row" style="margin-top:10px">
					<textarea rows="6" class="col-sm-8 col-sm-offset-2" 
						name="jobinfo_description" id="jobinfo_description"></textarea>
			     </div>
			     <div class="col-sm-offset-5" style="margin-top:30px">
			       <button type="submit" name="submit" class="btn" style="background-color:#ee2c2c;color:#fff">发布职位</button>
			    </div>
			 </div>
		</form>
	</div>
</div>

<!--divCity1为灰色背景div，divCity2为选择城市的弹框div-->
<div class="divCity1" id="DivCity1"></div>
<!-- 职位列表 -->
<div class="divCity2" id="DivCategory">
			<div class="divCity2Close">
				<input type="button" name="关闭" onclick="closeIndustry()" />
			</div>
			<div class="divCity2Title">
				<div class="Title1"><h3>行业类别</h3></div>
				<div class="Title3"><h3>具体类别</h3></div>
			</div>
			<div class="divIndustry">
				<ul id="IndustryUl">
					<li class="selected1">全部</li>
					<li>计算机/互联网/通信/电子</li>
					<li>会计/金融/银行/保险</li>
					<li>贸易/消费/制造/营运</li>
					<li>制药/医疗</li>
					<li>广告/媒体</li>
					<li>房地产/建筑</li>
					<li>专业服务/教育/培训</li>
					<li>服务业</li>
					<li>物流/运输</li>
					<li>能源/原材料</li>
					<li>政府/非营利组织/其他</li>
				</ul>
			</div>
			<div class="divCityAndBut">
				<div class="divCity" id="DivCategories">
					<div><ul><li>全部</li></ul></div>
					<div class="cityHide">
						<ul>
							<li>计算机软件</li>
							<li>计算机硬件</li>
							<li>计算机服务(系统、数据服务、维修)</li>
							<li>通信/电信/网络设备</li>
							<li>通信/电信运营、增值服务</li>
							<li>互联网/电子商务</li>
							<li>网络游戏</li>
							<li>电子技术/半导体/集成电路</li>
							<li>仪器仪表/工业自动化</li>
						</ul>
					</div>
					<div class="cityHide">
						<ul>
							<li>会计/审计</li>
							<li>金融/投资/证券</li>
							<li>银行</li>
							<li>保险</li>
							<li>信托/担保/拍卖/典当</li>
						</ul>
					</div>
				</div>
				<div class="cityButton">
					<input type="button" name="" value="确定" onclick="chooseIndustry()"/>
					<input type="button" name="" value="取消" onclick="closeIndustry()" />
				</div>
			</div>
		</div>
		
<!-- 城市列表 -->

	<div class="divCity2" id="DivCity2">
		<div class="divCity2Close">
			<input type="button" name="关闭" onclick="closeCity()" />
		</div>
		<div class="divCity2Title">
			<div class="Title1"><h3>省份/直辖市</h3></div>
			<div class="Title2"><h3>城市</h3></div>
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
				<div><ul><li>北京市</li></ul></div>
				<div class="cityHide"><ul><li>天津市</li></ul></div>
				<div class="cityHide"><ul><li>上海市</li></ul></div>
				<div class="cityHide"><ul><li>重庆市</li></ul></div>
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
				<input type="button" name="" value="确定" onclick="chooseCity()"/>
				<input type="button" name="" value="取消" onclick="closeCity()" />
			</div>
		</div>
	</div>
</body>
</html>