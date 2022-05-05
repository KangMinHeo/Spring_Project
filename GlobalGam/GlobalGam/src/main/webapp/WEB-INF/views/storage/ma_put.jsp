<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
	<link rel="stylesheet" href="resources/css/inventory.css">
<style>
#table_reg{margin:10px 0;}
.gom_wrap{margin:0px 0 -10px 0}
.inout_date{
    width: auto;
    padding: 0 10px;
    height: 35px;
    border: none;
    border: 2px solid #dfe2e5;
    font-size: 13px;
}
</style>
<script>
$(document).ready(function() {
	/*js 스크립트 불러오기*/
	js_reonload_src("datepicker");//js 폴더
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","/inventory/ma_put.html","delete");
	$('#myform').append($('<input/>',{type:'hidden',name:'in_out',value:''}));
	$('#myform').append($('<input/>',{type:'hidden',name:'date_today',value:''}));



	//전체선택
	javascript_onload_src("script_check_box");
	$("#myform").on("click","input[name='chk_all']",function(){
		script_checkall(this,"s_no[]");
	});
	
	//분류 탭 검색
	$(".tab li").click(function(){
		$(".tab li").removeClass("teb_on");
		$(this).addClass("teb_on");
	});
	
	//버블링 이벤트
	$("#myform").on("click","input[name='s_no[]']",function(e){
		e.stopPropagation();
	});
	
	//tr 이벤트
	$("#myform").on("click","#table tbody tr[role='row']",function(){
		$(this).find("input[name='s_no[]']").click();
	});
	
	//데이터테이블
	var table = $("#table").DataTable({
		lengthChange : false, // 표시 건수기능 숨기기
		searching : true, // 검색 기능 숨기기
		ordering : true, // 정렬 기능 숨기기
		info : false, // 정보 표시 숨기기
		processing : false, // 페이징 기능 숨기기
		serverMethod : 'post',
		serverSide: false,
		order : [ 11, "desc" ],
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
				<div id="content" class="maPutCont">
			<ul class="lnb">
				<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
				<li></li>
				<li><a href="storage_main.do">재고관리</a></li>
				<li></li>
				<li><a href="storage_ma_put.do">입/출고 현황</a></li>
			</ul>
			<!--lnb-->
			<div class="sub_con">
				<div class="tit_box">
					<h2 class="sub_tit">입/출고 현황</h2>
					<p class="sub_txt">
						<span>0</span>개의 데이터가 조회되었습니다.
					</p>
				</div>
				<!-- tit_box -->
				<table id="table_reg">
					<tr>
						<th>처리일자</th>
						<td>
							<input type="text" class="btn_candle input_calendar" id='input_date1' name="inout_date1">
							<span class="phonespan">~</span>
							<input type="text" class="btn_candle input_calendar" id='input_date2' name="inout_date2">
						</td>
					</tr>
				</table>
				<div class="search_pc">
					<select class="select_pc">
						<option value="">전체</option>
						<option value="1">입고</option>
						<option value="2">출고</option>
					</select>
				<ul class="tab">
					<li class="teb_on">전체(<span class="tab1">0</span>)</li>
					<li>입고(<span class="tab2">0</span>)</li>
					<li>출고(<span class="tab3">0</span>)</li>
				</ul>
				<!--tab-->
					<input type="text" id="search_po_p" name="search_key" placeholder="search">
					<div class="gla" style="cursor:pointer;"></div>
				</div>
				<!-- search_pc -->			
				<table id="table">
					<colgroup>
						<col width="9%"> <!--제품번호-->
						<col width="10%"> <!--제품명-->
						<col width="9%"> <!--창고명-->
						<col width="9%"> <!--구역명-->
						<col width="6%"> <!--총 수량-->
						<col width="6%"> <!--총 중량-->
						<col width="6%"> <!--단위-->
						<col width="7%"> <!--가격-->
						<col width="10%"> <!--처리일자-->
						<col width="6%"> <!--구분-->
						<col width="6%"> <!--입/출-->
					</colgroup>
					<thead>
						<tr>
							<th>제품번호</th>
							<th>제품명</th>
							<th>창고명</th>
							<th>구역명</th>
							<th>총 수량</th>
							<th>총 중량</th>
							<th>단위</th>
							<th>가격</th>
							<th>처리일자</th>
							<th>구분</th> <!-- 완제품, 원자재 구분 -->
							<th>입/출</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="5">합계</td>
							<td colspan="6">100,000,000</td>
						</tr>
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