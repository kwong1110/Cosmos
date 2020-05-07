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
	.adminList{
		width:600px;padding-top:50px;
	}
	div.adminList ul.nav-tabs {
		border-bottom-color: transparent;
	}
	
	div.adminList ul.nav-tabs {
		margin-bottom :30px;
		display:flex;
		justify-content: space-between;
	}
	
	div.adminList ul.nav-tabs>li {
		flex : 2 1 auto;
	}
	
	div.adminList ul.nav-tabs>li>a {
	    margin-right: 3px;
	    line-height: 1.42857143;
	    background-color: rgba(255, 255, 255, 0.5);
	    border: 1px solid #ddd;
	    border-radius: 4px 4px 0 0;
	    font-family: 'Binggrae';
	    text-align : center;
	}
	
 	div.adminList ul.nav-tabs>li.active>a:focus, div.content ul.nav-tabs>li.active>a:hover {
	    color: #555;
	    cursor: default;
	    background-color: #fff;
	    border: 1px solid #ddd;
	} 
	
	.nav>li>a {
	    position: relative;
	    display: block;
	    padding: 10px 15px;
	}
	
 table.inner{
  	width: 70%;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
 /*  margin : 20px 10px; */
  valign:middle-aign;	
}
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
    background:#67A261;
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
/*페이징*/
	.pagination a{border:none !important; background:transparent !important; color:black !important; width:43px !important; cursor:pointer !important;}
	.pagination .pageBtn{width:35px !important; height:35px !important;}
	.pagination .selectPageBtn{border-radius:50% !important; background:rgb(255,0,0,0.1) !important;}

</style>
</head>
<body>
	<div class="total-wrapper">
	<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div  align="center">	
				<div class="adminList" style="margin-bottom:0px;">
					<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a href="adminPage.ap">본점관리자</a></li>
						<li role="presentation"><a href="reportList.ap">신고 목록</a></li>
						<li role="presentation"><a href="branchList.ap">지점 목록</a></li>
						<li role="presentation"><a href="enrollBranch.ap">지점 등록</a></li>
						<li role="presentation"><a href="allSeat.se">예약 현황</a></li>
					</ul>
				</div>
			</div>
			<hr>
				<div class="main admin" style="padding:0px;" align="center">
					<div class="pageTitle" align="center">
						<h1>지점 목록</h1>
						<br>
						<h4 align="center" class="countlist"> 등록된 지점 수 :  ${ pi.listCount } </h4>
					</div>
					
					<div class="content" align="center">
						<table class="inner" >
								<tr >
									<th>No.</th>
									<th>지점 명</th>
									<th>지점 ID</th>
								</tr>
								<c:forEach var="vr" items="${ list }">
									<tr class="contentTR">
										<td align ="center">${ vr.branchNo }</td>
										<td align ="center">${ vr.branchName }</td>				
										<td align ="center">${ vr.masterId}</td>	
									</tr>
								</c:forEach> 
						</table>
						<div id="bottomArea" class="inner" align="center">
						<!-- 페이징  -->
 						<ul class="pagination">
                              <li>
                                 <c:if test="${ pi.currentPage eq pi.startPage }">
                                    <a aria-label="Previous">
                                        <span aria-hidden="true" class="icon-fast-backward"></span>
                                    </a>
                                 </c:if>
                                 <c:if test="${ pi.currentPage ne pi.startPage }">
                                    <c:url var="start" value="branchList.ap">
                                       <c:param name="page" value="${ pi.startPage }"/>
                                    </c:url>
                                    <a href="${ start }" aria-label="Previous">
                                       <span aria-hidden="true" class="icon-fast-backward"></span>
                                    </a>
                                 </c:if>
                              </li>
                              <li>
                                 <c:if test="${ pi.currentPage <= 1 }">
                                    <a aria-label="Previous">
                                       <span aria-hidden="true" class="icon-to-start"></span>
                                    </a>
                                 </c:if>
                                 <c:if test="${ pi.currentPage > 1 }">
                                    <c:url var="before" value="branchList.ap">
                                       <c:param name="page" value="${ pi.currentPage - 1 }"/>
                                    </c:url>
                                    <a href="${ before }" aria-label="Previous">
                                       <span aria-hidden="true" class="icon-to-start"></span>
                                    </a>
                                 </c:if>
                              </li>
                              <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                 <c:if test="${ p eq pi.currentPage }">
                                    <li><a class="pageBtn selectPageBtn">${ p }</a></li>
                                 </c:if>
                                 <c:if test="${ p ne pi.currentPage }">
                                    <c:url var="pagination" value="branchList.ap">
                                       <c:param name="page" value="${ p }"/>
                                    </c:url>
                                    <li><a href="${ pagination }">${ p }</a></li>
                                 </c:if>
                              </c:forEach>
                              <li>
                                 <c:if test="${ pi.currentPage >= pi.maxPage }">
                                    <a aria-label="Next">
                                       <span aria-hidden="true" class="icon-to-end"></span>
                                    </a>
                                 </c:if>
                                 <c:if test="${ pi.currentPage < pi.maxPage }">
                                    <c:url var="after" value="branchList.ap">
                                       <c:param name="page" value="${ pi.currentPage + 1 }"/>
                                    </c:url>
                                    <a href="${ after }" aria-label="Next">
                                       <span aria-hidden="true" class="icon-to-end"></span>
                                    </a>
                                 </c:if>
                              </li>
                              <li>
                                 <c:if test="${ pi.currentPage eq maxPage }">
                                    <a href="#" aria-label="Next">
                                       <span aria-hidden="true" class="icon-fast-forward"></span>
                                    </a>
                                 </c:if>
                                 <c:if test="${ pi.currentPage ne maxPage }">
                                    <c:url var="max" value="branchList.ap">
                                       <c:param name="page" value="${ pi.maxPage }"/>
                                    </c:url>
                                    <a href="${ max }" aria-label="Next">
                                        <span aria-hidden="true" class="icon-fast-forward"></span>
                                    </a>
                                 </c:if>
                              </li>
                           </ul>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
</body>
</html>