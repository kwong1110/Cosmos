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
	
	var $errorDiv = $("<div class='error'>");
	
	for(var i=0; i < arguments.length; i++){
		if($(arguments[i]).val().trim().length != 0){
			$('.error').detach();
		}
	}
	
	for(var i=0; i < arguments.length; i++){

		var msg = $(arguments[i]).prev().text();
		
		if($(arguments[i]).val().trim().length == 0){
			if(!$(arguments[i]).next().is($('.error'))){
				$(arguments[i]).parent().append($errorDiv);
				$('.error').text(msg + '를 입력해주세요!');
				$(arguments[i]).focus();
			}
			return false;
		}		
	}
	
	return true;
}