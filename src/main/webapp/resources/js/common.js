/**
 * 체크박스 전부 체크, 헤제 기능
 * 전부체크 #all
 * 요소별체크 name="checkselect";
 */
function checkAll() {
	var all = document.getElementById("all");
	var category = document.getElementsByName("checkselect");
	if (all.checked) {
		for (var i = 0; i < category.length; i++) {
			category[i].checked = true;
		}
	} else {
		for (var i = 0; i < category.length; i++) {
			category[i].checked = false;
		}
	}
}

function checkDetail() {
	var count = 0;
	var all = document.getElementById("all");
	var category = document.getElementsByName("checkselect");

	for (var i = 0; i < category.length; i++) {
		if (category[i].checked) {
			count++;
		}
	}

	if (count != category.length) {
		all.checked = false;
	} else {
		all.checked = true;
	}
}

/**
 *	빈칸으로 값 전송 시 아래칸에 경고메세지 출력
 * 	매개변수 값으로 빈칸이면 안되는 곳의 id를 차례로 입력해주면 됨.
 * 	1개, 여러개 모두 상관 없음.
 */
function checkEmptyValues(){
	
	// 이걸로 안하고 placeholder가 빛나는걸로 
	// var $errorDiv = $("<div class='error'>");
	
	for(var i=0; i < arguments.length; i++){
		if($(arguments[i]).val().trim().length != 0){
			$(arguments[i]).removeClass('error');
		}
	}
	
	for(var i=0; i < arguments.length; i++){

		var msg = $(arguments[i]).attr('placeholder');
		
		if($(arguments[i]).val().trim().length == 0){
			if(!$(arguments[i]).is($('.error'))){
				$(arguments[i]).addClass('error');
				$('.error').text(msg);
				$(arguments[i]).focus();
			}
			return false;
		}		
	}
	
	return true;
}