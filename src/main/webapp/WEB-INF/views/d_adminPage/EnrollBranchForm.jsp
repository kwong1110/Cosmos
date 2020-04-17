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
						<form action="">
						<table class="inner">
							<tr>
								<th>지점명</th>
								<td>
									<input type="text" class="form-control" placeholder="지점명을 입력하세요" style="padding:5px; width:50%";>
									 <span class="guide ok" style="color:gray">*이 지점명은 사용 가능합니다.</span>
					                 <span class="guide error">*이 지점명은 사용 불가능합니다.</span>
					                 <input type="hidden" name="idDuplicateCheck" value="0">
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
							
							<tr>
								<th>지점연락처</th>
								<td>
									<select style="padding:5px;" class="brc_tel" >
										<option>지역번호</option>
										<option>02</option>
										<option>031</option> <option>032</option> <option>033</option>
										<option>041</option> <option>042</option> <option>043</option> <option>044</option>
										<option>051</option> <option>052</option> <option>053</option> <option>054</option> <option>055</option>
										<option>061</option> <option>062</option> <option>063</option> <option>064</option>
									</select>
									- <input type="text"  style="padding:4px;" class="brc_tel" numberonly> - <input type="text"  style="padding:4px;"  class="brc_tel" numberonly>
									<p style="font-size:2; color:gray;">*숫자만 입력 가능합니다.</p>		
								</td>
							</tr>
							<tr>
								<th>지점사진</th>
								<td>
									<form method="post" enctype="multipart/form-data" action="imgup.jsp">
										<input type="file" name="filename1" size=40>
									</form>
								</td>
							</tr>
							<tr>
								<th>이용시간</th>
								<td>
									<input type="text" onKeyup="inputTimeColon(this);" placeholder="00:00" class="brc_time" maxlength="5" size=7 style="padding:5px; text-align:center;"> ~
									<input type="text" onKeyup="inputTimeColon(this);" placeholder="00:00" class="brc_time" maxlength="5" size=7 style="padding:5px; text-align:center;">
								</td>	
							</tr>
							<tr>
								<th>휴무일</th>
								<td>
									<select style="padding:5px" class="closeday">
										<option>월요일</option> <option>화요일</option> <option>수요일</option> <option>목요일</option>
										<option>금요일</option> <option>토요일</option> <option>일요일</option>
									</select>
								</td>	
							</tr>
							<tr>
								<th>지점소개</th>
								<td>
									<textarea id="summernote" name="branchIntroduce"></textarea>
									<c:import url="../a_common/summernote.jsp"/>
								</td>	
							</tr>	
						</table>
						</form>
						<div class="inner" align="center" >
							<div class="btnBox">
								<button type="submit" class="defaultBtn" onclick="">등록</button>
								<button name="취소" onclick={$ contextpath} class="defaultBtn">취소</button>	
							</div> 
						</div>
					</div>
				</div>	
							
		</div>				
	<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<!-- *summernote 가져오기 -->
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
	 
   <!-- *지도api 가져오기 -->	
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
   
   <!-- *전화번호 입력시 숫자만 입력가능하도록 -->
   <script>
   		$("input:text[numberOnly]").on("keyup", function() {
    		$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
   </script>
	
   <!-- 지점시간 숫자만 입력가능한 스크립트  -->
   <script>
	     function inputTimeColon(time) {
	
	       // replace 함수를 사용하여 콜론( : )을 공백으로 치환한다.
	       var replaceTime = time.value.replace(/\:/g, "");
	
	       // 텍스트박스의 입력값이 4~5글자 사이가 되는 경우에만 실행한다.
	       if(replaceTime.length >= 4 && replaceTime.length < 5) {
	
	           var hours = replaceTime.substring(0, 2);      // 선언한 변수 hours에 시간값을 담는다.
	           var minute = replaceTime.substring(2, 4);    // 선언한 변수 minute에 분을 담는다.
	
	
	           // isFinite함수를 사용하여 문자가 선언되었는지 확인한다.
	           // '숫자만 입력해 주세요' 알럿 띄우기
	           if(isFinite(hours + minute) == false) {
	               alert("문자는 입력하실 수 없습니다.");
	               time.value = "00:00";
	               return false;
	           }
	
	           // 두 변수의 시간과 분을 합쳐 입력한 시간이 24시가 넘는지를 체크한다.
	           if(hours + minute > 2400) {
	               alert("시간은 24시를 넘길 수 없습니다.");
	               time.value = "24:00";
	               return false;
	           }
	
	           // 입력한 분의 값이 60분을 넘는지 체크한다.
	           if(minute > 60) {
	               alert("분은 60분을 넘길 수 없습니다.");
	               time.value = hours + ":00";
	               return false;
	           }
	
	           time.value = hours + ":" + minute;
	       }
	   }
	     
         // 지점명 중복 확인	
         $('#userId').on('keyup', function(){
      	   var userId = $(this).val().trim();
      	   
      	   if(userId.length < 4){
      		   $('.guide').hide();
      		   $('#idDuplicateCheck').val(0);
      		   
      		   return;
      	   }
      	   
      	   $.ajax({
      		   url: 'dupid.me',
      		   data: {id:userId},
      		   success: function(data){
      			   if(data == 'true'){ //print로 보냈으므로 boolean아닌 String으로 넘어옴 그래서 user라는 아이디가없음에도 에러가뜸
      				   $('.guide.error').hide();
      				   $('.guide.ok').show();
      				   $('#idDuplicateCheck').val(1);
      			   } else{
      				   $('.guide.error').show();
      				   $('.guide.ok').hide();
      				   $('#idDuplicateCheck').val(0);
      			   }
      		   }
      	   });
         });  ㅣ
	     
   </script>
	
	
	
</body>
</html>