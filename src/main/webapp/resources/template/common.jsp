<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 초기 구조 -->
	<!-- import 경로는 알아서 바꿔줄것. -->
	<c:import url="menubar.jsp"/>
	<div class="wrapper">
		<div class="main">
			<div class="pageTitle">
				<h1>소제목</h1>
			</div>
			<div class="content">
				<div class="btnBox">
					<button class="defaultBtn" onclick=""></button>
				</div>
			</div>
		</div>
	</div>
	<c:import url="menubar.jsp"/>
</body>
</html>