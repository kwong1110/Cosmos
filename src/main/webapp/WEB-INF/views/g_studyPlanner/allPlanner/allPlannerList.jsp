<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두의 플래너</title>
<style>

	.modal-dialog.modal-80size {
		width: 60%; 
		height: auto; 
		margin: 0; 
		padding: 0;
	}
	.modal-content.modal-80size {
		height: auto; 
	}
	.modal {
		text-align: center;
	}
	@media screen and (min-width: 768px) {
  	.modal:before {
  		display: inline-block; 
  		vertical-align: middle; 
  		content: " ";height: 95%;
  		}
	}
	.modal-dialog {
		display: inline-block; 
		text-align: left; 
		vertical-align: middle;
	}

	/* 배경색 변경 */
	.modalCustom{
		background-color: rgb(254, 245, 198) !important;
	}
	
	.modalCustom>.modal-header{
		background-color: rgb(23, 149, 95);
		border-top-left-radius: 6px;
		border-top-right-radius: 6px;
	}
	.modal-title{
		color: white;
		width:100%; 
		text-align:center;
		margin:10px;
		font-size: 25px;
	}
	
	/* 테이블 */
	table>tbody>tr>th{
		letter-spacing: 0.1em;
		white-space: nowrap;
	}
	table>tbody>tr>td,.reReplyTable>tr>td{
		line-height: 10px;
	}
	table>tbody>tr>td>input,
	table>tbody>tr>th>input,
	table>tbody>tr>td>select{
		width: 100%;
		height: auto;
		line-height: auto;
		border: 0;
		background-color: rgb(255, 255, 224);
	}
	table>tbody>tr>td>textarea,.reReplyTable>tr>td>textarea{
		width: 99%;
		margin: 0 5px 0 5px;
		border: 0;
		resize: none;
		background-color: rgb(255, 255, 224);
	}
	.input-daterange-timepicker{
		background-color: rgb(255, 255, 224) !important;
	}
	
	input:read-only {
		background-color: rgb(247, 239, 193);
	}
	
	.exception>input {
		width: auto;
		height: auto;
	}
	
	/* 검색 부분 */
	#searchArea {
		width: 100%; 
		display: inline-block; 
		text-align: center;
	}
	#categoryBtn{width:200px; display:inline-block; text-align:center;}
	#categoryHiddenArea{width:100%; display:inline; text-align:center;}
	.categoryDiv{width:100%; min-height:40px; border-radius:8px; margin-top:5px; padding-top:10px; padding-bottom:10px; padding-left:30px; vertical-align: middle; display:inline-block; text-align:left; background-color:lightgray;}
	.categoryLabel{width:115px; cursor:pointer; margin:0; padding:0; margin-right:50px;float:left; line-height:1.7;}
	.pointer{cursor:pointer;}
	
	/* 모달창 스크롤바 */ 
	.modal-dialog { 
		overflow-y: initial !important 
	} 
	.modal-body { 
		height: 100%; 
		overflow-y: auto; 
	}
		/* 모달창 코스모스 스크롤바 추가*/
	.modal-body::-webkit-scrollbar{width: 16px;}
	.modal-body::-webkit-scrollbar-track {/*background-color:rgb(254, 245, 198);*/ background-image: linear-gradient(to right, transparent 0px, transparent 8px, rgb(23, 149, 95) 8px, rgb(23, 149, 95) 9px, transparent 9px, transparent 0px)}
	.modal-body::-webkit-scrollbar-thumb {background-color:rgb(23, 149, 95);border-radius: 10px;}
	.modal-body::-webkit-scrollbar-thumb:hover {background: rgb(23, 149, 95);}
	.modal-body::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:rgb(254, 245, 198); display: none;} 
	
	/* 댓글 창 */
	.replyTable>td{
		margin:0;
		padding:0;
	}
	.replyTA{
		overflow: hidden; 
		line-height: 14px; 
		height: 41px;
		border-radius: 8px;
	}
	.replyBtn{
		line-height: 14px; 
		height: 41px;
		width: 100%;
	}
	
	.r1{
		width:90%;
	}
	
	.smallReply {
		width: 120px; 
		font-size: 1.4rem; 
		padding: 0 !important;
	}
	
	.smallReply>a {
		display: inline-block;
		cursor: pointer;
	}
	
	.reReply {
		font-size: 1.2rem;
		cursor: pointer;
		background: url("<%= request.getContextPath() %>/resources/image/re_arr.png") no-repeat 0 0;
		padding-left: 10px;
		float: right;
	}
	
	.reReplyInsert{
		background: url("<%= request.getContextPath() %>/resources/image/re_arr2.gif") no-repeat 0 0;
		float: right;
		width: 10px;
    	height: 40px;
	}
	.reReplyTable{
		background-color: rgb(254, 245, 198) !important;
		padding: 0 !important;
		margin: 0 !important;
	}
</style>
</head>
<body>
	<div class="total-wrapper">
		<c:import url="../../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>모두의 플래너</h1>
				</div>
				<div class="content">
					<!-- 검색 -->
					<div class="inner" id="searchArea">
						<div class="searchForm">
						<!-- 비율은 본인 스타일대로 수정해서 사용하세요 -->
						<select style="width: 22%;" id="searchType" class="form-control search-select">
							<option value="title">제목</option>
							<option value="writer">작성자</option>
							<option value="content">내용</option>
						</select>
						<div class="input-group search-text" style="width: 78%;">
							<input type="text" id="searchText" class="form-control" style="border: none;" placeholder="검색어를 입력하세요.">
							<span class="input-group-btn">
								<button class="btn search-submit" id="allSearchBtn" type="button">검색</button>
							</span>
						</div><!-- /input-group -->
						</div>
					</div>
					
					<!-- 카테고리  -->
					<div id="settingArea" class="inner">
						<div id="categoryArea">
							<input type="button" class="defaultBtn" id="categoryBtn" value="카테고리">
							
							<!-- <div id="sortArea">
								<label class="sort" id="hitSort" onclick="categoryClickOption('sort', this);">조회수 순</label>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<label class="sort" id="likeSort" onclick="categoryClickOption('sort', this);">추천 순</label>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<label class="sort" id="replySort" onclick="categoryClickOption('sort', this);">댓글 순</label>
								&nbsp;&nbsp;|&nbsp;&nbsp;
							</div> -->
							
							<div id="categoryHiddenArea">
								<div class="categoryDiv">
									<c:forEach items="${ CstudyList }" var="item" varStatus="status">
										<c:if test="${ (status.count mod 5) eq 1 }">
											<section class="categoryLabel">
												<label class="pointer studyCategory" onclick="categoryClickOption('study', this);">${ item }</label><br>
										</c:if>
										<c:if test="${ (status.count mod 5) ne 1 && (status.count mod 5) ne 0 }">
												<label class="pointer studyCategory" onclick="categoryClickOption('study', this);">${ item }</label><br>
										</c:if>
										<c:if test="${ (status.count mod 5) eq 0 }">
												<label class="pointer studyCategory" onclick="categoryClickOption('study', this);">${ item }</label>
											</section>
										</c:if>
									</c:forEach>
								</div>
								
								<div class="categoryDiv" id="reSerchArea" style="width:65%; vertical-align:middle;">
									<label>결과 내 재검색</label>
									<input type="text" id="reSearchText" class="form-control" style="border: none;" placeholder="검색어를 입력하세요.">
								</div>
									
								<div style="width:35%; min-height:40px; display:inline-block; padding-top:8px; padding-left:10px; vertical-align: top;">
									<input type="button" class="defaultBtn" id="categoryRsetBtn" value="초기화" style="width:37%; height:100%;">
									<input type="button" class="defaultBtn" id="categorySerchBtn" value="검색" style="width:59%; height:100%; margin-left:3px;">
								</div>
							</div>
						</div>
					</div>
					
					<!-- 내용(표) -->
					<table class="table table-hover inner">
						<tr>
							<th>No.</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>추천수</th>
						</tr>
						<c:forEach var="p" items="${ pList }">
							<tr class="contentTR">
								<td>${ p.planNo }</td>
								<td>${ p.studyName }</td>
								<td>${ p.planTitle }</td>
								<td>${ p.nickName }</td>
								<td>${ p.createDate }</td>
								<td>${ p.hit }</td>
								<td>${ p.likeCount }</td>
							</tr>
						</c:forEach>
					</table>
					<!-- 페이징 -->
					<c:if test="${ pi.endPage > 1 }">
					<div class="inner">
						
						<ul class="pagination">
							<c:if test="${ searchText eq null }">
								<c:set var="loc" value="/allPlannerList.sp" scope="page"/>
							</c:if>
							<c:if test="${ searchText ne null }">
								<c:set var="loc" value="/searchPlanner.sp" scope="page"/>
							</c:if>
							<li>
								<c:if test="${ pi.currentPage eq pi.startPage }">
									<a aria-label="Previous">
										<span class="icon-fast-backward"></span>
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
										<span class="icon-fast-backward"></span>
									</a>
								</c:if>
							</li>
							<li>
								<c:if test="${ pi.currentPage <= 1 }">
									<a aria-label="Previous">
										<span class="icon-to-start"></span>
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
										<span class="icon-to-start"></span>
									</a>
								</c:if>
							</li>
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<li><a class="pageBtn selectPageBtn">${ p }</a></li>
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="${ loc }">
										<c:if test="${ searchValue ne null }">
											<c:param name="searchType" value="${ searchType }"/>
											<c:param name="searchText" value="${ searchText }"/>
										</c:if>									
										<c:param name="page" value="${ p }"/>
									</c:url>
									<li><a href="${ pagination }" class="pageBtn">${ p }</a></li>
								</c:if>
							</c:forEach>
							<li>
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									<a aria-label="Next">
										<span class="icon-to-end"></span>
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
										<span class="icon-to-end"></span>
									</a>
								</c:if>
							</li>
							<li>
								<c:if test="${ pi.currentPage eq maxPage }">
									<a href="#" aria-label="Next">
										<span class="icon-fast-forward"></span>
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
										<span class="icon-fast-forward"></span>
									</a>
								</c:if>
							</li>
						</ul>
					</div>
					</c:if>
				</div>
			</div>
		</div>
		<c:import url="../../a_common/footer.jsp"/>
	</div>
	<!-- 플랜  상세보기 MODAL -->
    <div id="viewModal" class="modal fade" tabindex="-1" role="dialog" >
		<div class="modal-dialog modal-80size" role="document">
		    <div class="modal-content modal-80size modalCustom">
		        <div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
		                    aria-hidden="true">&times;</span></button>
		            <h4 class="modal-title">플래너 상세 보기</h4>
		        </div>
		        <div id="modalBody" class="modal-body">
		            <!-- 내용 -->
		            <div>
			            <span>좋아요 수 : </span><span id="like"></span>
						<span>조회 수 : </span><span id="hit"></span>
					</div>
	                <table id="viewPlan" class="table">
						<tr>
							<th>카테고리</th>
							<td>
								<input type="hidden" id="planNo" name="planNo"/>
								<select id="categorySelect" name="studyNo">
									<optgroup label="나의 공부목록">
										<c:forEach var="us" items="${ userStudyList }">
											<c:if test="${ us.studyNo eq 97 || us.studyNo eq 98 || us.studyNo eq 99 }">
												<option value="${ us.studyNo }">${ us.studyEtc }</option>
											</c:if>
											<c:if test="${ us.studyNo ne 97 && us.studyNo ne 98 && us.studyNo ne 99 }">
												<option value="${ us.studyNo }">${ us.studyName }</option>
											</c:if>
										</c:forEach>
									</optgroup>
									<optgroup label="전체 공부목록">
										<c:forEach var="s" items="${ sList }">
									<option value="${ s.studyNo }">${ s.studyName }</option>
										</c:forEach>
									</optgroup>
								</select>
							</td>
							<th>모두의플래너</th>
							<td class="exception">
								<input type="radio" id="open" name="openStatus" value="Y">공개
								<input type="radio" id="close" name="openStatus" value="N">비공개
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input id="title" type="text" name="planTitle"></td>
							<th>종류</th>
							<td class="exception">
								<input type="radio" id="today" name="planMenu" value="TODAY">오늘의 할일
								<input type="radio" id="default" name="planMenu" value="DEFAULT">기본
							</td>
						</tr>
						<tr>
							<th>기간</th>
							<td><input id="planDate" type="text" class="form-control input-daterange-timepicker" name="daterange"></td>
						</tr>
						<tr>
							<th>작성일</th>
							<td id="planCreateDate"></td>
						</tr>
						<tr>
							<td colspan="6" style="padding: 0;">
								<textarea id="content" placeholder="내용" name="planContent"></textarea>
								<c:import url="../../a_common/summernote.jsp"/>
							</td>
						</tr>
					</table>
					
					<!-- 등록된 댓글이 보여지는 곳 -->
					<table class="replyTable table inner" id="rtb">
						<thead>
							<tr>
								<td colspan="3"><b id="rCount"></b></td>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
					
						<table class="replyTable table inner">
						<c:if test="${ !empty sessionScope.loginUser }">
					<!-- 댓글을 등록하는 곳 -->
							<tr>
								<td class="r1"><textarea id="replyContent" class="replyTA"></textarea></td>
								<td><button id="replySubmit" class="defaultBtn replyBtn">등록</button></td>
							</tr>
						</c:if>
						<c:if test="${ empty sessionScope.loginUser }">
							<tr><td>로그인을 하시면 댓글을 등록하실수 있습니다.</td></tr>
						</c:if>
					</table>
             	</div>
		    </div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
<script>
	$(document).ready(function(){
		
		// 클릭시 상세보기
		$('.contentTR').click(function(){
			
			var clickId = $(this).children('td').eq(0).text();
			
			planDetail(clickId);
		});
		
		// 검색 버튼 숨기기
		$('#categoryHiddenArea').css('display', 'none');
		$('#reSerchArea').css('display', 'none');

		// 모달창 스크롤바
		$('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .8) + 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>'); 
		
		// 검색!
		$('#allSearchBtn').on('click', function(){
			
			
			var searchType = $('#searchType').val();
			var searchText = $('#searchText').val();
			
			//console.log(searchType + searchText);
			
			location.href="searchPlanner.sp?searchType="+searchType+"&searchText="+searchText;
		});
		
		// 상세보기 모달 닫을 시 hit 갯수를 위해 리로드
		$('#viewModal').on('hide.bs.modal', function(e){
			
			location.reload();
			
			//이 이벤트는 위 closer를 여러번 호출시 실행되는 함수가 여러번 호출되는 것을 방지하는 이벤트 핸들러
			e.stopImmediatePropagation();
		});
		
		$('#categorySerchBtn').on('click', function(){
			
			
		});
	});
	// ready 끝 //
		
	// 플래너 상세보기
	function planDetail(clickId){
		// console.log("상세보기 planNo 확인 : " + clickId);
		$.ajax({
			url: "planDetail.sp",
			data: { planNo:clickId },
			dataType: 'json',
			success: function(data){
				data.openStatus == 'Y' ? $('#open').attr('checked', 'checked') : $('#close').attr('checked', 'checked');
				data.planMenu == 'TODAY' ? $('#today').attr('checked', 'checked') : $('#default').attr('checked', 'checked');
				$('#categorySelect').val(data.studyNo).prop('selected', true);
				$('#title').val(decodeURIComponent(data.planTitle.replace(/\+/g, ' ')));
				$('#planDate').val(data.planStart + "~" + data.planEnd);
				$('#planCreateDate').text(data.createDate);
				$('#like').text(data.likeCount);
				$('#hit').text(data.hit);
				$('#planNo').val(data.planNo);
				
				$('#content').summernote({
					toolbar: false,
					minHeight: null,             	// 최소 높이  
					maxHeight: null,             	// 최대 높이
					disableResizeEditor: true,		// 사이즈 조절 불가능
					disableResizeBar: true,			// 사이즈바 숨김
					lang: "ko-KR",					// 한글 설정
				});
				$('#content').summernote('code',decodeURIComponent(data.planContent.replace(/\+/g, ' ')));
				$('#content').summernote('disable'); 
				
				// 모든 입력박스 비활성화
				$('#viewPlan').find('input').attr('disabled', true);
				$('#viewPlan').find('select').attr('disabled', true);
				
				// autosize textarea 밑의 라이브러리이용.
				autosize.destroy($(".replyTA"));
				autosize($(".replyTA"));
				$(".replyTA").val("");
				
				// 댓글 리스트 1초마다 불러오기
				$(function(){
					getReplyList();
					/* setInterval(function(){
						getReplyList();
					}, 1000); */
				});
				
				// 댓글 리스트 불러오기
				function getReplyList(){
					var planNo = $("#planNo").val();
					
					$.ajax({
						url: "replyList.sp",
						data: {planNo:planNo},
						dataType: 'json',
						success: function(data){
							$tableBody = $("#rtb tbody");
							$tableBody.html('');
							
							var $tr;
							var $rWriter;
							var $rContent;
							var $rCreateDate;
							
							$('#rCount').text('댓글(' + data.length + ')');
							
							if(data.length > 0){
								for(var i in data){
									$tr = $('<tr class="originReply">');
									$rWriter = $('<td width="100">');
									$rWriter.text(decodeURIComponent(data[i].nickName.replace(/\+/g, ' ')))
											.append($('<input class="replyNo" type="hidden">').val(data[i].replyNo))
											.append($('<input class="reGrpNo" type="hidden">').val(data[i].reGrpNo))
											.append($('<input class="reGrpOrder" type="hidden">').val(data[i].reGrpOrder))
											.append($('<input class="reGrpDepth" type="hidden">').val(data[i].reGrpDepth));
									$rCreateDate = $('<td class="smallReply">').text(data[i].modifyDate)
												.append($('<span class="reReply"><a onclick="reReply(this)">답글</a></span>'));
									$rContent = $('<td>').text(decodeURIComponent(data[i].replyContent.replace(/\+/g, ' ')));
									$rStatus = $('<td class="smallReply"><a onclick="replyUpdate(this);" class="replyUpdate">수정</a>')
										.append($('<span style="margin: 5%;">|</span>'))
										.append($('<a onclick="replyDelete(this);" class="replyDelete">삭제</a>'));
									
									// 답글일 경우
									if(data[i].reGrpDepth > 1){
										$rWriter.prepend($('<span class="reReplyInsert" style="float: left">'))
												.prepend($('<input class="reReplyOn" type="hidden">').val("reReplyOn"));
									}
									
									$tr.append($rWriter);
									$tr.append($rCreateDate);
									$tr.append($rContent);
									$tr.append($rStatus);
									$tableBody.append($tr);
								}
							} else {
								$tr = $('<tr>');
								$rContent = $('<td colspan=3>').text('등록된 댓글이 없습니다.');
								
								$tr.append($rContent);
								$tableBody.append($tr);
							}
						}
					});
				};
				
				$('#viewModal').modal("show");
			}
		});
	}
	
	// 검색버튼 클릭시 보이기
	$('#categoryBtn').click(function() {
		if($('#categoryHiddenArea').css('display') == 'none') {
			$('#categoryHiddenArea').css('display', 'block');
		} else {
			$('#categoryHiddenArea').css('display', 'none');
			$('#listArea').css('margin-top', '2%');
		}
	});
	
	// 댓글 등록
	$('#replySubmit').on('click', function(){
		
		var planNo = $("#planNo").val();
		var replyContent = $('#replyContent').val();
		
		$.ajax({
			url: "addReply.sp",
			data: {planNo:planNo, replyContent:replyContent},
			type: "post",
			success: function(data){
				if(data == "successReplyInsert"){
					// $('#viewModal').modal("hide"); -> 굳이 닫고 안열어도됨.
					$('#replyContent').val('');
					planDetail(planNo);
				}
			}
		});
	});
	
	// 댓글 수정
	function replyUpdate(e){
		
		// 댓글은 1개씩 수정 가능하도록 함.
		if($('#newReContent').val() != null){
			swal({
				title: "댓글은 1개씩 수정 가능합니다."
			});
			return false;
		}
		
		// console.log($(e).parent().parent().find(".replyNo").val());
		var replyNo = $(e).parent().parent().find(".replyNo").val();
		var planNo = $("#planNo").val();
		
		var oldContent = $(e).parent().prev().text();
		
		//planDetail(planNo);
		
		$(e).parent().prev().text("");
		$(e).parent().prev().append('<textarea id="newReContent" class="replyTA">' + oldContent + '</textarea>');
		$(e).parent().html('<a id="updateCancel">수정취소</a>')
					 .append('<button id="newReSubmit" class="defaultBtn replyBtn">수정</button>');
		
		// 글을 입력후 수정취소 버튼 눌렀을 시 alert창
		$('#updateCancel').on('click',function(){
			if(oldContent != $('#newReContent').val()){
				swal({
					title:"내용입력을 취소하시겠습니까 ?",
					showCancelButton: !0,
					confirmButtonColor:"#DD6B55",
					confirmButtonText:"확인",
					closeOnConfirm: !0
					},
					function(){
						planDetail(planNo);
					}
				)
			} else {
				planDetail(planNo);
			}
		});
		
		// autosize textarea
		autosize.destroy($(".replyTA"));
		autosize($(".replyTA"));
		
		$('#newReSubmit').on('click',function(){
			var replyContent = $('#newReContent').val();
			
			$.ajax({
				url: "updateReply.sp",
				data: {replyNo:replyNo, replyContent:replyContent},
				type: "post",
				success: function(data){
					if(data == "successReplyUpdate"){
						$('#replyContent').val('');
						planDetail(planNo);
					}
				}
			});
		});
	};
	
	// 댓글 삭제
	function replyDelete(e){
		var replyNo = $(e).parent().parent().find(".replyNo").val();
		var planNo = $("#planNo").val();
		
		swal({
			title:"댓글을 삭제하시겠습니까 ?",
			text:"삭제 후 복구 할 수 없습니다.",
			type:"warning",
			showCancelButton: !0,
			confirmButtonColor:"#DD6B55",
			confirmButtonText:"삭제",
			closeOnConfirm: !0
			},
			function(){
				$.ajax({
					url: "deleteReply.sp",
					data: {replyNo:replyNo},
					type: "post",
					success: function(data){
						if(data == "successReplyDelete"){
							planDetail(planNo);
						}
					}
				});
			}
		)
	};
	
	function reReply(e){
		
		var replyNo = $(e).parent().parent().parent().find(".replyNo").val();
		var reGrpNo = $(e).parent().parent().parent().find(".reGrpNo").val();
		var reGrpOrder = $(e).parent().parent().parent().find(".reGrpOrder").val();
		var reGrpDepth = $(e).parent().parent().parent().find(".reGrpDepth").val();
		var reReplyOn = $(e).parent().parent().parent().find(".reReplyOn").val();
		var planNo = $("#planNo").val();
		
		$tr = $('<tr>');
		$td = $('<td colspan="4">');
		$table = $('<table class="reReplyTable table">');
		$tr2 = ($('<tr>'))
		$tr2.append('<td><span class="reReplyInsert">')
			.append('<td><textarea class="replyTA" id="reReplyContent"></textarea>')
			.append('<td><button id="reReSubmit" class="defaultBtn replyBtn">등록</button>');
		
		$table.append($tr2);
		$td.append($table);
		$tr.append($td);
		$(e).closest(".originReply").after($tr);
		
		autosize.destroy($(".replyTA"));
		autosize($(".replyTA"));
		
		// 답글 -> 취소로 바꿔줌
		$('<a id="reReplyCancel">취소</a>').replaceAll($(e));
		
		// 내용 입력 취소
		$('#reReplyCancel').on('click',function(){
			if($('#reReplyContent').val() != null && $('#reReplyContent').val() != ""){
				swal({
					title:"내용입력을 취소하시겠습니까 ?",
					showCancelButton: !0,
					confirmButtonColor:"#DD6B55",
					confirmButtonText:"확인",
					closeOnConfirm: !0
					},
					function(){
						planDetail(planNo);
					}
				)
			} else {
				planDetail(planNo);
			}
		});
		
		// 답글 등록 버튼 누를 시
		$('#reReSubmit').on('click',function(){
			var replyContent = $('#reReplyContent').val();
			if(reReplyOn != 'reReplyOn'){
				reReplyOn = 'reReplyOff';
			}
			// console.log(reReplyOn);
			$.ajax({
				url: "addReReply.sp",
				data: {planNo:planNo, reGrpNo:reGrpNo, reGrpOrder:reGrpOrder, reGrpDepth:reGrpDepth, replyContent:replyContent, replyNo:replyNo, reReplyOn:reReplyOn},
				type: "post",
				success: function(data){
					if(data == "successReReplyInsert"){
						$('#reReplyContent').val('');
						planDetail(planNo);
					}
				}
			});
		});
	};
	
	function categoryClickOption(e, click) {
		var $where;
		if(e == 'branch') $where = $('.branchCategory');
		else if(e == 'study') $where = $('.studyCategory');
		else if(e == 'type') $where = $('.typeCategory');
		else $where = $('.sort');
		
		if(e == 'sort') {
			for(var i = 0; i < $where.length; i++) {
				if($where.eq(i).attr('id') == $(click).attr('id') && $where.eq(i).css('color') == 'rgb(255, 255, 255)') {
					$where.eq(i).css({'background':'transparent', 'color':'#333'});
					return;
				}
			}
		}
		
		for(var i = 0; i < $where.length; i++) {
			if($where.eq(i).css('color') == 'rgb(255, 255, 255)') {
				$where.eq(i).css({'background':'transparent', 'color':'#333'});
			}
		}
		
		$(click).css({'background':'#135D36', 'color':'white'});
	}
	
</script>

<!-- autosize textarea -->
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
</html>