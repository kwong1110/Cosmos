<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보관함 목록</title>
<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/reset.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/plugins/sweetalert/sweetalert.css">
</head>
<body>
	<div class="content">
	    	<div class="modal-header">
				<h2 class="title">쪽지 보관함 목록</h2> 
				<div>
					<span class="cosmos"><c:out value="${ loginUser.birth }"/></span>님
				</div>       		
        	</div>	
        	<div class="modal-body">
        		<h3 align="center">총 쪽지 갯수 : ${ pi.listCount }</h3>
	
				<table border="1" id="tb">
					<tr style="background: yellowgreen;">
						<th>번호</th>
						<th>보낸사람</th>
						<th width="300">제목</th>
						<th>날짜</th>
					</tr>
					<c:forEach var="n" items="${ nList }">
					<tr class="contentTR">
						<td align="center">${ n.noteNo }</td>
						<td align="center">
							<c:url var="nInsert" value="noteInsertView.mp">
								<c:param name="noteToId" value="${n.noteFromId}"/>
							</c:url>
							<a href="${nInsert}">${ n.noteFromId }</a>
						</td>
						<td align="left">
							<c:url var="ndetail" value="noteDetail.mp">
								<c:param name="noteNo" value="${ n.noteNo }"/>
								<c:param name="page" value="${ pi.currentPage }"/>
							</c:url>
							<a href="${ ndetail }">${ n.noteContent }</a>
						</td>
						<td align="center">${ n.noteTime }</td>
					</tr>
					</c:forEach>
				</table>
        	</div>
        	
        	<div>
        		<button onclick="location.href='noteInsertView1.mp';">쪽지 보내기</button>
        		<button onclick="location.href='noteStorageList.mp';">보관함</button>
        	</div>
        	<div class="modal-footer">
        		<!-- 페이징  -->
				<nav>
					  <ul class="pagination">
					  <!-- 맨 처음으로 -->
						<li>
							<c:if test="${ pi.currentPage eq pi.startPage }">
								<a aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</c:if>
							<c:if test="${ pi.currentPage ne pi.startPage }">
								<c:url var="start" value="noteList.mp">
									<c:param name="userId" value="${loginUserId}"/>
									<c:param name="page" value="${ pi.startPage }"/>
								</c:url>
								<a href="${ start }" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</c:if>
						</li>
						
						<!-- 이전  -->
						<li>
							<c:if test="${ pi.currentPage <= 1 }">
								<a aria-label="Previous">
									<span aria-hidden="true">&lt;</span>
								</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="noteList.mp">
									<c:param name="userId" value="${loginUserId}"/>
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								</c:url>
								<a href="${ before }" aria-label="Previous">
									<span aria-hidden="true">&lt;</span>
								</a>
							</c:if>
						</li>
						
						<!-- 페이지 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<li><a>${ p }</a></li>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="noteList.mp">
									<c:param name="userId" value="${loginUserId}"/>
									<c:param name="page" value="${ p }"/>
								</c:url>
								<li><a href="${ pagination }">${ p }</a></li>
							</c:if>
						</c:forEach>
						
						<!-- 다음으로 -->
						<li>
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								<a aria-label="Next">
									<span aria-hidden="true">&gt;</span>
								</a>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="after" value="noteList.mp">
									<c:param name="userId" value="${loginUser.id}" />
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url>
								<a href="${ after }" aria-label="Next">
									<span aria-hidden="true">&gt;</span>
								</a>
							</c:if>
						</li>
						
						<!-- 마지막으로 -->
						<li>
							<c:if test="${ pi.currentPage eq maxPage }">
								<a aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</c:if>
							<c:if test="${ pi.currentPage ne maxPage }">
								<c:url var="max" value="noteList.mp">
									<c:param name="userId" value="${ loginUser.id }"/>
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
</body>
<script>
	function resizeWindow(win) {
		var wid = win.document.body.offsetWidth + 80;
		var hei = win.document.body.offsetHeight + 100;
		
		win.resizeTo(wid, hei);
	};
	
	
	// sweetalert
	$(function(){
		if("${ successMsg }" != ""){
			sweetSuccess("${ successMsg }");
		}
		
		if("${ updateMsg }" != ""){
			sweetUpdate("${ updateMsg }");
		}
		
	});
	
	
</script>
	<!-- sweet alert -->
<script src="${contextPath}/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${contextPath}/resources/js/plugins/sweetalert/sweetalert.cosmos.js"></script>
</html>