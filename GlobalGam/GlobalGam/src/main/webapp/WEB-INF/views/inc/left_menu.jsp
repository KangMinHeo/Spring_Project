<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
//var lolo_id = 1;
$(document).ready(function() {
	var level = <%=session.getAttribute("level")%>;
	if(level == '관리자'){
		$(".admin").shwo();
	} else {
		$(".admin").hide();
	}
	
	$(".logo > .m_icon").click(function(){
		location.href='/main.html';
	});
	
	$(".menu_tab > li.total").click(function() { // 전체메뉴
		$("li.total").addClass('on');
		$("li.bookmark").removeClass('on');
		$("ul.total_list").css('display', 'block');
		$("ul.bookmark_list").css('display', 'none');
	});
	$(".menu_tab > li.bookmark").click(function() { // 즐겨찾기
		$("li.total").removeClass('on');
		$("li.bookmark").addClass('on');
		$("ul.bookmark_list").css('display', 'block');
		$("ul.total_list").css('display', 'none');
	});
	
	$('ul.side_bar > .none_wrap').click(function() {
		if ($(this).hasClass("on") === true) {
//	console.log('on:'+this);
			$('.menu_box').css({
				'display' : 'none'
			});
			$(this).removeClass('on');
		} else {
//	console.log('off:'+this);
			$('ul.side_bar > .none_wrap ').removeClass('on');
			$(this).addClass('on');
			$('.menu_box').css({
				'display' : 'none'
			});
			$(this).next('.menu_box').css({
				'display' : 'block',
				'left' : '200px',
				'top' : 'unset'
			});
		}
	});	
	
	$('.sideback').click(function() {
		$('ul.side_bar > li').removeClass('on')
		$('.menu_box').css({
			'display' : 'none'
		});
		$('.sideback').css({
			'display' : 'none'
		});
	});	
});
</script>
<style>
.total{width:100% !important;}
ul.menu_list > li>a{text-align: center!important;}
</style>
<ul class="side_bar">
	<li class="info none_wrap">
		<div class="m_icon"></div> <!--m_icon-->
		<p>발주관리</p>
	</li>
	<div class="menu_box">
		<div class="menu_con">
			<ul class="menu_tab">
				<li class="total on" title="메뉴">메뉴</li>
			</ul>
			<!--menu_tab-->
			<ul class="menu_list total_list">
				<li><a href="request_ma_order.do" style="cursor:pointer">발주 관리</a></li>
				<li><a href="request_info_material.do" style="cursor:pointer">원부재료 관리</a></li>
				<li><a href="request_info_cooperative.do" style="cursor:pointer">협력업체</a></li>
			</ul>
			<!--menu_list-->
			<ul class="menu_list bookmark_list">
			</ul>
			<!--menu_list-->
		</div>
		<!--menu_con-->
	</div>
	<!--menu_box-->
	<li class="produce none_wrap">
		<div class="m_icon"></div> <!--m_icon-->
		<p>수주관리</p>
	</li>
	<div class="menu_box">
		<div class="menu_con">
			<ul class="menu_tab">
				<li class="total on" title="메뉴">메뉴</li>
			</ul>
			<!--menu_tab-->
			<ul class="menu_list total_list">
				<li><a href="order_pr_or_check.do" style="cursor:pointer">수주 관리</a></li>
				<li><a href="order_info_product.do" style="cursor:pointer">제품 관리</a></li>
				<li><a href="order_info_customer.do" style="cursor:pointer">고객 관리</a></li>
				<li><a href="order_info_company_reg.do" style="cursor:pointer">기업 정보</a></li>
			</ul>
			<!--menu_list-->
			<ul class="menu_list bookmark_list">
			</ul>
		</div>
		<!--menu_con-->
	</div>
	<!--menu_box-->

	<li class="process none_wrap">
		<div class="m_icon"></div> <!--m_icon-->
		<p>공정관리</p>
	</li>
	<div class="menu_box">
		<div class="menu_con">
			<ul class="menu_tab">
				<li class="total on" title="메뉴">메뉴</li>
			</ul>
			<!--menu_tab-->
			<ul class="menu_list total_list">
				<li><a href="process_info_route.do" style="cursor:pointer">공정 관리</a></li>
				<li><a href="process_info_recipe.do" style="cursor:pointer">통합레시피</a></li>
			</ul>
			<!--menu_list-->
			<ul class="menu_list bookmark_list">
			</ul>
			<!--menu_list-->
		</div>
		<!--menu_con-->
	</div>
	<!--menu_box-->

	<li class="system none_wrap">
		<div class="m_icon"></div> <!--m_icon-->
		<p>생산관리</p>
	</li>
	<div class="menu_box">
		<div class="menu_con">
			<ul class="menu_tab">
				<li class="total on" title="메뉴">메뉴</li>
			</ul>
			<!--menu_tab-->
			<ul class="menu_list total_list">
				<li><a href="/produce/pr_order.html" style="cursor:pointer">생산 관리</a></li>
				<li><a href="/produce/info_user.html" style="cursor:pointer">작업자 정보</a></li>
			</ul>
			<!--menu_list-->
			<ul class="menu_list bookmark_list">
			</ul>
			<!--menu_list-->
		</div>
		<!--menu_con-->
	</div>
	<!--menu_box-->
	<li class="quality none_wrap">
		<div class="m_icon"></div> <!--m_icon-->
		<p>재고관리</p>
	</li>
	<div class="menu_box" style="margin-top:-595px;">
		<!--profile_box-->
		<div class="menu_con">
			<ul class="menu_tab">
				<li class="total on" title="메뉴">메뉴</li>
			</ul>
			<!--menu_tab-->
			<ul class="menu_list total_list">
				<li><a href="storage_ma_put.do" style="cursor:pointer">입/출고 관리</a></li>
				<li><a href="storage_ma_inventory.do" style="cursor:pointer">재고 관리</a></li>
				<li><a href="storage_ma_inquiry_wa.do" style="cursor:pointer">입고 등록</a></li>
				<li><a href="storage_ma_inquiry_re.do" style="cursor:pointer">출고 등록</a></li>
			</ul>
			<!--menu_list-->
			<ul class="menu_list bookmark_list">
			</ul>
			<!--menu_list-->
		</div>
		<!--menu_con-->
	</div>
	<!--menu_box-->

	<li class="material none_wrap">
		<div class="m_icon"></div> <!--m_icon-->
		<p>출하관리</p>
	</li>
	<div class="menu_box" style="margin-top:-170px;">
		<div class="menu_con">
			<ul class="menu_tab">
				<li class="total on" title="메뉴">메뉴</li>
			</ul>
			<!--menu_tab-->
			<ul class="menu_list total_list">
				<li><a href="forward_pr_order_shipment.do" style="cursor:pointer">출하 관리</a></li>
			</ul>
			<!--menu_list-->
			<ul class="menu_list bookmark_list">
			</ul>
			<!--menu_list-->
		</div>
		<!--menu_con-->
	</div>
	<li class="monitoring none_wrap admin">
		<div class="m_icon"></div> <!--m_icon-->
		<p>관리자페이지</p>
	</li>
	<div class="menu_box admin" style="margin-top:-170px;">
		<div class="menu_con">
			<ul class="menu_tab">
				<li class="total on" title="메뉴">메뉴</li>
			</ul>
			<!--menu_tab-->
			<ul class="menu_list total_list">
				<li><a href="admin_main.do" style="cursor:pointer">직원 등록</a></li>
				<li><a href="admincrt_main.do" style="cursor:pointer">직원 수정 / 삭제</a></li>
			</ul>
			<!--menu_list-->
			<ul class="menu_list bookmark_list">
			</ul>
			<!--menu_list-->
		</div>
		<!--menu_con-->
	</div>
</ul>