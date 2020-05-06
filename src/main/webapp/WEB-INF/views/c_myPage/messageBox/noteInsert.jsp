<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<h2 class="title"><span class="cosmos">쪽지 쓰기</span></h2>
		</div>
		
		<form action="noteInsert.mp" method="post">
		<input type="hidden" name="noteFromId" value="${ loginUser.id }">
		<div class="note-body">
	
			<div class="insert-area">
				<span>받는 사람 :</span> 
				<c:if test="${ !empty toNick }">
					<input type="text" name="toNick" class="form-control" value="${ toNick }" readonly>
				</c:if>
				<c:if test="${ empty toNick }">
				<input type="text" name="toNick" class="form-control">
				</c:if>
			</div>
			<div>
				<textarea name="noteContent" class="note-content"></textarea>
			</div>
	
		</div>
		
		<c:url var="noteList" value="noteList.mp">
			<c:param name="userId" value="${loginUser.id}"/>
		</c:url>
		<!-- 푸터-->
		<div class="btn-box">
			<input type="submit" class="btn btnNote" value="등록 하기">
			<button type="button" class="btn btnNote" onclick="location.href='${noteList}'">목록으로</button>
		</div>
		</form>
	</div>
</body>
</html>