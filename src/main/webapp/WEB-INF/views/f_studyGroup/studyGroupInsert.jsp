<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap&subset=korean');
	body {font-family: 'Nanum Gothic', sans-serif; font-size: 1.6rem;}
	
	.tableStyle{width: 90%; border-collapse: separate; border-spacing: 0em 1em !important}
	.tableLabel{width: 35%; text-align: center; font-size: 20px; font-weight: bold;}
	#now_date{width:100px;}
	
	#studyName{width: 200px;}
	#recTerm{width: 200px; display: inline-block;}
	#recNum{width: 70px; display: inline-block;}
	#branchNo{width: 200px;}
	#meetingDate{width: 140px; display: inline-block;}
	
	.topTd{vertical-align: top;}
	.resize{resize: none;}
	.inline{display: inline;}
	
	.lengthAlert{float:right; font-weight:normal; padding:0; margin-left:5px;}
	
	.helpBtn{background: rgb(23, 149, 95); border: 0; outline: 0; width: 30px; height: 30px; padding: 3px 11px; margin: 5px; font-size: 13px; border-radius: 100%; color: #FFF;}
</style>

</head>
<body>

	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>스터디 그룹 등록</h1>
				</div>
				<div class="content">
					
					<form action="insertGroup.sg" method="post" onsubmit="return ckForm();">
					<input type="hidden" name="loginUserId" value="${ loginUser.id }">
					<table class="inner tableStyle">
						<tr>
							<td colspan="2">
								<!-- <button type="button" class="helpBtn" data-toggle="tooltip" data-placement="left" title="한 번의 모임 이후에 장기 그룹으로 전환 가능합니다.">?</button> -->
								<label style="text-align:center; font-size:25px; color:#17955F; font-family: 'Binggrae';">기본 그룹 정보</label>
								<label style="background:lightgray; font-family: 'Binggrae'; font-weight:normal; float:right; display:inline-block; margin-top:10px;">※ 한 번의 모집 이후 장기 그룹으로 전환 가능합니다.</label>
								<hr style="border:1px solid #17955F; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">그룹 명</td>
							<td>
								<input type="text" class="form-control" id="sgName" name="sgName">
							</td>
						</tr>
						<tr class="hiddenTr">
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">공부 종류</td>
							<td>
								<select class="form-control" id="studyName" name="studyName">
									 <c:forEach var="item" items="${ studyList }">
									 	<option>${ item }</option>
									 </c:forEach>
								</select>
							</td>
						</tr>
						<tr class="hiddenTr">
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">모집 기간</td>
							<td class="inline">
								<!-- <input class="form-control input-daterange-datepicker" type="text" id="recEndDate" name="recEndDate" style="width:200px;"> -->
								<!-- <label id="now_date"></label> ~ &nbsp;&nbsp;<input type="text" class="form-control" id="datepicker-autoclose" name="recEndDate" placeholder="년/월/일">
								<input type="hidden" id="recStartDate" name="recStartDate"> -->
								<input class="form-control input-daterange-datepicker" type="text" id="recTerm" name="recTerm">
							</td>
						</tr>
						<tr class="hiddenTr">
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">모집 인원</td>
							<td>
								<input type="number" min="1" max="7" class="form-control" id="recNum" name="recNum" placeholder="1이상 7이하" style="width:120px;">
								<button type="button" class="helpBtn" data-toggle="tooltip" data-placement="right" title="그룹장을 제외한 모집 인원을 입력해주세요. 1인 이상, 7인 이하">?</button>
							</td>
						</tr>
						<tr class="hiddenTr">
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">모임 장소</td>
							<td>
								<select class="form-control" id="branchNo" name="branchNo">
									 <c:forEach var="item" items="${ branchList }">
									 	<option value="${ item.branchNo }">${ item.branchName }</option>
									 </c:forEach>
								</select>
							</td>
						</tr>
						<tr class="hiddenTr">
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">모임 날짜</td>
							<td>
								<input type="text" class="form-control" id="datepicker-autoclose" id="rsgMetDate" name="rsgMetDate" placeholder="년/월/일" style="width:120px; display:inline-block;">
								<button type="button" class="helpBtn" data-toggle="tooltip" data-placement="right" title="모집 기간 이후로 선택해주새요.">?</button>
							</td>
						</tr>
						<tr class="hiddenTr">
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">그룹 목표</td>
							<td>
								<input type="text" class="form-control" id="sgGoal" name="sgGoal">
								<label class="lengthAlert" id="goalAlert"><span id="goalCount">0</span>/200</label>
							</td>
						</tr>
						<tr class="hiddenTr">
							<td colspan="2">
								<hr style="border: 0.5px solid #BDBDBD; margin:0; padding:0;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">그룹 내용</td>
							<td class="topTd">
								<textarea rows="20" class="form-control resize" id="sgContent" name="sgContent"></textarea>
								<label class="lengthAlert" id="contentAlert"><span id="contentCount">0</span>/2000</label>
							</td>
						</tr>
						<tr>
							<td colspan=2>
								<div class="btnBox" style="width:100%; text-align:center;">
									<input type="submit" class="btn defaultBtn" style="width:100px; padding:10px;" value="등록"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" class="btn defaultBtn" style="width:100px; padding:10px;" onclick="location.href='listView.sg'" value="취소"/>
								</div>
							</td>
						</tr>
					</table>
					</form>
					
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<script>
	function ckForm() {
		if($('#sgName').val().trim != '' && $('#recNum').val() != '' && $('#sgGoal').val().trim() != '' && $('#sgContent').val().trim() != '') {
			return true;
		} else {
			sweetWrong('모든 항목을 채워주세요.');
			return false;
		}
	}
	
	$(function() {
		$('[data-toggle="tooltip"]').tooltip();
		
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
		
	})
	
	</script>
	
	
	<!-- DatePicker -->
	<script src="${contextPath}/resources/js/plugins/datepicker/common.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/moment.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.ko.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/daterangepicker.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/form-pickers-init.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>