<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 상세 정보 수정</title>	

<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>

<!-- branch css불러오기 -->

<!-- *summernote가져오기 -->
<!-- include libraries(jQuery, bootstrap) -->
<!-- summernote 홈페이지에서 받은 summernote를 사용하기 위한 코드를 추가 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
 
<!-- include summernote css/js -->
<!-- 이 css와 js는 로컬에 있는 것들을 링크시킨 것이다. -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<style>
	div.contentImgArea { width: 200px; height : 150px; border: 1px solid red; display : inline-block;vertical-align : top;}
	div.contentImgArea img {max-width:100%; width:100%; max-height:100%; height : 100%;}
</style>


</head>
<body>
	<!-- view 초기 구조 -->
	<!-- import 경로는 알아서 바꿔줄것. -->
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>코스모스 스터디센터 (${vBranch.branchName}) 수정하기</h1>
				</div>
				<div class="content">
				
					<form action="viewBranchUpdate.vb" method="post" enctype="Multipart/form-data">
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="vbNo" value="${vBranch.branchNo}">
						<%-- <c:if test="${!empty vBranch.originalFileName}">
							<input type="hidden" name="renameFileName" value="${ vBranch.renameFileName }">
						</c:if> --%>
						
						<table class="inner">
							<!-- 지점명 -->
							<tr>
								<th>지점명</th>
								<td>
									<input type="text" name="branchName" value="${vBranch.branchName}" class="form-control" style="padding:5px; width:50%">
								</td>
							</tr>
							
							<!-- 우편번호 도로명주소 상세주소-->
							<c:forTokens var="addr" items="${vBranch.branchAddress}" delims="/" varStatus="status">
								<c:if test="${status.index eq 0 && addr >= '0' && addr <= '99999'}">
									<c:set var="post" value="${addr}"/>
								</c:if>
								<c:if test="${status.index eq 0 && !(addr >= '0' && addr <= '99999')}">
									<c:set var="address1" value="${addr}"/>
								</c:if>
								<c:if test="${status.index eq 1}">
									<c:set var="address1" value="${addr}"/>
								</c:if>
								<c:if test="${status.index eq 2}">
									<c:set var="address2" value="${addr}"/>
								</c:if>
							</c:forTokens>
						 	<tr>
               					<th>우편번호</th>
               					<td colspan="2">
                  					<input type="text" name="post" class="postcodify_postcode5" value="${post}">
                  					<button type="button" id="postcodify_search_button">검색</button>
               					</td>
            				</tr>
							
							<tr>
              					 <th>도로명 주소</th>
             					 <td><input type="text" name="address1" class="postcodify_address" value="${address1}" style="width:50%;"></td>
            				</tr>
            				<tr>
               					<th>상세 주소</th>
               					<td><input type="text" name="address2" class="postcodify_extra_info" value="${address2}" style="width:50%;"></td>
            				</tr>
            				
							<!-- 전화번호 -->
							<c:forTokens var="tel" items="${vBranch.branchTel}" delims="-" varStatus="telStatus">
								<c:if test="${telStatus.index eq 0 }">
									<c:set var="localNum" value="${tel}"/>
								</c:if>
								<c:if test="${telStatus.index eq 1}">
									<c:set var="tel1" value="${tel}"/>
								</c:if>
								<c:if test="${telStatus.index eq 2}">
									<c:set var="tel2" value="${tel}"/>
								</c:if>
							</c:forTokens>
							
							<tr>
								<th>지점연락처</th>
								<td>
									<select name="localNum" class="brc_tel" value="${localNum}" style="padding:5px;" >
										<option>지역번호</option>
										<option>02</option>
										<option>031</option> <option>032</option> <option>033</option>
										<option>041</option> <option>042</option> <option>043</option> <option>044</option>
										<option>051</option> <option>052</option> <option>053</option> <option>054</option> <option>055</option>
										<option>061</option> <option>062</option> <option>063</option> <option>064</option>
									</select>
									- <input type="text" name="tel1" value="${tel1}" numberonly maxlength="4"> 
									- <input type="text" name="tel2" value="${tel2}" numberonly maxlength="4">
									<p style="font-size:2; color:gray;">*숫자만 입력 가능합니다.</p>		
								</td>
							</tr>
							
							<!-- 이용시간 -->
							<c:forTokens var="time" items="${vBranch.branchTime}" delims="~" varStatus="timeStatus">
								<c:if test="${timeStatus.index eq 0}">
									<c:set var="time1" value="${time}"/>
								</c:if>
								<c:if test="${timeStatus.index eq 1}">
									<c:set var="time2" value="${time}"/>
								</c:if>
							</c:forTokens>
							<tr>
								<th>이용시간</th>
								<td>
									<input type="text" name="time1" onKeyup="inputTimeColon(this);" class="brc_time" maxlength="5" size=7 style="padding:5px; text-align:center;" value="${time1}"> ~
									<input type="text" name="time2" onKeyup="inputTimeColon(this);" class="brc_time" maxlength="5" size=7 style="padding:5px; text-align:center;" value="${time2}">
								</td>
									
							</tr>
							
							<!-- 휴무일 -->
							<tr>
								<th>휴무일</th>
								<td>
									<select style="padding:5px" class="closeday" name="brachRest" value="${vBranch.branchRest}">
										<option>월요일</option> <option>화요일</option> <option>수요일</option> <option>목요일</option>
										<option>금요일</option> <option>토요일</option> <option>일요일</option>
									</select>
								</td>	
							</tr>
							
							<!-- 지점소개 : summernote -->
							<tr>
								<th>지점소개</th>
								<td>
									<textarea id="summernote" style="resize: none" name="branchContent" value="${vBranch.branchContent}">${vBranch.branchContent}</textarea>
									<c:import url="../a_common/summernote.jsp"/>
								</td>	
							</tr>	
							
							<!-- 지점 사진 -->
							<!-- 지점 사진이 있으면 사진보이고 수정하기 위한 파일 첨부 보이기 -->
							<%-- <c:if test="${!empty vBranch.originalFileName}">
								<tr>
									<th rowspan="2">지점사진</th>
									<td>	
										<c:forEach var="p" items=""> <!-- ${ vBranch.renameFileName } -->
											<div class="photo">
												<img src="${ contextPath }/resources/photo_uploadFiles/${ vBranch.renameFileName }" id="detailImg" class="detailImg">
											</div>	
										</c:forEach>	
									</td>
								</tr>
								<tr>
									<td id="fileArea">
										<input type="file" id="thumbnailImg1" multiple="multiple" name="reloadFile" onchange="LoadImg(this,1)">
										<input type="file" id="thumbnailImg2" multiple="multiple" name="reloadFile" onchange="LoadImg(this,2)">
										<input type="file" id="thumbnailImg3" multiple="multiple" name="reloadFile" onchange="LoadImg(this,3)">
										<input type="file" id="thumbnailImg4" multiple="multiple" name="reloadFile" onchange="LoadImg(this,4)">
									</td>
								</tr>
							</c:if>
							
							<!-- 지점 사진이 없으면 빈 박스와 파일첨부만 보이기  -->
							<c:if test="${empty vBranch.originalFileName}">
								<tr>
									<th rowspan="2">지점사진</th>
									<td>	
										<div class="contentImgArea"><img id="contentImg1"></div>	
										<div class="contentImgArea"><img id="contentImg2"></div>	
										<div class="contentImgArea"><img id="contentImg3"></div>	
										<div class="contentImgArea"><img id="contentImg4"></div>	
									</td>
								</tr>
								<tr>
									<td id="fileArea">
										<input type="file" id="thumbnailImg1" multiple="multiple" name="uploadFile" onchange="LoadImg(this,1)">
										<input type="file" id="thumbnailImg2" multiple="multiple" name="uploadFile" onchange="LoadImg(this,2)">
										<input type="file" id="thumbnailImg3" multiple="multiple" name="uploadFile" onchange="LoadImg(this,3)">
										<input type="file" id="thumbnailImg4" multiple="multiple" name="uploadFile" onchange="LoadImg(this,4)">
									</td>
								</tr>
							</c:if> --%>
						
						</table>
						<!-- 버튼 박스 시작  -->
						<div class="inner" align="center">
							<div class="btnBox">
								<button type="submit" class="defaultBtn">수정하기</button>
								<c:url var="vbList" value="viewBranchList.vb">
									<c:param name="page" value="${page}"/>
								</c:url>
								<button type="button" onclick="location.href='${vbList}'" class="defaultBtn">목록으로</button>	
								<button type="button" onclick="location.href='javascript:history.go(-1);'" class="defaultBtn">이전페이지로</button>	
							</div> 
						</div>
						
					</form>
					
					
				</div> <!-- E:content -->	
							
			</div> <!-- E:main -->
		</div> <!-- E:wrapper -->				
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	
	<!-- 지점사진 -->
	<script>
	
	/**
	* 이미지 파일 업로드
	*/
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		folderRoot = "branch"
		data.append("folderRoot", folderRoot);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile.cm",
			contentType : false,
			processData : false,
			success : function(data) {
				// console.log("url확인 : " + data.url);
	        	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', "${ contextPath }/resources/" + data.url);
			}
		});
	}
	
	
	
	
	
	// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
	/* $(function(){
		$("#fileArea").hide();
		
		$("#titleImgArea").click(function(){
			$("#thumbnailImg1").click();
		});
		$("#contentImgArea1").click(function(){
			$("#thumbnailImg2").click();
		});
		$("#contentImgArea2").click(function(){
			$("#thumbnailImg3").click();
		});
		$("#contentImgArea3").click(function(){
			$("#thumbnailImg4").click();
		});
	}); */
	
	// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
	/* function LoadImg(value, num){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			
			reader.onload = function(e){								
				switch(num){
				case 1: 
					$("#contentImg1").attr("src", e.target.result);
					break;
				case 2:
					$("#contentImg2").attr("src", e.target.result);
					break;
				case 3: 
					$("#contentImg3").attr("src", e.target.result);
					break;
				case 4:
					$("#contentImg4").attr("src", e.target.result);
					break;
				}
			}
			
			reader.readAsDataURL(value.files[0]);
		}
	} */
	</script>
	
	
	<!-- *summernote 가져오기 -->
	<script>
	//id가 description인 것을 summernote 방식으로 적용하라는 의미이다.
	//높이와 넓이를 설정하지 않으면 화면이 작게 나오기때문에 설정해주어야 한다.
	/* $(function(){
	   	$("#description").summernote({
	       	height : 300,
	       	width : 800,
	       	toolbar: [
	            ['style', ['style']],
	            ['font', ['bold', 'underline', 'clear']],
	            ['color', ['color']],
	            ['para', ['ul', 'ol', 'paragraph']],
	            ['table', ['table']],
	            ['insert', []],
	            ['view', ['fullscreen', 'codeview', 'help']]
	         ]
	   	});
	}); */
	</script>
	
	
	
	<!-- 우편번호 도로명주소 상세주소  --> 
	<!-- jQuery와 Postcodify를 로딩한다. -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
	// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
	$(function(){
		$("#postcodify_search_button").postcodifyPopUp();
	});
	</script>
	 
	<!-- 지역 번호 DB에서 가져오기 -->
	<script>
	$(".brc_tel option").each(function(){
	   if($(this).val()=="${localNum}"){
	     $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
	   }
	});
	</script>
	
	<!-- 휴무일 DB에서 가져오기 -->
	<script>
	$(".closeday option").each(function(){
	   if($(this).val()=="${vBranch.branchRest}"){
	     $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
	   }
	});
	</script>
	   
	   
	<!-- 유효성 검사 -->
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
	});  
	     
	</script>
	 
</body>
</html>

