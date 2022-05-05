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
<script>
$(document).ready(function() {
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","/order/info_cooperative.html","delete");

	//체크박스 전체 선택
	javascript_onload_src("script_checkall");
	$("#table input[name='chk_all']").click(function(){
		script_checkall(this,"s_no[]");
	});
	
	//버블링 이벤트
	$("#table").on("click","tbody > tr > td.control,.btn_check,input[type='checkbox']",function(e){
		e.stopPropagation();
		var no = $(this).parent().parent().find(".co_no").text();
		console.log(no);
		window.open('request_popup_product.do?co_no='+no, '제품정보', 'width=700px, height=800px');
	});
	
	//tr 클릭 이벤트
	$("#table").on("click","tbody tr[role='row']",function(e){
		var s_no = $(this).find(".co_no").text();
		location.href='request_info_cooperative_mod.do'+'?s_no='+s_no;
	});
	
	//등록 버튼
	$("#myform .bot_btn .btn_right").click(function(){
		location.href='request_info_cooperative_reg.do';
	});
	
	//데이터 출력(추후 ajax로 변경)
	/* $("#table tbody").append("<tr><td>1</td><td>COP-0001</td><td>명리식품</td><td>김용훈</td><td>02-3211-6600</td><td>010-4281-7744</td><td>02-718-1812</td><td>mlits@naver.com</td><td><div class='btn_check' title='납품제품 현황' onclick=\"script_ajax_layer_pop('/order/popup_check.html','s_no=','.popup-15')\">확인</div></td></tr>");
	$("#table tbody").append("<tr><td>2</td><td>COP-0002</td><td>프래쉬푸드</td><td>김진표</td><td>02-2636-6600</td><td>010-8274-7744</td><td>02-2636-1812</td><td>freshfood26@gmail.com</td><td><div class='btn_check' title='납품제품 현황' onclick=\"script_ajax_layer_pop('/order/popup_check.html','s_no=','.popup-15')\">확인</div></td></tr>"); */
	
	//데이터테이블
	javascript_onload_src("script_ajax_layer_pop");
	$("#table thead tr").prepend("<th>상세</th>");
	$("#table tbody tr").prepend("<td>상세</td>");
	var table = $("#table").DataTable({
		lengthChange : false, // 표시 건수기능 숨기기
		searching : false, // 검색 기능 숨기기
		ordering : true, // 정렬 기능 숨기기
		info : false, // 정보 표시 숨기기
		processing : false, // 페이징 기능 숨기기
		serverMethod : 'post',
		serverSide: false,
		order : [ 2, "desc" ],
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
          }, {
        	orderable: false,
            targets:   1  
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
				<div id="content">
				<ul class="lnb">
					<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href='request_main.do'>발주관리</a></li>
					<li></li>
					<li><a href="reqeust_info_cooperative.do">협력업체 정보</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
					<div class="tit_box">
						<h2 class="sub_tit">협력업체 정보</h2>
						<p class="sub_txt">
							<span>2</span>개의 데이터가 조회되었습니다.
						</p>
					</div>
					<!-- tit_box -->
					<div class="search_pc">
						<input type="text" id="search_po_p" name="search_key" placeholder="search">
						<div class="gla" style="cursor:pointer;"></div>
					</div>
					<!-- search_pc -->
					<div id="table_wrapper">
						<table id="table" class="ui celled table" style="width: 100%">
							<colgroup>
								<col width="5%">
								<col width="13%">
								<col width="13%">
								<col width="9%">
								<col width="11%">
								<col width="12%">
								<col width="11%">
								<col width="12%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>협력업체 코드</th>
									<th>협력업체 명</th>
									<th>대표자 명</th>
									<th>전화번호</th>
									<th>휴대폰 번호</th>
									<th>FAX</th>
									<th>이메일</th>
									<th>제품</th>
								</tr>
							</thead>
							<tbody>
							<%int i = 1; %>
								<c:forEach var="co_com" items="${requestScope.list }">
									<tr>
										<td><%=i++ %></td>
										<td class="co_no">${co_com.co_no }</td>
										<td>${co_com.co_name }</td>
										<td>${co_com.co_ceo }</td>
										<td>${co_com.co_tel }</td>
										<td>${co_com.co_em_tel }</td>
										<td>${co_com.co_fex }</td>
										<td>${co_com.co_email }</td>
										<td><div class='btn_check' title='납품제품 현황' >확인</div></td>
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
				<div id="lay" style="overflow: auto;">
					<div class="bg"></div>
					<div id="lay2"></div>
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
</body>
</html>