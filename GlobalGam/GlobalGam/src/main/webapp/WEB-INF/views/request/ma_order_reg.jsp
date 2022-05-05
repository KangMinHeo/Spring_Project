<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
</head>
<link rel="stylesheet" href="resources/css/order.css">
<style>
@media screen and (max-width: 600px){
    #myform .input_calendar{
        width:90% !important;
    }
}
</style>
<script>
$(document).ready(function() {
	/*js 스크립트 불러오기*/
	js_reonload_src("datepicker");
	
	/*URL 파라미터 가져오기*/
	const urlParams = new URLSearchParams(location.search);
	var s_no = urlParams.get("s_no");
	var b_no = urlParams.get("b_no");
	var od_no = urlParams.get("od_no");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","/order/ma_order_reg.html","insert");
	$('#myform').append($('<input/>',{type:'hidden',name:'ph_code',value:s_no}));
	$('#myform').append($('<input/>',{type:'hidden',name:'b_no',value:b_no}));
	$('#myform').append($('<input/>',{type:'hidden',name:'od_no',value:od_no}));
	$('#myform').append($('<input/>',{type:'hidden',name:'tip_index',value:''}));
	
	// 담당자 변경 -> popup창 이동
	$("#e_manager").click(function(){
		openPop();
	});
	
	// 협력업체 선정 ->popup창 이동
	$(".co_name, #ph_address, #ph_address2").click(function(){
		openPop2();
	});
	
	// 원자재 선정 -> popup창 이동
	$(".p_name, .mt_number").click(function(){
		openPop3();
	});
	
	function openPop(){
	    var popup = window.open('request_popup_order.do','담당자 선택', 'width=700px,height=800px');
	}
	
	function openPop2(){
		var popup = window.open('request_popup_cc.do','협력사 선택', 'width=700px,height=800px');
	}
	
	function openPop3(){
		var popup = window.open('request_popup_met.do','자재 선택', 'width=700px,height=800px');
	}
	
	$(".quantity").change(function(){
		var pri = $(".p_price").val(); // 단가
		var p_sum = $(".price_sum").val($(this).val() * $(".p_price").val());
		var vat = $(".vat").val($(this).val() * ($(".p_price").val()*0.1));
 		var t_sum = $(".total_sum").val($(this).val() * $(".p_price").val() + $(this).val() * ($(".p_price").val()*0.1));

 		$(".quantity2").val($(this).val());
	});
	
	//납품처 주소
	javascript_onload_src("script_ajax_layer_pop");
	$("input[name='ph_post']").focus(function() {
		script_ajax_layer_pop('/popup/popup_home.html','post=ph_post&address=ph_address','.popup-31');
	});
	
	//협력업체
	$("#myform").on("click", ".c_name", function() {
		script_ajax_layer_pop('/popup/popup_coo.html','','.popup-5');
	});
	
	//제품
	$("#myform").on("focus", ".mt_number, .p_name", function() {
		script_ajax_layer_pop('/order/popup_material.html',"",'.popup-22');
	});
	
	//등록 버튼
	$(".btn.btn_right.save").click(function(){
		// 값들 받아서 던지기
		var co_code = $(".co_no").val(); // 협력사 사업자번호
		var wdate = $("input[name='s_date']").val(); // 발주일자
		var edate = $("input[name='e_date']").val(); // 납기일자
		var e_no = $("#e_no").val(); // 담당자 사번
		var m_no = $(".mt_number").val();
		var m_count = $(".quantity").val();
		var m_price = $(".p_price").val();
		location.href='request_ma_order_save.do?co_code='+co_code+'&wdate='+wdate+'&edate='+edate+
				'&e_no='+e_no+'&m_no='+m_no+'&m_count='+m_count+'&m_price='+m_price;
	});

	headerFixed();
	no_display();//번호
	
	//협력업체 목록
	$("#table thead tr").prepend("<th>상세</th>");
 	$("#table tbody tr").prepend("<td>상세</td>");
	var table = $("#table").DataTable({
		lengthChange : false, // 표시 건수기능 숨기기
		searching : false, // 검색 기능 숨기기
		ordering : false, // 정렬 기능 숨기기
		info : false, // 정보 표시 숨기기
		processing : false, // 페이징 기능 숨기기
		serverMethod : 'post',
		order : [ 1, "desc" ],
		dataType : "json",
		paging : false,
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
        }]
	});
	
	new $.fn.dataTable.Responsive( table );

	//추가버튼 
	$('#add_row1').on( 'click', function () {
		draw_row(table,'');
	});
	
	//삭제버튼
	$("#myform").on("click", ".btn_plma", function(){
		table.row($(this).parents('tr')).remove().draw();
		no_display();
	});
});


function no_display(){ // 행 삭제 - 숫자입력
	var ct = $('.btn_number').length;
	for(var i=0; i<ct; i++){
		$('.btn_number').eq(i).text(i+1);
	}
}

function headerFixed(){
	//리스트 상단 헤더 고정
	var winWidth = $(document).width();
	var menuOffset = $("#table thead").offset();
	var tableWidth = $("#table").innerWidth();
	var colArr = [0,5,5,9,9,9,9,9,9,9,9,9,9];
	$("#table thead").css("width",tableWidth);
	$("#table thead tr th").each(function(i,v){
		var colWidth = tableWidth * colArr[i] / 100;
		$(this).css("width",colWidth+"px");
	});
	if(winWidth>768){
		$(window).scroll(function() {
			if($(document).scrollTop() > menuOffset.top) {
				$("#table thead").addClass('menuFixed');
			}else{
				$("#table thead").removeClass('menuFixed');
			}
		});
	}
}
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
				<div id="content" class="maOrderRegCont">
				<ul class="lnb">
					<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href='/request_main.do'>발주관리</a></li>
					<li></li>
					<li><a href='request_ma_order.do'>발주관리</a></li>
				</ul>
				<!--lnb-->
				
				<div class="sub_con">
					<div class="tit_box">
						<h2 class="sub_tit">발주 등록</h2>
					</div>
					<!-- tit_box -->
					<table class="tag_table" id="due_table">
						<tbody>
							<tr>
								<th colspan="1">발주일자</th>
								<td colspan="2">
									<input type="text" class="btn_candle input_calendar" name="s_date">
								</td>
								<th colspan="1">납기일자</th>
								<td colspan="2">
									<input type="text" class="btn_candle input_calendar" name="e_date">
								</td>
							</tr>
							<tr target="_parent">
								<th>담당자</th>
								<td  colspan="4"  id="e_manager">
									<input type="text" id="e_no" readonly>
									<input type="text" id="e_name" readonly>
								</td>
							</tr>
							<tr>
								<th colspan="1">납품처 주소</th>
								<td colspan="5">
									<input type="text" id="ph_address" name="ph_address" style="width:60%;display:block;float:none;" readonly>
									<input type="text" id="ph_address2" name="ph_address2" style="width:60%;float:none;">
									<label for="ph_addr" class="error"></label>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table_ri" id="table" style="width: 100%">
						<colgroup>
							<col width="5%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
						</colgroup>
						<thead>
							<tr>
								<th style="cursor: pointer;" id="add_row1">추가</th>
								<th>협력업체</th>
								<th>제품번호</th>
								<th>제품명</th>
								<th>발주수량</th>
								<th>단가</th>
								<th>공급가액</th>
								<th>부가세</th>
								<th>합계</th>
							</tr>
						</thead>
						<tbody>
							<tr>
			                    <td>
			                    	<div class="btn_plma btn_number" title="삭제">1</div>
			                    	<input type="hidden" class="ph_no" name="ph_no[]">
			                	</td>
			                    <td>
			                    	<input type="text" class="co_name" name="c_name[]" style="cursor:pointer;" readonly>
			                    	<input type="hidden" class="co_no" name="pt_code[]">
			                	</td>
			                    <td>
			                    	<input type="text" class="mt_number" name="mt_number[]" style="cursor:pointer;" readonly>
			                    	<input type="hidden" class="sacks_unit" name="sacks_unit[]">
			                    	<input type="hidden" class="box_quantity" name="box_quantity[]">
			                    	<input type="hidden" class="p_unit" name="p_unit[]">
			                	</td>
			                    <td><input type="text" class="p_name" name="p_name[]" style="cursor:pointer;" readonly></td>
			                    <td><input type="text" class="quantity" name="quantity[]"></td>
			                    <td><input type="text" class="p_price" name="p_price[]" readonly></td>
			                    <td><input type="text" class="price_sum" name="price_sum[]" readonly></td>
			                    <td><input type="text" class="vat" name="vat[]" readonly></td>
			                    <td><input type="text" class="total_sum" name="total_sum[]" readonly></td>
			                </tr>
						</tbody>
					</table>
					<table class="table_ri">
						<colgroup>
							<col width="12%">
							<col width="12%">
							<col width="13%">
							<col width="13%">
							<col width="13%">
							<col width="13%">
						</colgroup>
						<tr>
							<th rowspan="2">총 합계</th>
							<th>발주수량</th>
							<th>단가</th>
							<th>공급가액</th>
							<th>부가세</th>
							<th>합계</th>
						</tr>
						<tr>
							<td id="sum_qty"><input type="text" class="quantity2" readonly></td>
							<td id="p_price"><input type="text" class="p_price" readonly></td>
							<td id="sum_price"><input type="text" class="price_sum" readonly/></td>
							<td id="sum_vat"><input type="text" class="vat" readonly/></td>
							<td id="total_sum"><input type="text" class="total_sum" readonly/></td>
						</tr>
					</table>
					<div class="bot_box">
						<div class="bot_btn">
							<div class="btn" title="취소"><a href="request_ma_order.do">취소</a></div>
							<div class="btn btn_right save" title="등록">등록</div>
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