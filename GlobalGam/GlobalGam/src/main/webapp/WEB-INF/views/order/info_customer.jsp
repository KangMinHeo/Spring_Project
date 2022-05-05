<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
<link rel="stylesheet" href="/resources/css/obtain_order.css">
</head>
<script>
$(document).ready(function(){
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","/obtain_order/info_customer.html","delete");
	
	//버블링 이벤트
	$("#table").on("click","tbody > tr > td.control, input[type='checkbox']",function(e){
		e.stopPropagation();
	});
	
	//tr 클릭 이벤트 - 상세페이지 이동
	$("#table").on("click","tbody tr[role='row']",function(e){
		var s_no = $(this).find("#cuNo").text();
		console.log(s_no);
		location.href='order_info_customer_mod.do?s_no='+s_no;
	});
	
	//등록 버튼 - 고객사 등록페이지
	$("#myform .bot_btn .btn_right").click(function(){
		location.href='order_info_customer_reg.do';
	});
	
	//데이터 출력(추후 ajax로 변경)
	/* $("#table tbody").append("<tr><td>1</td><td>CUS-0001</td><td>제일식품</td><td>이한진</td><td>031-573-2569</td><td>010-4710-5695</td><td>031-573-2570</td><td>mjindust@hanmail.net</td></tr>"); */
	
	//데이터테이블
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
		order : [ 1, "asc" ], //정렬기준
		dataType : "json",
		paging : true,
		pageLength : 10,
		pagingType : "full_numbers",
		dom : 'rt<"bottom"iflp>',
		language : {
	        emptyTable: "데이터가 없습니다.",
	        lengthMenu: "페이지당 _MENU_ 개씩 보기",
	        info: "현재 _START_ - _END_ / _TOTAL_건",
	        infoEmpty: "데이터 없음",
	        infoFiltered: "( _MAX_건의 데이터에서 필터링되었습니다. )",
	        search: "",
	        zeroRecords: "일치하는 데이터가 없습니다.",
	        loadingRecords: "로딩중...",
	        processing:  false,
	        paginate: {
	            next: "다음",
	            previous: "이전",
	            first: '처음',
	            last: '끝'
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
          }, {
        	orderable: false,
            targets:   1  
          }
        ]
	});
	
	new $.fn.dataTable.Responsive( table );
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
				<div id="content">
				<ul class="lnb">
					<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="order_main.do">수주관리</a></li>
					<li></li>
					<li><a href="order_info_customer.do">고객업체 정보</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
					<div class="tit_box">
						<h2 class="sub_tit">고객업체 정보</h2>
						<p class="sub_txt">
							<span>${requestScope.list.size() }</span>개의 데이터가 조회되었습니다.
						</p>
					</div>
					<!-- tit_box -->
					<div class="search_pc">
						<input type="text" id="search_po_p" name="search_key" placeholder="search">
						<div class="gla"></div>
					</div>
					<!-- search_pc -->
					<div id="table_wrapper">
						<table id="table" class="ui celled table" style="width: 100%">
							<colgroup>
								<col width="5%">
								<col width="14%">
								<col width="14%">
								<col width="12%">
								<col width="12%">
								<col width="13%">
								<col width="12%">
								<col width="14%">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>고객업체 코드</th>
									<th>고객업체 명</th>
									<th>대표자 명</th>
									<th>전화번호</th>
									<th>휴대폰 번호</th>
									<th>FAX</th>
									<th>이메일</th>
								</tr>
							</thead>
							<tbody>
							<!-- c:foreach문을 이용해서 list에 있는 값들을 불러서 넣는다. -->
							<% int i = 1; %>
							<c:forEach var="list" items="${requestScope.list }">
							<tr>
								<td><%=i++ %></td>
								<td id="cuNo">${list.cuNo }</td>
								<td>${list.cuName }</td>
								<td>${list.cuCeo }</td>
								<td>${list.cuTel }</td>
								<td>${list.cuEmpTel }</td>
								<td>${list.cuFax }</td>
								<td>${list.cuEmail }</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="bot_box">
						<div class="bot_btn">
							<div class="btn btn_right" title="등록">등록</div>
						</div>
						<!-- bot_btn -->
					</div>
					<!-- bot_box -->
				</div>
				<!--con-->
			</div>
			</div>
	</div>
	<!--content-->
	<div id="copy">
		<%@include file="../inc/copy_wrap.jsp"%>
	</div>
</body>
</html>
</body>
</html>