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
<link rel="stylesheet" href="${contextPath}/resources/css/note.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/plugins/sweetalert/sweetalert.css">
</head>
<body class="body">
	<div class="content">
	    	<div class="note-header">
	    	<div>
					<h2 class="title">
					<span class="cosmos"><c:out value="${ loginUser.id }"/>님</span>
					| 쪽지 보관함 <span class="note-total">(총 쪽지 갯수 : ${ pi.listCount })</span> 
					</h2>
				</div>      		
        	</div>	
        	<div class="note-body">
        		<div class="form-area clear-fix">
	        		<!-- 드롭다운 + 검색 -->
					<form method="get" action="" class="category">
						<!-- 비율은 본인 스타일대로 수정해서 사용하세요 -->
						<select class="form-control"><!--  search-select -->
							<option value="total">전체 쪽지</option>
							<option value="from">받은 쪽지</option>
							<option value="to">보낸 쪽지</option>
							<option value="me">내게 보낸 쪽지</option>
						</select>
					</form>
	        		<!-- 검색창 -->
				  	<!-- 드롭다운 + 검색 -->
					<form method="get" action="">
						<!-- 비율은 본인 스타일대로 수정해서 사용하세요 -->
						<select class="form-control"><!--  search-select -->
							<option>검색</option>
							<option>아이디</option>
							<option>별명</option>
							<option>내용</option>
						</select>
						<div class="input-group"><!-- search-text -->
							<input type="text" class="form-control" placeholder="검색어를 입력하세요.">
							<span class="input-group-btn">
								<button class="btn search-submit" style="border:1px solid #ccc" type="button">검색</button>
							</span>
						</div><!-- /input-group -->
					</form>
				</div>
				<table class="table table-hover">
					<thead class="thead">
						<tr>
							<th>번호</th>
							<th>보낸사람</th>
							<th width="300">제목</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody class="tbody">
						<c:forEach var="n" items="${ nList }">
						<tr class="contentTR">
							<td>${ n.noteNo }</td>
							<td>
								<c:url var="nInsert" value="noteInsertView.mp">
									<c:param name="noteToId" value="${n.noteFromId}"/>
								</c:url>
								<a href="${nInsert}">${ n.noteFromId }</a>
							</td>
							<td class="contentTD">
								<c:url var="ndetail" value="noteDetail.mp">
									<c:param name="noteNo" value="${ n.noteNo }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
								<a href="${ ndetail }">${ n.noteContent }</a>
							</td>
							<td>${ n.noteTime }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
        	</div>
        	
        	<c:url var="noteDelete" value="noteDelete.mp">
				<c:param name="noteNo" value="${note.noteNo}"/>
			</c:url>
			<c:url var="noteList" value="noteList.mp">
				<c:param name="userId" value="${loginUser.id}"/>
			</c:url>
        	<div class="btn-box">
        		<button class="btn btnNote" onclick="location.href='noteDelete.mp'">삭제</button>
        		<button type="button" class="btn btnNote" onclick="location.href='${noteList}'">목록으로</button>
        	</div>
        	<c:url var="noteList" value="noteList.mp">
				<c:param name="userId" value="${loginUser.id}"/>
			</c:url>
        	<div class="note-footer">
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
	/* function resizeWindow(win) {
		var wid = win.document.body.offsetWidth + 80;
		var hei = win.document.body.offsetHeight + 100;
		
		win.resizeTo(wid, hei);
	}; */
	
	
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