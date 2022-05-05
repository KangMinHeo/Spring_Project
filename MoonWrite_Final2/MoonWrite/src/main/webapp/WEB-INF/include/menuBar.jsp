<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resource/css/menuBar.css">
</head>

<body>

	<div class="logo_menu">
		<header>
			<img src="resource/img/logo.png" alt="logo" id="header_logo">

			<div class="title">
				<h2>Moon Write</h2>
			</div>
		</header>

		<nav>
			<div class="header">
				<ul>
					<li>${member.m_id}(${member.m_name} )님<br>
						<p>
							<span class= "span_information" onclick = "location.href = 'informationView.do?id=${sessionScope.member.m_id}' " >정보수정 </span>/ 
							<span class = "span_logout"  onclick = "location.href = 'logout.do' ">로그아웃</span>
						</p>
					</li>
					<li><a onclick="location.href = 'main.do' ">메인페이지</a></li>
					<li><a onclick="location.href = 'myDiary.do?' ">My Diary</a></li>
					<li><a onclick="location.href = 'content3.do' ">사람들의 이야기</a></li>
					<li><a onclick="location.href = 'bestSeller.do' ">책 추천</a></li>
				</ul>
			</div>
		</nav>

	</div>
</body>
</html>

