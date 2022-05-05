<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 글로벌 감</title>
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
				<form name="myform" id="myform" method="post">
					<!--side_bar-->
					<ul class="lnb">
						<li><a href="/"><img src="/resources/img/icon_home.jpg" alt="홈으로"></a></li>
						<li></li>
						<li style="cursor: pointer;">수주관리</li>
					</ul>
					<!--lnb-->
					<div class="con">
						<ul class="admin_list">
							<li>
								<a href="order_pr_or_check.do">
									 <img src="/resources/img/icon_produce1_big.png" alt="수주관리"><p>수주 관리</p>
								</a>
							</li>
							<li>
								<a href="order_info_product.do">
									 <img src="/resources/img/sub01_a1.png" alt="제품관리"><p>제품 관리</p>
								</a>
							</li>
							<li>
								<a href="order_info_customer.do">
									 <img src="resources//img/sub01_k1.png" alt="고객관리"><p>고객 관리</p>
								</a>
							</li>
							<li>
								<a href="order_info_company_reg.do">
									 <img src="resources//img/sub01_k1.png" alt="기업정보 관리"><p>기업 정보</p>
								</a>
							</li>
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
		</div>
	</div>
	<!--content-->
	<div id="copy">
	<%@include file="../inc/copy_wrap.jsp"%>
	</div>
	<div class="keyboard"></div>

</body>
</html>