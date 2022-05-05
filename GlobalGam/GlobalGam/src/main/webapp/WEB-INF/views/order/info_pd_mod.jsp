<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
	<link rel="stylesheet" href="resources/css/obtain_order.css">
	<style>
.tr_detail {
	display:none;
}
</style>
<script>
$(document).ready(function(){
	/*URL 파라미터 가져오기*/
	const urlParams = new URLSearchParams(location.search);
	var s_no = urlParams.get("s_no");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","","");
	$('#myform').append($('<input/>',{type:'hidden',name:'s_no',value:s_no}));
	$('#myform').append($('<input/>',{type:'hidden',name:'tip_index',id:'tip_index',value:''})); //협력업체 순서
	$('#myform').append($('<input/>',{type:'hidden',name:'num_dup',id:'num_dup',value:''})); //중복검사 확인
	
	//수정 버튼
	$(".update").click(function(){
		var no = $("#p_no").val();
		var name = $("#p_name").val();
		var size = $("#p_size").val();
		var count = $("#p_count").val();
		var price = $("#p_price").val();
		var date = $("#p_date").val();
		console.log(no+name+size+count+price+date);
 		 location.href='order_info_product_update.do?p_no='+no+'&p_name='+name+'&p_size='+size+'&p_price='+price
				+'&p_count='+count+'&p_date='+date;
	});
	
	//삭제 버튼
	$("#myform .bot_btn > .delete").click(function(){
		var no = $("#p_no").val();
		location.href='order_info_product_delete.do?p_no='+no;
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
				<div id="content" class="infoPdRegCont">
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
					<h2 class="sub_tit">제품 등록</h2>
					<table id="table_reg">
						<tr>
							<th>제품번호 <span class="txt_red">*</span></th>
							<td>
								<div class="td_wrap code_wrap">
									<input type='text' name='p_no' id='p_no' class="input_half" value="${requestScope.dto.productNo }">
								</div>
								<label for="p_no" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>제품명 <span class="txt_red">*</span></th>
							<td>
								<input type="text" name="p_name" id="p_name" value="${requestScope.dto.pName }">
								<label for="p_name" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>규격</th>
							<td>
								<input type="text" id="p_size" name="p_size" style="width:100% !important;" value="${requestScope.dto.pSize }">
								<label for="p_size" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>표시단위</th>
							<td>
								<input type='text' name='p_count' id='p_count' class="input_half" value="${requestScope.dto.pCount }">
								<label for="'p_count'" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>가격(원)</th>
							<td>
								<input type="text" id="p_price" name="p_price" value="${requestScope.dto.pPrice }">
								<label for="p_price" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>유통기한 <span class="txt_red">*</span></th>
							<td>
								<div class="td_wrap">
									<input type="text" class="input_half" name="p_date" id="p_date" value="${requestScope.dto.pDate }">
								</div>
								<label for="p_date" class="error"></label>
							</td>
						</tr>
					</table>
					<div class="bot_box">
						<div class="bot_btn">
							<div class="btn"><a href="order_info_product.do">취소</a></div>
							<div class="btn btn_right update" title="등록">등록</div>
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