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
		font-size: 14px;
	}
	
	span.ok {
		color: green;
	}
	
	span.error {
		color: red;	
	}
	.first {
		width : 300px;
	}
	.table td.second {
		text-align : left;
		padding-left : 30px;
		padding-top : 10px;
		padding-bottom:10px;
	}
	table.table {
		border-bottom:1px solid #ddd;
	}
	.etc {
		margin-top : 30px; 
	}
	
	.defaultBtn {
		vertical-align : middle;
	}
	
	.second input:not([type="checkbox"]) {
		width : 300px;
		padding : 3px 5px;
	}
	
	.second input[type="radio"]{
		width: 20px;
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
							<table class="table">
								<tr>
									<th class="first">아이디</th>
									<td class="second">
										<input type="text" id="userId" name="id">
										<span class="guide ok idOk">이 아이디는 사용 가능합니다.</span>
										<span class="guide error idError">이미 사용 중인 아이디입니다.</span>
										<span id=checkId style="font-size: 14px;">(영문소문자로 시작하는 영문소문자/숫자 조합, 4~7자)</span>
										<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
									</td>
								</tr>
								<tr>
									<th class="first">비밀번호</th>
									<td class="second"><input type="password" id="userPwd" name="pwd">
									<span id=checkPwd style="font-size: 14px;">(영어로 시작하며 영어와 숫자, !*&가 섞인 8~12자)</span>
									</td>
								</tr>
								<tr>
									<th class="first"><label for="userPwd2">비밀번호 확인</label></th>
									<td class="second">
										<input type="password" id="userPwd2" name="pwd2">
										<span id=pwd2Result style="font-size: 14px;"></span>
									</td>
								</tr>
								<tr>
									<th class="first"><label for="userName">이름</label></th>
									<td class="second"><input type="text" id="userName" name="name" required="required"></td>
								</tr>
								<tr>
									<th class="first"><label for="userNick">닉네임</label></th>
									<td class="second">
										<input type="text" id="userNick" name="nick">
										<span class="guide ok nickOk">이 닉네임은 사용 가능합니다.</span>
										<span class="guide error nickError">이 닉네임은 사용 불가능합니다.</span>
										<span id=checkNick style="font-size: 14px;">(한글,영문, 숫자 가능/특수문자 포함안됨, 2~7자)</span>
										<input type="hidden" name="nickDuplicateCheck" id="nickDuplicateCheck" value="0">
									</td>
								</tr>
								<tr>
									<th class="first">성별</th>
									<td class="second">
										<input type="radio" id="userGenderM" name="gender" value="M"><label for="userGenderM">남</label>
										<input type="radio" id="userGenderF" name="gender" value="F"><label for="userGenderF">여</label>
									</td>
								</tr>
								<tr>
									<th class="first"><label for="datepicker-autoclose">생년월일</label></th>
									<td class="second">
									<div class="input-group">
										<input type="text" class="form-control" id="datepicker-autoclose" placeholder="년/월/일" name="birth" required="required"><span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
									</div>
									</td>
								</tr>
								<tr>
									<th class="first"><label for="userPhone">핸드폰</label></th>
									<td class="second"><input type="tel" id="userPhone" name="phone" required="required"></td>
								</tr>
								<tr>
									<th class="first"><label for="userMail">이메일</label></th>
									<td class="second">
										<input type="email" id="userMail" name="email" required="required">
									</td>
								</tr>
							</table>
							<div>스터디 그룹 참여를 위해 다음 사항을 입력해 주세요</div>
							<table class="table">
								<tr>
									<th class="first"><label>공부 중인 항목</label></th>
									<td class="second">
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
										<div class="categoryLabel etc">
												<p>기타 항목을 입력해 주세요(3개까지 추가할 수 있습니다.)</p> 
												<input type="text" name="studyEtc" value="" class="studyEtc">
												<button type="button" class="addEtcBtn">추가</button>
										</div>
									</td>
								</tr>
								<tr>
									<th class="first">공부기간</th>
									<td id="category-area" class="second" style="vertical-align:top;">
										<p>해당 학업에서 본인이 공부한 기간을 입력해 주세요.</p>
									</td>
								</tr>
							</table>
							<div class="btnBox inner">
								<button class="defaultBtn" onclick="validate();">가입하기</button>
								<input type="reset" value="취소하기" class="defaultBtn">
								<button type="button" class="defaultBtn" onclick="location.href='home.do'">홈으로</button>						
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<script>

	$(function(){
		
		var isPw, isPw2 = false;		
		
		// 아이디 중복 체크
		$('#userId').on('keyup', function(){
			
			var userId = $(this).val().trim();
			var regExp = /^[a-z]+[0-9]+[a-z0-9]*$/;
			
			if(!regExp.test(userId) || $(this).val().trim().length < 4 || $(this).val().trim().length > 7){
				$('#checkId').text('영문소문자로 시작하는 영문소문자/숫자 조합, 4~7자').css('color', 'red');
				$('.guide').hide();
				$('#idDuplicateCheck').val(0);
				return;
				
			} else if(regExp.test(userId) && $(this).val().trim().length != 0) {
				$('#checkId').text(''); 
			
				$.ajax({
					url:'dupId.me',
					data: {id:userId},
					success:function(data){
						if(data == 'true'){
							$('.guide.idError').hide();
							$('.guide.idOk').show();
							$('#idDuplicateCheck').val(1);
						} else {
							$('.guide.idError').show();
							$('.guide.idOk').hide();
							$('#idDuplicateCheck').val(0);
						}
					}
				});
			}
			 
		}); // 아이디 중복 체크 끝
		
		// 닉네임 중복 체크
		$('#userNick').on('keyup', function(){
			var userNick = $(this).val().trim();
			var regExp = /^[a-zA-Z0-9가-힣]*$/;
			
			if(!regExp.test(userNick) || $(this).val().trim().length < 2 || $(this).val().trim().length > 7){
				$('#checkNick').text('한글,영문, 숫자 가능/특수문자 포함안됨, 2~7자').css('color', 'red');
				$('.guide').hide();
				$('#nickDuplicateCheck').val(0);
				return;
				
			} else if(regExp.test(userNick) && $(this).val().trim().length != 0) {
				$('#checkNick').text(''); 
				
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
			}
			
		}); // 닉네임 중복 체크 끝
		
		// 비밀번호
		$('#userPwd').on('keyup',function(){
			var userPwd = $(this).val().trim();
			var regExp = /^[a-zA-z](?=.*[0-9])(?=.*[!$*]).{7,11}$/;
			
			if(!regExp.test(userPwd)){
				$('#checkPwd').text('알맞은 비밀번호 : 영어로 시작, 영어, 숫자, !*& 조합, 8~12자').css('color', 'red');
				isPw = false;
			} else{
				$('#checkPwd').text('사용 가능한 비밀번호입니다.').css('color', 'green');
				isPw = true;
			}
			
		});
		
		$('#userPwd2').keyup(function(){
			if($('#userPwd').val() != $(this).val()){
				$('#pwd2Result').text('비밀번호 불일치').css('color', 'red');
				isPw2 = false;
			}else{
				$('#pwd2Result').text('비밀번호 일치').css('color', 'green');
				isPw2 = true;
			}
		});
		
		// 유효성 검증 스크립트
		function validate(){
			if($('#idDuplicateCheck').val() == 0){
				alert('사용 가능한 아이디를 입력해 주세요.');
				$('#userId').focus();
				return false;
			} else if($('#nickDuplicateCheck').val() == 0){
				alert('사용 가능한 닉네임을 입력해 주세요.');
				$('#userNick').focus();
			} else if(!isPw) {
				$('#userPwd').focus();
			} else if(!isPw2){
				$('#userPwd').focus();
			} else{
				$('#joinForm').submit();
			}
		}
		
		
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
			var $value4 = $("<option value='2년 이상 ~ 3년 이하'>").text("2년 이상");
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
			
			$(".minus").on('click', function(e){
				e.preventDefault();
				$(this).parent().remove();
			});
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
				var $select = $("<select name='etcTerm'>");
				var $value1 = $("<option value='0 ~ 3개월'>").text("0 ~ 3개월");
				var $value2 = $("<option value='3개월 이상 ~ 1년 이하'>").text("3개월 이상 ~ 1년 이하");
				var $value3 = $("<option value='1년 이상 ~ 2년 이하'>").text("1년 이상 ~ 2년 이하");
				var $value4 = $("<option value='2년 이상 ~ 3년 이하'>").text("2년 이상");
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
								
				$(this).attr('disabled', false);
				$("#studyEtc").attr('disabled', false);
				if(count == 3){
					$(this).attr('disabled', true);
					$(".studyEtc").attr('disabled', true);
				}
				
				$(".minus").on('click', function(e){
					e.preventDefault();
					$(this).parent().remove();
				});
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