<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보기</title>
<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/reset.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/note.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/plugins/sweetalert/sweetalert.css">
</head>
<body class="body">
<div class="content">
	<div class="note-header">
		<h2 class="title">
			<span class="cosmos">보낸 사람</span>
			| <c:out value="${note.noteFromId}"/>님
		</h2>
	</div>
	<form>
	<div class="note-body">
		<div>
			<span>받은 시간 : ${note.noteTime} &nbsp;</span>
			<button type="button" class="btn btn-report">[ <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true">신고</span> ]</button>
		</div>
		<div class="note-content">
			<%-- ${note.noteContent} --%>
			<% pageContext.setAttribute("newLineChar", "\r\n"); %>
			${ fn:replace(note.noteContent, newLineChar, "<br>") }
		</div>
	</div>

	<!--푸터-->
	<c:url var="noteReply" value="noteInsertView.mp">
		<c:param name="noteToId" value="${note.noteFromId}"/>
	</c:url>
	<c:url var="noteDelete" value="noteDelete.mp">
		<c:param name="noteNo" value="${note.noteNo}"/>
	</c:url>
	<c:url var="noteStorage" value="noteStorage.mp">
		<c:param name="noteNo" value="${note.noteNo}"/>
	</c:url>
	<c:url var="noteList" value="noteList.mp">
		<c:param name="userId" value="${loginUser.id}"/>
	</c:url>
	<div class="btn-box">
		<button type="button" class="btn btnNote" onclick="location.href='${noteReply}'">답장</button>
		<button type="button" class="btn btnNote" onclick="return sweetConfirm();">삭제</button>
		<button type="button" class="btn btnNote" onclick="location.href='${noteStorage}'">보관함</button>
		<button type="button" class="btn btnNote" onclick="location.href='${noteList}'">목록으로</button>
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