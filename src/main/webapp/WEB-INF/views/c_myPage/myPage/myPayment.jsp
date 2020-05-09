<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="total-wrapper">
		<c:import url="../../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>결제 내역</h1>
				</div>
				<div class="content">
					<table class="table table-hover inner">
						<%-- <c:if test="${ not empty mySeatList || not empty myLectureList }" > --%>
						<tr>
							<th>No.</th>
							<th>참가/예약일</th>
							<th>참가/예약 시간</th>
							<th>장소</th>
							<th>좌석번호</th>
							<th>강의명</th>
							<th>상태</th>
						</tr>
						<c:forEach var="msl" items="${ mySeatList }">
							<tr class="contentTR">
								<td>${ msl.reserNo }</td>
								<td>${ msl.reserDay } ~ ${ msl.finishDay }</td>
								<td>${ msl.startTime }시 ~ ${ msl.endTime }시</td>
								<td>${ msl.branchName }</td>
								<td>
									<c:choose>
										<c:when test="${ msl.reserType eq 'A' }">
											1인석
										</c:when>
										<c:when test="${ msl.reserType eq 'B' }">
											4인석
										</c:when>
										<c:when test="${ msl.reserType eq 'C' }">
											6인석
										</c:when>
										<c:when test="${ msl.reserType eq 'D' }">
											대강연장
										</c:when>
										<c:when test="${ msl.reserType eq 'Z' }">
											1인 고정석
										</c:when>
									</c:choose>
									${ msl.reserSort }-${ msl.seatNo }</td>
								<td> - </td>
								<td>
									<c:choose>
										<c:when test="${ msl.reserYn eq 'Y' }">
											예약 완료
										</c:when>
										<c:when test="${ msl.reserYn eq 'N' }">
											예약 취소
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
						<c:forEach var="mll" items="${ myLectureList }">
							<tr class="contentTR">
								<td>${ mll.lectureNo }</td>
								<td>${ fn:substring(mll.lectureStart,0,10) } ~ ${ fn:substring(mll.lectureEnd,0,10) }</td>
								<td>${ fn:substring(mll.lectureStart,11,13) }시 ~ ${ fn:substring(mll.lectureEnd,11,13) }시</td>
								<td>${ mll.branchName }</td>
								<td> - </td>
								<td>${ mll.lectureTitle }</td>
								<td>
									<c:choose>
										<c:when test="${ mll.lectureStatus eq 'C' }">
											신청 완료
										</c:when>
										<c:when test="${ mll.lectureStatus eq 'R' }">
											강연 취소
										</c:when>
										<c:when test="${ mll.lectureStatus eq 'S' }">
											수강 완료
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
						<%-- </c:if> --%>
						<c:if test="${ empty mySeatList && empty myLectureList }">
							<tr><td>결제내역이 없습니다.</td></tr>
						</c:if>
					</table>
					<!-- 페이징 -->
					<%-- <c:if test="${ pi.endPage > 1 }">
					<div class="inner">
						<ul class="pagination">
							<li>
								<c:if test="${ pi.currentPage eq pi.startPage }">
									<a aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</c:if>
								<c:if test="${ pi.currentPage ne pi.startPage }">
									<c:url var="start" value="lectureHistory.mp">
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
									<c:url var="before" value="lectureHistory.mp">
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
									<c:url var="pagination" value="lectureHistory.mp">
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
									<c:url var="after" value="lectureHistory.mp">
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
									<c:url var="max" value="lectureHistory.mp">
										<c:param name="page" value="${ pi.maxPage }"/>
									</c:url>
									<a href="${ max }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</c:if>
							</li>
						</ul>
					</div>
					</c:if> --%>
				</div>
			</div>
		</div>
		<c:import url="../../a_common/footer.jsp"/>
	</div>
</body>
</html>