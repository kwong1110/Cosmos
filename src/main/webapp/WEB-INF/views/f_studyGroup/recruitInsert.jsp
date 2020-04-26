<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>

<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap&subset=korean');
	body {font-family: 'Nanum Gothic', sans-serif; font-size: 1.6rem;}
	
	.tableStyle{width: 80%; border-collapse: separate; border-spacing: 0em 3em !important}
	.tableLabel{width: 35%; text-align: center; font-size: 20px; font-weight: bold;}
	#now_date{width:100px;}
	
	#groupSelect{width: 400px;}
	#studyType{width: 200px;}
	#recEndDate{width: 140px; display: inline-block;}
	#recNum{width: 70px; display: inline-block;}
	#recLoc{width: 200px;}
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
					<h1>스터디 그룹 모집 등록</h1>
				</div>
				<div class="content">
					
					<table class="inner tableStyle">
						<tr>
							<td class="tableLabel">그룹 명</td>
							<td>
								<select class="form-control" id="groupSelect" name="groupSelect">
									<c:forEach var="item" items="${ sgList }">
										<option>${ item }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="tableLabel">공부 종류</td>
							<td>
								<p id="studyType">공부종류</p>
								<!-- <input class="form-control" type="text" id="studyType" name="studyType" value="공부종류" disabled> -->
							</td>
						</tr>
						<tr>
							<td class="tableLabel">모집 기간</td>
							<td class="inline">
								<label id="now_date"></label> ~ &nbsp;&nbsp;<input type="text" class="form-control" id="datepicker-autoclose" placeholder="년/월/일">
								<input type="date" class="form-control" id="recEndDate" name="recEndDate">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">모집 인원</td>
							<td>
								<input type="number" min="1" class="form-control" id="recNum" name="recNum">
								<button class="helpBtn" data-toggle="tooltip" data-placement="right" title="그룹장을 제외한 모집 할 인원을 입력해주세요.">?</button>
							</td>
						</tr>
						<tr>
							<td class="tableLabel">모임 장소</td>
							<td>
								<p id="recLoc">한남점</p>
								<!-- <input class="form-control" type="text" id="recLoc" name="recLoc" value="한남점" disabled> -->
							</td>
						</tr>
						<tr>
							<td class="tableLabel">모임 날짜</td>
							<td>
								<p id="meetingDate">월요일</p>
								<!-- <input class="form-control" type="text" id="meetingDate" name="meetingDate" value="월요일" disabled> -->
							</td>
						</tr>
						<tr>
							<td class="tableLabel">그룹 목표</td>
							<td>
								<p id="groupGoal">그룹목표그룹목표그룹목표그룹목표그룹목표그룹목표그룹목표그룹목표그룹목표그룹목표그룹목표그룹목표그룹목표그룹목표그룹목표그룹목표</p>
								<!-- <input type="text" class="form-control" id="groupGoal" name="groupGoal">
								<label class="lengthAlert">0/100</label> -->
							</td>
						</tr>
						<tr>
							<td class="tableLabel">모집 내용</td>
							<td class="topTd">
								<textarea cols="50" rows="20" class="form-control resize"></textarea>
								<label class="lengthAlert">0/2000</label>
							</td>
						</tr>
						<tr>
							<td colspan=2>
								<div class="btnBox" style="width:100%; text-align:center;">
								<!-- btnBox 스타일 빠진 것 가튼데 여쭤보자 -->
									<input type="submit" class="btn btn-danger" value="등록"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" class="btn btn-info" value="취소"/>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	
	<script>
	$(function() {
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; // Jan is 0
		var yyyy = today.getFullYear();
		 
		if(dd<10){ dd = '0'+dd }
		
		if(mm<10){ mm = '0'+mm }
		                            
		today = yyyy + '-' + mm + '-' + dd;
		$('#now_date').text(today);
		console.log(today);

		$('[data-toggle="tooltip"]').tooltip()
	})
	</script>
	<script src="${contextPath}/resources/js/plugins/datepicker/common.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/moment.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.ko.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/daterangepicker.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/form-pickers-init.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
</body>
</html>