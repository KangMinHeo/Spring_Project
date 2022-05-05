<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 글로벌 감</title>
<link rel="stylesheet" href="resources/css/obtain_order.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
.lack {
    background:#dd9379 !important;
}
@media screen and (max-width: 600px){
    #myform .input_calendar{
        width:90% !important;
    }
}
</style>

<script>
$(document).ready(function(){
	/*js 스크립트 불러오기*/
	js_reonload_src("datepicker");
	javascript_onload_src("script_next_focus");
	
	/*URL 파라미터 가져오기*/
	const urlParams = new URLSearchParams(location.search);
	var s_no = urlParams.get("s_no");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","","");
	$('#myform').append($('<input/>',{type:'hidden',name:'s_no',value:s_no}));
	$('#myform').append($('<input/>',{type:'hidden',name:'re_mt_number',value:''}));
	$('#myform').append($('<input/>',{type:'hidden',name:'re_quantity',value:''}));
	$('#myform').append($('<input/>',{type:'hidden',name:'tip_index',id:'tip_index',value:''}));



	//납기일자 높이설정
	if($(window).width()>768){
		$("#due_table").css("height",$("#order_table").outerHeight());
	}
	
	//발주자
	javascript_onload_src("script_ajax_layer_pop");
	$("#myform").on("click", "#c_name", function() {
		script_ajax_layer_pop('/obtain_order/popup_guest.html',jQuery('#myform').serialize(),'.popup-31');
	});
	
	//납품처 주소
	$("#myform").on("focus", "#od_post", function() {
		script_ajax_layer_pop('/popup/popup_home.html','post=od_post&address=od_address','.popup-31');
	});
	
	//발주자 체크
	$("#myform").on("click", ".mt_number, .p_name, .standard, .p_unit, .box_quantity, .sacks_unit", function() {
		script_ajax_layer_pop('/obtain_order/popup_product.html', jQuery('#myform').serialize(), '.popup-31');
	});
	
	//수정 버튼
	$("#myform .bot_btn > .save").click(function(){
		
		let endDay = $("#end_day").val();
		let etc = $("#cu_etc").val();
		let quantity = $(".quantity").val();
		
		let oNo = $("#cu_code").val();
		let cuNo = $("#cu_businessnum").val();
		let proNo = $(".mt_number").val();
		
		let data = "endDay="+endDay+"&cuEtc="+etc+"&quantity="+quantity+"&orderNo="+oNo+"&cuNo="+cuNo+"&proNo="+proNo;
		
		if(confirm("수정 할까요?")){
			location.href='pr_or_update.do?'+data;
		} else{
			return;
		}

	});
	
	//데이터테이블
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
	$('#add_row2').on( 'click', function () {
		draw_row(table);
	});
	
	//삭제버튼
	$("#myform").on("click", ".btn_plma", function(){
		table.row($(this).parents('tr')).remove().draw();
		no_display();
	});
	
});
	

function headerFixed(){
	//리스트 상단 헤더 고정
	var winWidth = $(document).width();
	var menuOffset = $("#table thead").offset();
	var tableWidth = $("#table").innerWidth();
	var colArr = [0,5,8,8,8,8,8,8,8,8,8,8,8,7];
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

</head>
<body>
<%@include file="../inc/head_html_text.jsp"%>
<div class="background"></div>
	<div class="header_wrap">
		<!--header-->
		<%@include file="../inc/header.jsp"%>
		<!--header-->
	</div>
	<!--header_wrap-->
	<div class="content">
		<%@include file="../inc/left_menu.jsp"%>
		
		<div class="content_detail" id="content_detail">
			<div id="content" class="prOrCheckRegCont">
				<!--side_bar-->
				<ul class="lnb">
					<li><a href="/"><img src="/resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="order_main.do">수주관리</a></li>
					<li></li>
					<li><a href="order_pr_or_check.do">수주조회</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
					<h2 class="sub_tit" style="margin-bottom:20px;">수주 수정</h2>
					<!-- 발주자 -->
					<table class="tag_table" id="order_table" style="width: 50%;">
						<tbody>
							<tr>
								<th colspan="4" class="tag_th_st"><span>발주자</span></th>
							</tr>
							<tr>
								<th>상호</th>
								<td colspan="3">
									<input type="text" class="insearch" name="c_name" id="c_name"  value= ${cuDto.cuName } readonly>
									<input type="hidden" name="cu_code" id="cu_code" value="${order[0].orderNo}">
								</td>
							</tr>
							<tr>
								<th>사업자번호</th>
								<td><input type="text" name="cu_businessnum" id="cu_businessnum"  value=${ cuDto.cuNo} readonly></td>
								<th>성명</th>
								<td><input type="text" name="cu_username" id="cu_username"  value=${ cuDto.cuCeo } readonly></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td class="input_num">
									<input type="text" maxlength="3" id='cu_tel1' name='cu_tel1' onkeyup="script_next_focus(this,3,document.myform.cu_tel2)" value=${map.tel[0] } readonly>
									<p class="input_line">-</p>
									<input type="text" maxlength="4" id='cu_tel2' name='cu_tel2' onkeyup="script_next_focus(this,4,document.myform.cu_tel3)" value=${map.tel[1] } readonly>
									<p class="input_line">-</p>
									<input type="text" maxlength="4" id='cu_tel3' name='cu_tel3' value=${map.tel[2] } readonly>
								</td>
								<th>FAX</th>
								<td class="input_num">
									<input type="text" maxlength="3" id='cu_fax1' name='cu_fax1' onkeyup="script_next_focus(this,3,document.myform.cu_fax2)" value=${map.fax[0] } readonly>
									<p class="input_line">-</p>
									<input type="text" maxlength="4" id='cu_fax2' name='cu_fax2' onkeyup="script_next_focus(this,4,document.myform.cu_fax3)" value=${map.fax[1] } readonly>
									<p class="input_line">-</p>
									<input type="text" maxlength="4" id='cu_fax3' name='cu_fax3' value=${map.fax[2] } readonly>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="3">
								<input type="text" name="cu_address" id="cu_address" style="width: 84%;" value="${cuDto.cuAddr }" readonly>
								</td>
							</tr>
		
							<tr>
								<th>담당자</th>
								<td colspan="3">
									<input type="text" name="cu_manager" id="cu_manager" value="${cuDto.cuEmp }" readonly>
								
									<!-- 구현포기
									<label for="manager_ck2">
									 <input type="checkbox" id="manager_ck2" name="manager_ck2" value="ok"> 발주자정보 자동업데이트 (담당자명/번호/이메일)
									 </label>
									 -->
								</td>
							</tr>
							<tr>
								<th>담당자번호</th>
								<td class="input_num">
									<input type="text" maxlength="3" id='ma_hp1' name='ma_hp1' onkeyup="script_next_focus(this,3,document.myform.ma_hp2)" value=${map.empTel[0] } readonly>
									<p class="input_line">-</p>
									<input type="text" maxlength="4" id='ma_hp2' name='ma_hp2' onkeyup="script_next_focus(this,4,document.myform.ma_hp3)" value=${map.empTel[1] } readonly>
									<p class="input_line">-</p>
									<input type="text" maxlength="4" id='ma_hp3' name='ma_hp3' onkeyup="script_next_focus(this,4,document.myform.ma_email1)" value=${map.empTel[2] } readonly>
								</td>
								<th>이메일</th>
								<td class="email_input">
									<input name="ma_email1" type="text" id='ma_email1' value=${map.email[0] } readonly>
									<p class="email_line">@</p>
									<input name="ma_email2" type="text" id='ma_email2' value=${map.email[1] } readonly>
									<!-- css.css 1729번째 줄 수정
											 td.email_input input {
																width: 110px;
																margin-right: 5px;
														} -->
								</td>
							</tr>
						</tbody>
					</table>
					<table class="tag_table" id="due_table" style="width:50%;">
						<tbody>
							<tr>
								<th colspan="8" class="tag_th_st"><span>납기정보</span></th>
							</tr>
							<tr>
								<th colspan="1">수주일자</th>
								<td colspan="3">
									<input type="text" class="btn_candle input_calendar" id="reg_day" name="s_date"   value="${order[0].orderRegDate} "  readonly>
								</td>
								<th colspan="1">납기일자</th>
								<td colspan="3">
									<input type="text" class="btn_candle input_calendar"  id="end_day" name="e_date"  value="${order[0].orderEndDate} ">
								</td>
							</tr>
							
							<tr>
								<th colspan="1">납품처 주소</th>
								<td colspan="7">
									<input type="text" id="od_address" name="od_address" style="width: 80%;" value="${map.addr[0] }" readonly>
									<input type="text" id="od_address2" name="od_address2" style="width: 80%;" value=${map.addr[1] } readonly>
									<label for="od_addr" class="error"></label>
								</td>
							</tr>
							
							<tr>
								<th>결제 및 기타사항</th>
								<td colspan="7">
									<textarea rows="7" cols="90" id="cu_etc">${cuDto.cuEtc }</textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table_ri" id="table">
		   				<thead>
		   					<tr>
		   						<th id="add_row2" style="cursor: pointer;">추가</th>
		   						<th>제품번호/제품명</th>
		   						<th>규격/단위</th>
		   						<th>수주수량</th>
		   						<th>단가</th>
		   						<th>공급가액</th>
		   						<th>부가세</th>
		   						<th>합계</th>
		   						<th>보유 재고량<br>필요 재고량</th>
		   					</tr>
		   				</thead>
						<tbody>
							<c:forEach var="pro" items="${requestScope.proInfo }">
							<% int i=1; %>
		   					<tr>
		   						<td>
		   							<div class="btn_plma btn_number" title="제거"><%=i++%></div> 
		   							<input type="hidden" name="od_no">
		   						</td>
		   						<td>
		   							<input type="text" class="mt_number" name="mt_number"  value="${pro.proNo}"readonly>
		   							<input type="text" class="p_name" name="p_name" value="${pro.proName}" readonly>
		   						</td>
		   						<td>
		   							<input type="text" class="standard" value="${pro.pSize}" readonly>
		   							<input type="text" class="p_unit" value="Kg" readonly>
		   						</td>

		   						<td><input type="text" class="quantity" name="quantity" value="${pro.orderQuantity }"></td>
		   						<td><input type="text" class="p_price" name="p_price" value="${pro.proPrice}" readonly></td>
		   						<td><input type="text" class="price_sum" name="price_sum" value="${(pro.orderQuantity)*(pro.proPrice)}"readonly></td>
		   						<td><input type="text" class="vat_sum" name="vat_sum" value="${((pro.orderQuantity)*(pro.proPrice))*0.1}"readonly></td>
		   						<td><input type="text" class="total_sum" name="total_sum"  value="${(((pro.orderQuantity)*(pro.proPrice))*0.1)+((pro.orderQuantity)*(pro.proPrice))}" readonly></td>
		   						<td>
		   						<input type='text' class='stock' value="${pro.proStock}" readonly>
		   						
		   						<input type='text' class='req_stock' value="${pro.proStock - pro.orderQuantity} " readonly>
		   						</td>
		   					</tr>
		   					</c:forEach>
						</tbody>
					</table>
					<div class="bot_box">
						<div class="bot_btn">
							<div class="btn"><a href="order_pr_or_check.do">취소</a></div>
							<div class="btn btn_right save" title="수정">수정</div>
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
	<div class="keyboard"></div>
</body>
</html>