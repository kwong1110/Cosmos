<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>branchInsert</title>	
<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>

<!-- branch css불러오기 -->
<link href="${contextPath}/resources/css/branch.css" rel="stylesheet" type="text/css">

<!-- *summernote가져오기 -->
<!-- include libraries(jQuery, bootstrap) -->
<!-- summernote홈페이지에서 받은 summernote를 사용하기 위한 코드를 추가 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
 
<!-- include summernote css/js -->
<!-- 이 css와 js는 로컬에 있는 것들을 링크시킨 것이다. -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

</head>
<body>
	<!-- view 초기 구조 -->
	<!-- import 경로는 알아서 바꿔줄것. -->
	<div class="total-wrapper">
	<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
				<div class="main">
					<div class="pageTitle" align="center">
						<h1>지점등록</h1>
					</div>
					<div class="content" align="center" >
						 <form action="binsert.ap" method="post" id="joinForm">
						<table class="inner">
							<tr>
								<th>지점명</th>
								<td>
									<input type="text" name ="name" id ="branchName" placeholder="지점명을 입력하세요" style="padding:5px; width:50%";>
									 <span class="guide ok" style="color:gray">*이 지점명은 사용 가능합니다.</span>
					                 <span class="guide error">*이 지점명은 사용 불가능합니다.</span>
					                 <input type="hidden" name="nameDuplicateCheck" value="0">
								</td>
							</tr>
						 	<tr>
               					<th>우편번호</th>
               					<td colspan="2">
                  					<input type="text" name="post" class="postcodify_postcode5" value="" readonly style="background:#e9ecf2">
                  					<button type="button" id="postcodify_search_button">검색</button>
               					</td>
            				</tr>
							<tr>
              					 <th>도로명 주소</th>
             					 <td><input type="text" name="address1" class="postcodify_address" value="" style="width:50%; background:#e9ecf2 "readonly></td>
            				</tr>
            				<tr>
               					<th>상세 주소</th>
               					<td><input type="text" name="address2" class="postcodify_extra_info" value="" style="width:50%;"></td>
            				</tr>
            				<!-- jQuery와 Postcodify를 로딩한다. -->
            				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
            				<script>
               				// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
               				$(function(){
                  				$("#postcodify_search_button").postcodifyPopUp();
               				});
               				</script>
               				</form>	
						</table>
						<div class="inner" align="center" >
							<div class="btnBox">
								<button type="submit" class="defaultBtn" onclick="validate();" >등록</button>
								<button name="취소"  class="defaultBtn">취소</button>	
							</div> 
						</div>
					</div>
					
				</div>	
						
		</div>				
	<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<!-- summernote 가져오기 -->
	<script>
	//id가 description인 것을 summernote 방식으로 적용하라는 의미이다.
	//높이와 넓이를 설정하지 않으면 화면이 작게 나오기때문에 설정해주어야 한다.
	$(function(){
    	$("#description").summernote({
        	height : 300,
        	width : 800
    	});
	});
	</script>
	 
   <!-- 한솔_지도api 가져오기 -->	
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
      function openDaumZipAddress() {
         // 우편번호 찾기 화면을 넣을 element를 지정
         var element_wrap = document.getElementById("wrap");

         // wrap 레이어가 off된 상태라면 다음 우편번호 레이어를 open 한다.
         if (jQuery("#wrap").css("display") == "none") {
            new daum.Postcode({
               oncomplete : function(data) {
                  jQuery("#zonecode").val(data.zonecode);
                  jQuery("#address").val(data.address);
                  jQuery("#address_detail").focus();
                  address = data.address;
                  zonecode = data.zonecode;
                  $('#addressInput').val(address);
                  $('#zonecodeInput').val(zonecode);
               }

               // 사용자가 값을 주소를 선택해서 레이어를 닫을 경우
               // 다음 주소록 레이어를 완전히 종료 시킨다.
               ,
               onclose : function(state) {
                  if (state === "COMPLETE_CLOSE") {

                     // 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
                     offDaumZipAddress(function() {
                        element_wrap.style.display = "none";
                     });
                  }
               }
            }).embed(element_wrap);

            // 슬라이드 다운 기능을 이용해 레이어 창을 오픈한다.
            jQuery("#wrap").slideDown();
            jQuery("section").slideDown();
         }

         // warp 레이어가 open된 상태라면 다음 우편번호 레이어를 off 상태로 변경한다.
         else {

            // 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
            offDaumZipAddress(function() {
               element_wrap.style.display = "none";
               return false;
            });
         }
      }

      function offDaumZipAddress() {
         // 슬라이드 업 기능을 이용해 레이어 창을 닫는다.
         jQuery("#wrap").slideUp();
      }
   </script>
   
   <script>
	     
         // 지점명 중복 확인	
         $('#branchName').on('keyup', function(){
      	   var branchName = $(this).val().trim();
      	   
      	   if(branchName.length < 3){
      		   $('.guide').hide();
      		   $('#nameDuplicateCheck').val(0);
      		   
      		   return;
      	   }
      	   
      	   $.ajax({
      		   url: 'dupName.ap',
      		   data: {name:branchName},
      		   success: function(data){
      			   if(data == 'true'){ //print로 보냈으므로 boolean아닌 String으로 넘어옴 그래서 user라는 아이디가없음에도 에러가뜸
      				   $('.guide.error').hide();
      				   $('.guide.ok').show();
      				   $('#nameDuplicateCheck').val(1);
      			   } else{
      				   $('.guide.error').show();
      				   $('.guide.ok').hide();
      				   $('#nameDuplicateCheck').val(0);
      			   }
      		   }
      	   });
         }); 
   </script>
	   <script>
   	function validate(){
   		if($('#nameDuplicateCheck').val() == 0 ){
   			alert('사용 가능한 지점명을입력해 주세요.');
   			$('branchName').focus();
   			return false;
		} else {
			('#joinForm').submit();
		}
   	}
   </script>
	
	
</body>
</html>