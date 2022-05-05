<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
<style>
@media screen and (max-width: 1120px){
	#search_po_p  { width:230px; background: url(/img/btn_search.jpg) no-repeat 16px 50%; }
	.gla {display:none;}
}
@media screen and (max-width: 880px){
	.search_pc { display: flex; flex-direction: column-reverse; }
	.search_pc .tab { margin:0; }
	#search_po_p  { width:100%; margin:0 0 10px; background: url(/img/btn_search.jpg) no-repeat 16px 50%; }
	#table { margin: unset; }
}
@media screen and (max-width: 615px) {
	ul.tab {
		height:auto;
	}
	ul.tab li {
		width:31%;
		height: auto;
		margin: 0 1% 10px 1%;
		padding: 12px 0;
		text-align: center;
		font-size:12px;
		border-right: 1px solid #b3c1cb;
		line-height: inherit;
	}
}
</style>
<script>
$(document).ready(function() {
	/*URL 파라미터 가져오기*/
	const urlParams = new URLSearchParams(location.search);
	var s_no = urlParams.get("s_no");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","","");
	$('#myform').append($('<input/>',{type:'hidden',name:'bar_no',value:s_no}));

	//분류 탭 검색
	$(".tab li").click(function(){
		$(".tab li").removeClass("teb_on");
		$(this).addClass("teb_on");
	});
	
	//버블링 이벤트
	$("#table").on("click","tbody > tr > td.control",function(e){
		e.stopPropagation();
	});
	
	//tr 클릭 이벤트
	$("#table").on("click","tbody tr[role='row']",function(e){
		var no = $(this).find("#st_no").text();
		console.log(no);
		location.href='storage_inv_detail.do?st_no='+no;
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
				<div id="content">
			<ul class="lnb">
				<li><a href="/"><img src="resources/img/icon_home.jpg"alt="홈으로"></a></li>
				<li></li>
				<li><a href="storage_main.do">재고관리</a></li>
				<li></li>
				<li><a href="storage_ma_inventory.do">재고 관리</a></li>
			</ul>
			<!--lnb-->
			<div class="sub_con">
				<div class="tit_box">
					<h2 class="sub_tit">재고 관리</h2>
					<p class="sub_txt">
						<span>${requestScope.list3_size }</span>개의 데이터가 조회되었습니다.
					</p>
				</div>
				<!-- tit_box -->
				<div class="search_pc">
					<input type="text" id="search_po_p" name="search_key" placeholder="search">
					<div class="gla" style="cursor:pointer;"></div>
				</div>
				<div id="table_wrapper">
					<table id="table" style="width: 100%">
						<colgroup>
							<col width="8%"> <!--구분-->
							<col width="12%"> <!--창고명-->
							<col width="12%"> <!--제품번호-->
							<col width="22%"> <!--제품명-->
							<col width="8%"> <!--총 수량-->
						</colgroup>
						<thead>
							<tr>
								<th>구분</th>
								<th>창고명</th>
								<th>제품번호</th>
								<th>제품명</th>
								<th>총 수량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${requestScope.list }">
								<tr>
									<td>${list.st_kind }</td>
									<td id="st_no">${list.st_no }</td>
									<td>${list.st_name }</td>
									<td>${list.m_name }</td>
									<td>${list.st_number }</td>
								</tr>
							</c:forEach>
							<c:forEach var="list" items="${requestScope.list2 }">
								<tr>
									<td>${list.st_kind }</td>
									<td id="st_no">${list.st_no }</td>
									<td>${list.st_name }</td>
									<td>${list.p_name }</td>
									<td>${list.st_number }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="bot_box">
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