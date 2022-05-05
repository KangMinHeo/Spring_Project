<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 감코리아</title>
	<%@include file="../inc/head_html_text.jsp"%>
	<link rel="stylesheet" href="/css/obtain_order.css">
</head>
<script>
$(document).ready(function(){
	/*js 스크립트 불러오기*/
	javascript_onload_src("script_next_focus");
	
	/*URL 파라미터 가져오기*/
	const urlParams = new URLSearchParams(location.search);
	var s_no = urlParams.get("s_no");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","","");
	$('#myform').append($('<input/>',{type:'hidden',name:'s_no',value:s_no}));
	$('#myform').append($('<input/>',{type:'hidden',name:'customer_dup',id:'customer_dup',value:''}));


	
	//입력제한
	$("#table_reg input[name='initial_text']").on('keyup', function(event) {
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
		    var inputVal = $(this).val();
		    $(this).val(inputVal.replace(/[^A-Za-z0-9]/gi,'').toUpperCase());
	    }
	});
	
	//중복체크
	javascript_onload_src("script_ajax_layer_pop");
	$("#table_reg .btn_dup").click(function(){
		script_ajax_layer_pop('/obtain_order/customer_dup.html',"cu_code=",'.popup-4');
	});
	
	//주소
	$("#table_reg input[name='post']").click(function(){
		script_ajax_layer_pop('/popup/popup_home.html','post=post&address=address1','.popup-17');
	});
	$("#table_reg input[name='n_post']").click(function(){
		script_ajax_layer_pop('/popup/popup_home.html','post=n_post&address=n_address1','.popup-17');
	});
	
	//등록 버튼
	$(".bot_btn > .save").click(function(){
		var no = $("input[name='businessnum']").val();
		console.log(no);
		var name = $("input[name='c_name']").val();
		console.log(name);
		var ceo = $("input[name='user_name']").val();
		console.log(ceo);
		var tel = $("input[name='tel1']").val()+"-"+$("input[name='tel2']").val()+"-"+$("input[name='tel3']").val();
		console.log(tel);
		var fax = $("input[name='fax1']").val()+"-"+$("input[name='fax2']").val()+"-"+$("input[name='fax3']").val();
		console.log(fax);
		var address = $("input[name='address1']").val()+"/"+$("input[name='address2']").val();
		console.log(address);
		var ma = $("input[name='cu_manager']").val();
		console.log(ma);
		var ma_tel = $("input[name='cu_ma_tel1']").val()+"-"+$("input[name='cu_ma_tel2']").val()+"-"+$("input[name='cu_ma_tel3']").val();
		console.log(ma_tel);
		var email = $("input[name='cu_ma_email1']").val()+"@"+$("input[name='cu_ma_email2']").val();
		console.log(email);
		var etc = $("textarea.gita").val();
		console.log(etc);
 		location.href='order_info_customer_register.do?businessnum='+no+'&c_name='+name+'&user_name='+ceo+'&tel1='+tel+
		'&fax1='+fax+'&address='+address+'&cu_manager='+ma+
		'&cu_ma_tel1='+ma_tel+'&cu_ma_email1='+email+'&cu_etc='+etc;
	});
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
					<div id="content" class="infoCustomerRegCont">
				<ul class="lnb">
					<li><a href="/"><img src="resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="order_main.do">수주관리</a></li>
					<li></li>
					<li><a href="order_info_customer.do">고객업체 정보</a></li>
				</ul>
				<!--lnb-->
				<div class="sub_con">
					<h2 class="sub_tit">고객업체 정보 등록</h2>
					<table id="table_reg">
						<tr>
							<th>사업자 등록번호</th>
							<td>
								<input type="text" name="businessnum">
								<label for="businessnum" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>고객업체 명 <span class="txt_red">*</span></th>
							<td>
								<input type="text" name="c_name">
								<label for="c_name" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>대표자 명</th>
							<td>
								<input type="text" name="user_name">
								<label for="user_name" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<select class="select_number" name='tel99' onChange='document.myform.tel1.value=this.value'>
									<option value='' selected>직접입력</option>
									<option value='02'>02</option>
									<option value='031'>031</option>
									<option value='032'>032</option>
									<option value='033'>033</option>
									<option value='041'>041</option>
									<option value='042'>042</option>
									<option value='043'>043</option>
									<option value='051'>051</option>
									<option value='052'>052</option>
									<option value='053'>053</option>
									<option value='054'>054</option>
									<option value='061'>061</option>
									<option value='062'>062</option>
									<option value='063'>063</option>
									<option value='064'>064</option>
								</select>
								<input type="text" class="phonenum" maxlength="3" name="tel1" onkeyup="script_next_focus(this,3,document.myform.tel2)">
								<span class="phonespan">-</span>
								<input type="text" class="phonenum" maxlength="4" name="tel2" onkeyup="script_next_focus(this,4,document.myform.tel3)">
								<span class="phonespan">-</span>
								<input type="text" class="phonenum" maxlength="4" name="tel3" onkeyup="script_next_focus(this,4,document.myform.hp99)">
								<label for="tel" class="error"></label>
							</td>
						</tr>

						<tr>
							<th>FAX</th>
							<td class="input_num">
								<select name='fax99' class="select_number" onChange='document.myform.fax1.value=this.value'>
									<option value='' selected>직접입력</option>
									<option value='02'>02</option>
									<option value='031'>031</option>
									<option value='032'>032</option>
									<option value='033'>033</option>
									<option value='041'>041</option>
									<option value='042'>042</option>
									<option value='043'>043</option>
									<option value='051'>051</option>
									<option value='052'>052</option>
									<option value='053'>053</option>
									<option value='054'>054</option>
									<option value='061'>061</option>
									<option value='062'>062</option>
									<option value='063'>063</option>
									<option value='064'>064</option>
								</select>
								<input type="text" class="phonenum" maxlength="3" name="fax1" onkeyup="script_next_focus(this,3,document.myform.fax2)">
								<span class="phonespan">-</span>
								<input type="text" class="phonenum" maxlength="4" name="fax2" onkeyup="script_next_focus(this,4,document.myform.fax3)">
								<span class="phonespan">-</span>
								<input type="text" class="phonenum" maxlength="4" name="fax3" onkeyup="script_next_focus(this,4,document.myform.email1)">
								<label for="fax" class="error"></label>
							</td>
						</tr>
						<tr>
							<th rowspan="2">주소</th>
							<td><input type="text" class="trhome" id="address" placeholder="도로명 주소를 입력해주세요." name="address1"></td>
						</tr>
						<tr>
							<td><input type="text" class="trhome" placeholder="상세주소를 입력해주세요" name="address2"></td>
						</tr>
						<tr>
							<th>담당자명</th>
							<td>
								<input type="text" name="cu_manager">
								<label for="cu_manager" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>담당자 번호</th>
							<td><select class="select_number" name='cu_ma_tel99' onChange='document.myform.cu_ma_tel1.value=this.value'>
									<option value='' selected>직접입력</option>
									<option value='010'>010</option>
									<option value='011'>011</option>
									<option value='017'>017</option>
									<option value='018'>018</option>
									<option value='019'>019</option>
							</select> 
							<input type="text" class="phonenum" maxlength="3" name='cu_ma_tel1' onkeyup="script_next_focus(this,3,document.myform.cu_ma_tel2)">
								<span class="phonespan">-</span>
								<input type="text" class="phonenum" maxlength="4" name='cu_ma_tel2' onkeyup="script_next_focus(this,4,document.myform.cu_ma_tel3)">
								<span class="phonespan">-</span>
								<input type="text" class="phonenum" maxlength="4" name='cu_ma_tel3' onkeyup="script_next_focus(this,4,document.myform.cu_ma_email1)">
								<label for="cu_ma_tel" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>담당자 이메일</th>
							<td class="email_input">
								<input class="in_em" name="cu_ma_email1" type="text" size="12">
								<span class="phonespan">@</span>
								<input class="in_em" name="cu_ma_email2" type="text" size="12">
								<select name='email99' onChange='document.myform.cu_ma_email2.value=this.value' class="select_em">
									<option value=''>직접입력</option>
		   							<option value='naver.com'>naver.com</option>
		   							<option value='daum.net'>daum.net</option>
		   							<option value='nate.com'>nate.com</option>
		   							<option value='gmail.com'>gmail.com</option>
		   							<option value='hanmail.net'>hanmail.net</option>
		   							<option value='hotmail.com'>hotmail.com</option>
		   							<option value='chollian.net'>chollian.net</option>
		   							<option value='empas.com'>empas.com</option>
		   							<option value='hitel.com'>hitel.com</option>
		   							<option value='korea.com'>korea.com</option>
		   							<option value='netian.com'>netian.com</option>
		   							<option value='yahoo.co.kr'>yahoo.co.kr</option>
								</select>
								<label for="cu_ma_email1" class="error"></label>
							</td>
						</tr>
						<tr>
							<th>기타</th>
							<td><textarea class="gita" name="etc"></textarea></td>
						</tr>
					</table>
					<div class="bot_box">
						<div class="bot_btn">
							<div class="btn"><a href="order_info_customer.do">취소</a></div>
							<div class="btn btn_right save" title="등록">등록</div>
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
	</div><!-- 여기가 메인 컨텐츠 영역 -->
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