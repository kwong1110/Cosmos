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
				<c:if test="${ !empty noteToId }">
				<input type="hidden" name="noteToId" value="${ noteToId }">
				<input type="text" class="form-control" value="${ noteToId }" readonly>
				<!-- 위의 input hidden 이랑 text 둘의 name이 noteToId로 되어있어서 파라미터에서 받을때 아이디 두 개가 들어가서 text부분을 지웠어요. (ex. admin00,admin00 이런식으로 name이 두개라 두 개를 이어서 받아오더라구요)
				어차피 수정 불가능한 input이라서 submit할 때 hidden에 값 업데이트하는 부분은 추가 안했습니다! -->
				</c:if>
				<c:if test="${ empty noteToId }">
				<input type="text" name="noteToId" class="form-control">
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