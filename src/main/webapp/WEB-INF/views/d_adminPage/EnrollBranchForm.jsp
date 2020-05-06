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
				                	<input type="text" name="branchName" id="branchName" placeholder="지점명을 입력하세요" style="padding:5px; width:50%";>
				                    <span class="guide ok"> 이 지점명은 사용 가능합니다.</span>
				             		<span class="guide error">이 지점명은 사용 불가능합니다.</span>
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
               				
               				<tr>
								<th>지점연락처</th>
								<td>
									<select style="padding:5px;" name="tel1" class="branchTel">
										<option>지역번호</option>
										<option>02</option>
										<option>031</option> <option>032</option> <option>033</option>
										<option>041</option> <option>042</option> <option>043</option> <option>044</option>
										<option>051</option> <option>052</option> <option>053</option> <option>054</option> <option>055</option>
										<option>061</option> <option>062</option> <option>063</option> <option>064</option>
									</select>
									- <input type="text" name="tel2" style="padding:4px;" class="branchTel" numberonly>
									- <input type="text" name="tel3" style="padding:4px;"  class="branchTel" numberonly>
									<p style="font-size:2; color:gray;">*숫자만 입력 가능합니다.</p>		
								</td>
							</tr>
						</table>
						<div class="inner" align="center" >
							<div class="btnBox">
								<button type="submit" class="defaultBtn" id="enrollBtn" onclick="validate();" >등록</button>
								<button name="취소"  class="defaultBtn""  onClick="history.go(-1)">취소</button>	
							</div> 
						</div>
               				</form>	
					</div>
					
				</div>	
						
		</div>				
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
   <!-- 한솔_지점명중복확인 -->
    <script> 
         $('#branchName').on('keyup', function(){
      	   var branchName = $(this).val().trim();
      	   
      	   if(branchName.length < 3){
      		   $('.guide').hide();
      		   $('#nameDuplicateCheck').val(0);
      		   
      		   return;
      	   }
      	   
      	   $.ajax({
      		   url: 'dupName.ap',
      		   data: {masterName:branchName},
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
    
   <!-- 한솔_전화번호 입력시 숫자만 입력가능하도록 -->
   <script>
   		$("input:text[numberOnly]").on("keyup", function() {
    		$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
   </script>

   <!-- 지점등록시 -->	
	
</body>
</html>