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
 table.inner{
  	width: 100%;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
 /*  margin : 20px 10px; */
  valign:middle-aign;	
}
table.inner th {
    width: 150px;
    text-align: center;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    valign:middle-aign;
    line-height: 50px;
}
table.inner td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    text-align: center;
   	cursor:pointer;
}

#bottomArea{
	margin-top: 50px;
}

</style>
</head>
<body>
	<div class="total-wrapper">
	<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
				<div class="main">
					<div class="pageTitle" align="center">
						<h1>지점 목록</h1>
						<br>
						<h4 align="center"> 등록된 지점 수 :  ${ pi.listCount } </h4>
					</div>
					
					<div class="content" align="center">
						<table class="inner">
							<thead>
								<tr >
									<th>No.</th>
									<th>지점 명</th>
									<th>지점 ID</th>
								</tr>
							</thead>
						  	<tbody>
								<c:forEach var="vr" items="${ list }">
									<tr class="contentTR">
										<td align ="center">${ m.masterId }</td>
										<td align ="center">${ b.branchNo }</td>
										<td align ="center">${ b.branchName }</td>
									</tr>
								</c:forEach> 
								<tr th:if="${ #list.size(list)} > 0" th:each="list: ${list }">
									
								</tr>
								<tr th:unless="${#list.size(list) } > 0">
									<td colspan="4">조회된 결과가 없습니다.</td>
								</tr>
								
							</tbody> 
						</table>
						<div id="bottomArea" class="inner" align="center">
						<!-- 페이징  -->
						<nav>
							<ul class="pagination">
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&lt;</span>
								</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#" aria-label="Next"> <span
										aria-hidden="true">&gt;</span>
								</a></li>
								<li><a href="#" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
</body>
</html>