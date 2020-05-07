/* 
 *  sweetalert !
 *
 */

	// sweet confirm
	// 삭제 버튼 전부.
	// 처음은 sweetConfirm() 실행 -> 각페이지 statusUpdate() 함수 만들어서 사용.
function sweetConfirm(status){
	swal({
		title:"정말 삭제하시겠습니까 ?",
		text:"삭제 후 복구 할 수 없습니다.",
		type:"warning",
		showCancelButton: !0,
		confirmButtonColor:"#DD6B55",
		confirmButtonText:"삭제",
		closeOnConfirm: !1
		},
		function(){
			statusUpdate(status);
		}
	)
};

	// sweet success
	// 성공 창 전부 (회원가입, 예약완료, 수정, 삭제, 신고, 예약, 수락 등등)
function sweetSuccess(successMsg){
	swal({
		title: successMsg + "하였습니다!", 
		type: "success",
		html: !0
	})
};

	// Sweet Wrong	
	// 폼 빈칸, 정규화 등 전부 
function sweetWrong(wrongMsg){
	sweetAlert({
		title: wrongMsg, 
		type: "error",
		html: !0
	});
};

	// 이건 예비용 으로 만들어 놓은 것.
function sweetUpdate(updateMsg){
	swal({
		title: updateMsg + "하였습니다!", 
		type: "success",
		html: !0
	})
};