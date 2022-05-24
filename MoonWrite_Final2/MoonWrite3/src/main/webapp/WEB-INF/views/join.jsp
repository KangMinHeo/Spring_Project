<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="resource/css/join.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="resource/js/join.js"></script>

<script type="text/javascript">
    	$(function(){
    	
    		
    	});
    </script>
</head>
<body>
	<h1>Moon write</h1>
    <div class="container">
    
        <form action="member_insert.do" id="frm">
          <h2>Join</h2>
            <ul>
                <li >
                    <input class="border_bottom"  type="text" name="id" id="id"  placeholder="아이디를 입력하세요">
                    <input type="hidden" class="id_check" value="" >
                    <button type="button" class="btn_id_chk">중복확인</button>
                </li>
                <li>
                  <input class="border_bottom" type="text" name="nick_name" id="nick_name" placeholder="닉네임을 입력하세요">
                  <input type="hidden" class="name_check" value="">
                  <button type="button" class="btn_name_chk">중복확인</button>
              </li>
                <li >
                    <input class="border_bottom" type="password" name="pass" id="pass" placeholder="비밀번호(8~32자리)">
                </li>
                <li>
                    <input class="border_bottom" type="password" id="pass_chk"  name="pass_chk" placeholder="비밀번호 재입력">
                </li>
                <li class="pass_check"></li>
                <li>
                  <input class="border_bottom" type="text" id="email"  name="email" placeholder="이메일을 입력하세요">
                  <label class="email_tag">@</label>
                
                 <select id ="class" name="address">
                      <option value="naver.com">naver.com</option>
                      <option value="nate.com">nate.com</option>
                      <option value="hanmail.com">hanmail.net</option>
                      <option value="gmail.com">gmail.com</option>
                  </select>
              </li>
					
                <li>
                    <button  type="button" class="btn_next">회원가입</button>
                </li>
            </ul>
        </form>

    </div>
</body>

</html>