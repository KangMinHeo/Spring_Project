<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moon Write</title>

<link rel="stylesheet" href="resource/css/commentView.css"> 
<link rel="stylesheet" href="resource/css/menuBar.css"> 

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="icon" href="/resource/img/diary.png">
</head>
<body>

<%@ include file="../include/sessionCheck.jsp"%>
<%@ include file="../include/menuBar.jsp"%>

 <div class="content">
        <!-- 여기 영역이 내용이 나올 영역입니다.
        여기서 작업을 해주시면 됩니다. -->
          <h1>나의 발자취</h1>
        <div class="main_content">
        	<table>
        	<span class="count">내가 쓴 글 갯수 : <a href="myDiary.do">${requestScope.b_count }</a></span>
        	<span class="count">내가 쓴 댓글 수 : <a href="viewComment.do">${requestScope.c_count }</a></span>
        		<tr>
        			<th>NO</th>
        			<th>내용</th>
        			<th>작성자</th>
        		</tr>
        		<c:forEach var="c_list" items="${requestScope.c_list}">
        			<tr>
        				<td>${c_list.cno}</td>
        				<td><a href="boardView.do?bno=${c_list.bno}">${c_list.c_content}</a></td>
        				<td>${c_list.m_name}</td>
        			</tr>
        		</c:forEach>
        		<c:if test="${requestScope.pagging != null }">
		<tr>
			<td colspan="7">
			<c:if test="${requestScope.pagging.isPriviousPageGroup() }">
				<a href="viewComment.do?page=${requestScope.pagging.getStartPageOfPageGroup()-1 }"><<</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${requestScope.pagging.getStartPageOfPageGroup() }" end="${requestScope.pagging.getEndPageOfPageGroup() }">
				<c:choose>
					<c:when test="${i==requestScope.pagging.currentPageNo }">
						${i}&nbsp;
					</c:when>
					<c:otherwise>
						<a href="viewComment.do?page=${i }">${i }</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${requestScope.pagging.isNextPageGroup() }">
				<a href="viewComment.do?page=${requestScope.pagging.getEndPageOfPageGroup()+1}">>></a>
			</c:if>
			</td>
		</tr>
		</c:if>
        	</table>
		        
        </div>
    </div>
</body>
</html>