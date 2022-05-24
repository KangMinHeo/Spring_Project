<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>

<link rel="stylesheet" href="resource/css/information.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="resource/js/information.js"></script>


</head>

<body>
<%@ include file="../include/sessionCheck.jsp"%>
   <h1>Moon write</h1>
    <div class="container">
    
        <form action="member_update.do" id="frm">
          <h2>Information</h2>
            <ul>
                <li >
                    <input class="border_bottom" type="text" name="id" id="id" value="${requestScope.member.m_id }" readonly>
                </li>
                <li>
                   <input class="border_bottom" type="text" name="nick_name" id="nick_name" value="${requestScope.member.m_name}"
                  		onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
                  		<input type="hidden" class="name_check" value="">
                  <button type="button" class="btn_name_chk">중복확인</button>
              </li>
                <li >
                    <input class="border_bottom" type="password" name="pass" id="pass" placeholder="비밀번호(미입력시 기존 비밀번호로 저장)">
                    <input type="hidden" name="current_pw" value="${requestScope.member.m_pw}">
                </li>
                <li>
                    <input class="border_bottom" type="password" id="pass_chk" placeholder="변경할 비밀번호 재입력">
                </li>
                <li class="pass_check"></li>
                <li>
                  <input class="border_bottom" type="email" id="mail_chk" value="${requestScope.member.email}" readonly>
              </li>

                <li>
                   <button type="button"  id="btn_delete" class="btn_next">회원탈퇴하기</button> 
                    <button type="button" class="btn_next">저장하기</button>
                </li>

            </ul>
        </form>

    </div>
</body>
</html>