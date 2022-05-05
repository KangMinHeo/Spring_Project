<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
	<link rel="stylesheet" href="resources/css/shipment.css">
<meta charset="utf-8">
<script>
$(document).ready(function() {
	/*js 스크립트 불러오기*/
	//js_reonload_src("datepicker");//js 폴더
	
	/*URL 파라미터 가져오기*/
	const urlParams = new URLSearchParams(location.search);
	var s_no = urlParams.get("s_no");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","/shipment/pr_order_shipment.html","delete");
	$('#myform').append($('<input/>',{type:'hidden',name:'sh_code',value:s_no}));
	$('#myform').append($('<input/>',{type:'hidden',name:'date_today',value:''}));
	
	//분류 탭 검색
	$(".tab li").click(function(){
		$(".tab li").removeClass("teb_on");
		$(this).addClass("teb_on");
	});
	
	//버블링 이벤트
	$("#table").on("click","tbody > tr > td.control, input[type='checkbox']",function(e){
		e.stopPropagation();
	});
	
	//tr 클릭 이벤트
	// $("#table").on("click","tbody tr[role='row']",function(e){
	// 	var s_no = $(this).find("input[name='s_no[]']").val();
	// 	location.href='/shipment/pr_order_shipment_mod.html?s_no='+s_no;
	// });
	
	//인쇄
	javascript_onload_src("script_ajax_layer_pop");
	$("#table").on("click",".print",function(e){
		e.stopPropagation();
		script_ajax_layer_pop('/shipment/popup_shipment_print.html?s_no=','','.popup-28');
	});
	
	//출하
	$("#table").on("click",".state_check",function(e){
		e.stopPropagation();
		var no = $(this).parent().parent().find("#f_no").text();
		console.log(no);
		location.href='forward_pr_order_shipment_me.do?f_no='+no; 
	});
	
/* 	//등록 버튼
	$("#myform .bot_btn .btn_right").click(function(){
		location.href='/shipment/pr_order_shipment_reg.html';
	}); */
	
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
		order : [ 1, "desc" ],
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
});
</script>
</head>
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
				<div id="content" class="prOrderShipmentCont">
				<ul class="lnb">
					<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="forward_main.do">출하관리</a></li>
					<li></li>
					<li><a href="forward_pr_order_shipment.do">출하지시 관리</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
					<div class="tit_box">
						<h2 class="sub_tit">출하지시 관리</h2>
						<p class="sub_txt">
							<span>${requestScope.list.size() }</span>개의 데이터가 조회되었습니다.
						</p>
					</div>
					<!-- tit_box -->
					<table id="table_reg">
						<tr>
							<th>출하일자</th>
							<td>
								<input type="text" class="btn_candle input_calendar" id='input_date1' name="inout_date1" readonly>
								<span class="phonespan">~</span>
								<input type="text" class="btn_candle input_calendar" id='input_date2' name="inout_date2" readonly>
							</td>
							<th>납기일자</th>
							<td>
								<input type="text" class="btn_candle input_calendar" id='input_date3' name="inout_date3" readonly>
								<span class="phonespan">~</span>
								<input type="text" class="btn_candle input_calendar" id='input_date4' name="inout_date4" readonly>
							</td>
						</tr>
					</table>
					<div class="search_pc">
			  				<!--tab-->
			  				<input type="text" id="search_po_p" name="search_key" placeholder="search">
			  				<div class="gla" style="cursor:pointer;"></div>
			  			</div>
			   		<!-- search_pc -->		
					<table id="table" class="ui celled table" style="width: 100%">
						<colgroup>
							<col width="6%">	<!-- 출하코드 -->
							<col width="9%">	<!-- 출하일자 -->
							<col width="9%">	<!-- 납기일자 -->
							<col width="9%">	<!-- 고객업체 -->
							<col width="13%">	<!-- 제품명 -->
							<col width="6%">	<!-- 요청수량 -->
							<col width="6%">	<!-- 요청수량 -->
							<col width="6%">	<!-- 인쇄 -->
							<col width="8%">	<!-- 상태 -->
						</colgroup>
						<thead>
							<tr>
								<th>출하코드</th>
								<th>출하일자</th>
								<th>납기일자</th>
								<th>고객업체</th>
								<th>제품명</th>
								<th>요청수량</th>
								<th>출하수량</th>
								<th>재고수량</th>
								<!-- <th>인쇄</th> -->
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
						 	<c:forEach var="list" items="${requestScope.list }">
						 		<tr>
						 			<td id="f_no">${list.f_no }</td>
						 			<td>${list.f_date }</td>
						 			<td>${list.o_end_date }</td>
						 			<td>${list.cu_name }</td>
						 			<td>${list.p_name }</td>
						 			<td>${list.o_de_count }</td>
						 			<td>${list.f_count }</td>
						 			<td>${list.st_number }</td>
						 			<!-- <td><div class='print' title='인쇄'></div></td> -->
				 					<td>
				 						<c:choose>
							 				<c:when test="${list.f_count eq list.o_de_count}">
									 				<div class='state_check' title='출하완료' style='color: blue; border: 1px solid blue;'>출하완료</div>
							 				</c:when>
							 				<c:when test="${list.o_de_count > list.st_number + list.f_count }">
								 					<div class='state_check' title='출고요청' style='color: red; border: 1px solid red;margin-bottom:5px;'>생산중</div>
							 				</c:when>
							 				<c:when test="${list.o_de_count <= list.st_number + list.o_de_count }">
									 				<div class='state_check' title='출하처리' style='color: green; border: 1px solid green;'>출하대기</div>
							 				</c:when>
							 			</c:choose>
					 				</td>
						 		</tr>
						 	</c:forEach>
						</tbody>
					</table>
					<!-- bot_box -->
				</div>
				<!--con-->
				<div id="lay" style="overflow: auto;">
					<div class="bg"></div>
					<div id="lay2"></div>
				</div>
			</div>
			<!--content-->
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