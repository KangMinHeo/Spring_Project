<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Moon Write</title>
<link rel="icon" href="resource/img/diary.png">

<!-- css Link -->
<link rel="stylesheet" href="resource/css/boardView.css">
<link rel="stylesheet" href="resource/css/menuBar.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



<!-- 
공감버튼 ajax 코드 입니다. 
js 파일을 따로 빼려고 하니 js 코드 안에서 jstl 이 사용되지 않더라구요 ㅜㅜ
검색해보니 원래 안되는거라고 해서 부득이 jsp 파일 내부로 옮겨 왔습니다.
-->
<script>
	$(function() {

		$(".img-heart")
				.click(
						function() {

							let data = "bno=${requestScope.board.bno}&id=${sessionScope.member.m_id}";

							$.ajax({
								type : "get",
								url : "boardLike.do",
								data : data,
								datatype : "json",
								success : function(res) {

									let json = JSON.parse(res);

									if (json.result == 0) {
										alert("공감을 취소했어요.");
										$(".img-heart").attr("src",
												"resource/img/empty3.png");
									} else {
										alert("이 글에 공감합니다!");
										$(".img-heart").attr("src",
												"resource/img/full.png");
									}
									$(".blike").text(json.count);
								},
								error : function() {
									alert("통신 실패!!");
								}
							});
						});

		
		$(".btn-board-delete").click(function() {
			let check = confirm("이 글을 정말 삭제할까요?");
			if (!check)
				return;

			let bno = "${requestScope.board.bno}";
			let page = "${requestScope.page}";
			location.href = "deleteBoard.do?bno=" + bno + "&page=" + page;
		});
		
		

		$(".book_info_title")
				.click(
						function() {
							let link = "${requestScope.book_info.link}";
							window
									.open("${book_info.link}",
											"${book_info.title}",
											"width=700, height=850, top=100, left=200,scrollbars=yes");
						});

		$("#btn_add_comment")
				.click(
						function() {
							let bno = "${board.bno}";

							if ($("#comment_area").val().replaceAll(" ", "").length == 0) {
								alert("내용을 입력하세요!!");
								return;
							}

							var data = "content=" + $("#comment_area").val()
									+ "&c_bno=" + bno;

							$
									.ajax({
										url : "commentAdd.do",
										data : data,
										type : "get",
										dataType : "json",
										contentType : "application/json; charset=utf-8",
										success : function(r) {
											var str = "";

											for (let i = 0; i < r.length; i++) {
												str += "<div class='txt_area'> <div class='m_write'>";
												str += "<p>작성자 : "
														+ r[i].m_name
														+ "</p>  </div>";
												str += "<div class='m_content'><p>"
														+ r[i].c_content
														+ "</p> </div>";
												str += "</div>";
											}

											$(".text_box").html(str);
											$("#comment_area").val("");
										}
									});
						});

	});
</script>

</head>

<body>

	<!-- session 정보 체크 / menuBar  -->
	<%@ include file="../include/sessionCheck.jsp"%>
	<%@ include file="../include/menuBar.jsp"%>


	<div class="content">
		<!-- 여기 영역이 내용이 나올 영역입니다. 여기서 작업을 해주시면 됩니다. -->
		<div class="content3-title">
			<c:choose>
				<c:when test="${sessionScope.host eq 'myDiary.do'}">
					<p>
						My Moon <br> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 나만의 <span class="span-moon">달</span> 이야기
					</p>
				</c:when>
				<c:otherwise>
					<p>
						Another Moon <br> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 다른 <span class="span-moon">달</span>의 이야기
					</p>
				</c:otherwise>
			</c:choose>

		</div>

		<h2 id="board-title">${board.title}</h2>

		<div class="top_container">
			<div class="view-area">

				<div class="board-info">
					<p class="img-p">NO.${board.bno}</p>
					<p class="img-p">글쓴이&nbsp;&nbsp;[${board.m_name}]</p>
					<p class="img-p">작성&nbsp;&nbsp;[${board.regist_day}]</p>
					<div class="img">
						<img alt="조회수" src="resource/img/eye.png" class="img-eye">&nbsp; &nbsp;
						<p class="img-p bLike">${board.b_count}</p>
					</div>

					<!-- 최초 글보기 화면에 왔을 때
내가 (로그인한 사용자) 이 게시글에 공감을 누른 상태면 노랑색 하트, 아니면 빈 하트-->
					<div class="img">
						<c:choose>
							<c:when test="${userLikeTrue>0}">
								<img alt="공감" src="resource/img/full.png" class="img-heart">&nbsp; &nbsp;					
						</c:when>
							<c:otherwise>
								<img alt="공감" src="resource/img/empty3.png" class="img-heart">&nbsp; &nbsp;	
						</c:otherwise>
						</c:choose>
						<p class="img-p blike">${bLike}</p>
					</div>
					<!-- 자물쇠 -->
					
					<c:if test="${board.b_secret eq 's' }">
						<p> <img alt="비밀글" src="resource/img/rock.png" class="rock"> </p>
					</c:if>
					<c:if test="${board.b_secret eq 'o' }">
						<p> </p>
					</c:if>
				
				</div>
				<textarea rows="8" cols="80" readonly class="board_content"> ${board.content}</textarea>

				<div class="content-footer">

					<div class="book_info">
						<c:if test="${book_info !=null}">
							<p>
								참고도서 : <span class="book_info_title">${book_info.title}</span>
							</p>
						</c:if>
					</div>
					<div class="btn-area">
						<button onclick="location.href= 'boardWriteView.do' ">글쓰기</button>

						<c:choose>

							<c:when test="${sessionScope.member.m_id eq board.b_writer }">
								<button type="button" onclick="location.href= 'updateBoardView.do?bno= ${board.bno}' ">수정하기</button>
								<button type="button" class="btn-board-delete">삭제하기</button>
							</c:when>

							<c:when test="${sessionScope.member.m_level eq 'a'}">
								<button type="button" class="btn-board-delete">삭제하기</button>
							</c:when>
						</c:choose>
					</div>
					<!-- btn-area 종료 -->
				</div>
				<!-- content-footer -->

			</div>
			<!-- view area 종료 -->

			<div class="book_img_area">
				<c:if test="${book_info != null}">
					<p>참고 도서</p>
					<img alt="${book_info.title}" src="${book_info.image}">
				</c:if>
			</div>
		</div>
		<!-- top_container 종료 -->


		<!-- 댓글 영역 -->
		<div class="text_box">
			<c:forEach var="txt" items="${requestScope.c_list}">
				<div class="txt_area">
					<div class="m_write">
						<p>작성자 : ${txt.m_name}</p>
					</div>
					<div class="m_content">
						<p>${txt.c_content}</p>
					</div>
				</div>
			</c:forEach>
		</div>


		<div class="add_text">
			<form action="commentAdd.do">
				<textarea id="comment_area" name="comment_area" class="txt_comment_write"></textarea>
				<br> <input type="hidden" name="c_bno" value="${board.bno}">
				<button type="button" id="btn_add_comment">등록</button>
			</form>
		</div>
		<!-- 댓글영역 종료 -->

	</div>
</body>
</html>















