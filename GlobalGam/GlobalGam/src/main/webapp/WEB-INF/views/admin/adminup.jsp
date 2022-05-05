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
<style>
*{
    margin: 0;
    padding: 0;
}

h2{
    text-align: center;
    margin: 30px 0px;
}

form{
    margin: 0 auto;
    margin-top: 20px;
    padding: 30px;
    width: 500px;
    text-align: center;
}

.form_group{
    margin: 0 auto;
    width: 500px;
    background-color: #e9e9e9;
    text-align: center;
}

div label{
    width: 30%;
}

div input, div select{
    width: 30%;
}

input{
    height: 30px;
    margin-left: 10px;
    margin-bottom: 20px;
    border: 1px solid #c9c9c9;
    border-radius: 10px;
}

select{
    height: 30px;
    border: 1px solid #c9c9c9;
    border-radius: 10px;
}

#btn{
    height: 50px;
    margin: 0px 20px;
    margin-top: 20px;
    border: none;
    border-radius: 10px;
    background-color: cornflowerblue;
    color: white;
}

#btn:hover{
    background-color: #c9c9c9;
    color: black;
}

.type{
    width: 20%;
    margin-bottom: 0px;
    vertical-align: middle;
    margin-right: 10px;
}
</style>
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
			<ul class="lnb">
				<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
				<li></li>
				<li><a href="admin_select_main.do">관리자 페이지</a></li>
				<li></li>
				<li><a href="admincrt_main.do">직원 정보 목록</a></li>
			</ul>
             <h2>직원 정보 수정</h2>
			<form action="adminud.do" method="POST">
				<!-- 사원 번호 -->
				<div class="box">
					<div class="form-group">
						<label for="user_id">사원 번호</label>
						<input type="text"
							class="form-control" id="id" name="id" placeholder="ID"
							value="${requestScope.emp.eNo}" required readonly>
					</div>

					<!-- 비밀번호 -->
					<div class="form-group">
						<label for="user_pw">비밀번호</label>
						<input type="password" class="form-control" id="pw" name="pw" placeholder="PASSWORD">
						<input type="hidden" name="apw" value="${requestScope.emp.ePw}" id="pw_h">
					</div>

					<!-- 비밀번호 재확인 -->
					<div class="form-group">
						<label for="user_pw2">비밀번호 확인</label>
						<input type="password" class="form-control" id="pw2" name="pw2" placeholder="Confirm Password">
						<input type="hidden" value="${requestScope.emp.ePw}" id="pw2_h">
					</div>

					<!-- 사원 이름 -->
					<div class="form-group">
						<label for="user_name">사원 이름</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Name" value="${requestScope.emp.eName }" required>
					</div>

					<!-- 담당 공정 -->
					<div>
						<label for="pro">담당 공정</label>
						<select id="pro" name="pro" size="1">
							<option value="${requestScope.emp.eProNo }">${requestScope.emp.eProNo }</option>
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
						<label for="line">담당 라인</label>
						<select id="line" name="line" size="1">
							<option value="${requestScope.emp.eLine }">${requestScope.emp.eLine }</option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select> <br> <br>
					</div>
					<!-- 사원 권한 -->
					<div class="form-group required">
						<label for="type">사원 권한</label>
						<c:choose>
							<c:when test="${requestScope.emp.eLevel eq '관리자' }">
								<input type='radio' name='type' value='관리자' class="type" id="type1" checked />
								<label for="type1">관리자</label>
								<input type='radio' name='type' value='직원' class="type" id="type2" />
								<label for="type2">직원</label>
							</c:when>
							<c:when test="${requestScope.emp.eLevel eq '직원' }">
								<input type='radio' name='type' value='관리자' class="type" id="type1" />
								<label for="type1">관리자</label>
								<input type='radio' name='type' value='직원' class="type" id="type2" checked />
								<label for="type2">직원</label>
							</c:when>
						</c:choose>
					</div>
					<input type="submit" value="수정하기" id="btn"> <br> <br>
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