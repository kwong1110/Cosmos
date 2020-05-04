<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.seatstatus{text-align:center !important; width:100%; border:"1px solid black;"}
	.seatstatus th{text-align:center !important;}
</style>
<body>
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper"> 
			<div class="main">
				<div class="pageTitle">
					<h1>예약현황</h1>
				</div>
				<div class="content">
					<table border="1" class="seatstatus">
				      <tr style="border-bottom:1px solid black;">
				         <th>예약번호</th>
				         <th>예약인원</th>
				         <th>시작날짜</th>
				         <th>종료날짜</th>
				         <th>시작시간</th>
				         <th>종료시간</th>
				         <th>예약지점</th>
				         <th>아이디</th>
				         <th>자리유형</th>
				         <th>자리번호</th>
				         <th>예약분류</th>
				         <th>총요금</th>
				      </tr>
				      <c:forEach var="seat" items="${ seatStatusList }">
				      	<tr>
				      		<td>${ seat.reserNo }</td>
				      		<td>${ seat.reserPeople }</td>
				      		<td>${ seat.reserDay }</td>
				      		<td>${ seat.finishDay }</td>
				      		<td>${ seat.startTime }:00</td>
				      		<td>${ seat.endTime }:00</td>
				      		<td>${ seat.branchName }</td>
				      		<td>${ seat.id }</td>
				      		<td>${ seat.reserSort }</td>
				      		<td>${ seat.seatNo }</td>
				      		<td>${ seat.reserType }</td>
				      		<td>${ seat.totalFee }</td>
				      	</tr>
				      </c:forEach>
				      
				   </table>
				   
				  	 <div class="searchPaging" style="text-align:center;">
									  <ul class="pagination">
										<li>
											<c:if test="${ pi.currentPage eq pi.startPage }">
												<a aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
												</a>
											</c:if>
											<c:if test="${ pi.currentPage ne pi.startPage }">
												<c:url var="start" value="seatStatus.se">
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
												<c:url var="before" value="seatStatus.se">
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
												<c:url var="pagination" value="seatStatus.se">
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
												<c:url var="after" value="seatStatus.se">
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
												<c:url var="max" value="seatStatus.se">
													<c:param name="page" value="${ pi.maxPage }"/>
												</c:url>
												<a href="${ max }" aria-label="Next">
													<span aria-hidden="true">&raquo;</span>
												</a>
											</c:if>
										</li>
									</ul>
					        </div>
					       		  <div id="searchArea" align="center">
										<label>검색 조건</label> 
										<select id="searchCondition" name="searchCondition">
											<option>-------</option>
											<option value="branchName">예약지점</option>
											<option value="id">아이디</option>
										</select>
										
										<input id="searchValue" type="search">
										<button onclick="searchKeyword();">검색하기</button>
									</div>
									
									<!-- <script type="text/javascript">
										function searchKeyword(){
											var searchCondition = $("#searchCondition").val();
											var searchValue = $("#searchValue").val();
											
											location.href="seatStatus.se?searchCondition="+searchCondition+"&searchValue="+searchValue;
										}
									</script>  -->
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
</body>
</html>