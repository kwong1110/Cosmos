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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style>
	.note-content {
		background: yellow;
		width: 50%;
		margin: auto;
	}
	
	textarea {
		resize: none;
		width: 80%;
		margin: 50px auto;
		height: 200px;
	}
	
	input {
		padding-bottom: 10px;
		margin-left: 40px;
	}
	
	.send-btn {
		padding: 10px 15px;
		font-size: 1.2rem;
		background: #003366;
		border: 0;
		color: #fff;
	}

	</style>
</head>
<body>
	<div class="content note-content">
	보내는 사람 : ${ loginUser.id }
	
		<!--모달 헤더-->
		<div class="modal-header">
			<h2 class="modal-title">쪽지 쓰기</h2>
		</div>
		<form action="noteInsert.mp" method="post">
		<input type="hidden" name="noteFromId" value="${ loginUser.id }">
		<!--모달 바디-->
		<div class="modal-body">
	
			<h3>
				받는 사람 : 
				<c:if test="${ !empty noteToId }">
				<input type="hidden" name="noteToId" value="${ noteToId }">${ noteToId }
				</c:if>
				<c:if test="${ empty noteToId }">
				<input type="text" name="noteToId">
				</c:if>
			</h3>
			<div>
				<textarea name="noteContent"></textarea>
			</div>
	
		</div>
	
		<!--모달 푸터-->
		<div class="modal-footer">
			<input type="submit" value="등록 하기"> &nbsp;
			<button onclick="location.href='noteList.mp'">목록으로</button>
		</div>
		</form>
	</div>
</body>
</html>