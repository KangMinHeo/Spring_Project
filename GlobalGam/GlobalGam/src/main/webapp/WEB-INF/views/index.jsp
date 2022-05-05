<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../views/inc/head_html_text.jsp"%>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var level = '<%=session.getAttribute("level")%>'
		console.log(level);
		if(level == '관리자'){
			$(".admin").shwo();
		} else {
			$(".admin").hide();
		}
	});
</script>
<body>
	<div class="background"></div>
	<div class="header_wrap">
		<!--header-->
		<%@include file="../views/inc/header.jsp"%>
		<!--header-->
	</div>
	<div class="content">
		<%@include file="../views/inc/left_menu.jsp"%>
			<div class="content_detail" id="content_detail">
			<!--side_bar-->
			<!--lnb-->
			<div class="con" style="height: auto;">
				<ul class="admin_list">
					<li>
						<a href="/request_main.do" style="cursor: pointer">
							<img src="/resources/img/icon_info1_big.png" alt="발주 관리">
							<p>발주 관리</p>
						</a>
					</li>
					<li>
						<a href="order_main.do" style="cursor: pointer">
							<img src="/resources/img/icon_produce1_big.png" alt="수주 관리">
							<p>수주 관리</p>
						</a>
					</li>
					<li>
						<a href="process_main.do" style="cursor: pointer">
							<img src="/resources/img/icon_process1_big.png" alt="공정 관리">
							<p>공정 관리</p>
						</a>
					</li>
					<li>
						<a href="/produce/main.html" style="cursor: pointer">
							<img src="/resources/img/icon_system1_big.png" alt="생산 관리">
							<p>생산 관리</p>
						</a>
					</li>
					<li>
						<a href="storage_main.do" style="cursor: pointer">
							<img src="/resources/img/icon_quality1_big.png" alt="재고 관리">
							<p>재고 관리</p>
						</a>
					</li>
					<li>
						<a href="forward_main.do" style="cursor: pointer">
							<img src="/resources/img/icon_material1_big.png" alt="출하 관리">
							<p>출하 관리</p>
						</a>
					</li>
					<li class = "admin">
						<a href="admin_select_main.do" style="cursor: pointer">
							<img src="/resources/img/admin.png" alt="관리자 페이지">
							<p>관리자 페이지</p>
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
		</div>
	</div>
	<!--content-->
	<div id="copy">
		<%@include file="../views/inc/copy_wrap.jsp"%>
	</div>
	<div class="keyboard"></div>
</body>
</html>
</body>
</html>