<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강연 등록 신청</title>
<style>
	table>tbody>tr>th{
		letter-spacing: 0.1em;
		white-space: nowrap;
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
	
	input:read-only {
		background-color: rgb(247, 239, 193);
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
					<form action="lectureApply.le" method="post" onsubmit="return checkEmptyValues(job, title, lectureFee, maxpeople, summernote, record);">
						<table class="inner table">
							<tr>
								<th>이름<input type="hidden" value="${ loginUser.id }" name="id"></th>
								<td><input type="text" value="${ loginUser.name }" readonly></td>
								<th colspan="5">이력 사항 / 강연 경험</th>
							</tr>
							<tr>
								<th>핸드폰 번호</th>
								<td><input type="text" value="${ loginUser.phone }" readonly></td>
								<td rowspan="3" colspan="5">
									<textarea id="record" name="lectureRecord" placeholder="이력 사항을 입력해주세요."></textarea>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" value="${ loginUser.email }" readonly></td>
							</tr>
							<tr>
								<th>직업</th>
								<td><input type="text" id="job" name="lectureJob" placeholder="직업을 입력해주세요."></td>
							</tr>
							<tr>
								<th rowspan="2">강연 제목</th>
								<td rowspan="2"><input type="text" id="title" name="lectureTitle" placeholder="제목을 입력해주세요."></td>
								<th>강연 일시</th>
								<td colspan="2">
									<input type="text" class="form-control input-daterange-timepicker" name="daterange" id="daterange">
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
								<td colspan="1"><input type="number" id="lectureFee" name="lectureFee" step="1000" min="0" placeholder="1000 단위 입력 가능"></td>
								<th>강연 인원</th>
								<td colspan="2"><input type="number" id="maxpeople" name="maxpeople" step="10" min="0" max="30" placeholder="10 단위 입력 가능"></td>
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
<script>
	/**
	* 이미지 파일 업로드
	*/
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		folderRoot = "lecture"
		data.append("folderRoot", folderRoot);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile.cm",
			contentType : false,
			processData : false,
			success : function(data) {
				console.log("url확인 : " + data.url);
	        	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', "${ contextPath }/resources/" + data.url);
			}
		});
	}
</script>
	<%-- summernote와 충돌나서 주석처리해주었음 이걸 주석처리해도 datepicker는 잘 작동함. --%>
	<%-- <script src="${contextPath}/resources/js/plugins/datepicker/common.min.js"></script> --%>
	<script src="${contextPath}/resources/js/plugins/datepicker/moment.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.ko.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-timepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/daterangepicker.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/form-pickers-init.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</html>