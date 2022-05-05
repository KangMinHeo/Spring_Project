<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
</head>
<link rel="stylesheet" href="resources/css/obtain_order.css">
<style>
#table td {
	padding: 7px 15px;
	height: 40px;
}

td .img_box img {
	width: auto;
	height: auto;
	max-width: 100%;
	max-height: 100%;
}

td .img_box {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
	height: 100%;
	border: 0px solid #000;
	background: #fff;
	box-sizing: border-box;
	text-align: center;
	overflow: hidden;
}
#ba_img{
	width:300px;
	height:200px;
	position:absolute;
	left:50%;
	top:50%;
	margin-left:-100px;
	margin-top:-150px;
}
@media screen and (max-width: 414px){
	.btn_barcode {
		margin:0;
	}
}
</style>
<script type="text/javascript" src='/resources/js/bxllabel.js'></script>
<script type="text/javascript" src='/resources/js/bxlcommon.js'></script>
<script type="text/javascript" src='/resources/js/bxlpos.js'></script>
<script>
$(document).ready(function() {
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","/obtain_order/info_product.html","delete");
	$('#myform').append($('<input/>',{type:'hidden',name:'division',value:''}));

	//버블링 이벤트
	$("#table").on("click","tbody > tr > td.control,.btn_barcode,.btn_check,input[type='checkbox']",function(e){
		e.stopPropagation();
	});
	
	//tr 클릭 이벤트
	$("#table").on("click","tbody tr[role='row']",function(e){
		var p_no = $(this).find("#p_no").text();
		console.log(p_no);
		location.href='order_info_pd_mod.do?p_no='+p_no;
	});
	
	$("#ba_img").hide();
	var sw = -1;
	
	// 바코드 이벤트
	$(".btn_barcode").click(function(){
		var no = $(this).parent().parent().find("#p_no").text();
		var name = $(this).parent().parent().find("#p_name").text();
		var size = $(this).parent().parent().find("#p_size").text();
		var count = $(this).parent().parent().find("#p_count").text();
		var price = $(this).parent().parent().find("#p_price").text();
		var sc = size + count;
		console.log(no);
		$("#ba_img").barcode(no, "code128");
		if(sw == no){
		      $ ('#ba_img').fadeOut ('slow');
		      sw=-1;
		}else{
		    $ ('#ba_img') .fadeIn ('slow');
			$("#ba_img").show();
			$("#ba_img").off("click").on("click",function(){
				PrintLabel(no, name, sc, price);
			});
			sw=no;
		}
	});
	function viewResult(result) {
		console.log(result);
	}
	//var issueID = 1;
	function PrintLabel(no, name, sc, price) {
		//setLabelId(issueID);
		clearBuffer();
		
		// 2inch sample
		setWidth(432);
		drawDeviceFont(name,5,15,"b",2,2,0,0,0,0);
		if (getBrowser().name == 'Netscape') { //for iOS
			drawDeviceFont(price,10,60,"2",3,3,0,0,1,0);
		} else {
			drawTrueTypeFont(price,10,320,"Arial",80,0,false,true,false,true); 
		}
		draw1DBarcode(no+" - "+sc,10,160,1,2,4,100,0,1);			
		//drawBlock(10,60,350,160,"B",5);
		//drawVectorFont("Vector Font",5,350,"U",40,40,0,0,1,0,0,0,false);
	
		printBuffer();
		
		var strSubmit = getLabelData();

		console.log(strSubmit);
		//alert("프린터 호출");
		//issueID++;
		requestPrint("Printer1", strSubmit, viewResult);
	}	
	
	//등록 버튼
	$("#myform .bot_btn .btn_right").click(function(){
		location.href='order_info_product_reg.do';
	});
	
	//데이터테이블
	javascript_onload_src("script_ajax_layer_pop");
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
		order : [ 1, "asc" ],
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
				<!--side_bar-->
				<ul class="lnb">
					<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="order_main.do">수주관리</a></li>
					<li></li>
					<li><a href="order_info_product.do">제품정보</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
					<div class="tit_box">
						<h2 class="sub_tit">제품 정보</h2>
						<p class="sub_txt">
							<span>${requestScope.list_size }</span>개의 데이터가 조회되었습니다.
						</p>
					</div>
					<!-- tit_box -->
					<div class="search_pc">
						<input type="text" id="search_po_p" name="search_key" placeholder="search">
						<div class="gla"></div>
					</div>
					<!-- search_pc -->
					<table id="table" class="ui celled table">
						<colgroup>
							<col width="5%"> <!--번호-->
							<col width="10%"> <!--제품번호-->
							<col width="11%"> <!--제품명-->
							<col width="6%"> <!--규격-->
							<col width="6%"> <!--단위-->
							<col width="6%"> <!--유통기한-->
							<col width="8%"> <!--가격-->
							<col width="5%"> <!--바코드-->
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제품번호</th>
								<th>제품명</th>
								<th>규격</th>
								<th>단위</th>
								<th>유통기한</th>
								<th>가격(원)</th>
								<th>바코드</th>
							</tr>
						</thead>
						<tbody>
						<%int i = 1; %>
							<c:forEach var="list" items="${requestScope.list }">
								<tr>
									<td><%=i++ %></td>
									<td id="p_no">${list.productNo }</td>
									<td id="p_name">${list.pName }</td>
									<td id ="p_size">${list.pSize }</td>
									<td id ="p_count">${list.pCount }</td>
									<td>${list.pDate }</td>
									<td id ="p_price">${list.pPrice }원</td>
									<td><div class='btn_barcode' title='제품 바코드' ></div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="ba_img">상품명</div>
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