<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>✔ 글로벌 감</title>
<%@include file="../inc/head_html_text.jsp"%>
<link rel="stylesheet" href="resources/css/obtain_order.css">
<style>
.bank_select {
    width: 100px!important;
    vertical-align: middle;
    float: left;
    height: 30px;
}
.mar10 {
    margin-right: 10px;
}

.i_block {
    display: inline-block;
    vertical-align: middle;
}
@media screen and (max-width: 560px){
    .i_block {
        display: grid;
    }
}
</style>
<script>
$(document).ready(function(){
	/*js 스크립트 불러오기*/
	javascript_onload_src("script_next_focus");
	
	/*FORM 태그 삽입하기*/
	script_new_reformdata(".sub_con","myform","","");
	$('#myform').append($('<input/>',{type:'hidden',name:'s_no',value:''}));
	
	// 등록버튼
	$(".save").click(function(){
		var no = $("input[name=mc_no]").val();
		console.log(no);
		var name = $("input[name=mc_name]").val();
		console.log(name);
		var ceo = $("input[name=mc_ceo]").val();
		console.log(ceo);
		var tel = $("input[name=tel1]").val()+"-"+$("input[name=tel2]").val()+"-"+$("input[name=tel3]").val();
		console.log(tel);
		var fax = $("input[name=fax1]").val()+"-"+$("input[name=fax2]").val()+"-"+$("input[name=fax3]").val();
		console.log(fax);
		var em = $("input[name=mc_em]").val();
		console.log(em);
		var em_tel = $("input[name=mc_em_tel1]").val()+"-"+$("input[name=mc_em_tel2]").val()+"-"+$("input[name=mc_em_tel3]").val();
		console.log(em_tel);
		var email = $("input[name=email1]").val() + "@" +$("input[name=email2]").val();
		console.log(email);
		var add = $("input[name=address]").val()+"/"+$("input[name=address2]").val();
		console.log(add);
		var bank = $("input[name=mc_bank]").val();
		console.log(bank);
		var bank_num = $("input[name=mc_bank_num]").val();
		console.log(bank_num);
		var bank_name = $("input[name=mc_bank_name]").val();
		console.log(bank_name);
		
		location.href='order_info_company_update.do?mc_no='+no+'&mc_name='+name+'&mc_ceo='+ceo+'&mc_tel='+tel+'&mc_fax='+fax+
				'&mc_em='+em+'&mc_em_tel='+em_tel+'&mc_email='+email+'&mc_address='+add+'&mc_bank='+bank+'&mc_bank_num='+bank_num+'&mc_bank_name='+bank_name;
		});
});

function ck_cname() {
	var c_name = $('#c_name').val();
	var checked = $('#same').prop("checked");
	if(checked){
		$('#acc_name').val(c_name);
		$('#acc_name').prop("readonly",true);
	}else{
		$('#acc_name').val('');
		$('#acc_name').prop("readonly",false);
	}
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
			<div id="content" class="infoCompanyRegCont">
				<ul class="lnb">
						<li><a href="/"><img src="/resources/img/icon_home.jpg" alt="홈으로"></a></li>
					<li></li>
					<li><a href="/order_main.do">수주관리</a></li>
					<li></li>
					<li><a href="order_info_company_reg.do">기업 정보</a></li>
				</ul>
				<!--lnb-->
		   		<div class="sub_con">
		   			<h2 class="sub_tit">기업 정보 관리</h2>
		   			<table id="table_reg">
		   				<tr>
		   					<th>사업자 등록번호</th>
		   					<td><input type="text" name="mc_no" value="${requestScope.dto.mc_no }"></td>
		   				</tr>
		   				<tr>
		   					<th>기업명</th>
		   					<td><input type='text' name='mc_name' id='mc_name' value="${requestScope.dto.mc_name} ">
		   					</td>
		   				</tr>
		   				<tr>
		   					<th>대표자 명</th>
		   					<td><input type="text" name="mc_ceo" value="${requestScope.dto.mc_ceo }"></td>
		   				</tr>
		   				<tr>
		   					<th>대표 전화번호</th>
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
		   						<input type="text" class="phonenum" maxlength="3"  name="tel1" onkeyup="script_next_focus(this,3,document.myform.tel2)" value="${requestScope.tel[0] }">
		   						<span class="phonespan">-</span>
		   						<input type="text" class="phonenum" maxlength="4" name="tel2" onkeyup="script_next_focus(this,4,document.myform.tel3)" value="${requestScope.tel[1] }">
		   						<span class="phonespan">-</span>
		   						<input type="text" class="phonenum" maxlength="4" name="tel3" onkeyup="script_next_focus(this,4,document.myform.hp99)" value="${requestScope.tel[2] }">
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
		   						<input type="text" class="phonenum" maxlength="3" name="fax1" onkeyup="script_next_focus(this,3,document.myform.fax2)" value="${requestScope.fax[0] }">
		   						<span class="phonespan">-</span>
		   						<input type="text" class="phonenum" maxlength="4" name="fax2" onkeyup="script_next_focus(this,4,document.myform.fax3)" value="${requestScope.fax[1] }">
		   						<span class="phonespan">-</span>
		   						<input type="text" class="phonenum" maxlength="4" name="fax3" onkeyup="script_next_focus(this,4,document.myform.email1)" value="${requestScope.fax[2] }">
		   						<label for="fax" class="error"></label>
		   					</td>
		               	</tr>
		   				<tr>
		   					<th>담당자 명</th>
		   					<td><input type="text" name="mc_em" value="${requestScope.dto.mc_em }"></td>
		   				</tr>
		   				<tr>
		   					<th>담당자 핸드폰 번호</th>
		   					<td class="input_num">
		   						<select name='ma_hp99' class="select_number" onChange='document.myform.ma_hp1.value=this.value'>
		   							<option value='' selected>직접입력</option>
		   							<option value='010'>010</option>
		   							<option value='011'>011</option>
		   							<option value='017'>017</option>
		   							<option value='018'>018</option>
		   							<option value='019'>019</option>
		   						</select>								
		   						<input type="text" class="phonenum" maxlength="3" name="mc_em_tel1" onkeyup="script_next_focus(this,3,document.myform.ma_hp2)" value="${requestScope.etel[0] }">
		   						<span class="phonespan">-</span>
		   						<input type="text" class="phonenum" maxlength="4" name="mc_em_tel2" onkeyup="script_next_focus(this,4,document.myform.ma_hp3)" value="${requestScope.etel[1] }">
		   						<span class="phonespan">-</span>
		   						<input type="text" class="phonenum" maxlength="4" name="mc_em_tel3" onkeyup="script_next_focus(this,4,document.myform.ma_email1)"value="${requestScope.etel[2] }">
		   						<label for="ma_tel" class="error"></label>
		   					</td>
		               	</tr>
		               	<tr>
		   					<th>담당자 이메일</th>
		   					<td class="email_input">
		   						<input class="in_em" name="email1" type="text" value="${requestScope.email[0] }">
		   						<span class="phonespan">@</span>
		   						<input class="in_em" name="email2" type="text" value="${requestScope.email[1] }">
		   						<select name='ma_email99' onChange='document.myform.ma_email2.value=this.value' class="select_em">
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
		   						<label for="ma_email1" class="error"></label>
		   					</td>
		   				</tr>
		       			<tr>
		       				<th rowspan="2">주소</th>
		                      <td><input type="text" class="trhome" id="address" placeholder="도로명 주소를 입력해주세요." name="address" readonly value="${requestScope.add[0] }"></td>
		                   </tr>
		                   <tr>
		                      <td><input type="text" class="trhome" placeholder="상세주소를 입력해주세요" name="address2" value="${requestScope.add[1] }"></td>
		                   </tr>
		                   <tr>
		                   	<th rowspan="2">입금 계좌정보</th>
		                   	<td>
		       					<div class="i_block mar10">
		           					<select class="bank_select" name='bank1' onChange='document.myform.bank.value=this.value'>
		           						<option value="">직접입력</option>
		           						<option value="국민은행">국민은행</option>
		           						<option value="신한은행">신한은행</option>
		           						<option value="기업은행">기업은행</option>
		           						<option value="농협중앙회">농협중앙회</option>
		           						<option value="단위농협">단위농협</option>
		           						<option value="우리은행">우리은행</option>
		           						<option value="대구은행">대구은행</option>
		           						<option value="외환은행">외환은행</option>
		           						<option value="SC제일은행">SC제일은행</option>
		           						<option value="부산은행">부산은행</option>
		           						<option value="새마을금고">새마을금고</option>
		           						<option value="한국씨티은행">한국씨티은행</option>
		           						<option value="광주은행">광주은행</option>
		           						<option value="경남은행">경남은행</option>
		           						<option value="수협">수협</option>
		           						<option value="신협">신협</option>
		           						<option value="전북은행">전북은행</option>
		           						<option value="제주은행">제주은행</option>
		           						<option value="산림조합">산림조합</option>
		           						<option value="우체국">우체국</option>
		           						<option value="하나은행">하나은행</option>
		           						<option value="신한은행">신한은행</option>
		           						<option value="동양종금증권">동양종금증권</option>
		           						<option value="한국투자증권">한국투자증권</option>
		           						<option value="삼성증권">삼성증권</option>
		           						<option value="미래에셋">미래에셋</option>
		           						<option value="우리투자증권">우리투자증권</option>
		           						<option value="현대증권">현대증권</option>
		           						<option value="SK증권">SK증권</option>
		           						<option value="신한금융투자">신한금융투자</option>
		           						<option value="하이증권">하이증권</option>
		           						<option value="HMC증권">HMC증권</option>
		           						<option value="대신증권">대신증권</option>
		           						<option value="하나대투증권">하나대투증권</option>
		           						<option value="동부증권">동부증권</option>
		           						<option value="유진증권">유진증권</option>
		           						<option value="메리츠증권">메리츠증권</option>
		           						<option value="신영증권">신영증권</option>
		           						<option value="대우증권">대우증권</option>
		           					</select>
		           					<input type="text" class="bank_text" name="mc_bank" value="${requestScope.dto.mc_bank }">
		           					<label for="bank" class="error"></label>
		       					</div>
		       					<div class="i_block">
		       						계좌번호<input type="text" name="mc_bank_num" style="float: none;" value="${requestScope.dto.mc_bank_num }">
		       						<label for="mc_bank_num" class="error"></label>
		   						</div>
		       				</td>
		                   </tr>
		                   <tr>
		                   	<td>
		       					<span style="font-size:12px;">예금주</span>
		       					<input type="text" id="acc_name" name="mc_bank_name" style="float: none;" value="${requestScope.dto.mc_bank_name }">
		       					<label for="mc_bank_name" class="error"></label>
		       				</td>
		                   </tr>
		   			</table>
		   			<div class="bot_box">
		       			<div class="bot_btn">
		           			<div class="btn"><a href="order_main.do">취소</a></div>
		           			<div class="btn btn_right save" title="등록">등록</div>
		       			</div><!-- bot_btn -->
		   			</div><!-- bot_box -->
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
	<div class="keyboard"></div>
</body>
</html>