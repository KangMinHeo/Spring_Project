<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
	<link rel="stylesheet" href="resources/css/inventory.css">
<style>
#table input.in, .table input.out {
	width: 130px !important;
	margin-right: 10px;
	vertical-align: middle;
}

#table input.input_calendar {
	width: 130px !important;
	vertical-align: middle;
	text-align: left !important;
	padding-left: 10px;
}

span.in_day, span.out_day {
	margin: 0 5px 0 5px;
	vertical-align: middle;
}
#table td input[type=text]{
	width:130px;
}
</style>
<script>
$(document).ready(function() {
	/*js 스크립트 불러오기*/
	js_reonload_src("datepicker");//js 폴더
	
	/*URL 파라미터 가져오기*/
	const urlParams = new URLSearchParams(location.search);
	var s_no = urlParams.get("s_no");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","","");
	$('#myform').append($('<input/>',{type:'hidden',name:'s_no',value:s_no}));

	//입력제한
	$("#myform").on("keyup", "input.in, input.out", function(event) {
		var role = $(this).closest("tr").attr("role");
		var mode = $(this).attr("class").split(" ");
		var tip_index = 0;
		role ? tip_index = $("#table tbody tr ."+mode[0]).index(this) : tip_index = $(this).closest("li").attr("data-dt-row");
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
		    var inputVal = $(this).val();
		    $(this).val(Number(inputVal.replace(/[^0-9]/gi,'')));
		    !role ? $("#table tbody tr[role='row'] ."+mode[0]).eq(tip_index).val(Number(inputVal.replace(/[^0-9]/gi,''))) : false; 
	    }
	});
	
	//전체선택
	javascript_onload_src("script_checkall");
	$("#myform").on("click","input[name='chk_all']",function(){
		script_checkall(this,"b_no[]");
	});
	
	//버블링 이벤트
	$("#myform").on("click","input",function(e){
		e.stopPropagation();
	});
	
	//tr 이벤트
	$("#myform").on("click","#table tbody tr[role='row']",function(e){
		$(this).find("input.b_no").click();
	});
	
	// 등록 버튼 이벤트 처리
	$(".bot_box > .bot_btn > .delete").click(function(){
		var no = $("#st_no").text();
		location.href='storage_inv_delete.do?st_no='+no;
	})
	
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
});
function draw_row(table,data){
	var reg_date;
	reg_date = data['reg_date'].split(" ");
	!data['c_name'] ? data['c_name'] = "-" : false; 

	table.row.add([
         "<td class='control' tabindex='0'>상세</td>",
         "<input type='checkbox' class='b_no' name='b_no[]' value='"+data['st_code']+"'>",
         data['article_num']+"<input type='hidden' class='st_code' name='st_code[]' value='"+data['st_code']+"'>",
         reg_date[0]+"<br>"+reg_date[1],
         data['c_name'],
         "<input type='text' class='in' name='in[]' placeholder='입고량'>",
         "<input type='text' class='out' name='out[]' placeholder='출고량'>",
         data['box_qty'],
         data['quantity'],
         data['weight'],
         data['expiration_day']
    ]).draw(false);
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
				<div id="content" class="invDetailCont">
			<ul class="lnb">
				<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
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
						<span>0</span>개의 데이터가 조회되었습니다.
					</p>
				</div>
				<!-- tit_box -->
				<table id="table_reg">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
		   			<tbody>
		   				<tr>
		   					<th>제품번호</th>
		   					<td id="mt_number">
		   						<c:if test="${!empty requestScope.dto.st_name }">
		   							<c:out value="${requestScope.dto.st_name }"></c:out>  
		   						</c:if>
		   						<c:if test="${!empty requestScope.dto2.st_name }">
		   							<c:out value="${requestScope.dto2.st_name }"></c:out>  
		   						</c:if>
		   					</td>
		   					<th>제품명</th>
		   					<td id="p_name">
		   						<c:if test="${!empty requestScope.dto.m_name }">
		   							<c:out value="${requestScope.dto.m_name }"></c:out>  
		   						</c:if>
		   						<c:if test="${!empty requestScope.dto2.p_name }">
		   							<c:out value="${requestScope.dto2.p_name }"></c:out>  
		   						</c:if>
							</td>
		   				</tr>
		   				<tr>
		   					<th>규격</th>
		   					<td id="standard">
		   						<c:if test="${!empty requestScope.dto.m_size }">
		   							<c:out value="${requestScope.dto.m_size }"></c:out>  
		   						</c:if>
		   						<c:if test="${!empty requestScope.dto2.p_size }">
		   							<c:out value="${requestScope.dto2.p_size }"></c:out>  
		   						</c:if>
		   					</td>
		   					<th>단위</th>
		   					<td id="p_unit">
		   						<c:if test="${!empty requestScope.dto.m_count }">
		   							<c:out value="${requestScope.dto.m_count }"></c:out>  
		   						</c:if>
		   						<c:if test="${!empty requestScope.dto2.p_count }">
		   							<c:out value="${requestScope.dto2.p_count }"></c:out>  
		   						</c:if>
		   					</td>
		   				</tr>
		   				<tr>
		   					<th>구분</th>
		   					<td id="division">
		   						<c:if test="${!empty requestScope.dto.st_kind}">
		   							<c:out value="${requestScope.dto.st_kind }"></c:out>  
		   						</c:if>
		   						<c:if test="${!empty requestScope.dto2.st_kind }">
		   							<c:out value="${requestScope.dto2.st_kind }"></c:out>  
		   						</c:if>
		   					</td>
		   					<th>창고명</th>
		   					<td id="st_no">
		   						<c:if test="${!empty requestScope.dto.st_no}">
		   							<c:out value="${requestScope.dto.st_no }"></c:out>  
		   						</c:if>
		   						<c:if test="${!empty requestScope.dto2.st_no }">
		   							<c:out value="${requestScope.dto2.st_no }"></c:out>  
		   						</c:if>
		   					</td>
		   				</tr>
		   			</tbody>
				</table>
				<table id="table" style="width:100%;">
					<colgroup>
						<col width="9%">
						<col width="7%">
						<col width="9%">
					</colgroup>
					<thead>
						<tr>
							<th>업체명</th>
							<th>수량</th>
							<th>유통기한</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<c:if test="${!empty requestScope.dto.co_name}">
		   							<c:out value="${requestScope.dto.co_name }"></c:out>  
		   						</c:if>
		   						<c:if test="${!empty requestScope.cN }">
		   							<c:out value="${requestScope.cN }"></c:out>  
		   						</c:if>
							</td>
							<td>
								<c:if test="${!empty requestScope.dto.st_number}">
		   							<c:out value="${requestScope.dto.st_number }"></c:out>  
		   						</c:if>
		   						<c:if test="${!empty requestScope.dto2.st_number }">
		   							<c:out value="${requestScope.dto2.st_number }"></c:out>  
		   						</c:if>
							</td>
							<td>
								<c:if test="${!empty requestScope.dto.m_date}">
		   							<c:out value="${requestScope.dto.m_date }"></c:out>  
		   						</c:if>
		   						<c:if test="${!empty requestScope.dto2.p_date }">
		   							<c:out value="${requestScope.dto2.p_date }"></c:out>  
		   						</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="bot_box">
					<div class="bot_btn">
						<div class="btn"><a href="storage_ma_inventory.do">목록</a></div>
						<div class="btn btn_right delete" title="삭제">삭제</div>
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