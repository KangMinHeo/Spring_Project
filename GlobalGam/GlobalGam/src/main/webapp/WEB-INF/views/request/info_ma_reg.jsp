<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
	<link rel="stylesheet" href="resources/css/order.css">
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
	$('#myform').append($('<input/>',{type:'hidden',name:'tip_index',id:'tip_index',value:''}));
	$('#myform').append($('<input/>',{type:'hidden',name:'num_dup',id:'num_dup',value:''}));
	$('#myform').append($('<input/>',{type:'hidden',name:'no',id:'no',value:''}));



	//이미지 파일 미리보기
	javascript_onload_src("image_file_check");
	javascript_onload_src("previewImage");
	$("#image2").change(function(){
		if(image_file_check(this)){
			var file_text = $(this).val().split("\\");
			$("#image").val(file_text[2]);
			$("#View_area").html("");
			previewImage(this,'View_area');
		}
	});
	$("#image, #myform div.btn_06").click(function(){
		$('#image2').click();
	});
	
	//입력제한
	$("#table_reg input[name='initial_text']").on('keyup', function(event) {
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
		    var inputVal = $(this).val();
		    $(this).val(inputVal.replace(/[^A-Za-z0-9]/gi,'').toUpperCase());
	    }
	});
	$("#myform input[name='box_quantity'],#myform input[name='expiration_term1'],#myform input[name='display_order']").on('keyup', function(event) {
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
		    var inputVal = $(this).val();
		    $(this).val(Number(inputVal.replace(/[^0-9]/gi,'')));
	    }
	});
	//포장지당 중량
	$("#myform input[name='sacks_unit']").on('keyup', function(event) {
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
		    var inputVal = $(this).val();
		    $(this).val(inputVal.replace(/[^0-9\.]/gi,''));
	    }
	});
	//단가
	$("#myform #p_price").on('keyup', function(event) {
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
		    var inputVal = $(this).val();
		    $(this).val(addComma(Number(inputVal.replace(/[^0-9]/gi,''))));
	    }
	});
	
	//중복체크
	javascript_onload_src("script_ajax_layer_pop");
	$("#table_reg .btn_dup").on("click",function(){
		script_ajax_layer_pop('/order/material_dup.html',"mt_number=",'.popup-4');
	});
	
	//BOX 표시단위
	$("#table_reg select[name='box_unit']").on("change",function(){
		if($(this).val()=="A"){
			$("#box_unit_text").css("display","inline-block");
			$("#box_unit_text").val("");
		}else{
			$("#box_unit_text").css("display","none");
			$("#box_unit_text").val("BOX");
		}
	});
	
	//협력업체
	$("#myform").on("click", ".insearch", function() {
		script_ajax_layer_pop('/popup/popup_coo.html','','.popup-5');
	});
	
	//등록 버튼
	$("#myform .bot_btn > .btn_right").click(function(){
		var no = $("input[name=m_no]").val();
		console.log(no);
		var name = $("input[name=m_name]").val();
		console.log(name);
		var size = $("input[name=m_size]").val();
		console.log(size);
		var count = $("input[name=m_count]").val();
		console.log(count);
		var price = $("input[name=m_price]").val();
		console.log(price);
		var code = $("#co_com option:selected").val();
		console.log(code);
		var country = $("input[name=m_country]").val();
		console.log(country);
		var date = $("input[name=m_date]").val();
		console.log(date);
 		location.href='request_info_ma_register.do?m_no='+no+'&m_name='+name+
				'&m_size='+size+'&m_count='+count+'&m_price='
				+price+'&m_cc_code='+code+'&m_country='+country+'&m_date='+date;
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
				<div id="content" class="infoMaRegCont">
				<ul class="lnb">
					<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="request_main.do">발주관리</a></li>
					<li></li>
					<li><a href="request_info_material.do">원부재료 정보</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
					<h2 class="sub_tit">원부재료 등록</h2>
					<table id="table_reg">
						<tr>
							<th>제품번호 <span class="txt_red">*</span></th>
							<td>
								<div class="td_wrap code_wrap">
									<input type='text' name='m_no' id='m_no' class="input_half">
								</div>
								<label for="m_no" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>제품명 <span class="txt_red">*</span></th>
							<td>
								<input type="text" name="m_name" id='m_name'>
								<label for="m_name" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>규격</th>
							<td>
								<input type="text" name="m_size" style="width:100% !important;">
								<label for="m_size" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>표시단위</th>
							<td>
								<div class="td_wrap code_wrap">
									<input type='text' name='m_count' id='m_count' class="input_half">
								</div>
								<label for="m_count" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>단가</th>
							<td>
								<input type="text" id="m_price" name="m_price">
								<label for="m_price" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>협력업체 <span class="txt_red">*</span></th>
							<td>
								<div class="pt_line">
									<select name="co_com" class="select_half" id="co_com">
										<c:forEach var="cop" items="${requestScope.list }">										
											<option value="${cop.co_no }">${cop.co_name }</option>
										</c:forEach>
									</select>
									<input type="hidden" class="insearch" name="co_name">
									<input type="hidden" name="m_cc_code">
								</div>
							</td>
						</tr>
						<tr>
							<th>원산지</th>
							<td>
								<input type="text" name="m_country">
							</td>
						</tr>
						<tr>
							<th>유통기한 <span class="txt_red">*</span></th>
							<td>
								<div class="td_wrap">
									<input type="text" class="input_half" name="m_date">
								</div>
								<label for="m_date" class="error"></label>
							</td>
						</tr>
					</table>
					<div class="bot_box">
						<div class="bot_btn">
							<div class="btn"><a href="request_info_material.do">취소</a></div>
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
			<!--content-->
		</div>
	</div>
	<!--content-->
	<div id="copy">
		<%@include file="../inc/copy_wrap.jsp"%>
	</div>
</body>
</html>