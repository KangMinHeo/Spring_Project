<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
</head>

<body>
	<div class="background"></div>
	<div class="header_wrap">
		<!--header-->
		<%@include file="../inc/header.jsp"%>
		<!--header-->
	</div>
	<div class="content">
		<%@include file="../inc/left_menu.jsp"%>
			<div class="content_detail" id="content_detail">
			<div id="content">
				<ul class="lnb">
					<li><a href="/"><img src="/resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li style="cursor: pointer;">발주관리</li>
				</ul>
				<!--lnb-->
				<div class="con" style="height: auto;">
					<ul class="admin_list">
						<li><a href="request_ma_order.do" style="cursor: pointer">
								 <img src="/resources/img/icon_info1_big.png" alt="발주 관리"><p>발주 관리</p>
						</a></li>
						<li><a href="request_info_material.do" style="cursor: pointer">
								<img src="/resources/img/sub01_c1.png" alt="원자재 관리"><p>원자재 관리</p> 
						</a></li>
						<li><a href="request_info_cooperative.do" style="cursor: pointer">
								 <img src="/resources/img/sub01_m1.png" alt="협력업체"><p>협력업체</p>
						</a></li>
					</ul>
					<!--admin_list-->
				</div>
				<!--sub_con-->
				<div id="lay" style="overflow: auto; z-index: 999999999999999;">
					<div class="bg"></div>
					<div id="lay2"></div>
				</div>
			</div>
			<!--content-->
			</div>
	</div>
	<!--content-->
	<div id="copy">
		<%@include file="../inc/copy_wrap.jsp"%>
	</div>
</body>
</html>
</body>
</html>