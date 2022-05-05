<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
<%@include file="../inc/head_html_text.jsp"%>
</head>
<script type="text/javascript">
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;

	//비밀번호 유효성 검사
	$(function() {
		$("#pw2").on('focus', function() {
			if ($('#pw').val() != $('#pw2').val()) {
				$("#pw_check").text("비밀번호가 같지 않습니다. :p");
				$("#pw_check").css("color", "red");
				$("#reg_submit").attr("disabled", true);
			} else if ($('#pw').val().length <= 8) {
				$("#pw_check").text("비밀번호는 8글자이상으로 써주세요 :p");
				$("#pw_check").css("color", "red");
				$("#reg_submit").attr("disabled", true);
			} else {
				$("#pw_check").text("비밀번호가 적합합니다!");
				$("#pw_check").css("color", "blue");
				$("#reg_submit").attr("disabled", true);
				$("#reg_submit").attr("disabled", false);
			}
		})

	})
</script>

<body>
	<div class="background"></div>
	<div class="header_wrap">
		<!--header-->
		<%@include file="../inc/header.jsp"%>
	</div>
	<!--header-->
	<div class="content">
		<%@include file="../inc/left_menu.jsp"%>
		<div class="content_detail" id="content_detail">
			<!-- 여기가 메인 컨텐츠 영역 -->
			<form action="register.do" method="POST">
			<div class="div_right">
				<ul class="lnb">
					<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="admin_select_main.do">관리자 페이지</a></li>
					<li></li>
					<li><a href="admin_main.do">직원 등록</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
				<!-- 사원 번호 -->
				<div class="box">
					<div class="form-group">
						<label for="user_id">사원 번호</label><br> <input type="text"
							class="form-control" id="id" name="id" placeholder="ID" required>
						<div class="check_font" id="id_check"></div>
					</div>

					<!-- 비밀번호 -->
					<div class="form-group">
						<label for="user_pw">비밀번호</label><br> <input type="password"
							class="form-control" id="pw" name="pw" placeholder="PASSWORD"
							required>
						<div class="check_font" id="pw_check"></div>
					</div>

					<!-- 비밀번호 재확인 -->
					<div class="form-group">
						<label for="user_pw2">비밀번호 확인</label><br> <input
							type="password" class="form-control" id="pw2" name="pw2"
							placeholder="Confirm Password" required>
						<div class="check_font" id="pw2_check"></div>
					</div>

					<!-- 사원 이름 -->
					<div class="form-group">
						<label for="user_name">사원 이름</label><br> <input type="text"
							class="form-control" id="name" name="name" placeholder="Name"
							required>
						<div class="check_font" id="name_check"></div>
					</div>

					<!-- 담당 공정 -->
					<div>
						<label for="pro">담당 공정</label> <select id="pro" name="pro"
							size="1">
							<option value="">선택하세요.</option>
							<option value="총괄">총괄</option>
							<option value="FIND">FIND</option>
							<option value="WASH">WASH</option>
							<option value="DRY">DRY</option>
							<option value="10B-OUT">10B-OUT</option>
							<option value="20B-OUT">20B-OUT</option>
							<option value="20N-OUT">20N-OUT</option>
							<option value="30B-OUT">30B-OUT</option>
						</select> <br> <br>
					</div>

					<!-- 담당 라인 -->
					<div>
						<label for="line">담당 라인</label> <select id="line" name="line"
							size="1">
							<option value="">선택하세요.</option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select> <br> <br>
					</div>
					<!-- 사원 권한 -->
					<div class="form-group required">
						사원 권한<br> <input type='radio' name='type' value='관리자' />관리자
						<input type='radio' name='type' value='직원' />직원 <br>
					</div>

					<input type="submit" value="등록하기"> <br> <br>
				</div>
			</div>
		</div>
			</form>
		</div>
	</div>
	<!--content-->
	<div id="copy">
		<%@include file="../inc/copy_wrap.jsp"%>
	</div>
</body>
</html>