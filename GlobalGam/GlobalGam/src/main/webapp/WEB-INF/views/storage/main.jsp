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
				<form name="myform" id="myform" method="post"
					enctype="multipart/form-data" action="/inventory/main.html">
					<ul class="lnb">
						<li><a href="/"><img src="/resources/img/icon_home.jpg"
								alt="홈으로"></a></li>
						<li></li>
						<li style="cursor: pointer;">재고관리</li>
					</ul>
					<!--lnb-->
					<div class="con">
						<ul class="admin_list">
							<li><a href="storage_ma_put.do">
									 <img src="resources/img/sub06_a1.png" alt="입/출고관리"><p>입/출고 관리</p>
							</a></li>
							<li><a href="storage_ma_inventory.do">
									 <img src="resources/img/sub06_b1.png" alt="재고관리"><p>재고 관리</p>
							</a></li>
							<li><a href="storage_ma_inquiry_wa.do">
									 <img src="resources/img/sub06_d1.png" alt="조회입고"><p>조회 입고</p>
							</a></li>
							<li><a href="storage_ma_inquiry_re.do">
									 <img src="resources/img/sub05_e1.png" alt="조회출고"><p>조회 출고</p>
							</a></li>
						</ul>
						<!--admin_list-->
					</div>
					<!--sub_con-->
					<div id="lay" style="overflow: auto;">
						<div class="bg"></div>
						<div id="lay2"></div>
					</div>
				</form>
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