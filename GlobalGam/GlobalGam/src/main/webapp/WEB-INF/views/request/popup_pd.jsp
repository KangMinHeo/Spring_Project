<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>원자재 목록</title>
	<%@include file="../inc/head_html_text.jsp"%>
	<link rel="stylesheet" href="resources/css/order.css">
<meta charset="UTF-8">
</head>
<style>
.tr_hover:hover {
	background: #ddd;
	cursor: pointer;
}
</style>
<script>
$(document).ready(function(){
	/*URL 파라미터 가져오기*/
	const urlParams = new URLSearchParams(location.search);
	var s_no = urlParams.get("s_no");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".popup_check.popup-15","myform2","","");
	$('#myform2').append($('<input/>',{type:'hidden',name:'s_no',value:s_no}));

	// tr 클릭 이벤트
	$("#table_check").on("click", "tbody tr[role='row']", function(e){
		window.self.close();
	});
	
	$(".pop_close").click(function(){
		window.close();
	})
	
	//닫기
	$(".popup-15 .down").click(function(){
		$('#lay').fadeOut();
		$('html, body').css({'overflow': 'visible'});
	});
	
	//데이터테이블
	var table = $("#table_check").DataTable({
		lengthChange : false, // 표시 건수기능 숨기기
		searching : true, // 검색 기능 숨기기
		ordering : true, // 정렬 기능 숨기기
		info : false, // 정보 표시 숨기기
		processing : false, // 페이징 기능 숨기기
		serverMethod : 'post',
		serverSide: false,
		order : [ 0, "desc" ],
		dataType : "json",
		paging : true,
		pageLength : 10,
		pagingType : "full_numbers",
		dom : 'rt<"bottom"iflp>',
		language : {
	        "emptyTable": "데이터가 없습니다.",
	        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
	        "info": "현재 _START_ - _END_ / _TOTAL_건",
	        "infoEmpty": "데이터 없음",
	        "infoFiltered": "( _MAX_건의 데이터에서 필터링되었습니다. )",
	        "search": "",
	        "zeroRecords": "일치하는 데이터가 없습니다.",
	        "loadingRecords": "로딩중...",
	        "processing":  false,
	        "paginate": {
	            "next": "다음",
	            "previous": "이전",
	            "first": '처음',
	            "last": '끝'
	        }
		},
        columnDefs: [ {
            className: 'control',
            targets:   0
          }
        ]
	});
	
	alignModal(); //수직 정렬
});
$(window).resize(function(){
	alignModal(); //수직 정렬
});
</script>
<body>
	<div class="popup_check popup-15">
		<div class="pop_close down"></div>
		<div class="message">원자재 현황</div>
		<!-- message -->

			<table id="table_check" class="table_pop">
				<colgroup>
					<col width="50%">
					<col width="50%">
				</colgroup>
				<thead>
    				<tr>
    					<th>제품번호</th>
    					<th>제품명</th>
    					<th>단가</th>
    				</tr>
				</thead>
				<tbody>
					<c:forEach var="met" items="${requestScope.list }">
						<tr>
							<td class="m_no">${met.m_no}</td>
							<td class="m_name">${met.m_name }</td>
							<td class="m_price">${met.m_price }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- table_search -->
		<div class="pop_bp"></div>
		<!-- pop_bp -->
	</div>
	<!--popup-->
</body>
</html>