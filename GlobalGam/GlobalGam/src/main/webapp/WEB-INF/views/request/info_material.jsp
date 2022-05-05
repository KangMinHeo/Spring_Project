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
<link rel="stylesheet" href="resources/css/order.css">
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
	script_new_reformdata(".sub_con","myform","/order/info_material.html","delete");
	$('#myform').append($('<input/>',{type:'hidden',name:'division',value:''})); //Excel 분류별 출력
	
	//버블링 이벤트
	$("#table").on("click","tbody > tr > td.control,.btn_barcode,input[type='checkbox']",function(e){
		e.stopPropagation();
	});

	$("#ba_img").hide();
	var sw = -1;
	
	// 바코드 이벤트
	$(".btn_barcode").click(function(){
		var no = $(this).parent().parent().find(".m_no").text();
		var name = $(this).parent().parent().find(".m_name").text();
		var size = $(this).parent().parent().find(".m_size").text();
		var count = $(this).parent().parent().find(".m_count").text();
		var country = $(this).parent().parent().find(".m_country").text();
		var sc = size+count;
		country = "원산지 : " +country;
		console.log(no);
		console.log(sc);
		$("#ba_img").barcode(no, "code128");
		if(sw == no){
		      $ ('#ba_img').fadeOut ('slow');
		      sw=-1;
		}else{
		    $ ('#ba_img') .fadeIn ('slow');
			$("#ba_img").show();
			$("#ba_img").off("click").on("click",function(){
				PrintLabel(no,name, sc, country);
			});
			sw=no;
		}
	});
	
	function viewResult(result) {
		console.log(result);
	}
	function PrintLabel(no,name, sc, country) {
		//setLabelId(1);
		clearBuffer();
		
		// 2inch sample
		setWidth(432);
		drawDeviceFont(country,5,15,"b",2,2,0,0,0,0);

		if (getBrowser().name == 'Netscape') { //for iOS
			drawDeviceFont(name,10,60,"2",3,3,0,0,1,0);
		} else {
			drawTrueTypeFont(name,10,320,"Arial",50,0,false,true,false,true); 
		}
		draw1DBarcode(no + " - " + sc,10,160,1,2,4,100,0,1);			
		//drawBlock(10,60,350,160,"B",5);
		//drawVectorFont("Vector Font",5,350,"U",40,40,0,0,1,0,0,0,false);
	
		printBuffer();
		
		var strSubmit = getLabelData();

		console.log(strSubmit);

		requestPrint("Printer1", strSubmit, viewResult);
	}	
	
	//tr 클릭 이벤트
	$("#table").on("click","tbody tr[role='row']",function(e){
		var no = $(this).find(".m_no").text();
		console.log(no);
		location.href='request_info_ma_mod.do?m_no='+no;
	});
	
	//분류 탭 검색
	$(".tab li").click(function(){
		$(".tab li").removeClass("teb_on");
		$(this).addClass("teb_on");
	});
	
	//등록 버튼
	$("#myform .bot_btn .btn_right").click(function(){
		location.href='request_info_ma_reg.do';
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
		order : [ 0, "desc" ],
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
<style>
#ba_img{
	width:300px;
	height:200px;
	position:absolute;
	left:50%;
	top:50%;
	margin-left:-100px;
	margin-top:-150px;
}
</style>
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
				<div id="content" class="infoMaterialCont">
				<ul class="lnb">
					<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="request_main.do">발주관리</a></li>
					<li></li>
					<li><a href="request_info_material.do">원자재 정보</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
					<div class="tit_box">
						<h2 class="sub_tit">원자재 정보</h2>
						<p class="sub_txt">
							<span>2</span>개의 데이터가 조회되었습니다.
						</p>
					</div>
					<!-- tit_box -->
					<div class="search_pc">
						<!-- sub_teb -->
						<input type="text" id="search_po_p" name="search_key" placeholder="search">
						<div class="gla" style="cursor:pointer;"></div>
					</div>
					<!-- search_pc -->
					<table id="table" class="ui celled table" style="width: 100%">
						<colgroup>
							<col width="5%"> <!--번호-->
							<col width="8%"> <!--이미지-->
							<col width="12%"> <!--제품번호-->
							<col width="13%"> <!--제품명-->
							<col width="7%"> <!--포장지당 중량-->
							<col width="7%"> <!--단위-->
							<col width="9%"> <!--가격-->
							<col width="10%"> <!--협력업체-->
							<col width="6%"> <!--유통기한-->
							<col width="6%"> <!--바코드-->
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제품번호</th>
								<th>제품명</th>
								<th>규격</th>
								<th>단위</th>
								<th>가격(원)</th>
								<th>협력업체</th>
								<th>원산지</th>
								<th>유통기한</th>
								<th>바코드</th>
							</tr>
						</thead>
						<tbody>
							<%int i = 1; %>
								<c:forEach var="met" items="${requestScope.mlist }">
									<tr>
										<td><%=i++ %></td>
										<td class="m_no">${met.m_no }</td>
										<td class="m_name">${met.m_name }</td>
										<td class="m_size">${met.m_size }</td>
										<td class="m_count">${met.m_count }</td>
										<td>${met.m_price }</td>
										<td>${met.co_name }</td>
										<td class="m_country">${met.m_country }</td>
										<td>${met.m_date }</td>
										<td><div class='btn_barcode' title='바코드'></div></td>
									</tr>
								</c:forEach>
						</tbody>
					</table>
					<div id="ba_img"></div>
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