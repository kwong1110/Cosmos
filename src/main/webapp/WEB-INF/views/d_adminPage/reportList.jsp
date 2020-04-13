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


</style>
</head>
<body>
	<div class="total-wrapper">
	<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
				<div class="main">
					<div class="pageTitle" align="center">
						<h1>신고회원 리스트(관리자)</h1>
						<h3 align="center">총 신고된 회원 수 :<%--  ${ pi.listCount } --%> 10</h3>
					</div>
					
					<div class="content" align="center">
						<table class="inner">
							<tr >
								<th>No.</th>
								<th>신고당한 회원 ID</th>
								<th>신고 사유</th>
								<th>신고한 회원 ID</th>
							</tr>
							</tr>
							<tr >
								<td>10</td>
								<td>user01</td>
								<td>공부안함</td>
								<td>user02</td>
							</tr>
							<tr >
								<td>9</td>
								<td>user01</td>
								<td>잠수</td>
								<td>user02</td>
							</tr>
							<tr >
								<td>8</td>
								<td>user01</td>
								<td>타인비하</td>
								<td>user02</td>
							</tr>
							<tr>
								<td>7</td>
								<td>user01</td>
								<td>분위기를 흐림</td>
								<td>user02</td>
							</tr>
							<tr>
								<td>6</td>
								<td>user02</td>
								<td>분위기를 흐림</td>
								<td>user01</td>
							</tr>
							<tr>
								<td>5</td>
								<td>user01</td>
								<td>기타</td>
								<td>user02</td>
							</tr>
							<tr>
								<td>4</td>
								<td>user01</td>
								<td>공부안함</td>
								<td>user02</td>
							</tr>
							<tr>
								<td>3</td>
								<td>user01</td>
								<td>잠수</td>
								<td>user02</td>
							</tr>
							<tr>
								<td>2</td>
								<td>user01</td>
								<td>타인비하</td>
								<td>user02</td>
							</tr>
							<tr>
								<td>1</td>
								<td>user01</td>
								<td>분위기를 흐림</td>
								<td>user02</td>
							</tr>
<%-- 							<c:forEach var="r" items="${ list }">
							<tr class="contentTR">
								<td align="center">${ b.bId }</td>
								
								<td align="left">
									<c:if test="${ !empty loginUser }">
										<c:url var="bdetail" value="bdetail.bo">
											<c:param name="bId" value="${ b.bId }"/>
											<c:param name="page" value="${ pi.currentPage }"/>
										</c:url>
										<a href="${ bdetail }">${ b.bTitle }</a>
									</c:if>
									<c:if test="${ empty loginUser }">
										${ r.bTitle }		
									</c:if>
								</td>
								
								<td align="center">${ r.bWriter }</td>
								<td align="center">${ r.bCreateDate }</td>
								<td align="center">${ r.bCount }</td>
								<td align="center">
									<c:if test="${ ! empty b.originalFileName }">
										♥
									</c:if>
								</td>
							</tr>
							</c:forEach> --%>
						</table>
						<div id="bottomArea" class="inner">
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
		<c:import url="../a_common/footer.jsp"/>	
	</div>
</body>
</html>