<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 주석된 부분은 menubar에 연결되어있음! -->
	
		<!-- Sweet Wrong -->
		<!-- 폼 빈칸, 정규화 등 전부 -->
		<!-- <script>
			function sweetWrong(wrongMsg){
				sweetAlert({
					title: wrongMsg, 
					type: "error"
				});
			}
		</script>
		
		sweet success
		성공 창 전부 (회원가입, 예약완료, 수정, 삭제, 신고, 예약, 수락 등등)
		<script>
			function sweetSuccess(successMsg){
				swal("완료!", successMsg, "success")
			};
		</script> -->
		
	<!-- sweet confirm
	<!-- 삭제 버튼 전부
		<script>
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
		</script>
		
	<!-- menubar 연결 끝  -->
	
		<!-- sweet confirm 과 같이 같은 페이지에 쓰는 것 (예시임)  -->
		<script>
			function statusUpdate(state){
				var lNo = $('#lectureNo').val();
				location.href="lectureUpdate.ap?lectureStatus=" + state + "&lNo=" + lNo;
			};
		</script>
	
	<!-- sweet ajax -->
	<!-- ajax 사용시 무조건 사용해야하는건 아님. 필요한 부분만. -->
		<script>
			function sweetAjax(){
				swal({
					title:"댓글을 작성하시겠습니까?",
					type:"info",
					showCancelButton:!0,
					closeOnConfirm:!1,
					showLoaderOnConfirm:!0
					},
					function(){
						/* $.ajax({
							success: function(data){
								swal("전송 성공하였습니다!")
							};
						}); */
					}
				)
			}
		</script>
	
</body>
</html>