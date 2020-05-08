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
<link rel="stylesheet" href="${contextPath}/resources/css/fontello.css">
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
					<span class="cosmos"><c:out value="${ loginUser.nick }"/>님</span>
					| 쪽지 보관함 <span class="note-total">(총 쪽지 갯수 : ${ pi.listCount })</span> 
					</h2>
				</div>      		
        	</div>	
        	<div class="note-body">
        	
        		<div class="form-area clear-fix">
        			<input type="hidden" id="userId" name="userId" value="${loginUser.id}">
	        		<!-- 드롭다운 + 검색 -->
					<form method="get" action="" class="category">
						<!-- 비율은 본인 스타일대로 수정해서 사용하세요 -->
						<select class="form-control" id="menuCondition" name="menuCondition"><!--  search-select -->
							<option value="total" <c:if test="${menuCondition == 'total'}">selected='selected'</c:if>>전체 쪽지</option>
							<option value="to" <c:if test="${menuCondition == 'to'}">selected='selected'</c:if>>받은 쪽지</option>
							<option value="from" <c:if test="${menuCondition == 'from'}">selected='selected'</c:if>>보낸 쪽지</option>
							<option value="tome" <c:if test="${menuCondition == 'tome'}">selected='selected'</c:if>>내게 보낸 쪽지</option>
						</select>
					</form>
	        		<!-- 검색창 -->
				  	<!-- 드롭다운 + 검색 -->
					<form method="get" action="">
						<!-- 비율은 본인 스타일대로 수정해서 사용하세요 -->
						<select class="form-control" id="searchCondition" name="searchCondition"><!--  search-select -->
							<option>검색</option>
							<option value="id">아이디</option>
							<option value="nick">닉네임</option>
							<option value="content">내용</option>
						</select>
						<div class="input-group"><!-- search-text -->
							<input type="text" class="form-control" placeholder="검색어를 입력하세요." id="searchValue" name="searchValue">
							<span class="input-group-btn">
								<button class="btn search-submit" style="border:1px solid #ccc" type="button" onclick="searchNote();">검색</button>
							</span>
						</div><!-- /input-group -->
					</form>
				</div>
				<table class="table table-hover">
					<thead class="thead">
						<tr>
							<th style="width:70px;"><input type="checkbox" name="chkNoAll"> 번호</th>
							<th style="width:200px;">보낸사람</th>
							<th style="width:240px;">제목</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody class="tbody">
						<c:forEach var="n" items="${ nList }">
						<tr>
							<td>
								<input type="checkbox" name="chkNo" value="${ n.noteNo }" id="chk">
								${ n.noteNo }
							</td>
							<c:if test="${n.noteFromId eq loginUser.id }"> <!-- 보낸 편지 -->
								<td style="color:#4188e2;">
									${ n.nick }(${n.noteFromId})
								</td>
							</c:if>
							<c:if test="${n.noteFromId ne loginUser.id }"> <!-- 받은 편지 -->
								<td style="color:green;">
									${ n.nick }(${n.noteFromId})
								</td>
							</c:if>
							<td>
								<div class="contentTD">
								<c:url var="ndetail" value="noteDetail.mp">
									<c:param name="noteNo" value="${ n.noteNo }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
								<a href="${ ndetail }">${ n.noteContent }</a>
								</div>
							</td>
							<td>${ n.noteTime }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
        	</div>
        	
        	<%-- <c:url var="noteDelete" value="noteDelete.mp">
				<c:param name="noteNo" value="${note.noteNo}"/>
			</c:url> --%>
			<c:url var="noteList" value="noteList.mp">
				<c:param name="userId" value="${loginUser.id}"/>
			</c:url>
        	<div class="btn-box">
        		<button class="btn btnNote" onclick="toDeleteNote();">삭제</button>
        		<button type="button" class="btn btnNote" onclick="location.href='${noteList}'">목록으로</button>
        	</div>
        	
        	
        	<div class="note-footer">
        		<!-- 페이징  -->
				<nav>
					  <ul class="pagination">
					  <c:if test="${searchValue eq null && menuCondition eq null}"><!-- 검색 안 한것 전체 값 가지고 오기 -->
					  	<c:set var="loc" value="noteStoreList.mp" scope="page"/>
					  </c:if>
					  <c:if test="${searchValue ne null && menuCondition eq null} "><!-- 검색을 했고, 분류는 하지 않았다면 search.mp로 검색해서 가지고 오기 -->
					  	<c:set var="loc" value="searchStore.mp" scope="page"/>
					  </c:if>
					  <c:if test="${menuCondition ne null && searchValue eq null} "><!-- 분류를 했다면 -->
					  	<c:set var="loc" value="noteMenuStore.mp" scope="page"/>
					  </c:if>
					  
					  <!-- 맨 처음으로 -->
						<li>
							<c:if test="${ pi.currentPage eq pi.startPage }">
								<a aria-label="Previous">
									<span class="icon-fast-backward"></span>
								</a>
							</c:if>
							<c:if test="${ pi.currentPage ne pi.startPage }">
								<c:url var="start" value="${loc}">
									<c:if test="${searchValue ne null && menuCondition eq null}">
										<c:param name="searchCondition" value="${ searchCondition }"/>
										<c:param name="searchValue" value="${ searchValue }"/>
									</c:if>
									<c:if test="${menuCondition ne null && searchValue eq null}">
										<c:param name="menuCondition" value="${menuCondition}"/>
									</c:if>
									<c:param name="userId" value="${loginUser.id}"/>
									<c:param name="page" value="${ pi.startPage }"/>
								</c:url>
								<a href="${ start }" aria-label="Previous">
									<span class="icon-fast-backward"></span>
								</a>
							</c:if>
						</li>
						
						<!-- 이전  -->
						<li>
							<c:if test="${ pi.currentPage <= 1 }">
								<a aria-label="Previous">
									<span class="icon-to-start"></span>
								</a>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<%-- <c:url var="before" value="noteList.mp"> --%>
								<c:url var="before" value="${loc}">
									<c:if test="${searchValue ne null && menuCondition eq null}">
										<c:param name="searchCondition" value="${ searchCondition }"/>
										<c:param name="searchValue" value="${ searchValue }"/>
									</c:if>
									<c:if test="${menuCondition ne null && searchValue eq null}">
										<c:param name="menuCondition" value="${menuCondition}"/>
									</c:if>
									<c:param name="userId" value="${loginUser.id}"/>
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								</c:url>
								<a href="${ before }" aria-label="Previous">
									<span class="icon-to-start"></span>
								</a>
							</c:if>
						</li>
						
						<!-- 페이지 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<li><a class="pageBtn selectPageBtn">${ p }</a></li>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="${loc}">
									<c:if test="${searchValue ne null && menuCondition eq null}">
										<c:param name="searchCondition" value="${ searchCondition }"/>
										<c:param name="searchValue" value="${ searchValue }"/>
									</c:if>
									<c:if test="${menuCondition ne null && searchValue eq null}">
										<c:param name="menuCondition" value="${menuCondition}"/>
									</c:if>
									<c:param name="userId" value="${loginUser.id}"/>
									<c:param name="page" value="${ p }"/>
								</c:url>
								<li><a href="${ pagination }">${ p }</a></li>
							</c:if>
						</c:forEach>
						
						<!-- 다음으로 -->
						<li>
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								<a aria-label="Next">
									<span class="icon-to-end"></span>
								</a>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="after" value="${loc}">
									<c:if test="${searchValue ne null && menuCondition eq null}">
										<c:param name="searchCondition" value="${ searchCondition }"/>
										<c:param name="searchValue" value="${ searchValue }"/>
									</c:if>
									<c:if test="${menuCondition ne null && searchValue eq null}">
										<c:param name="menuCondition" value="${menuCondition}"/>
									</c:if>
									<c:param name="userId" value="${loginUser.id}" />
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url>
								<a href="${ after }" aria-label="Next">
									<span class="icon-to-end"></span>
								</a>
							</c:if>
						</li>
						
						<!-- 마지막으로 -->
						<li>
							<c:if test="${ pi.currentPage eq maxPage }">
								<a aria-label="Next">
									<span class="icon-fast-forward"></span>
								</a>
							</c:if>
							<c:if test="${ pi.currentPage ne maxPage }">
								<c:url var="max" value="${loc}">
									<c:if test="${searchValue ne null && menuCondition eq null}">
										<c:param name="searchCondition" value="${ searchCondition }"/>
										<c:param name="searchValue" value="${ searchValue }"/>
									</c:if>
									<c:if test="${menuCondition ne null && searchValue eq null}">
										<c:param name="menuCondition" value="${menuCondition}"/>
									</c:if>
									<c:param name="userId" value="${ loginUser.id }"/>
									<c:param name="page" value="${ pi.maxPage }"/>
								</c:url>
								<a href="${ max }" aria-label="Next">
									<span class="icon-fast-forward"></span>
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
	
	// 검색
	function searchNote(){
		var searchCondition = $("#searchCondition").val();
		var searchValue = $("#searchValue").val();
		var userId = $("#userId").val();
		
		location.href="searchStore.mp?searchCondition=" + searchCondition + "&searchValue=" + searchValue + "&userId=" + userId;
	}
	
	// 분류
	$("#menuCondition").change(function(){
		var menuCondition = $("#menuCondition").val();
		var userId = $("#userId").val();
		
		location.href="noteMenuStore.mp?menuCondition=" + menuCondition + "&userId=" + userId;
	});
	
	// 여러 개 선택한 쪽지 삭제
	function toDeleteNote(){
		var noteNo;
		$("#chk:checked").each(function(){
			
			noteNo += "," + $(this).val();
		});
		
		var noteNos = noteNo.split(",");
		noteNos.shift();
		
		location.href="noteDelete2.mp?noteNos=" + noteNos;
	}
	
</script>
	<!-- sweet alert -->
<script src="${contextPath}/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${contextPath}/resources/js/plugins/sweetalert/sweetalert.cosmos.js"></script>
</html>