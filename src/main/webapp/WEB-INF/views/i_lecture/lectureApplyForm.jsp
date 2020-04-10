<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강연 등록 신청</title>
<style>
	table>tbody>tr>th,table>tbody>tr>td{
		text-align: center;
		vertical-align: middle !important;
	}
	table>tbody>tr>th{
		background-color: rgb(247, 239, 193);
		letter-spacing: 0.1em;
	}
	table>tbody>tr>td{
		line-height: 10px;
	}
	table>tbody>tr>td>input,
	table>tbody>tr>th>input,
	table>tbody>tr>td>select{
		width: 100%;
		height: auto;
		line-height: auto;
		border: 0;
		background-color: rgb(255, 255, 224);
	}
	table>tbody>tr>td>textarea{
		width: 99%;
		height: 139px;
		margin: 0 5px 0 5px;
		border: 0;
		resize: none;
		background-color: rgb(255, 255, 224);
	}
	.input-daterange-timepicker{
		background-color: rgb(255, 255, 224) !important;
	}
</style>
</head>
<body>
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>강연 등록 신청</h1>
				</div>
				<div class="content">
					<form action="lectureApply.le" method="post" onsubmit="">
						<table class="inner table">
							<tr>
								<th>이름</th>
								<td><input type="text" name="id"></td>
								<th colspan="5">이력 사항 / 강연 경험</th>
							</tr>
							<tr>
								<th>핸드폰 번호</th>
								<td><input type="text"></td>
								<td rowspan="3" colspan="5">
									<textarea name="lectureRecord"></textarea>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email"></td>
							</tr>
							<tr>
								<th>직업</th>
								<td><input type="text" name="lectureJob"></td>
							</tr>
							<tr>
								<th rowspan="2">강연 제목</th>
								<td rowspan="2"><input type="text" name="lectureTitle"></td>
								<th>강연 일시</th>
								<td colspan="2">
									<input type="text" class="form-control input-daterange-timepicker" name="daterange" id="daterange">
									<input id="startDate" name="startDate" type="hidden"/>
									<input id="endDate" name="endDate" type="hidden"/>
								</td>
								<th>강연 장소</th>
								<td>
									<select id="placeSelect" name="branchNo">
										<c:forEach var="s" items="${ branchList }">
											<option value="${ s.branchNo }">${ s.branchName }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>참가비</th>
								<td colspan="1"><input type="number" step="1000" min="0" placeholder="1000 단위 입력 가능" name="lectureFee"></td>
								<th>강연 인원</th>
								<td colspan="2"><input type="number" step="10" min="0" max="30" placeholder="10 단위 입력 가능" name="maxpeople"></td>
							</tr>
							<tr>
								<th colspan="8">강연 내용</th>
							</tr>
							<tr>
								<td colspan="8" style="padding: 0;">
									<textarea id="summernote" style="resize: none" name="lectureContent"></textarea>
									<c:import url="../a_common/summernote.jsp"/>
								</td>
							</tr>
						</table>
						<div class="inner btnBox">
							<button id="applyBtn" class="btn defaultBtn">신청 완료</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
</body>
	<script src="${contextPath}/resources/js/plugins/datepicker/common.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/moment.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.ko.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-timepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/daterangepicker.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/form-pickers-init.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</html>