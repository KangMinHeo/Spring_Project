<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
	<link rel="stylesheet" href="resources/css/order.css">
</head>
<script>
$(document).ready(function(){
	/*js 스크립트 불러오기*/
	js_reonload_src("datepicker");//js 폴더

	/*URL 파라미터 가져오기*/
	const urlParams = new URLSearchParams(location.search);
	var s_no = urlParams.get("s_no");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","/order/ma_order.html","delete");
	$('#myform').append($('<input/>',{type:'hidden',name:'ph_code',value:s_no}));
	
	//체크박스 전체 선택
	javascript_onload_src("script_checkall");
	$("input[name='chk_all']").click(function(){
		script_checkall(this,"s_no[]");
	});
	
	//버블링 이벤트
	$("#table").on("click","tbody > tr > td.control,input[type='checkbox']",function(e){
		e.stopPropagation();
	});
	
	//tr 클릭 이벤트
	$("#table").on("click","tbody tr[role='row']",function(e){
		var no = $(this).find(".r_no").text();
		console.log(no);
		location.href='request_ma_order_mod.do?r_no='+no;
	});
	
	//발주서인쇄
	$("#table").on("click",".print",function(e){
		e.stopPropagation();
		var no = $(this).parent().parent().find("#r_no").text();
		console.log(no);
		window.open('request_print.do?r_no='+no,'주문서','width=800, scrollbars=yes, menubar=no, status=no, toolbar=no');
	});
	
	//등록 버튼
	$(".bot_btn .btn_right").click(function(){
		location.href='request_ma_order_reg.do';
	});
	
	// 검색 아이콘 클릭
	$(".gla").click(function(){ // 검색창에 있는 돋보기 모양 아이콘 클릭 이벤트
			let data = "searchKey="+$("#search_po_p").val(); /* 검색 칸에 입력한 값을 저장 */
			$.ajax({
				type: "get",
				url: "ma_order_search.do", // 해당 url로 값을 전달하여 Back 작업 실시
				data: data,
				dataType: "json",
				success:function(r){
					let str = "";
					for(let i = 0; i < r.length; i++){
						str += "<tr><td class='r_no'>"+r[i].r_no+"</td>";
						str += "<td>"+r[i].co_name+"</td>";
						str += "<td>"+r[i].r_de_m_no+"</td>";
						str += "<td>"+r[i].m_name+"</td>"; 
						str += "<td>"+r[i].r_write_date +"</td>";					
						str += "<td>"+r[i].r_write_date+"</td>";
						str += "<td>"+r[i].r_end_date+"</td>";
						str += "<td>"+r[i].r_de_count+"</td>";
						str += "<td><div class='print' title='인쇄'></div></td>";
					}
					$("#table>tbody").html(str); // 테이블 영역에 표기
					$(".sub_txt > span").text(r.length); // content 영역 좌 상단 갯수 표기에 해당 갯수로 표기
				}
			});
	});
	
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
		order : [ 5, "desc" ],
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
       } ]
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
				<div id="content" class="maOrderCont">
		    	<ul class="lnb">
		    		<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
		    		<li></li>
		    		<li><a href="/request_main.do">발주관리</a></li>
		    		<li></li>
		    		<li><a href="request_ma_order.do">발주관리</a></li>
		    	</ul>
		    	<!--lnb-->
		    	
				<div class="sub_con">
					<div class="tit_box">
						<h2 class="sub_tit">발주 관리</h2>
						<p class="sub_txt">
							<span>${requestScope.list.size() }</span>개의 데이터가 조회되었습니다.
						</p>
					</div>
					<!-- tit_box -->
					<table id="table_reg">
						<tr>
							<th>발주일자</th>
							<td>
								<input type="text" class="btn_candle input_calendar" id='input_date1' name="inout_date1">
								<span class="phonespan">~</span>
								<input type="text" class="btn_candle input_calendar" id='input_date2' name="inout_date2">
							</td>
							<th>납기일자</th>
							<td>
								<input type="text" class="btn_candle input_calendar" id='input_date3' name="inout_date3">
								<span class="phonespan">~</span>
								<input type="text" class="btn_candle input_calendar" id='input_date4' name="inout_date4">
							</td>
						</tr>
					</table>
					<div class="search_pc">
		    			<input type="text" id="search_po_p" name="search_key" placeholder="search">
						<div class="gla" style="cursor:pointer;"></div>
					</div>
					<!-- search_pc -->
					<table id="table" class="ui celled table" style="width: 100%">
						<thead>
							<tr>
								<th>발주번호</th>
								<th>협력업체</th>
								<th>제품번호</th>
								<th>제품명</th>
								<th>등록일자</th>
								<th>발주일자</th>
								<th>납기일자</th>
								<th>발주수량</th>
								<th>발주서</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="req" items="${requestScope.list }">
									<tr>
										<td id="r_no" class="r_no">${req.r_no }</td>
										<td>${req.co_name }</td>
										<td>${req.r_de_m_no }</td>
										<td>${req.m_name }</td>
										<td>${req.r_write_date }</td>
										<td>${req.r_write_date }</td>
										<td>${req.r_end_date }</td>
										<td>${req.r_de_count}</td>										
										<td><div class='print' title='인쇄'></div></td>
									</tr>
								</c:forEach>
						</tbody>
					</table>
					<div class="bot_box">
						<div class="bot_btn">
							<div class="btn btn_right" title="등록">등록</div>
						</div>
						<!-- bot_btn -->
					</div>
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