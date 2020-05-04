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


.countlist{
	text-decoration: underline;
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
						<br>
						<h4 align="center" class="countlist">총 신고된 회원 수 :  ${ pi.listCount } </h4>
					</div>
					
					<div class="content" align="center">
						<table class="inner">
							<tr >
								<th>No.</th>
								<th>신고당한 회원 ID</th>
								<th>신고 사유</th>
								<th>신고한 회원 ID</th>
								<th>신고날짜</th>
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
										<td align ="center">${ rp.reportDate}</td>
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
<!-- 페이징  -->
 						<ul class="pagination">
                              <li>
                                 <c:if test="${ pi.currentPage eq pi.startPage }">
                                    <a aria-label="Previous">
                                       <span aria-hidden="true">&laquo;</span>
                                    </a>
                                 </c:if>
                                 <c:if test="${ pi.currentPage ne pi.startPage }">
                                    <c:url var="start" value="reportList.ap">
                                       <c:param name="page" value="${ pi.startPage }"/>
                                    </c:url>
                                    <a href="${ start }" aria-label="Previous">
                                       <span aria-hidden="true">&laquo;</span>
                                    </a>
                                 </c:if>
                              </li>
                              <li>
                                 <c:if test="${ pi.currentPage <= 1 }">
                                    <a aria-label="Previous">
                                       <span aria-hidden="true">&lt;</span>
                                    </a>
                                 </c:if>
                                 <c:if test="${ pi.currentPage > 1 }">
                                    <c:url var="before" value="reportList.ap">
                                       <c:param name="page" value="${ pi.currentPage - 1 }"/>
                                    </c:url>
                                    <a href="${ before }" aria-label="Previous">
                                       <span aria-hidden="true">&lt;</span>
                                    </a>
                                 </c:if>
                              </li>
                              <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                 <c:if test="${ p eq pi.currentPage }">
                                    <li><a>${ p }</a></li>
                                 </c:if>
                                 <c:if test="${ p ne pi.currentPage }">
                                    <c:url var="pagination" value="reportList.ap">
                                       <c:param name="page" value="${ p }"/>
                                    </c:url>
                                    <li><a href="${ pagination }">${ p }</a></li>
                                 </c:if>
                              </c:forEach>
                              <li>
                                 <c:if test="${ pi.currentPage >= pi.maxPage }">
                                    <a aria-label="Next">
                                       <span aria-hidden="true">&gt;</span>
                                    </a>
                                 </c:if>
                                 <c:if test="${ pi.currentPage < pi.maxPage }">
                                    <c:url var="after" value="reportList.ap">
                                       <c:param name="page" value="${ pi.currentPage + 1 }"/>
                                    </c:url>
                                    <a href="${ after }" aria-label="Next">
                                       <span aria-hidden="true">&gt;</span>
                                    </a>
                                 </c:if>
                              </li>
                              <li>
                                 <c:if test="${ pi.currentPage eq maxPage }">
                                    <a href="#" aria-label="Next">
                                       <span aria-hidden="true">&raquo;</span>
                                    </a>
                                 </c:if>
                                 <c:if test="${ pi.currentPage ne maxPage }">
                                    <c:url var="max" value="reportList.ap">
                                       <c:param name="page" value="${ pi.maxPage }"/>
                                    </c:url>
                                    <a href="${ max }" aria-label="Next">
                                       <span aria-hidden="true">&raquo;</span>
                                    </a>
                                 </c:if>
                              </li>
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