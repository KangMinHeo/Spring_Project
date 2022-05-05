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
					enctype="multipart/form-data" action="/process/main.html">
					<!--side_bar-->
					<ul class="lnb">
						<li><a href="/"><img src="resources/img/icon_home.jpg"
								alt="홈으로"></a></li>
						<li></li>
						<li style="cursor: pointer;">공정관리</li>
					</ul>
					<!--lnb-->
					<div class="con">
						<ul class="admin_list">
						<li><a href="admin_main.do">
									 <img src="resources/img/add_employee.png" alt="직원등록"><p>직원 등록</p>
							</a></li>
							<li><a href="admincrt_main.do">
									<img src="resources/img/list_employee.png" alt="직원 수정 삭제"><p>직원 수정 / 삭제</p> 
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
	</div>
	<!--content-->
	<div id="copy">
		<%@include file="../inc/copy_wrap.jsp"%>
	</div>
</body>
</html>
</body>
</html>