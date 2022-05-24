<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moon Write</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="resource/img/diary.png">
<link rel="stylesheet" href="resource/css/index.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="main">
			<img src="resource/img/logo.png" alt="logo" id="logo">
		</div>
		<!--
		<table>
			<tr>
				<th>오늘의 한 문장</th>
			</tr>
			<tr>
				<td class="message">${message}</td>
			</tr>
		</table>-->
		<div class="comment">
			<h2>오늘의 한 문장</h2>
			<p class="message">${message }</p>
		</div>
	</div>
	<div class="select_btn">
		<button class="btn_join" onclick = "location.href='joinView.do' ">회원가입</button>
		<button class="btn_login" onclick="location.href='loginView.do'">로그인</button>
	</div>
</body>
</html>