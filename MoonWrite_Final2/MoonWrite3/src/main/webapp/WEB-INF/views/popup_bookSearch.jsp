<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 제목 검색하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/resource/css/popup_bookSearch.css">

<script type="text/javascript">
	
	$(function () {
		$(".bookTitle").click(function() {
			
			let title = $(this).text();
			let isbn = $(this).parent().parent().find(".bookIsbn").text();
			let author = $(this).parent().parent().find(".bookAuthor").text();
			let publisher = $(this).parent().parent().find(".bookPublisher").text();
			let price = $(this).parent().parent().find(".bookPrice").text();
			let image = $(this).parent().parent().find(".img_book").attr("src");
			let link = $(this).parent().parent().find(".bookLink").text();
			let description = $(this).parent().parent().find(".bookDescription").text();
			
			$(opener.document).find("#book_keyword").val(title);
			$(opener.document).find("#book_isbn").val(isbn);
			$(opener.document).find("#book_author").val(author);
			$(opener.document).find("#book_publisher").val(publisher);
			$(opener.document).find("#book_price").val(price);
			$(opener.document).find("#book_image").val(image);
			$(opener.document).find("#book_link").val(link);
			$(opener.document).find("#book_description").val(description);
			
			window.close();
		});
			
		$(".btn_search").click(function () {
			let data = "keyword="+$(".inp_search").val();
			location.href = "popupView.do?"+data;
		});
	});
</script>
</head>
<body>
	<div class="container">

		<div class="searchBox">
			<h2>책 제목을 입력하세요</h2>
			
				<input type="text" class="inp_search">
				<button type="button" class="btn_search">검색</button>
			
		</div>

		<div class="resultBox">
			<table>
				<thead>
					<tr>
						<th>제목</th>
						<th>저자명</th>
						<th>출판사</th>
						<th>가격</th>
						<th>이미지</th>
						<th>ISBN</th>
					</tr>
				</thead>
				<c:if test="${bookList == null}">
					<tr>
						<td colspan="6">검색결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${bookList != null}">
					<tbody>
						<c:forEach var="book" items="${bookList}">
						 
						
							<tr>
								<td class="bookDescription">${book.description}</td>
								<td class="bookLink">${book.link}</td>
								<td><a class="bookTitle" >${book.title}</a></td>
								<td class="bookAuthor">${book.author}</td>
								<td class="bookPublisher">${book.publisher}</td>
								<td><p class="bookPrice">${book.price}</p>원</td>
								<td><img alt="책이미지" src="${book.image}" class="img_book"></td>
								<td class="bookIsbn">${book.isbn}</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>
</body>
</html>











