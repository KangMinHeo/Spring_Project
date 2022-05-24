<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moon Write</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<link rel="stylesheet" href="resource/css/my_diary.css">
<link rel="stylesheet" href="resource/css/menuBar.css">

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- <script src="/resource/js/main_scroll.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<link rel="icon" href="/resource/img/diary.png">

</head>
<body>
    <%@ include file="../include/menuBar.jsp"%>
    <%@ include file="../include/sessionCheck.jsp"%>
   
    <div class="content">
        <!-- 여기 영역이 내용이 나올 영역입니다.
        여기서 작업을 해주시면 됩니다. -->
     
     	<!-- 수정한 부분 -->
		<div class="content3-title">
			<p>My Moon <br> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 나만의 <span class="span-moon">달</span> 이야기</p>
		</div>
        <div class="main_content">
        	<table>
        	<span class="count">내가 쓴 글 갯수 : <a href="#">${requestScope.b_count}</a></span>
        	<span class="count">내가 쓴 댓글 수 : <a href="viewComment.do">${requestScope.c_count}</a></span>
        		<tr>
        		  <th>NO</th>
                 <th>제목</th>
                 <th>작성일</th>
                 <th>유형</th>
                 <th>비공개</th>

        		</tr>
        		  <c:forEach var="board" items="${requestScope.writer}">
                 <tr>
                    <td>${board.bno}</td>
                    <td><a href="boardView.do?bno=${board.bno}&page=${pagging.currentPageNo}">${board.title}</a></td>
                    <td>${board.regist_day}</td>
                    <td>
                       <c:if test="${board.b_kind eq 'b' }">글귀</c:if>
                     <c:if test="${board.b_kind eq 'd' }">일기</c:if>
                    </td>
                    <td><c:if test="${board.b_secret eq 's' }">
               <p><img class="rock" src="resource/img/rock.png"></p>
            </c:if>
            <c:if test="${board.b_secret eq 'o' }">
               <p></p>
            </c:if></td>
                    
                    
                 </tr>
                 
              </c:forEach>

        		<c:if test="${requestScope.pagging != null }">
		<tr>
			<td colspan="7">
			<c:if test="${requestScope.pagging.isPriviousPageGroup() }">
				<a href="myDiary.do?page=${requestScope.pagging.getStartPageOfPageGroup()-1 }"><<</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${requestScope.pagging.getStartPageOfPageGroup() }" end="${requestScope.pagging.getEndPageOfPageGroup() }">
				<c:choose>
					<c:when test="${i==requestScope.pagging.currentPageNo }">
						<span class="selectPage">${i}&nbsp;</span>
					</c:when>
					
					<c:otherwise>
						<a href="myDiary.do?page=${i }">${i }</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${requestScope.pagging.isNextPageGroup() }">
				<a href="myDiary.do?page=${requestScope.pagging.getEndPageOfPageGroup()+1}">>></a>
			</c:if>
			</td>
		</tr>
		</c:if>
        	</table>
		      <div class="a_write">
				<a href="boardWriteView.do"><span>글쓰기</span></a>
			</div>
        </div>
    </div>
</body>
</html>