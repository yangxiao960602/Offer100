<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>企业认证</title>
<script src="js/jquery-1.9.1.min.js"></script> 
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/ucOffer.css">
<script src="js/bootstrap.min.js"></script> 

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
			<li><a href="jobRelease.jsp" style="text-align:center;border:solid 0.5px grey;border-bottom:none;">发布职位</a></li>
			<li><a href="epCerti.jsp" style="text-align:center;border:solid 0.5px grey;border-bottom:none;color:#ee2c2c">企业认证</a></li>
			<li><a style="text-align:center;border:solid 0.5px grey">安全中心</a></li>
		</ul>
	</div>
	
	<div class="col-sm-6 col-sm-offset-1" style="border:solid 0.5px grey;height:600px">
		<form class="horizontal">
			<div class="form-group" style="margin-top:20px">
				<div class="row">
					<div class="col-sm-5" style="text-align:right;margin-left:40px">
						<label>公司名称:</label>
						<c:if test="${!empty enterprise }">
							<input type="text" name="en_name" id="en_name" disabled="disabled" 
								value=${enterprise.en_name}></input>
						</c:if>
						</div>
					<div class="col-sm-5" style="text-align:right">
						<label>城市:</label>
						<input type="text"  name="en_city" id="en_city"/>
						</div>
				</div>
				<div class="row" style="margin-top:20px">
					<div class="col-sm-5" style="text-align:right;margin-left:40px">
						<label>公司地址:</label>
						<input type="text"  name="en_address" id="en_address"/>
					</div>
					<div class="col-sm-5" style="text-align:right">
						<label>邮箱:</label>
						<input type="text"  name="en_email" id="en_email"/>
					</div>
			    </div>
			    <div class="row" style="margin-top:20px">
					<div class="col-sm-5" style="text-align:right;margin-left:40px">
						<label>联系人:</label>
						<input type="text"  name="en_contact" id="en_contact"/>
					</div>
					<div class="col-sm-5" style="text-align:right">
						<label>联系电话:</label>
						<input type="text"  name="en_phone" id="en_phone"/>
					</div>
			    </div>
			    <div class="row" style="margin-top:20px">
					<div class="col-sm-2" style="text-align:right;margin-left:42px">
						<label>公司介绍:</label>
					</div>
			    </div>
			    <div class="row" style="margin-top:20px">
					<textarea rows="4" class="col-sm-8 col-sm-offset-2"  
						name="en_introduce" id="en_introduce"></textarea>
			    </div>
			     <div class="row" style="margin-top:20px">
					<div class="col-sm-2" style="text-align:right;margin-left:42px">
						<label>营业执照:</label>
					</div>
			    </div>
			     <div class="row" style="margin-top:20px">
					<div class="col-sm-5" style="text-align:right;margin-left:90px">
						<div id="preview" style="width:250px;height:150px;border:1px solid #000;overflow:hidden;margin-left:0px;margin-top:0px;">
                             <img id="imghead" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);alpha(opacity=60);" width=150 height=150 border=0 >
                    	</div>
					</div>
					<div class="col-sm-5" style="margin-top:120px">
						<input type="file" name="image" id="" onchange="previewImage(this)" /> 
					</div>
			    </div>
			     <div class="col-sm-offset-5" style="margin-top:30px">
			       <button type="button" class="btn" style="background-color:#ee2c2c;color:#fff">保存</button>
			    </div>
			 </div>
		</form>
	</div>
</div>

<script type="text/javascript">
      //图片上传预览    IE是用了滤镜。
        function previewImage(file)
        {
          var MAXWIDTH  = 260; 
          var MAXHEIGHT = 180;
          var div = document.getElementById('preview');
          if (file.files && file.files[0])
          {
              div.innerHTML ='<img id=imghead>';
              var img = document.getElementById('imghead');
              img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
                img.style.marginTop = rect.top+'px';
              }
              var reader = new FileReader();
              reader.onload = function(evt){img.src = evt.target.result;}
              reader.readAsDataURL(file.files[0]);
          }
          else //兼容IE
          {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
          }
        }
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight )
            {
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                 
                if( rateWidth > rateHeight )
                {
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else
                {
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
             
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }
</script>   	
</body>
</html>