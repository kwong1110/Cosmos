<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>

<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap&subset=korean');
	body {font-family: 'Nanum Gothic', sans-serif; font-size: 1.6rem;}
	
	.tableStyle{width: 90%; border-collapse: separate; border-spacing: 0em 1em !important}
	.tableLabel{width: 35%; text-align: center; font-size: 20px; font-weight: bold;}
	#now_date{width:100px;}
	
	#studyName{width: 200px;}
	#recTerm{width: 200px; display: inline-block;}
	#msgNum{width: 70px; display: inline-block;}
	#branchNo{width: 200px;}
	#meetingDate{width: 140px; display: inline-block;}
	
	.topTd{vertical-align: top;}
	.resize{resize: none;}
	.inline{display: inline;}
	
	.lengthAlert{float:right; font-weight:normal; padding:0; margin-left:5px;}
	
	.helpBtn{background: rgb(23, 149, 95); border: 0; outline: 0; width: 30px; height: 30px; padding: 3px 11px; margin: 5px; font-size: 13px; border-radius: 100%; color: #FFF;}
	
	#minusIl,#pluseIl{width:32px; height:32px; color:#17955F; border-radius:50%; border:1.5px solid #17955F; background:transparent;}
	#minusIl:hover,#pluseIl:hover{color:white; background:#17955F;}
	
</style>

</head>
<body>

	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>스터디 그룹 정보 수정</h1>
				</div>
				<div class="content">
					
					<form action="updateGroup.sg" method="post" onsubmit="return ckSubmit();">
					<table class="inner tableStyle">
						<tr>
							<td colspan="2">
								<label style="text-align:center; font-size:25px; color:#17955F; font-family: 'Binggrae';">기본 그룹 정보</label>
								<hr style="border:1px solid #17955F; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">그룹 명</td>
							<td>
								<label id="sgName" name="sgName">${ group.sgName }</label>
								<input type="hidden" name="sgNo" value="${ group.sgNo }">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">공부 종류</td>
							<td>
								<label id="studyName">${ group.studyName }</label>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">모집 인원</td>
							<td>
								<c:set var="num" value="${ partNum }" />
								<c:if test="${ partNum  >= 1 }" >
									<c:set var="num" value="${ partNum }" />
								</c:if>
								<c:if test="${ partNum eq 0 }" >
									<c:set var="num" value="${ partNum + 1 }" />
								</c:if>
								
								<input type="number" min="${ num }" max="7" class="form-control" id="msgNum" name="msgNum" value="${ group.msgNum }">
								<button class="helpBtn" data-toggle="tooltip" data-placement="right" title="그룹장을 제외한 그룹인원을 입력해주세요. 현재 참여 중인 그룹원 이상으로 설정되아야 합니다.">?</button>
								
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">모임 장소</td>
							<td>
								<select class="form-control" id="branchNo" name="branchNo">
									 <c:forEach var="item" items="${ branchList }">
									 	<c:if test="${ item.branchNo eq group.msgNum }">
									 		<option value="${ item.branchNo }" selected>${ item.branchName }</option>
									 	</c:if>
									 	<c:if test="${ item.branchNo ne group.msgNum }">
									 		<option value="${ item.branchNo }">${ item.branchName }</option>
									 	</c:if>
									 </c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">그룹 목표</td>
							<td>
								<input type="text" class="form-control" id="sgGoal" name="sgGoal" value="${ group.sgGoal }">
								<label class="lengthAlert" id="goalAlert"><span id="goalCount">0</span>/200</label>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">그룹 내용</td>
							<td class="topTd">
								<textarea rows="20" class="form-control resize" id="sgContent" name="sgContent">${ group.sgContent }</textarea>
								<label class="lengthAlert" id="contentAlert"><span id="contentCount">0</span>/1000</label>
							</td>
						</tr>
					</table>
					
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:parseDate var="finalDate" value="${group.finalRecDate }" pattern="yyyy-MM-dd" />
					<fmt:formatDate var="now" value="${now}" pattern="yyyy-MM-dd" />
					<fmt:formatDate var="finalDate" value="${finalDate}" pattern="yyyy-MM-dd" />
					
					<c:if test="${ (group.sgStatus eq 'N' and now > finalDate) or (group.sgStatus ne 'N' and group.sgStatus ne 'E') }">
						
					<table class="inner tableStyle" style="margin-top:3%;">
						<tr>
							<td colspan="2">
								<label style="text-align:center; font-size:25px; color:#17955F; font-family: 'Binggrae';">장기 그룹 정보</label>
								<hr style="border:1px solid #17955F; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">
								<label id="optionLabel">장기 그룹 옵션&nbsp;&nbsp;</label>
							</td>
							<td style="display:inline-block; vertical-align:middle;">
								<div style="display:inline-block; vertical-align:middle;">
									<c:if test="${ group.sgStatus eq 'Y' }">
										<input class="tgl tgl-skewed" id="cb3" name="msgSwitch" type="checkbox" checked/>
									</c:if>
									<c:if test="${ group.sgStatus ne 'Y' }">
										<input class="tgl tgl-skewed" id="cb3" name="msgSwitch" type="checkbox"/>
									</c:if>
								    <label class="tgl-btn" data-tg-off="OFF" data-tg-on="ON" for="cb3"></label>
							    </div>
							</td>
						</tr>
						<tr class="hiddenTr">
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr class="hiddenTr">
							<td class="tableLabel">모임 주기</td>
							<td>
								<input type="hidden" id="msgMetRule" name="msgMetRule">
								<c:if test="${ group.sgStatus eq 'Y' }">
									<script>
										var rule = "${group.msgMetRule}";
									</script>
									<c:choose>
										<c:when test="${fn: contains(group.msgMetRule, '요일') }">
											<input type="radio" name="metRule" id="weekCk" checked> <label style="margin-right:30px;">요일</label>
											<input type="radio" name="metRule" id="dayCk"> <label style="margin-right:30px;">일</label>
											<input type="radio" name="metRule" id="ectCk"> <label>기타</label>
										</c:when>
										<c:otherwise>
											<input type="radio" name="metRule" id="weekCk"> <label style="margin-right:30px;">요일</label>
											<c:choose>
												<c:when test="${fn: contains(group.msgMetRule, '일') }">
													<input type="radio" name="metRule" id="dayCk" checked> <label style="margin-right:30px;">일</label>
													<input type="radio" name="metRule" id="ectCk"> <label>기타</label>
												</c:when>
												<c:otherwise>
													<input type="radio" name="metRule" id="dayCk"> <label style="margin-right:30px;">일</label>
													<input type="radio" name="metRule" id="ectCk" checked> <label>기타</label>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${ group.sgStatus ne 'Y' }">
									<input type="radio" name="metRule" id="weekCk"> <label style="margin-right:30px;">요일</label>
									<input type="radio" name="metRule" id="dayCk"> <label style="margin-right:30px;">일</label>
									<input type="radio" name="metRule" id="ectCk"> <label>기타</label>
								</c:if>
								<button class="helpBtn" data-toggle="tooltip" data-placement="right" title="특정한 주기를 정해놓지 않고 모이는 경우">?</button>
								
								
								<div id="hiddenOption" style="margin-top:10px; height:40px;">
									<div id="week">
										<button type="button" class="form-control weekBtn" id="mon" style="width:50px; display:inline;">월</button>
										<button type="button" class="form-control weekBtn" id="tue" style="width:50px; display:inline;">화</button>
										<button type="button" class="form-control weekBtn" id="wed" style="width:50px; display:inline;">수</button>
										<button type="button" class="form-control weekBtn" id="thu" style="width:50px; display:inline;">목</button>
										<button type="button" class="form-control weekBtn" id="fri" style="width:50px; display:inline;">금</button>
										<button type="button" class="form-control weekBtn" id="sat" style="width:50px; display:inline;">토</button>
										<button type="button" class="form-control weekBtn" id="sun" style="width:50px; display:inline;">일</button>
									</div>
									<div id="day">
										<input type="number" id="dayCount" class="form-control" min="0" style="width:60px; display:inline-block; margin-right:10px;"><label> 일 마다</label>
									</div>
								</div>
							</td>
						</tr>
						<tr class="hiddenTr">
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr class="hiddenTr">
							<td class="tableLabel">그룹 규칙</td>
							<td>
								<ul id="RuleUl">
									<c:choose>
										<c:when test="${!empty group.msgRule1 }">
											<li><input type="text" class="form-control ruleli" style="margin:5px;" value="${group.msgRule1}"></li>
											<c:if test="${!empty group.msgRule2 }">
												<li><input type="text" class="form-control ruleli" style="margin:5px;" value="${group.msgRule2}"></li>
												<c:if test="${!empty group.msgRule3 }">
													<li><input type="text" class="form-control ruleli" style="margin:5px;" value="${group.msgRule3}"></li>
												</c:if>
											</c:if>
										</c:when>
										<c:otherwise>
											<li><input type="text" class="form-control" style="margin:5px;"></li>
										</c:otherwise>
									</c:choose>
								</ul>
								<div style="float:left; width:70%;">
									<label id="ruleAlert" style="color:red;"></label>
								</div>
								<div style="float:right; width:30%; text-align:right; margin-bottom:10px;">
									<!-- 
									<button type="button" id="minusIl" style="margin-right:10px; border-radius:50%; width:40px; height:40px; border:2px solid black; color:black; background:transparent;">-</button>
									<button type="button" id="pluseIl" style="border-radius:50%; width:40px; height:40px; border:2px solid black; color:black; background:transparent;">+</button>
									 -->
									<button type="button" id="minusIl" style="margin-right:10px;">-</button>
									<button type="button" id="pluseIl" style="">+</button>
								</div>
							</td>
						</tr>
					</table>
					</c:if>
					
					<div class="btnBox" style="width: 100%; text-align: center; margin-top:10%;">
						<input type="submit" class="btn btn-info" value="등록" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn btn-danger" value="취소" />
					</div>
					</form>
					
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<script>
		$(function() {
	        var content = $('#sgGoal').val();
	        if(content.length < 200) {
	        	$('#goalAlert').css('color', 'black');
		        $('#goalCount').html(content.length);
	        } else if(content.length == 200) {
	        	$('#goalAlert').css('color', 'red');
		        $('#goalCount').html(content.length);
	        } else {
	        	$('#sgGoal').val(content.substr(0, 200));
	        	$('#goalAlert').css('color', 'red');
	        }
	        
	        content = $('#sgContent').val();
	        if(content.length < 1000) {
	        	$('#contentAlert').css('color', 'black');
		        $('#contentCount').html(content.length);
	        } else if(content.length == 1000) {
	        	$('#contentAlert').css('color', 'red');
		        $('#contentCount').html(content.length);
	        } else {
	        	$('#sgContent').val(content.substr(0, 1000));
	        	$('#contentAlert').css('color', 'red');
	        }
			
			$('[data-toggle="tooltip"]').tooltip();
			
			$('#hiddenOption').css('display','none');
			$('#week').css('display','none');
			$('#day').css('display','none');
			$('.hiddenTr').css('display', 'none');
			
			if($('#cb3').attr('checked') == 'checked') 
				$('.hiddenTr').css('display', '');
			else
				$('.hiddenTr').css('display', 'none');

			if($('#weekCk').is(':checked')) {
				$('#hiddenOption').css('display', 'block');
				$('#week').css('display', 'block');
				$('#day').css('display', 'none');

				if(rule.indexOf('월요일') != -1) $('#mon').trigger('click');
				if(rule.indexOf('화요일') != -1) $('#tue').trigger('click');
				if(rule.indexOf('수요일') != -1) $('#wed').trigger('click');
				if(rule.indexOf('목요일') != -1) $('#thu').trigger('click');
				if(rule.indexOf('금요일') != -1) $('#fri').trigger('click');
				if(rule.indexOf('토요일') != -1) $('#sat').trigger('click');
				if(rule.indexOf('일요일') != -1) $('#sun').trigger('click');
			} else if($('#dayCk').is(':checked')) {
				$('#hiddenOption').css('display', 'block');
				$('#day').css('display', 'block');
				$('#week').css('display', 'none');
				
				console.log(rule.substr(0, rule.indexOf('일')));
				$('#dayCount').val(rule.substr(0, rule.indexOf('일')));
			} else {
				$('#hiddenOption').css('display', 'none');
				$('#week').css('display', 'none');
				$('#day').css('display', 'none');
			}
			
		})
		
		$('#sgGoal').keyup(function (e){
	          var content = $(this).val();
	          if(content.length < 200) {
	        	  $('#goalAlert').css('color', 'black');
		          $('#goalCount').html(content.length);
	          } else if(content.length == 200) {
	        	  $('#goalAlert').css('color', 'red');
		          $('#goalCount').html(content.length);
	          } else {
	        	  $('#sgGoal').val(content.substr(0, 200));
	        	  $('#goalAlert').css('color', 'red');
	          }
	    });
		
		$('#sgContent').keyup(function (e){
	          var content = $(this).val();
	          if(content.length < 1000) {
	        	  $('#contentAlert').css('color', 'black');
		          $('#contentCount').html(content.length);
	          } else if(content.length == 1000) {
	        	  $('#contentAlert').css('color', 'red');
		          $('#contentCount').html(content.length);
	          } else {
	        	  $('#sgContent').val(content.substr(0, 1000));
	        	  $('#contentAlert').css('color', 'red');
	          }
	    });
		
		$('input[name=metRule]').click(function() {
			if($(this).attr('id') == 'weekCk') {
				$('#hiddenOption').css('display', 'block');
				$('#week').css('display', 'block');
				$('#day').css('display', 'none');
			} else if($(this).attr('id') == 'dayCk') {
				$('#hiddenOption').css('display', 'block');
				$('#day').css('display', 'block');
				$('#week').css('display', 'none');
			} else {
				$('#hiddenOption').css('display', 'none');
				$('#week').css('display', 'none');
				$('#day').css('display', 'none');
			}
		})
		
		$('.weekBtn').click(function() {
			if($(this).css('color') == 'rgb(255, 255, 255)') {
				$(this).css({'background':'white', 'color':'#555'});
			} else {
				$(this).css({'background':'#6DBD6A', 'color':'white'});
			}
		})
		
		$('#minusIl').click(function() {
			var length = $('#RuleUl').children().length;
			if(length != 1) {
				$('#ruleAlert').text('');
				$('#RuleUl').children().eq(length-1).remove();
			} else {
				$('#ruleAlert').text('그룹 규칙은 반드시 하나 이상 존재해야 합니다.');
			}
		})
		
		$('#pluseIl').click(function() {
			$('#ruleAlert').text('');
			if($('#RuleUl').children().length != 3) {
				$('#RuleUl').append('<li><input type="text" class="form-control ruleli" style="margin:5px;"></li>');
			}
		})
		
		$('#cb3').click(function() {
			if($('.hiddenTr').css('display') == 'table-row') {
				$('.hiddenTr').css('display', 'none');
			} else {
				$('.hiddenTr').css('display', '');
			}
		})
		
		function ckSubmit() {
			var str = "";
			
			if($('#weekCk').is(':checked')) {
				for(var i = 0; i < $('.weekBtn').length; i++) {
					if($('.weekBtn').eq(i).css('color') == 'rgb(255, 255, 255)') {
						str += $('.weekBtn').eq(i).text() + "요일,";
					}
				}
				
				if(str != '') {
					str = str.substr(-0, str.length-1);
				}
			} else if($('#dayCk').is(':checked')) {
				str = $('#dayCount').val() + "일";
			} else {
				str = "기타";
			}
			
			console.log(str);
			$('#msgMetRule').val(str);
			
			for(var i = 0; i < $('#RuleUl').children().length; i++) {
				if($('#ruleli').eq(i).val().trim() == '') {
					
				}
			}
			
			if($('#msgNum').val().trim() != '' && $('#sgGoal').val().trim() != '' && $('#sgContent').val().trim() != '' && str != '' ) {
				
			}
			
			return false;
		}
	</script>
	
</body>
</html>