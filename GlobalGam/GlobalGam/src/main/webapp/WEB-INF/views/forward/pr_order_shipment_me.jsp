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
<style>
#table_out tbody tr:hover{
	background:#ddd;
	cursor:pointer;
}
.enable {
	background: #ff8400 !important;
	color: #fff !important;
}
.wh_wrap {
    margin: 8px 5px;
}
label.error {
    display:none;
}
@media screen and (max-width: 768px){
	.wh_wrap {
	    margin:0;
	}
}
</style>
<script>
$(document).ready(function() {
	/*URL 파라미터 가져오기*/
	const urlParams = new URLSearchParams(location.search);
	var s_no = urlParams.get("s_no");
	var h_no = urlParams.get("h_no");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","","");
	$('#myform').append($('<input/>',{type:'hidden',name:'s_no',value:s_no}));
	$('#myform').append($('<input/>',{type:'hidden',name:'h_no',value:h_no}));
	$('#myform').append($('<input/>',{type:'hidden',name:'tip_index',id:'tip_index',value:''}));
	$('#myform').append($('<input/>',{type:'hidden',name:'tip_index2',id:'tip_index2',value:''}));



/* 	//수기 버튼
	$("#myform .btn_pmn").click(function(){
		var id = $(this).attr("id");
		if(id=="nor"){
			$("#table tbody tr[role='row'] input.no_out_indiv").each(function(i,v){
				$("#table tbody tr[role='row'] input.sh_cnt").eq(i).val($(this).val());
				//반응형
			    if($("#table tbody tr.child ul[data-dtr-index='"+i+"']").length){
			    	$("#table tbody tr.child ul[data-dtr-index='"+i+"']").find('.sh_cnt').val($(this).val());
			    }
			});
		}else{
			$("#table tbody tr[role='row'] input.sh_cnt").each(function(i,v){
				$("#table tbody tr[role='row'] input.sh_cnt").eq(i).val(0);
			});
		}
	}); */
/* 	
	//바코드 
	javascript_onload_src("script_ajax_layer_pop");
	$("#myform").on("click", "#table .btn_barcode", function() {
		script_ajax_layer_pop('/popup/popup_box_confirm.html',"s_no=&e_date=&count=",'.popup-b');
	}); */
	
	//버블링 이벤트
	$("#myform").on("click","td.control",function(e){
		e.stopPropagation();
	});
/* 	
	//tr 클릭
	$("#myform").on("click", "#table_out tbody tr[role='row']", function(){
		location.href="/inventory/request_reg_out.html?s_no=";
	});
	
	//요청 바코드
	$("#myform").on("click", "#table_out tbody tr .btn_barcode", function(e){
		e.stopPropagation();
		script_ajax_layer_pop('/popup/popup_request.html',"s_no=&date=",'.popup-b');
	}); */
	
	$(".finish").click(function(){
		var f_no = $("input[name=f_no]").val(); // 출하번호
		var p_no = $(".p_no").text(); // 제품번호
		var st_num = $(".st_num").text(); // 재고수량
		var f_num = $("#sum_out").text(); // 출하수량
		var s_no = $("#sum_noout").text(); // 미 출하수량
		var o_num = $("#sum_qty").text();
		
		console.log("수주 수량 : "+o_num + " / " + "재고 수량 : " + st_num + " / " + "출하 수량 : " + f_num);
		console.log($(".st_num").text() + $("#sum_out").text());
		if(o_num > Number(st_num) + Number(f_num)){
			alert("수량 부족");
		} else {
			location.href = 'forward_send.do?f_no='+f_no+'&st_num='+st_num+'&f_num='+f_num+'&p_no='+p_no+'&s_no='+s_no;
		}
	});
	
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
	
	$("#table_out thead tr").prepend("<th>상세</th>");
	$("#table_out tbody tr").prepend("<td>상세</td>");
	var list_table = $("#table_out").DataTable({
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
		pageLength : 5,
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
	
	new $.fn.dataTable.Responsive( list_table );
});
/* function draw_row(table,data,index){
	var wh_name="",zone_name="",quantity="",out_qty="",sh_cnt="",outQtySum=0,no_out=0,no_out_indiv=0;
	$.each(data.wh_arr,function(i,v){
		no_out_indiv = v.quantity - v.out_qty;
		no_out_indiv < 0 ? no_out_indiv = 0 : false;
		wh_name += "<div class='wh_wrap'>"+v.wh_name+"<input type='hidden' class='sh_whno' name='sh_whno["+index+"][]' value='"+v.sh_whno+"'></div>";
		zone_name += "<div class='wh_wrap'>"+v.zone_name+"<input type='hidden' class='wh_no' name='wh_no["+index+"][]' value='"+v.wh_no+"'></div>";
		quantity += "<div class='wh_wrap'>"+v.quantity+"<input type='hidden' class='no_out_indiv' value='"+no_out_indiv+"'></div>";
		out_qty += "<div class='wh_wrap'>"+v.out_qty+"<input type='hidden' class='out_qty' value='"+v.out_qty+"'></div>";
		sh_cnt += "<div class='wh_wrap'><input type='text' class='sh_cnt' name='sh_cnt["+index+"][]' value='0' readonly><input type='hidden' class='req_amount' value='"+v.no_out+"'></div>";
		outQtySum += Number(v.out_qty);
	});
	table.row.add([
         "<td class='control' tabindex='0'>상세</td>",
         "<div class='btn_barcode'></div>",
         wh_name,
         zone_name,
         sh_cnt,
         "<input type='hidden' class='sh_no' name='sh_no[]' value='"+data['sh_no']+"'>"+data['article_num'],
         data['pd_number']+"<input type='hidden' class='mt_number' name='mt_number[]' value='"+data['pd_number']+"'><input type='hidden' class='box_quantity' name='box_quantity[]' value='"+data['box_quantity']+"'>",
         data['p_name']+"<input type='hidden' class='p_name' name='p_name[]' value='"+data['p_name']+"'>",
         quantity,
         data['quantity']+"<input type='hidden' class='quantity' value='"+data['quantity']+"'>",
         out_qty,
         outQtySum+"<input type='hidden' class='out' value='"+outQtySum+"'>",
         data['no_out']+"<input type='hidden' class='no_out' value='"+data['no_out']+"'>",
         data['over']+"<input type='hidden' class='over' value='"+data['over']+"'>",
         data['unit'],
         data['meno']
    ]).draw(false);
}
function change_insert(state){
    if(state=='plus'){
        $('#plus').addClass("enable");
        $('#minus').removeClass("enable");
        $('#nor').removeClass("enable");
        $("#myform input[type='text']").prop("readonly",true);
        $("#myform input[type='text']").click(function(){
        	return false;
        });
    }else if(state=='minus'){
        $('#plus').removeClass("enable");
        $('#minus').addClass("enable");
        $('#nor').removeClass("enable");
        $("#myform input[type='text']").prop("readonly",true);
        $("#myform input[type='text']").click(function(){
        	return false;
        });
    }else{
        $('#plus').removeClass("enable");
        $('#minus').removeClass("enable");
        $('#nor').addClass("enable");
        $("#myform input.sh_cnt").prop("readonly",false);
        $("#myform input[type='text']").click(function(){
        	return true;
        });
    }
} */
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
				<div id="content" class="prOrderShipmentMeCont">
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
						<h2 class="sub_tit">출고요청</h2>
						<input type="hidden" value = "${requestScope.dto.f_no }" name="f_no">
					</div>
					<table id="table_reg">
						<tbody>
							<tr>
								<th>출하일자</th>
								<td id="od_date">${requestScope.dto.f_date }</td>
							</tr>
							<tr>
								<th>납기일자</th>
								<td id="od_date">${requestScope.dto.o_end_date }</td>
							</tr>
							<tr>
								<th>수주번호</th>
								<td id="c_name">${requestScope.dto.f_o_no }</td>
							</tr>
							<tr>
								<th>거래처</th>
								<td id="c_name">${requestScope.dto.cu_name }</td>
							</tr>
							<tr>
								<th>납품장소</th>
								<td id="n_address">${requestScope.dto.cu_address }</td>
							</tr>
							<tr>
								<th>상태</th>
								<td id="n_address">
							 			<c:choose>
							 				<c:when test="${requestScope.dto.f_count eq requestScope.dto.o_de_count}">
									 				출하완료
							 				</c:when>
							 				<c:when test="${requestScope.dto.o_de_count > requestScope.dto.st_number + requestScope.dto.f_count }">
								 					생산중
							 				</c:when>
							 				<c:when test="${requestScope.dto.o_de_count <= requestScope.dto.st_number + requestScope.dto.o_de_count }">
									 				출하대기
							 				</c:when>
							 			</c:choose>
								</td>
							</tr>
						</tbody>
					</table>

					<table class="table_ri" id="table">
						<colgroup>
							<col width="3%">		<!-- 번호 -->
							<col width="9%">		<!-- 제품번호 -->
							<col width="9%">		<!-- 제품명 -->
							<col width="6%">		<!-- 수량 -->
							<col width="6%">		<!-- 출고수량 -->
							<col width="9%">		<!-- 창고명 -->
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제품번호</th>
								<th>제품명</th>
								<th>요청수량</th>
								<th>재고수량</th>
								<th>창고명</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td class="p_no">${requestScope.dto.p_no }</td>
								<td>${requestScope.dto.p_name }</td>
								<td>${requestScope.dto.o_de_count }</td>
								<td class="st_num">${requestScope.dto.st_number }</td>
								<td>${requestScope.dto.st_no }</td>
							</tr>
						</tbody>
					</table>
					<table class="table_ri">
						<colgroup>
							<col width="16%">
							<col width="16%">
							<col width="17%">
							<col width="17%">
						</colgroup>
						<tr>
							<th rowspan="2">합계</th>
							<th>총 수량</th> <!-- 전체 요청수량 합계 -->
							<th>출고수량</th> <!-- 전체 재고 수량 합계 -->
							<th>미출고수량</th> <!-- 총 수량 - 출고수량 => 부족한 수량 -->
						</tr>
						<tr>
							<td id="sum_qty">${requestScope.dto.o_de_count }</td>
							<td id="sum_out">${requestScope.dto.f_count }</td>
							<td id="sum_noout">
										<c:choose>
							 				<c:when test="${(requestScope.dto.o_de_count - requestScope.dto.f_count) >= 0}">
									 				${requestScope.dto.o_de_count - requestScope.dto.f_count}
							 				</c:when>
							 				<c:when test="${requestScope.dto.o_de_count - requestScope.dto.f_count < 0}">
								 					0
							 				</c:when>
							 			</c:choose>
							</td>
						</tr>
					</table>
					
					<div class="bot_box">
						<div class="bot_btn">
							<div class="btn"><a href="forward_pr_order_shipment.do">목록</a></div>
							<c:if test="${requestScope.dto.f_count ne requestScope.dto.o_de_count}">
								<div class="btn btn_right finish" title="출고완료">출하완료</div>
							</c:if>
						</div>
						<!-- bot_btn -->
						<label class="error"></label>
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