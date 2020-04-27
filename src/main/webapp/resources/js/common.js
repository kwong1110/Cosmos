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
 *	빈칸으로 값 전송 시 sweetalert.
 * 	매개변수 값으로 빈칸이면 안되는 곳의 id를 차례로 입력해주면 됨.
 * 	1개, 여러개 모두 상관 없음.
 */
function checkEmptyValues(){
	
	for(var i=0; i < arguments.length; i++){
		// console.log($(arguments[i]) + arguments[i]);
		var msg = $(arguments[i]).attr('placeholder');
			
			// 보통 9글자라 생각하고 넉넉히 8글자 이하이면 입력해주세요.를 붙임.
			// radio,checkbox 등 placeholder가 없는 버튼을 위해 msg!=null 추가.
		if(msg != null){
			if(msg.length < 8){
				msg += "을/를 입력해주세요."
			}
		}
		
		if($(arguments[i]).val().trim().length == 0 && 
			((($(arguments[i]).prop('tagName') == 'INPUT' && $(arguments[i]).attr('type') == 'text') || 
			($(arguments[i]).prop('tagName') == 'INPUT' && $(arguments[i]).attr('type') == 'number') ||
			($(arguments[i]).prop('tagName') == 'TEXTAREA')) ||
			($(arguments[i]).text().trim().length == 0 && $(arguments[i]).prop('tagName') == 'DIV'))){
			sweetAlert({
				title: msg, 
				type: "error"
			});
			
			$(arguments[i]).focus();
			return false;
		}
		
		if($(arguments[i]).prop('tagName') == 'INPUT' && $(arguments[i]).attr('type') == 'radio'){
			
			radioName = $(arguments[i]).attr('name');
			
			if($('input:radio[name=' + radioName +']').is(':checked') == false){
				msg = $(arguments[i]).parent().prev().text();
				msg.split('●');
				sweetAlert({
					title: msg + "을/를 선택해주세요!", 
					type: "error"
				});
				return false;
			}
		}
		
		if($(arguments[i]).prop('tagName') == 'INPUT' && $(arguments[i]).attr('type') == 'checkbox'){
			
			checkName = $(arguments[i]).attr('name');
			
			if($('input:checkbox[name=' + checkName +']').is(':checked') == false){
				sweetAlert({
					title: "선택사항을 모두 확인해주세요!", 
					type: "error"
				});
				return false;
			}
		}
	}
	
	return true;
}