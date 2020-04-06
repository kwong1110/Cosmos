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
</style>

</head>
<body>
	<div class="total-wrapper">
		<c:import url="../../a_common/menubar.jsp"/>
		
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>마이 그룹</h1>
				</div>
				<div class="content">
					
					<table>
						<tr>
							<th>No</th>
							<th>그룹유형</th>
							<th>공부 종류</th>
							<th>그룹 명</th>
							<th>그룹장</th>
							<th>그룹 상태</th>
						</tr>
					</table>
					
					
				</div>
			</div>
		</div>
		
		<c:import url="../../a_common/footer.jsp"/>
	</div>

</body>
</html>