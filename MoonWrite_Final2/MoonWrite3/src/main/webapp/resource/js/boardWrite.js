$(function(){
	
	$(".btn_submit").click(function(){
		let b_kind = $("input[name='b_kind']:checked").val();
		let b_secret = $("input[name='b_secret']:checked").val();
		let title = $("input[name='title']").val().replaceAll(" ","");
		let content = $("#b_content").val().replaceAll(" ","");
		
		if(b_kind == undefined){
			alert("글의 종류를 선택하세요!");
			return;
		} else if(b_secret == undefined){
			alert("공개 여부를 선택하세요!");
			return;
		} else if(title.length<=0){
			alert("제목을 입력하세요!");
			return;
		} else if(content <=0){
			alert("내용을 입력하세요!");
			return;
		}
		
		$("#frm_boardWrite").submit(); 
	});
	
	$(".btn_search").click(function(){
		let keyword = $(".book_keyword").val();
		
		window.open("popupView.do?keyword="+keyword, 
		"이름으로 책 검색", "width=1100, height=500, top=150, left=150,scrollbars=yes");
	});
	
});