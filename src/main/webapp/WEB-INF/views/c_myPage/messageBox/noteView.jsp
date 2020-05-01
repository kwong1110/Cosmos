<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보기</title>
<style>
	.note-content {
		background: yellow;
		width: 50%;
		margin: auto;
	}

	.content {
		width: 100%;
		height: 200px;
	}

	.send-btn {
		padding: 10px 15px;
		font-size: 1.2rem;
		background: #003366;
		border: 0;
		color: #fff;
	}

</style>

<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/reset.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/plugins/sweetalert/sweetalert.css">
</head>
<body>
<div class="content note-content">
	<!--모달 헤더-->
	<div class="modal-header">
		<h2 class="modal-title myCuponTitle">쪽지 받기</h2>
	</div>
	<form>
	<!--모달 바디-->
	<div class="modal-body">

		<h3>보낸 사람  ${note.noteFromId}</h3>
		<div>
			<span>받은 시간 : ${note.noteTime}</span>
			<button type="button"><span aria-hidden="true">신고</span></button>
		</div>
		<div class="content">
			<%-- ${note.noteContent} --%>
			<% pageContext.setAttribute("newLineChar", "\r\n"); %>
			${ fn:replace(note.noteContent, newLineChar, "<br>") }
		</div>
	</div>

	<!--모달 푸터-->
	<c:url var="noteReply" value="noteInsertView.mp">
		<c:param name="noteToId" value="${note.noteFromId}"/>
	</c:url>
	<c:url var="noteDelete" value="noteDelete.mp">
		<c:param name="noteNo" value="${note.noteNo}"/>
	</c:url>
	<c:url var="noteStorage" value="noteStorage.mp">
		<c:param name="noteNo" value="${note.noteNo}"/>
	</c:url>
	<div class="modal-footer">
		<button type="button" class="send-btn" onclick="location.href='${noteReply}'">답장</button>
		<button type="button" class="del-btn" onclick="return sweetConfirm();">삭제</button>
		<button type="button" class="del-btn" onclick="location.href='${noteStorage}'">보관함</button>
	</div>
	</form>
</div>
</body>
<script>
	function statusUpdate(){
		location.href='${noteDelete}'		
	}
</script>
	<!-- sweet alert -->
<script src="${contextPath}/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${contextPath}/resources/js/plugins/sweetalert/sweetalert.cosmos.js"></script>
</html>