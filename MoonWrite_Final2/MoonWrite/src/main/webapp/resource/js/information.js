 function checkPass(){
        let pass = document.querySelector("#pass");
        let passChk = document.querySelector("#pass_chk");
        let passCheck = document.querySelector(".pass_check");
       
		 let result = false;

        if((pass.value.length < 8 )|| pass.value.length > 32){
          passCheck.innerHTML = "암호는 글자수가 8~32글자 사이로 사용하세요";
        }else if(!isNaN(pass.value)){
          passCheck.innerHTML = "암호는 숫자로만 구성할수 없습니다.";
        }else if(pass.value.indexOf(" ") != -1){
          passCheck.innerHTML = "암호에는 띄워쓰기를 할수 없습니다.";
        }else if(pass.value != passChk.value){
          passCheck.innerHTML = "입력하신 암호가 동일하지 않습니다.";
        }else{
          passCheck.innerHTML = "암호가 올바르게 입력되었습니다.";
          result = true;
        }
		
		//아예 공백일 때
		if(pass.value.length + passChk.value.length == 0){
			result = true;
		}

        if(result){
          passCheck.classList.remove("false");
          if(!passCheck.classList.contains("true"))
            passCheck.classList.add("true");
        }else{
          passCheck.classList.remove("true");
          if(!passCheck.classList.contains("false"))
            passCheck.classList.add("false");
        }
        return result;
      }

	function noSpaceForm(obj) { // 공백사용못하게
    	var str_space = /\s/;  // 공백체크
   		 if(str_space.exec(obj.value)) { //공백 체크
        	alert("닉네임에 공백을 포함시킬 수 없습니다.");
        	obj.focus();
			obj.value = obj.value.replace(' ',''); // 공백제거
        return false;
    }
}

      window.onload = function(){
        let pass = document.querySelector("#pass"); //1차 비밀번호
        let passChk = document.querySelector("#pass_chk"); // 2차 확인 번호
       
      		pass.onkeyup = checkPass;
			passChk.onkeyup = checkPass;
		 

		$(".btn_next").click(function(){
		
			let pass = document.querySelector("#pass"); //1차 비밀번호
			let passChk = document.querySelector("#pass_chk"); // 2차 확인 번호
			pass.onkeyup = checkPass;
			passChk.onkeyup = checkPass;
			
			//수정에서 비밀번호를 바꾸고 싶지 않으면? 
			if (!checkPass()) {
				alert("비밀번호를 확인 하세요!!");
				return;
			} else if ($(".name_check").val() == "") {
				alert("닉네임 중복확인을 하세요!!");
				return;
			} 
			
			$("#frm").submit();
						
		});

			$(".btn_name_chk").click(function(){
			//닉네임을 내가 쓰고 있는지? 타인이 쓰고 있는지?
			//현재 내가 쓰고 있는거면 계속 쓸 수 있어야 할 것 같아서
			//코드 수정합니다.
			var nick_name = "m_name=" + $("#nick_name").val().trim()+"&m_id="+$("#id").val();
	
			$.ajax({
				type: "get",
				url: "info_name_chk.do",
				data: nick_name,
				datatype: "json",
				success: function(res) {
					
					let json = JSON.parse(res);
					//alert(json.name_result);
					
					if (json.name_result == 0) {
						alert($("#nick_name").val() + "은(는) 사용 가능한 닉네임 입니다.");
						$(".name_check").val("ok");
					} else if(json.name_result == 1) {
						alert($("#nick_name").val() + "은(는) 현재 당신이 사용중인 닉네임 입니다.");
						$(".name_check").val("ok");
					} else if(json.name_result>=2){
						alert($("#nick_name").val() + "은(는) 사용이 불가능한 닉네임 입니다.");
						$(".name_check").val("");
					}
					//console.log($(".name_check").val());
				},
				error: function() {
					alert("ajax 통신 실패 ㅠㅠ!!");
				}
			});
		});
		
		  $("#btn_delete").click(function(){
		 		var id = $("#id").val();
		 		let check = confirm("정말 탈퇴하실거에요? ㅠㅠ");
		 		
		 		if(check)
             		location.href="member_delete.do?id="+id;
             		else
             			return;
          });

      }