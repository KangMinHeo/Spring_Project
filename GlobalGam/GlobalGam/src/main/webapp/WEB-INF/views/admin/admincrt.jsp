<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
</head>
<script type="text/javascript">
$( document ).ready(function() {
    console.log( "ready!" );
 	$("#table").on("click", ".adu", function(){
		var no = $(this).parent().parent().find(".no").text();
		console.log(no);
		location.href = 'adminup.do?e_no='+no;
	});
	$("#table").on("click", ".add", function() {
		var no = $(this).parent().parent().find(".no").text();
		console.log(no);
		location.href = 'admindt.do?e_no=' + no;
	});
	
	javascript_onload_src("script_ajax_layer_pop");
	$("#table thead tr").prepend("<th>상세</th>");
	$("#table tbody tr").prepend("<td>상세</td>");
    var table = $("#table").DataTable({
    	lengthChange : false, // 표시 건수기능 숨기기
		searching : true, // 검색 기능 숨기기
		ordering : true, // 정렬 기능 숨기기
		info : false, // 정보 표시 숨기기
		processing : false, // 페이징 기능 숨기기
		serverMethod : 'post',
		serverSide: false,
		order : [ 1, "asc" ],
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
		responsive: {
            details: {
                type: 'column'
            }
        },
        columnDefs: [ {
            className: 'control',
            orderable: false,
            targets:   0
          }
        ]
    });
    new $.fn.dataTable.Responsive( table );
/*     $(".adu").click(function() {
    	alert("이벤트");
    	var no=$(this).parent().parent().find(".no").text();
    	console.log(no);
		//location.href='adminup.do?e_no='+no;
	});  */
});
</script>
<body>
	<div class="background"></div>
	<div class="header_wrap">
		<!--header-->
		<%@include file="../inc/header.jsp"%>
		<!--header-->
	</div>
	<div class="content">
		<%@include file="../inc/left_menu.jsp"%>
			<div class="content_detail" id="content_detail">
				<!-- 여기가 메인 컨텐츠 영역 -->
				<div class="div_right">
					<ul class="lnb">
					<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="admin_select_main.do">관리자 페이지</a></li>
					<li></li>
					<li><a href="admincrt_main.do">직원 수정 / 삭제</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
					<div class="tit_box">
						<h2 class="sub_tit">직원 정보</h2>
						<p class="sub_txt">
							<span>${requestScope.emp.size() }</span>개의 데이터가 조회되었습니다.
						</p>
					</div>
					<!-- tit_box -->
					<div class="search_pc">
						<input type="text" id="search_po_p" name="search_key" placeholder="search">
						<div class="gla"></div>
					</div>
					<!-- search_pc -->
					<table id="table" class="ui celled table">
						<thead>
							<tr>
								<td>사원 번호</td>
								<th>사원 이름</th>
								<th>담당 공정</th>
								<th>담당 라인</th>
								<th>사원 권한</th>
								<th>사원 권한 관리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.emp}" var="list" varStatus="loop">
								<tr>
									<td class="no"><c:out value="${list.eNo }" /></td>
									<td><c:out value="${list.eName }" /></td>
									<td><c:out value="${list.eProNo }" /></td>
									<td><c:out value="${list.eLine }" /></td>
									<td><c:out value="${list.eLevel }" /></td>
									<td><a class="adu">수정</a> / <a class="add">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</div>
	</div>
	<!--content-->
	<div id="copy">
		<%@include file="../inc/copy_wrap.jsp"%>
	</div>
</body>
</html>