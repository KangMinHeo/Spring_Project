<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
	<link rel="stylesheet" href="resources/css/inventory.css">
<script>
$(document).ready(function() {
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","/inventory/ma_inquiry_wa.html","write");
	$('#myform').append($('<input/>',{type:'hidden',name:'tip_index',id:'tip_index',value:''}));

	//제품 모달창
	javascript_onload_src("script_ajax_layer_pop");
	$("#myform").on("click", ".mt_number, .p_name, .box_quantity, .sacks_unit, .p_unit", function() {
		script_ajax_layer_pop('/popup/popup_material.html',jQuery('#myform').serialize(),'.popup-5');
	});
	
	//창고 모달창
	$("#myform").on("click", ".wh_name, .zone_name", function() {
		script_ajax_layer_pop('/popup/popup_position.html',jQuery('#myform').serialize(),'.popup-5');
	});
	
	// 등록 버튼 이벤트 처리
	$(".bot_box > .bot_btn > .save").click(function(){
		location.href='storage_ma_inquiry_wa_register.do';
	})
	
	//데이터테이블
	$("#table thead tr").prepend("<th>상세</th>");
 	$("#table tbody tr").prepend("<td>상세</td>");
	var table = $("#table").DataTable({
		lengthChange : false, // 표시 건수기능 숨기기
		searching : false, // 검색 기능 숨기기
		ordering : false, // 정렬 기능 숨기기
		info : false, // 정보 표시 숨기기
		inventorying : false, // 페이징 기능 숨기기
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
	        "inventorying":  false,
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
	$('#add_row5').on( 'click', function () {
		draw_row(table);
	});
	
	//삭제버튼
	$("#myform").on("click", ".btn_plma", function(){
		table.row($(this).parents('tr')).remove().draw();
		no_display(); 
	});
	 no_display();
});
function draw_row(table){
	table.row.add([
        "<td class='control' tabindex='0'>상세</td>",
        "<div class='btn_plma btn_number' title='제거'>-</div>",
        "<div class='division'>-</div>",
        "<input type='text' class='mt_number' name='mt_number[]' style='cursor:pointer;' readonly>",
        "<input type='text' class='p_name' name='p_name[]'  style='cursor:pointer;' readonly>",
        "<input type='text' class='box_quantity' name='box_quantity[]'  style='cursor:pointer;' readonly>",
        "<input type='text' class='sacks_unit' name='sacks_unit[]'  style='cursor:pointer;' readonly>",
        "<input type='text' class='p_unit' name='p_unit[]'  style='cursor:pointer;' readonly>",
        "<input type='text' class='wh_name' name='wh_name[]'  style='cursor:pointer;' readonly>",
        "<input type='text' class='zone_name' name='zone_name[]'  style='cursor:pointer;' readonly><input type='hidden' class='wh_no' name='wh_no[]'>",
        "<input type='text' class='quantity' name='quantity[]'>"
    ]).draw(false);
	 no_display();
}
function no_display(){ // 행 삭제 - 숫자입력
	var a1 = $('.btn_number').length;
	for(var i=1;i<=a1;i++){
		$('.btn_number').eq(i-1).text(i);
	}
}
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
				<div id="content" class="maInquiryWaCont">
			<ul class="lnb">
				<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
				<li></li>
				<li><a href="storage_main.do">재고관리</a></li>
				<li></li>
				<li><a href="storage_ma_inquiry_wa.do">입고 등록</a></li>
			</ul>
			<!--lnb-->
			<div class="sub_con">
				<div class="tit_box">
					<h2 class="sub_tit">입고 등록</h2>
				</div>
				<!-- tit_box -->
				<table class="table_ri" id="table">
					<thead>
						<tr>
							<th id="add_row5" style="cursor: pointer;">추가</th>
							<th>제품번호</th>
							<th>제품명</th>
							<th>단위</th>
							<th>창고명</th>
							<th>구역명</th>
							<th>입고량</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><div class="btn_plma btn_number" title="제거">1</div></td>
							<td><input type="text" class="mt_number" name="mt_number[]"  style='cursor:pointer;' readonly></td>
							<td><input type="text" class="p_name" name="p_name[]"  style='cursor:pointer;' readonly></td>
							<td><input type="text" class="p_unit" name="p_unit[]"  style='cursor:pointer;' readonly></td>
							<td><input type="text" class="wh_name" name="wh_name[]"  style='cursor:pointer;' readonly></td>
							<td>
								<input type="text" class="zone_name" name="zone_name[]"  style='cursor:pointer;' readonly>
								<input type="hidden" class="wh_no" name="wh_no[]">
							</td>
							<td><input type="text" class="quantity" name="quantity[]"></td>
						</tr>
					</tbody>
				</table>
				<div class="bot_box">
					<div class="bot_btn">
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
		<!--content-->
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