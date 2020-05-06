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
				      <tr style=" background:#67A261;">
				         <th>No.</th>
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
				      <c:forEach var="seat" items="${ allList }">
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
										<c:if test="${ searchText eq null }">
											<c:set var="loc" value="/allSeat.se" scope="page"/>
										</c:if>
										<c:if test="${ searchText ne null }">
											<c:set var="loc" value="/seatStatus.se" scope="page"/>
										</c:if>
										<li>
											<c:if test="${ pi.currentPage eq pi.startPage }">
												<a aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
												</a>
											</c:if>
											<c:if test="${ pi.currentPage ne pi.startPage }">
												<c:url var="start" value="${ loc }">
													<c:if test="${ searchValue ne null }">
														<c:param name="searchType" value="${ searchType }"/>
														<c:param name="searchText" value="${ searchText }"/>
													</c:if>
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
												<c:url var="before" value="${ loc }">
													<c:if test="${ searchValue ne null }">
														<c:param name="searchType" value="${ searchType }"/>
														<c:param name="searchText" value="${ searchText }"/>
													</c:if>
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
												<c:url var="pagination" value="${ loc }">
													<c:if test="${ searchValue ne null }">
														<c:param name="searchType" value="${ searchType }"/>
														<c:param name="searchText" value="${ searchText }"/>
													</c:if>									
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
												<c:url var="after" value="${ loc }">
													<c:if test="${ searchValue ne null }">
														<c:param name="searchType" value="${ searchType }"/>
														<c:param name="searchText" value="${ searchText }"/>
													</c:if>
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
												<c:url var="max" value="${ loc }">
													<c:if test="${ searchValue ne null }">
														<c:param name="searchType" value="${ searchType }"/>
														<c:param name="searchText" value="${ searchText }"/>
													</c:if>
													<c:param name="page" value="${ pi.maxPage }"/>
												</c:url>
												<a href="${ max }" aria-label="Next">
													<span aria-hidden="true">&raquo;</span>
												</a>
											</c:if>
										</li>
									</ul>
					        </div>
					       		 <div class="inner" id="searchArea">
									<div class="searchForm">
									<!-- 비율은 본인 스타일대로 수정해서 사용하세요 -->
									<select style="width: 22%;" id="searchType" class="form-control search-select">
										<optgroup label="분류">
											<!-- <option value="all">전체</option> -->
											<option value="id">아이디</option>
											<option value="branchName">예약지점</option>
										</optgroup>
									</select>
									<div class="input-group search-text" style="width: 78%;">
										<input type="text" id="searchText" class="form-control" style="border: none;" placeholder="검색어를 입력하세요.">
										<span class="input-group-btn">
											<button class="btn search-submit" id="allSearchBtn" type="button">검색</button>
										</span>
									</div><!-- /input-group -->
									</div>
								 </div>
									<script>
										$('#allSearchBtn').on('click', function(){
											var searchType = $('#searchType').val();
											var searchText = $('#searchText').val();
																				
											location.href="seatStatus.se?searchType="+searchType+"&searchText="+searchText;
										});
									</script> 
									 
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	 
</body>
</html>