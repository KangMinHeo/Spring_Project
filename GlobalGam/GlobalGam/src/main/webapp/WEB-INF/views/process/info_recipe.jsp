<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
	<style>
	#copy{margin-top:30%;}
</style>
<script>
$(document).ready(function(){
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","/process/info_recipe.html","delete");

	//체크박스 전체 선택
	javascript_onload_src("script_checkall");
	$("#table input[name='chk_all']").click(function(){
		script_checkall(this,"s_no[]");
	});
	
	//버블링 이벤트
	$("#table").on("click","tbody > tr > td.control,input[type='checkbox']",function(e){
		e.stopPropagation();
	});
	
	//tr 클릭 이벤트
	$("#table").on("click","tbody tr[role='row']",function(e){
		var no = $(this).find(".re_no").text();
		console.log(no);
		location.href='process_info_recipe_mod.do?re_no='+no;
	});
	
	//등록 버튼
	$("#myform .bot_btn .btn_right").click(function(){
		location.href='process_info_recipe_reg.do';
	});
	
	//데이터테이블
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
		order : [ 2, "desc" ],
		dataType : "json",
		paging : true,
		pageLength : 10,
		pagingType : "full_numbers",
		dom : 'rt<"bottom"iflp>',
		language : {
	        emptyTable: "데이터가 없습니다.",
	        lengthMenu: "페이지당 _MENU_ 개씩 보기",
	        info: "현재 _START_ - _END_ / _TOTAL_건",
	        infoEmpty: "데이터 없음",
	        infoFiltered: "( _MAX_건의 데이터에서 필터링되었습니다. )",
	        search: "",
	        zeroRecords: "일치하는 데이터가 없습니다.",
	        loadingRecords: "로딩중...",
	        processing:  false,
	        paginate: {
	            next: "다음",
	            previous: "이전",
	            first: '처음',
	            last: '끝'
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
				<div id="content">
				<ul class="lnb">
					<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="process_main.do">공정관리</a></li>
					<li></li>
					<li><a href="process_info_recipe.do">통합 레시피 비율 정보</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
					<div class="tit_box">
						<h2 class="sub_tit">통합 레시피 비율 정보</h2>
						<p class="sub_txt">
							<span>1</span>개의 데이터가 조회되었습니다.
						</p>
					</div>
					<!-- tit_box -->
					<div class="search_pc">
						<input type="text" id="search_po_p" name="search_key" placeholder="search">
						<div class="gla"></div>
					</div>
					<table id="table" style="width: 100%">
						<colgroup>
							<col width="30%">
							<col width="30%">
							<col width="30%">
						</colgroup>
						<thead>
							<tr>
								<th>레시피 코드</th>
								<th>완제품 명</th>
								<th>투입 배합 수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="rec" items="${requestScope.list }">
								<tr>
									<td class="re_no">${rec.re_no }</td>
									<td>${rec.p_name }</td>
									<td>${rec.re_m_number }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="bot_box">
						<div class="bot_btn">
							<div class="btn btn_right" title="등록">등록</div>
						</div>
						<!-- bot_btn -->
					</div>
					<!-- bot_box -->
				</div>
				<!--con-->
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