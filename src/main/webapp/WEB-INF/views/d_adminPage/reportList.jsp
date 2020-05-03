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
						<h1>신고회원 리스트(관리자)</h1>
						<h4 align="center">총 신고된 회원 수 :  ${ pi.listCount } </h4>
					</div>
					
					<div class="content" align="center">
						<table class="inner">
							<tr >
								<th>No.</th>
								<th>신고당한 회원 ID</th>
								<th>신고 사유</th>
								<th>신고한 회원 ID</th>
								<th>회원상태</th>
								<th>신고처리상태</th>
							</tr>
							</tr>
								<c:forEach var="rp" items="${ list }">
									<tr class="contentTR">
										<td align ="center">${ rp.reportNo }</td>
										<td align ="center">${ rp.reportMid }</td>				
										<td align ="center">${ rp.reportReason}</td>	
										<td align ="center">${ rp.mid}</td>
										<td align ="center">${ rp.reportStatus}</td>		
										<td>
											<input type="button" value="수락" class="stbtn" style="background:green; color:white" >
											<input type="button" value="거절" class="stbtn" style="background:red; color:white">
										</td>
									</tr>
								</c:forEach> 
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