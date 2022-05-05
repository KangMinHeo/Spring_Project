<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
	<link rel="stylesheet" href="resources/css/process.css">
<script>
$(document).ready(function(){
	/*js 스크립트 불러오기*/
	javascript_onload_src("addComma");
	
	/*URL 파라미터 가져오기*/
	const urlParams = new URLSearchParams(location.search);
	var s_no = urlParams.get("s_no");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","","");
	$('#myform').append($('<input/>',{type:'hidden',name:'s_no',value:s_no}));
	$('#myform').append($('<input/>',{type:'hidden',name:'recipe_dup',id:'recipe_dup',value:''}));
	$('#myform').append($('<input/>',{type:'hidden',name:'tip_index',id:'tip_index',value:''}));
	
	//재품검색
	$("#myform").on("click", "#p_name", function() {
		script_ajax_layer_pop('/process/popup_product.html',jQuery('#myform').serialize(),'.popup-55');
	});
	
	//공정검색
	$("#myform").on("click", ".ro_name", function() {
		script_ajax_layer_pop('/popup/popup_route.html', jQuery('#myform').serialize(), '.popup-22');
	});
	
	//배합검색
	$("#myform").on("click", ".mi_name", function() {
		$('#tip_index').val($('.mi_name').index(this));
		var a = $('.method').eq($('#tip_index').val()).val();
		if (!a) {
			alert("공정을 선택해주세요.");
			script_ajax_layer_pop('/popup/popup_route.html', jQuery('#myform').serialize(), '.popup-22');
		} else if (a == '2' || a == '3') {
			if (!$('#mt_number').val()) {
				alert("제품을 선택해주세요.");
				script_ajax_layer_pop('/process/popup_product.html', jQuery('#myform').serialize(), '.popup-55');
			} else {
				script_ajax_layer_pop('/popup/popup_mix.html', jQuery('#myform').serialize()+"&mode=recipe", '.popup-22');
			}
		}
	});
	
	//수정 버튼
	$("#myform .bot_btn > .btn_right").click(function(){
		//location.href='process_info_recipe_update.do';
	});
	
	// 삭제 버튼
	$("#myform .bot_btn > .btn_right.delete").click(function(){
		var no = $("#re_no").val();
		console.log(no);
		location.href='process_info_recipe_delete.do?re_no='+no;
	});
	
	//데이터테이블
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
        columnDefs: [ {
            className: 'control',
            orderable: false,
            targets:   0
        }]
	});
	
	//추가버튼 
	$('#add_row10').on( 'click', function () {
		draw_row(table);
	});
	
	//삭제버튼
	$("#myform").on("click", ".btn_plma", function(){
		table.row($(this).parents('tr')).remove().draw();
		no_display();
	});

function no_display(){ // 행 삭제 - 숫자입력
	var a1 = $('.btn_number').length;
	for(var i=1;i<=a1;i++){
		$('.btn_number').eq(i-1).text(i);
	}
}
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
				<div id="content" class="infoRecipeRegCont">
		    	<ul class="lnb">
		    		<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
		    		<li></li>
		    		<li><a href="process_main.do">공정관리</a></li>
		    		<li></li>
		    		<li><a href="process_info_recipe.do">통합 레시피 비율 정보</a></li>
		    	</ul>
		    	<!--lnb-->
		   		<div class="sub_con">
		   			<h2 class="sub_tit">통합 레시피 비율 상세 정보</h2>
		   			<table id="table_reg">
		   				<tr>
		   					<th>레시피 코드 <span class="txt_red">*</span></th>
		   					<td>
		   						<div class="code_wrap">
		    						<input type='text' name='re_no' id='re_no' readonly value="${requestScope.dto.re_no }">
		   						</div>
								<label for="re_no" class="error"></label>
		   					</td>
		   				</tr>
		   				<tr>
		   					<th>제품명 <span class="txt_red">*</span></th>
		   					<td>
		   						<input type="text" class="insearch" id="p_name" name="p_name" readonly value="${requestScope.dto.p_name }">
		   						<input type="hidden" id="re_p_no" name="re_p_no" value="${requestScope.dto.re_p_no }">
		   					</td>
		   				</tr>
		   				<tr>
		   					<th>원자재 품목1 <span class="txt_red">*</span></th>
		   					<td>
						   		<input type="text" class="insearch" id="m_name" name="m_name" readonly value="${requestScope.dto1.m_name }">
		   						<input type="hidden" id="re_m_no" name="re_m_no" value="${requestScope.dto1.re_m_no }">
							</td>
		   				</tr>
		   				<tr>
		   					<th>원자재 품목2 <span class="txt_red">*</span></th>
		   					<td>
		   						<input type="text" class="insearch" id="m_name_2" name="m_name_2" readonly value="${requestScope.dto2.m_name }">
		   						<input type="hidden" id="re_m_no_2" name="re_m_no_2" value="${requestScope.dto2.re_m_no2 }">
							</td>
		   				</tr>
		   			</table>
		   			<table class="table_ri" id="table">
		   				<thead>
		   					<tr>
		   						<th>공정 - 1</th>
		   						<th>공정 - 2</th>
		   						<th>공정 - 3</th>
		   						<th>공정 - 4</th>
		   					</tr>
		   				</thead>
		   				<tbody>
		   					<tr>
		   						<td>
		   							<input type="text" class="pro_name" name="pro_name" style='cursor:pointer;' readonly value="선별">
		   							<input type="hidden" class="re_pro_no_1" name="re_pro_no_1" value="FIND">
		   						</td>
		   						<td>
		   							<input type="text" class="pro_name" name="pro_name" style='cursor:pointer;' readonly value="세척">
		   							<input type="hidden" class="re_pro_no_2" name="re_pro_no_2" value="WASH">
		   						<td>
		   							<input type="text" class="pro_name" name="pro_name" style='cursor:pointer;' readonly value="건조">
		   							<input type="hidden" class="re_pro_no_3" name="re_pro_no_3" value="DRY" >
		   						</td>
		   						<td>
		   							<input type="text" class="pro_name" name="pro_name" style='cursor:pointer;' readonly value="${requestScope.dto.pro_name }">
		   							<input type="hidden" class="re_pro_no_4" name="re_pro_no_4" value="${requestScope.dto.re_pro_4 }">
		   						</td>
		   					</tr>
		   				</tbody>
		   			</table>
		   			<div class="bot_box">
		   				<div class="bot_btn">
		   					<div class="btn"><a href="process_info_recipe.do">취소</a></div>
		   					<!-- <div class="btn btn_right save" title="수정">수정</div> -->
							<div class="btn btn_right delete">삭제

							</div>
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