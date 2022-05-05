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
	/*URL 파라미터 가져오기*/
	const urlParams = new URLSearchParams(location.search);
	var s_no = urlParams.get("s_no");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","","");
	$('#myform').append($('<input/>',{type:'hidden',name:'s_no',value:s_no}));
	$('#myform').append($('<input/>',{type:'hidden',name:'route_dup',id:'route_dup',value:''}));

	//수정 버튼
	$("#myform .bot_btn > .btn_right.save").click(function(){
		var no = $("input[name=pro_no]").val();
		console.log(no);
		var name = $("input[name=pro_name]").val();
		console.log(name);
		var info = $("textarea[name=pro_detail]").val();
		console.log(info);
		location.href='process_info_route_update.do?pro_no='+no+'&pro_name='+name+'&pro_detail='+info;
	});

	//삭제 버튼
	$("#myform .bot_btn > .btn_right.delete").click(function(){
		var no = $("input[name=pro_no]").val();
		location.href='process_info_route_delete.do?pro_no='+no;
	});
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
				<div id="content" class="infoRouteRegCont">
				<ul class="lnb">
					<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="process_main.do">공정관리</a></li>
					<li></li>
					<li><a href="process_info_route.do">공정 정보</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
					<h2 class="sub_tit">공정 수정</h2>
					<table id="table_reg">
						<tr>
							<th>공정코드 <span class="txt_red">*</span></th>
							<td>
								<div class="code_wrap">
									<input type='text' name='pro_no' id='pro_no' readonly value="${requestScope.pro_dto.pro_no }">
								</div>
								<label for="pro_no" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>공정명 <span class="txt_red">*</span></th>
							<td><input type="text" name="pro_name" value="${requestScope.pro_dto.pro_name }"></td>
						</tr>
						<tr>
							<th>세부 공정정보</th>
							<!-- 2019 01 08 박인범 수정사항 -->
							<td><textarea class="gita" name="pro_detail" style="resize: none;">${requestScope.pro_dto.pro_detail }</textarea></td>
							<!-- 2019 01 08 박인범 수정사항 -->
						</tr>
					</table>
					<div class="bot_box">
						<div class="bot_btn">
							<div class="btn"><a href="process_info_route.do">취소</a></div>
							<div class="btn btn_right save" title="수정">수정</div>
							<div class="btn btn_right delete">삭제</div>
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