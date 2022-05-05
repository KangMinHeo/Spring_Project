<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 글로벌 감</title>
<%@include file="../inc/head_html_text.jsp"%>
<link rel="stylesheet" href="resources/css/obtain_order.css">

<script>
	var table = null;
	//수주목록 읽어오는 Ajax 코드를 함수화 한 것.
	let listAjax = function() {
		let data = "searchKey="+$("#search_po_p").val();
		$.ajax({
			type: "get",
			url: "pr_or_list.do",
			data: data,
			dataType: "json",
			success: function(r) {
				let str = "";
				
				for (let i = 0; i < r.length; i++) {
					str+="<tr><td></td><td class='s_no'>"+r[i].orderNo+"</td>";
					str+="<td>"+r[i].cuName+"</td>";
					str+="<td>"+r[i].regDate+"</td>";
					str+="<td>"+r[i].regDate+"</td>";
					str+="<td>"+r[i].endDate+"</td>";
					str+="<td>"+r[i].count+"</td>";
					str+="<td><img src='resources/img/btn_print.png' alt='인쇄' class='print'></td></tr>"
				}
				if(table != null)
					table.destroy();
				$("#table>tbody").html(str);
				$(".orderQuantity").text(r.length);
								
				//데이터테이블 : 라이브러리
				/*  $("#table thead tr").prepend("<th>상세</th>");
				$("#table tbody tr").prepend("<td>상세</td>");  */
				table = $("#table").DataTable({
					lengthChange : false, // 표시 건수기능 숨기기
					searching : true, // 검색 기능 숨기기
					ordering : false, // 정렬 기능 숨기기
					info : false, // 정보 표시 숨기기
					processing : false, // 페이징 기능 숨기기
					serverMethod : 'post',
					serverSide : false,
					order : [ 2, "desc" ],
					dataType : "json",
					paging : true,
					pageLength : 10,
					pagingType : "full_numbers",
					dom : 'rt<"bottom"iflp>',
					language : {
						"emptyTable" : "데이터가 없습니다.",
						"lengthMenu" : "페이지당 _MENU_ 개씩 보기",
						"info" : "현재 _START_ - _END_ / _TOTAL_건",
						"infoEmpty" : "데이터 없음",
						"infoFiltered" : "( _MAX_건의 데이터에서 필터링되었습니다. )",
						"search" : "",
						"zeroRecords" : "일치하는 데이터가 없습니다.",
						"loadingRecords" : "로딩중...",
						"processing" : false,
						"paginate" : {
							"next" : "다음",
							"previous" : "이전",
							"first" : '처음',
							"last" : '끝'
						}
					},
					responsive : {
						details : {
							type : 'column'
						}
					},
					columnDefs : [ {
						className : 'control',
						orderable : false,
						targets : 0
					} ]
				});
				
				new $.fn.dataTable.Responsive(table);
				
			},
			error: function() {
				alert("ajax 통신실패!");
			}
		});
	}

	
	$(function() {
		
		//수주목록 읽어오기
		listAjax();
				
		/*js 스크립트 불러오기*/
		js_reonload_src("datepicker");//js 폴더
		
		/*URL 파라미터 가져오기*/
		const urlParams = new URLSearchParams(location.search);
		var s_no = urlParams.get("s_no");

		/*FORM 태그 삽입하기*/
		script_new_reformdata(".sub_con", "myform",
				"/obtain_order/pr_or_check.html", "delete");
		/* $('#myform').append($('<input/>', {
			type : 'hidden',
			name : 'od_code',
			value : s_no
		})); */
		$('#myform').append($('<input/>', {
			type : 'hidden',
			name : 'date_today',
			value : ''
		}));

		//버블링 이벤트
		$("#table")
				.on(
						"click",
						"tbody > tr > td.control,input[type='checkbox']",
						function(e) {
							e.stopPropagation();
						});

		//tr 클릭 이벤트
		$("#table").on(
				"click",
				"tbody tr[role='row']",
				function(e) {
					var s_no = $(this).find(".s_no").text();
					location.href = '/pr_or_check_mod.do?s_no='
							+ s_no;
				});

		//인쇄
		$("#table")
				.on(
						"click",
						".print",
						function(e) {
							e.stopPropagation();
							window
									.open(
											'/printing/jumun.html?s_no=',
											'주문서',
											'width=800, scrollbars=yes, menubar=no, status=no, toolbar=no');
						});

		//등록 버튼
		$("#myform .bot_btn .btn_right")
				.click(
						function() {
							location.href = '/obtain_order/pr_or_check_reg.html';
						});
		
		//검색
		$(".gla").click(function() {
			listAjax();
		})
		
	})
</script>
</head>
<body>

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
			<div id="content" class="prOrCheckCont">
				<!--side_bar-->
				<ul class="lnb">
					<li><a href="/"><img src="/resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="order_main.do">수주관리</a></li>
					<li></li>
					<li><a href="#">수주조회</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
					<div class="tit_box">
						<h2 class="sub_tit">수주 조회</h2>
						<p class="sub_txt">
							<span class="orderQuantity"></span>개의 데이터가 조회되었습니다.
						</p>
					</div>
					<!-- tit_box -->
					<table id="table_reg">
						<tr>
							<th>수주일자</th>
							<td>
								<div>
									<input type="text" class="btn_candle input_calendar" id='input_date1' name="inout_date1" >
									<span class="phonespan">~</span>
									<input type="text"
										class="btn_candle input_calendar" id='input_date2' name="inout_date2" >
								</div>
							</td>
							<th>납기일자</th>
							<td>
								<div>
									<input type="text" class="btn_candle input_calendar" id='input_date3' name="inout_date3" >
									<span class="phonespan">~</span>
									<input type="text" class="btn_candle input_calendar" id='input_date4' name="inout_date4" >
								</div>
							</td>
						</tr>
					</table>
					<div class="search_pc">
						<input type="text" id="search_po_p" name="search_key" placeholder="업체명으로 검색">
						<div class="gla" style="cursor: pointer;"></div>
					</div>
					<!-- search_pc -->
					<table id="table" class="ui celled table" style="width: 100%">
						<thead>
							<tr>
								<!-- <th>수주번호</th> -->
								<th></th>
								<th>수주번호</th>
								<th>고객업체</th>
								<th>등록일자</th>
								<th>수주일자</th>
								<th>납기일자</th>
								<th>수주수량</th>
								<th>인쇄</th>
							</tr>
						</thead>
						
						<tbody>
							
						</tbody>
					</table>
					<div class="bot_box">
						<div class="bot_btn">
							<div class="btn btn_right" title="등록">등록</div>
						</div>
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
	<div class="keyboard"></div>

</body>
</html>