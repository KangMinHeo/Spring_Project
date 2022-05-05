<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>내 정보 찾기</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    
    <link rel="stylesheet" href="resource/css/find_info.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
</head>
<body>
    <h1>Moon Write</h1>
    <div class="container">
        <div class="find_id">
            <form action="find_id.do">
                <h2>Identified</h2>
                <input type="text" name="email" id="find_email" placeholder="이메일을 입력하세요"><br>
                <input type="submit" value="찾기" class="find_id_chk">
              </form>
        </div>
        <div class="find_pass">
            <form action="find_pass.do">
                <h2>Password</h2>
                <input type="text" name="id" id="find_id" placeholder="아이디를 입력하세요"><br>
                <input type="text" name="email" id="find_email" placeholder="이메일을 입력하세요"><br>
                <input type="submit" value="찾기" class="find_pass_chk">
              </form>
        </div>
    </div>
    <div class="back_login">
        <button class="btn_back_login" onclick="location.href='loginView.do';">로그인</button>
    </div>
</body>
</html>