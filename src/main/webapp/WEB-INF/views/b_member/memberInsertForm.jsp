<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.minus {
		display : inline-block;
		cursor:pointer;
	}
	
	span.guide {
		display: none;
		font-size: 12px;
		top: 12px;
		right: 10px;
	}
	
	span.ok {
		color: green;
	}
	
	span.error {
		color: red;	
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
				<div class="pageTitle">
					<h1>회원가입</h1>
				</div>
				<div class="content">
					<div class="inner">
						<form action="minsert.me" method="post" id="joinForm"><!-- onsubmit="return checkEmptyValues(userId, userPwd)" -->
							<table class="table table-hover">
								<tr>
									<th>아이디</th>
									<td>
										<input type="text" id="userId" name="id">
										<span class="guide ok idOk">이 아이디는 사용 가능합니다.</span>
										<span class="guide error idError">이 아이디는 사용 불가능합니다.</span>
										<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="password" id="userPwd" name="pwd"></td>
								</tr>
								<tr>
									<th><label for="userPwd2">비밀번호 확인</label></th>
									<td>
										<input type="password" id="userPwd2" name="pwd2">
									</td>
								</tr>
								<tr>
									<th><label for="userName">이름</label></th>
									<td><input type="text" id="userName" name="name"></td>
								</tr>
								<tr>
									<th><label for="userNick">닉네임</label></th>
									<td>
										<input type="text" id="userNick" name="nick">
										<span class="guide ok nickOk">이 닉네임은 사용 가능합니다.</span>
										<span class="guide error nickError">이 닉네임은 사용 불가능합니다.</span>
										<input type="hidden" name="nickDuplicateCheck" id="nickDuplicateCheck" value="0">
									</td>
								</tr>
								<tr>
									<th>성별</th>
									<td>
										<input type="radio" id="userGenderM" name="gender" value="M"><label for="userGenderM">남</label>
										<input type="radio" id="userGenderF" name="gender" value="F"><label for="userGenderF">여</label>
									</td>
								</tr>
								<tr>
									<th><label for="datepicker-autoclose">생년월일</label></th>
									<td>
									<div class="input-group">
										<input type="text" class="form-control" id="datepicker-autoclose" placeholder="년/월/일" name="birth"><span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
									</div>
									</td>
								</tr>
								<tr>
									<th><label for="userPhone">핸드폰</label></th>
									<td><input type="tel" id="userPhone" name="phone"></td>
								</tr>
								<tr>
									<th><label for="userMail">이메일</label></th>
									<td>
										<input type="email" id="userMail" name="email">
										<input type="button" value="인증메일 발송">
									</td>
								</tr>
								<tr>
									<th><label for="userNum">인증번호 입력</label></th>
									<td>
										<input type="text" id="userNum" name="certifyNum">
										<input type="button" value="인증완료">
									</td>
								</tr>
							</table>
							<div>스터디 그룹 참여를 원한다면 다음 사항을 입력해 주세요</div>
							<table class="table table-hover">
								<tr>
									<th><label>공부 중인 항목</label></th>
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
										<p>해당 학업에서 본인이 공부한 기간을 입력해 주세요.</p>
									</td>
								</tr>
							</table>
						</form>
					</div>
					
					<div class="btnBox inner">
						<button class="defaultBtn" onclick="validate();">가입하기</button>
						<input type="reset" value="취소하기">
						<button type="button" onclick="location.href='home.do'">홈으로</button>						
					</div>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<script>

	$(function(){
		// 아이디 중복 체크
		$('#userId').on('keyup', function(){
			
			var userId = $(this).val().trim();
			
			if(userId.length < 4){
				$('.guide').hide();
				$('#idDuplicateCheck').val(0);
				
				return;
			}
			
			$.ajax({
				url:'dupId.me',
				data: {id:userId},
				success:function(data){
					if(data == 'true'){
						$('.guide.idError').hide();
						$('.guide.idOk').show();
						$('#idDuplicateCheck').val(1);
					} else{
						$('.guide.idError').show();
						$('.guide.idOk').hide();
						$('#idDuplicateCheck').val(0);
					}
				}
			});
			
		}); // 아이디 중복 체크 끝
		
		// 닉네임 중복 체크
		$('#userNick').on('keyup', function(){
			var userNick = $(this).val().trim();
			
			if(userNick < 7){
				$('.guide').hide();
				$('#nickDuplicateCheck').val(0);
				
				return;
			}
			
			$.ajax({
				url:'dupNick.me',
				data : {nick:userNick},
				success:function(data){
					if(data == 'true'){
						$('.guide.nickError').hide();
						$('.guide.nickOk').show();
						$('#nickDuplicateCheck').val(1);
					} else{
						$('.guide.nickError').show();
						$('.guide.nickOk').hide();
						$('#nickDuplicateCheck').val(0);
					}
				}
			});
			
		}); // 닉네임 중복 체크 끝
		
		
		// 공부 과목 추가 삭제
		var category = document.getElementsByName("studyGroup"); // 공부 과목 카테고리
		var $area = $("#category-area");
		
		$(category).change(function(){
			var valAfter = $(this).val().replace(/[\s/]/g, '');
			var valBefore = $(this).val();
			var val = $(this).attr('id');
			
			var $div = $("<div id='" + valAfter + "'>");
			var $result = valBefore + " ";
			var $rHidden = $("<input type='hidden' name='studyGroupChk' value='" + val + "'>");
			var $select = $("<select name='term'>");
			var $value1 = $("<option value='0 ~ 3개월'>").text("0 ~ 3개월");
			var $value2 = $("<option value='3개월 이상 ~ 1년 이하'>").text("3개월 이상 ~ 1년 이하");
			var $value3 = $("<option value='1년 이상 ~ 2년 이하'>").text("1년 이상 ~ 2년 이하");
			var $value4 = $("<option value='2년 이상 ~ 3년 이하'>").text("2년 이상 ~ 3년 이하");
			var $iconWrap = $("<span class='minus'>");
			var $icon = $("<span class='glyphicon glyphicon-minus-sign' aria-hidden='true'>");
			
			if($(this).is(":checked")){
				$area.append($div);
				$div.append($result);
				$div.append($rHidden);
				$div.append($select);
				$select.append($value1);
				$select.append($value2);
				$select.append($value3);
				$select.append($value4);
				$div.append($iconWrap);
				$iconWrap.append($icon);
				
			} else {
				$("div#" + valAfter).remove();
			}
		});
		
		var count = 0;
		var idNum = 96;
		
		$(".addEtcBtn").click(function(){
			var valAfter = $(".studyEtc").val().replace(/[\s/]/g, '');
			var valBefore = $(".studyEtc").val();
			
			count++;
			idNum++;
			
			if(count <= 3){
				var $div = $("<div id='" + valAfter + "'>");
				var $result = valBefore + " ";
				var $rHidden1 = $("<input type='hidden' name='studyEtcNo' value='" + idNum + "'>");
				var $rHidden2 = $("<input type='hidden' name='studyEtcName' value='" + valBefore + "'>");
				var $select = $("<select name='term'>");
				var $value1 = $("<option value='0 ~ 3개월'>").text("0 ~ 3개월");
				var $value2 = $("<option value='3개월 이상 ~ 1년 이하'>").text("3개월 이상 ~ 1년 이하");
				var $value3 = $("<option value='1년 이상 ~ 2년 이하'>").text("1년 이상 ~ 2년 이하");
				var $value4 = $("<option value='2년 이상 ~ 3년 이하'>").text("2년 이상 ~ 3년 이하");
				var $iconWrap = $("<span class='minus'>");
				var $icon = $("<span class='glyphicon glyphicon-minus-sign' aria-hidden='true'>");
				
				$area.append($div);
				$div.append($result);
				$div.append($rHidden1);
				$div.append($rHidden2);
				$div.append($select);
				$select.append($value1);
				$select.append($value2);
				$select.append($value3);
				$select.append($value4);
				$div.append($iconWrap);
				$iconWrap.append($icon);
				$iconWrap.append($icon1);
				// alert(document.getElementsByName(studyEtc).value());
								
				$(this).attr('disabled', false);
				$("#studyEtc").attr('disabled', false);
				if(count == 3){
					$(this).attr('disabled', true);
					$(".studyEtc").attr('disabled', true);
				}
			} 
			
			console.log($('input[name="studyEtcName"]').val());
						
		});
		
		var removeNum = 0;
		
		$("#category-area").click("span.minus", function(){
			
			/* removeNum = $(this).find("span.minus").parent().find("input").attr('value');
			$(this).find("span.minus").parent().remove(); */
			/* $(".categoryLabel").find("#"+idNum).prop('checked', false); */
			
		}); 
			
		/* 
		$('#id').val().replace(/ /g, ''); -> 모든 공백 없어짐.﻿ 
		$('#id').val().replace(/,/g, ''); -> 모든 콤마(,) 없어짐.﻿ 
		*/ 
	});

	// 유효성 검증 스크립트
	function validate(){
		if($('#idDuplicateCheck').val() == 0){
			alert('사용 가능한 아이디를 입력해 주세요.');
			$('#userId').focus();
			return false;
		} else{
			$('#joinForm').submit();
		}
	}
	
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