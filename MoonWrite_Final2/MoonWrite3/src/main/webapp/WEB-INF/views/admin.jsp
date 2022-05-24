<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet" href="resource/css/admin.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
                    <li>AAA(aaa)님<br>
                        <p>정보수정 / 로그아웃</p>
                        <p>admin Page 영역</p>
                    </li><!--<li class="on" class="a">-->
                    <li><a href="#content1">메인페이지</a></li>
                    <li><a href="#">My Diary</a></li>
                    <li><a href="#">사람들의 이야기</a></li>
                    <li><a href="#">책 추천</a></li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="content">
        <h2>관리자 페이지</h2>
        <div class="mode_change">
            <button class="btn_member">회원 관리</button>
            <button class="btn_board btn_hide">게시글 관리</button>
        </div>
        <table>
            <tr>
                <th>게시글 번호</th>
                <th class="table_title">제목</th>
                <th>작성일</th>
                <th>작성자</th>
                <th>비고</th>
            </tr>
            <tr>
                <td>게시글 번호 영역</td>
                <td class="table_title">제목 영역</td>
                <td>작성일 영역</td>
                <td>작성자 영역</td>
                <td>수정/삭제</td>
            </tr>
        </table>
    </div>


</body>
</html>