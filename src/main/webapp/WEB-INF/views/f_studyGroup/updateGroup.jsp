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
					<h1>스터디 그룹 정보 수정</h1>
				</div>
				<div class="content">
					
					<table class="inner tableStyle">
						<tr>
							<td class="tableLabel">그룹 명</td>
							<td>
								<input type="text" class="form-control" id="sgName" name="sgName" value="${ group.sgName }">
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
						<tr>
							<td class="tableLabel">모집 기간</td>
							<td class="inline">
								<!-- <input class="form-control input-daterange-datepicker" type="text" id="recEndDate" name="recEndDate" style="width:200px;"> -->
								<!-- <label id="now_date"></label> ~ &nbsp;&nbsp;<input type="text" class="form-control" id="datepicker-autoclose" name="recEndDate" placeholder="년/월/일">
								<input type="hidden" id="recStartDate" name="recStartDate"> -->
								<input class="form-control input-daterange-datepicker" type="text" id="recTerm" name="recTerm">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">모집 인원</td>
							<td>
								<input type="number" min="1" max="7" class="form-control" id="recNum" name="recNum">
								<button class="helpBtn" data-toggle="tooltip" data-placement="right" title="그룹장을 제외한 모집 인원을 입력해주세요. 1인 이상, 7인 이하">?</button>
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
						<tr>
							<td class="tableLabel">모임 날짜</td>
							<td>
								<input type="text" class="form-control" id="datepicker-autoclose" name="recMettingDate" placeholder="년/월/일" style="width:120px;">
							</td>
						</tr>
						<tr>
							<td class="tableLabel">그룹 목표</td>
							<td>
								<input type="text" class="form-control" id="sgGoal" name="sgGoal">
								<label class="lengthAlert" id="goalAlert"><span id="goalCount">0</span>/200</label>
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
	
</body>
</html>