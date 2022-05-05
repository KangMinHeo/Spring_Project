<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(document).ready(function() {
	$(".btn_logout").click(function(){
		location.href='logout.do';
	});
	/*js 스크립트 불러오기*/
	javascript_onload_src("time_clock");
	$(".header > .logo > a").attr('href',function(i,originalValue){
		return "/";
	});
	$(".header > .btn_back").click(function(){
		history.back();
	});
	$(".header > .btn_home").click(function(){
		window.location.href='/';
	});
	$(".header > .btn_next").click(function(){
		history.forward();
	});
});
$(window).load(function(){
  realTimer();
  setInterval(realTimer, 500);
});
</script>
<style>
	.logout{
		width: 10%;
		text-align: left;
		vertical-align: middle;
	}
</style>
<div class="header">
	<div class="logo">
		<a href="/"><img src="/resources/img/logo.png" alt="(주)글로벌 감"></a> <!-- logo 이미지 변경 -->
	</div>
	<!--logo-->
	<div class="btn_menu"></div>
	<div class="btn_logout"></div>
	<!-- <div class="btn_home"></div>
	<div class="btn_next"></div> -->
	<span id="nowTimes" class="time head_font"></span>
</div>