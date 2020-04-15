<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>branchInsert</title>	
<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>

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


<style>
 table.inner{
  	width: 100%;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
 /*  margin : 20px 10px; */
  valign:middle-aign;	
}
table.inner th {
    width: 150px;
    text-align: center;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    valign:middle-aign;
    line-height: 50px;
}
table.inner td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
} 


</style>

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
									<input type="text" class="form-control" placeholder="지점명을 입력하세요" style="padding:5px;  width:50%" >
								</td>
							</tr>
						 	<tr>
               					<th>우편번호</th>
               					<td>
                  					<input type="text" name="post" class="postcodify_postcode5" value="" size="6" readonly>
                  					<button type="button" id="postcodify_search_button">검색</button>
               					</td>
            				</tr>
							<tr>
              					 <th>도로명 주소</th>
             					 <td><input type="text" name="address1" class="postcodify_address" value="" style="width:50%"></td>
            				</tr>
            				<tr>
               					<th>상세 주소</th>
               					<td><input type="text" name="address2" class="postcodify_extra_info" value="" style="width:50%"></td>
            				</tr>
            				<!-- jQuery와 Postcodify를 로딩한다. -->
            				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
            				<script>
               				// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
               				$(function(){
                  				$("#postcodify_search_button").postcodifyPopUp();
               				});
               				</script>
 						<!--	<tr>
								<th>지점주소</th>
								<td>
									<input type="text"  id="zonecodeInput" name="zonecodeInput" style="width:28%" readonly >
									<input type="button"  onClick="openDaumZipAddress();"  style="width:25%"  value="우편번호" >
									<br>
								    <input type="text" id="addressInput" name="addressInput" style="width:50%" readonly >
 								    <input type="text" id="detailAddressInput" name="detailAddressInput" placeholder="상세주소">
									지도가 생길공간 div로 만들어주기
									<div id="wrap">
   
 									</div>
 								 </td> 
							</tr> -->
							
							<tr>
								<th>지점연락처</th>
								<td>
									<select style="padding:5px;">
										<option>지역번호</option>
										<option>02</option>
										<option>031</option> <option>032</option> <option>033</option>
										<option>041</option> <option>042</option> <option>043</option> <option>044</option>
										<option>051</option> <option>052</option> <option>053</option> <option>054</option> <option>055</option>
										<option>061</option> <option>062</option> <option>063</option> <option>064</option>
									</select>
									- <input type="text" size=6  style="padding:4px;" numberonly> - <input type="text" size=10  style="padding:4px;" numberonly>
									<p style="font-size:2; color:gray;">*숫자만 입력 가능합니다.</p>		
								</td>
							</tr>
							<tr>
								<th>지점사진</th>
								<td>
									<form method="post" enctype="multipart/form-data" action="imgup.jsp">
										<input type="file" name="filename1" size=40>
										<input type="submit" value="업로드">
									</form>
								</td>
							</tr>
							<tr>
								<th>이용시간</th>
								<td>
									<input type="text" size=7 style="padding:5px" placeholder="00:00"> ~ <input type="text" size=7 style="padding:5px" placeholder="00:00">
								</td>	
							</tr>
							<tr>
								<th>휴무일</th>
								<td>
									<select style="padding:5px">
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
	
	
</body>
</html>