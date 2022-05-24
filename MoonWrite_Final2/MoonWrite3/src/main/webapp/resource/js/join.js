function checkPass() {
	let pass = document.querySelector("#pass");
	let passChk = document.querySelector("#pass_chk");
	let passCheck = document.querySelector(".pass_check");

	let result = false;

	if (pass.value.length < 8 || pass.value.length > 32) {
		passCheck.innerHTML = "암호는 글자수가 8~32글자 사이로 사용하세요";
	} else if (!isNaN(pass.value)) {
		passCheck.innerHTML = "암호는 숫자로만 구성할수 없습니다.";
	} else if (pass.value.indexOf(" ") != -1) {
		passCheck.innerHTML = "암호에는 띄워쓰기를 할수 없습니다.";
	} else if (pass.value != passChk.value) {
		passCheck.innerHTML = "입력하신 암호가 동일하지 않습니다.";
	} else {
		passCheck.innerHTML = "암호가 올바르게 입력되었습니다.";
		result = true;
	}

	if (result) {
		passCheck.classList.remove("false");
		if (!passCheck.classList.contains("true"))
			passCheck.classList.add("true");
	} else {
		passCheck.classList.remove("true");
		if (!passCheck.classList.contains("false"))
			passCheck.classList.add("false");
	}
	return result;
}

window.onload = function() {

	let pass = document.querySelector("#pass"); //1차 비밀번호
	let passChk = document.querySelector("#pass_chk"); // 2차 확인 번호
	pass.onkeyup = checkPass;
	passChk.onkeyup = checkPass;


	$(".btn_next").click(function() {
		if (!checkPass()) {
			alert("비밀번호를 확인 하세요!!");
			return;
		} else if ($(".id_check").val() == "") {
			alert("id 중복확인을 하세요!!");
			return;
		} else if ($(".name_check").val() == "") {
			alert("닉네임 중복확인을 하세요!!");
			return;
		} else if($("#email").val()==""){
			alert("이메일을 확인 하세요!!");
			return;
		}
		$("#frm").submit();

	});

	$(".btn_id_chk").click(function() {
		var id = "id=" + $("#id").val();

		$.ajax({
			type: "get",
			url: "id_chk.do",
			data: id,
			datatype: "json",
			success: function(res) {
				let json = JSON.parse(res);

				if (json.id_result == 0) {
					alert($("#id").val() + "은(는) 사용 가능한 아이디 입니다.");
					$(".id_check").val("ok");
					console.log($(".id_check").val());
				} else {
					alert($("#id").val() + "은(는) 사용이 불가능한 아이디 입니다.");
					$(".id_check").val("");
					console.log($(".id_check").val());
				}
			},
			error: function() {
				alert("ajax 통신 실패 ㅠㅠ!!");
			}
		});
	})

	$(".btn_name_chk").click(function() {
		var m_name = "m_name=" + $("#nick_name").val();

		$.ajax({
			type: "get",
			url: "name_chk.do",
			data: m_name,
			datatype: "json",
			success: function(res) {
				let json = JSON.parse(res);

				if (json.name_result == 0) {
					alert($("#nick_name").val() + "은(는) 사용 가능한 닉네임 입니다.");
					$(".name_check").val("ok");
				} else {
					alert($("#nick_name").val() + "은(는) 사용이 불가능한 닉네임 입니다.");
					$(".name_check").val("");
				}
				console.log($(".name_check").val());
			},
			error: function() {
				alert("ajax 통신 실패 ㅠㅠ!!");
			}
		});
	})

}