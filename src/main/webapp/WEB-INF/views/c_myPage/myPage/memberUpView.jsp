<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정하기</title>
</head>
<body>
	<!-- view 초기 구조 -->
	<!-- import 경로는 알아서 바꿔줄것. -->
	<div class="total-wrapper">
		<c:import url="../../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>'${loginUser.name}'님의 정보 수정하기</h1>
				</div>
				<div class="content">
					<ul class="nav nav-tabs">
					  <li role="presentation" class="active"><a href="#">회원 정보</a></li>
					  <li role="presentation"><a href="#">My Group</a></li>
					  <li role="presentation"><a href="#">강연 내역</a></li>
					  <li role="presentation"><a href="#">결재 내역</a></li>
					  <c:url var="memberDelete" value="memberDelete.mp">
					  	<c:param name="id" value="${loginUser.id}"/>
					  </c:url>
					  <li role="presentation"><a href="location.href='${memberDelete}'">회원 탈퇴하기</a></li>
					</ul>
					<div class="inner">
						<form action="memberUp.mp" method="post" id="upForm">
							<table class="table table-hover">
								<tr>
									<th>아이디</th>
									<td>${loginUser.id}<input type="hidden" name="id" value="${loginUser.id}"></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text" name="name" value="${loginUser.name}"></td>								
								</tr>
								<tr>
									<th>닉네임</th>
									<td><input type="text" name="nick" value="${loginUser.nick}"></td>								
								</tr>
								<tr>
									<th>성별</th>	
									<c:if test="${loginUser.gender eq 'M'}">
										<td>
											<input type="radio" name="gender" value="M" checked>남
											<input type="radio" name="gender" value="F">여
										</td>								
									</c:if>
									<c:if test="${loginUser.gender eq 'F'}">
										<td>
											<input type="radio" name="gender" value="M">남
											<input type="radio" name="gender" value="F" checked>여
										</td>								
									</c:if>
								</tr>
								<tr>
									<th><label for="datepicker-autoclose">생년월일</label></th>
									<td> 
										<div class="input-group">
											<input type="text" class="form-control" id="datepicker-autoclose" placeholder="년/월/일"  name="birth" value="${loginUser.birth}">
											<span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
										</div>
									</td>								
								</tr>
								<tr>
									<th>핸드폰</th>
									<td><input type="tel" id="userPhone" name="phone" value="${loginUser.phone}"></td>								
								</tr>
								<tr>
									<th>이메일</th>
									<td><input type="email" id="userMail" name="email" value="${loginUser.email}"></td>								
								</tr>
							</table>
							<table class="table table-hover">
								<tr>
									<th>공부 중인 항목</th>
									<td>
										<div class="categoryLabel">
											<c:forEach var="i" begin="0" end="4" items="${ sList }">
												<input type="checkbox" id="${ i.studyNo }" name="studyGroup" value="${ i.studyName }"> ${ i.studyName }&nbsp;&nbsp;
											</c:forEach>
										</div>
										<div class="categoryLabel">
											<c:forEach var="i" begin="5" end="9" items="${ sList }">
												<input type="checkbox" id="${ i.studyNo }" name="studyGroup" value="${ i.studyName }"> ${ i.studyName }&nbsp;&nbsp;
											</c:forEach>
										</div>
										<div class="categoryLabel">
											<c:forEach var="i" begin="10" end="14" items="${ sList }">
												<input type="checkbox" id="${ i.studyNo }" name="studyGroup" value="${ i.studyName }"> ${ i.studyName }&nbsp;&nbsp;
											</c:forEach>
										</div>
										<div class="categoryLabel">
											<c:forEach var="i" begin="15" end="19" items="${ sList }">
												<input type="checkbox" id="${ i.studyNo }" name="studyGroup" value="${ i.studyName }"> ${ i.studyName }&nbsp;&nbsp;
											</c:forEach>
										</div>
										<div class="categoryLabel">
											<c:forEach var="i" begin="20" end="24" items="${ sList }">
												<input type="checkbox" id="${ i.studyNo }" name="studyGroup" value="${ i.studyName }"> ${ i.studyName }&nbsp;&nbsp;
											</c:forEach>
										</div>
										<div class="categoryLabel">
												<p>기타 항목을 입력해 주세요(3개까지 추가할 수 있습니다.)</p> 
												<input type="text" name="studyEtc" value="" class="studyEtc">
												<button type="button" class="addEtcBtn">추가</button>
										</div>
									</td>
								</tr>
								<tr>
									<th>공부기간</th>
									<td id="category-area">
											<c:forEach var="s" items="${ loginUserList }">
											<c:choose>
												<c:when test="${ s.studyName eq '기타1' }">
													<div id="${ s.studyNo }">
													${ s.studyEtc } : 
													<input type="hidden" name="studyEtcNo" value="${ s.studyNo }">
													<input type="hidden" name="studyEtcName" value="${ s.studyEtc }">
													<select name='term'>
														<option value="0 ~ 3개월">0 ~ 3개월</option>
														<option value="3개월 이상 ~ 1년 이하">3개월 이상 ~ 1년 이하</option>
														<option value="1년 이상 ~ 2년 이하">1년 이상 ~ 2년 이하</option>
														<option value="2년 이상 ~ 3년 이하">2년 이상 ~ 3년 이하</option>
													</select>
													<a href="#" class="minusWrap"><span class='glyphicon glyphicon-minus-sign' aria-hidden='true'></span></a>
													</div>
													<br>
												</c:when>
												<c:when test="${ s.studyName eq '기타2' }">
													<div id="${ s.studyNo }">
													${ s.studyEtc } : 
													<input type="hidden" name="studyEtcNo" value="${ s.studyNo }">
													<input type="hidden" name="studyEtcName" value="${ s.studyEtc }">
													<select name='term'>
														<option value="0 ~ 3개월">0 ~ 3개월</option>
														<option value="3개월 이상 ~ 1년 이하">3개월 이상 ~ 1년 이하</option>
														<option value="1년 이상 ~ 2년 이하">1년 이상 ~ 2년 이하</option>
														<option value="2년 이상 ~ 3년 이하">2년 이상 ~ 3년 이하</option>
													</select>
													<a href="#" class="minusWrap"><span class='glyphicon glyphicon-minus-sign' aria-hidden='true'></span></a>
													</div>
													<br>
												</c:when>
												<c:when test="${ s.studyName eq '기타3' }">
													<div id="${ s.studyNo }">
													${ s.studyEtc } : 
													<input type="hidden" name="studyEtcNo" value="${ s.studyNo }">
													<input type="hidden" name="studyEtcName" value="${ s.studyEtc }">
													<select name='term'>
														<option value="0 ~ 3개월">0 ~ 3개월</option>
														<option value="3개월 이상 ~ 1년 이하">3개월 이상 ~ 1년 이하</option>
														<option value="1년 이상 ~ 2년 이하">1년 이상 ~ 2년 이하</option>
														<option value="2년 이상 ~ 3년 이하">2년 이상 ~ 3년 이하</option>
													</select>
													<a href="#" class="minusWrap"><span class='glyphicon glyphicon-minus-sign' aria-hidden='true'></span></a>
													</div>
													<br>
												</c:when>
												<c:otherwise>
													<div id="${ s.studyNo }">
													<input type="hidden" name="studyGroupChk" value="${ s.studyNo }">
													${ s.studyName } : 
													<select name='term'>
														<option value="0 ~ 3개월">0 ~ 3개월</option>
														<option value="3개월 이상 ~ 1년 이하">3개월 이상 ~ 1년 이하</option>
														<option value="1년 이상 ~ 2년 이하">1년 이상 ~ 2년 이하</option>
														<option value="2년 이상 ~ 3년 이하">2년 이상 ~ 3년 이하</option>
													</select>
													<a href="#" class="minusWrap"><span class='glyphicon glyphicon-minus-sign' aria-hidden='true'></span></a>
													</div>
													<br>
												</c:otherwise>
											</c:choose>
											<script>
												$(function(){
													$('div#${ s.studyNo }').find("select").find("option").each(function(){
// --------------------------------------------------------------------------------------------------------------------------------	

														// 첫 번째 문제 ---> ${ s.spTerm }에 해당 값이 담기게 하려면?? 
														// 스크립트 문을 밖으로 빼내야 할텐데...

// --------------------------------------------------------------------------------------------------------------------------------																
														if($(this).val() == "${ s.spTerm }"){
															$(this).attr("selected", "selected");
														}
													});
												});
											</script>
											</c:forEach>
											
									</td>
								</tr>
							</table>
							<div class="btnBox inner">
								<button class="defaultBtn" onclick="">수정하기</button>
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
		<c:import url="../../a_common/footer.jsp"/>
	</div>
	
	<script>
	var $area = $("#category-area"); // 추가되는 항목이 나타나는 <td id="category-area">
	
	/* 새로 추가되는 공부 항목 */
	$(".categoryLabel input[type='checkbox']").change(function(){
		var text = $(this).val();
		var val = $(this).attr('id');
		
		var $div = $("<div id='"+val+"'>"); 
		var $subject = text + " ";	
		var $hiddenVal = $("<input type='hidden' name='studyGroupChk' value='" + val + "'>");	
		var $select = $("<select name='term'>");
		var $value1 = $("<option value='0 ~ 3개월'>").text("0 ~ 3개월");
		var $value2 = $("<option value='3개월 이상 ~ 1년 이하'>").text("3개월 이상 ~ 1년 이하");
		var $value3 = $("<option value='1년 이상 ~ 2년 이하'>").text("1년 이상 ~ 2년 이하");
		var $value4 = $("<option value='2년 이상 ~ 3년 이하'>").text("2년 이상 ~ 3년 이하");
		var $iconMinusWrap = $("<a href='#' class='minusWrap'>");
		var $iconMinus = $("<span class='glyphicon glyphicon-minus-sign' aria-hidden='true'>")
		
		if($(this).is(":checked")){
			
			$area.append($div); 			// td 영역 안에 div 만들기
			$div.append($subject); 			// div에 해당 과목명 넣기
			$div.append($hiddenVal); 		// div에 <input type=hidden> 넣기 : name='studyGroupChk'
			$div.append($select); 			// div에 <select name=term> 넣기 : name=term
			$select.append($value1);		// select에 옵션 추가하기
			$select.append($value2);
			$select.append($value3);
			$select.append($value4);
			$select.append($value4);
			$div.append($iconMinusWrap);	// 마이너스 버튼 클릭할 수 있는 영역	
			$iconMinusWrap.append($iconMinus);
		
		} else{
			
			$("div#" + val).remove();
			
		}
		
		/* var removeId = null; */
		$(".minusWrap").on('click', function(e){
			e.preventDefault();
			$(this).parent().remove();
			
			// 나중에 체크 풀면 해당 항목의 체크도 checked='false'
			/* removeID = $(this).parent().attr('id');
			alert($(".categoryLabel input[type='checkbox']").attr('id')); */
		});
	});
	
	/* 기타 추가되는 항목 */
	var count = 0;
	var etcNum = 97;
	
	$(".addEtcBtn").click(function(){
		// var valAfter = $(".studyEtc").val().replace(/[\s/]/g, '');
		var val = $(".studyEtc").val();
		
		count++;

		if(count <= 3){
			var $div = $("<div id='"+ etcNum +"'>"); 
			var $subject = val + " ";	
			var $hiddenVal1 = $("<input type='hidden' name='studyEtcNo' value='" + etcNum + "'>");	// name='studyEtcNo'
			var $hiddenVal2 = $("<input type='hidden' name='studyEtcName' value='" + val + "'>");	// name='studyEtcName'
			var $select = $("<select name='term'>");												// name=term
			var $value1 = $("<option value='0 ~ 3개월'>").text("0 ~ 3개월");
			var $value2 = $("<option value='3개월 이상 ~ 1년 이하'>").text("3개월 이상 ~ 1년 이하");
			var $value3 = $("<option value='1년 이상 ~ 2년 이하'>").text("1년 이상 ~ 2년 이하");
			var $value4 = $("<option value='2년 이상 ~ 3년 이하'>").text("2년 이상 ~ 3년 이하");
			var $iconMinusWrap = $("<a href='#' class='minusWrap'>");
			var $iconMinus = $("<span class='glyphicon glyphicon-minus-sign' aria-hidden='true'>")
			
			$area.append($div);
			$div.append($subject); 			
			$div.append($hiddenVal1);
			$div.append($hiddenVal2);
			$div.append($select);
			$select.append($value1);		
			$select.append($value2);
			$select.append($value3);
			$select.append($value4);
			$select.append($value4);
			$div.append($iconMinusWrap);	
			$iconMinusWrap.append($iconMinus);
			
// --------------------------------------------------------------------------------------------------------------------------------	

			// 두 번째 문제 ---> 기존에 기타 과목 value=97이 있는데 추가하게되면 또 다시 value=97로 추가되는 문제

//--------------------------------------------------------------------------------------------------------------------------------				
			
			// $("input[name='inputName']").each(function (i) {
        	// 		$("input[name='inputName']").eq(i).attr("value");
    		// });
			
			/* $("input[name='studyEtcNo']").each(function (i) {
				if(etcNum > 96 || etcNum < 100){
					if($("input[name='studyEtcNo']").attr("value") == 97){
						etcNum = 98;
						etcNum++;
					} else if($("input[name='studyEtcNo']").attr("value") == 98){
						etcNum = 99;
						etcNum++;
					} 
					alert(etcNum);
				}
			}); */
			
			
			$(this).attr('disabled', false);
			$("#studyEtc").attr('disabled', false);
			if(count == 3){
				$(this).attr('disabled', true);
				$(".studyEtc").attr('disabled', true);
			}
			
			$(".minusWrap").on('click', function(e){
				e.preventDefault();
				$(this).parent().remove();
				
				count--;
				
// --------------------------------------------------------------------------------------------------------------------------------	

				// 세 번째 문제 ---> 기타는 3개까지만 추가할 수 있는데 수정에서 추가된 기타 과목이 있을 경우는 어떻게 카운트를 세지??? 

//--------------------------------------------------------------------------------------------------------------------------------	

// --------------------------------------------------------------------------------------------------------------------------------	

				// 네 번째 문제 
				// ---> 기타 항목 추가되면 기타 항목은 빈칸으로 만들기
				// ---> 공부 기간에서 항목이 삭제되면 자동으로 해당 항목의 체크를 해제하는 방법은 ? (checked='false')
				/* removeID = $(this).parent().attr('id');
				alert($(".categoryLabel input[type='checkbox']").attr('id')); */
				

//--------------------------------------------------------------------------------------------------------------------------------	
				
				
				// ----> 기타 삭제할떄마다 count-1
				// ----> 기타 삭제할 때마다 etcNum-1 
				
				
				
			});
			
		}
		
	});
	
	
	$(".minusWrap").on('click', function(e){
		e.preventDefault();
		$(this).parent().remove();
		
	});	
	</script>
	
	
	
	
	
	<!-- 달력과 관련된 스크립트 -->
	<script src="${contextPath}/resources/js/plugins/datepicker/common.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/moment.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.ko.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/daterangepicker.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/form-pickers-init.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	
</body>
</html>