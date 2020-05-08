<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강연 관리</title>
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
  		content: " ";height: 95%;}
	}
	.modal-dialog {
		display: inline-block; 
		text-align: left; 
		vertical-align: middle;
	}
	/* 배경색 변경 */
	.modal-content{
		background-color: rgb(254, 245, 198) !important;
	}
	
	/* 테이블 */
	table>tbody>tr>th{
		letter-spacing: 0.1em;
		white-space: nowrap;
	}
	table>tbody>tr>td{
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
	table>tbody>tr>td>textarea{
		width: 99%;
		height: 139px;
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
</style>
</head>
<body>
	<div class="total-wrapper">
		<c:import url="../../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>강연관리</h1>
				</div>
				<div class="content">
					<table class="table table-hover inner">
						<tr>
							<th>No.</th>
							<th>이름(ID)</th>
							<th>제목</th>
							<th>강연장소</th>
							<th>신청날짜</th>
							<th>강연날짜(시간)</th>
							<th>참가비</th>
							<th>상태</th>
						</tr>
						<c:forEach var="l" items="${ lList }">
							<tr class="contentTR">
								<td>${ l.lectureNo }</td>
								<td>${ l.name }(${ l.id })</td>
								<td>${ l.lectureTitle }</td>
								<td>${ l.branchName }</td>
								<td>${ l.lectureDate }</td>
								<c:if test="${ l.lectureStart eq l.lectureEnd }">
									<td>${ l.lectureStart }(${ l.lectureTime })</td>
								</c:if>
								<c:if test="${ l.lectureStart ne l.lectureEnd }">
									<td>${ l.lectureStart }~${ l.lectureEnd }(${ l.lectureTime })</td>
								</c:if>
								<td>${ l.lectureFee }</td>
								<td>
									<c:choose>
										<c:when test="${ l.lectureStatus eq 'APPLY' }">
											신청
										</c:when>
										<c:when test="${ l.lectureStatus eq 'OPEN' }">
											모집중
										</c:when>
										<c:when test="${ l.lectureStatus eq 'CLOSE' }">
											정원마감
										</c:when>
										<c:when test="${ l.lectureStatus eq 'REJECT' }">
											거절
										</c:when>
										<c:when test="${ l.lectureStatus eq 'DELETE' }">
											삭제
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</table>
					<!-- 페이징 -->
					<c:if test="${ pi.endPage > 1 }">
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
					</c:if>
				</div>
			</div>
		</div>
		<c:import url="../../a_common/footer.jsp"/>
	</div>
	<!-- 강연 상세보기 MODAL -->
    <div id="viewModal" class="modal fade" tabindex="-1" role="dialog" >
        <div class="modal-dialog modal-80size" role="document">
            <div class="modal-content modal-80size">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">강연 상세 보기</h4>
                </div>
                <div id="modalBody" class="modal-body">
                	<!-- 내용 -->
					<table class="inner table">
						<tr>
							<th>강연번호</th>
							<td><input type="text" id="lectureNo" name="lectureNo" readonly></td>
							<th>분류</th>
							<td><input type="text" id="lectureCategory" readonly></td>
							<th colspan="7">이력 사항 / 강연 경험</th>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" id="userId" readonly></td>
							<th>연락처</th>
							<td><input type="text" id="userPhone" readonly></td>
							<td rowspan="2" colspan="7">
								<textarea id="record" name="lectureRecord" readonly></textarea>
							</td>
						</tr>
						<tr>
							<th>직업</th>
							<td><input type="text" id="job" name="lectureJob" readonly></td>
							<th>이메일</th>
							<td><input type="email" id="userEmail" readonly></td>
						</tr>
						<tr>
							<th>신청일</th>
							<td><input type="text" id="lectureDate" name="lectureDate" readonly></td>
							<th>장소</th>
							<td>
								<input type="text" id="branchName" name="branchName" readonly>
							</td>
							<th>일시</th>
							<td colspan="6">
								<input type="text" id="lectureStart" name="lectureStart" readonly>
							</td>
						</tr>
						<tr>
							<th>상태</th>
							<td><input type="text" id="lectureStatus" name="lectureStatus" readonly></td>
							<th>참가비</th>
							<td colspan="1"><input type="number" id="lectureFee" name="lectureFee" readonly></td>
							<th>강연 인원</th>
							<td><input type="number" id="maxpeople" name="maxpeople" readonly></td>
							<th>신청 인원</th>
							<td><input type="number" id="attendpeople" name="attendpeople" readonly></td>
						</tr>
						<tr>
							<th colspan="2">강연 제목</th>
							<td colspan="9"><input type="text" id="title" name="lectureTitle" readonly></td>
						</tr>
						<tr>
							<th colspan="11">강연 내용</th>
						</tr>
						<tr>
							<td rowspan="5" colspan="11" style="padding: 0;">
								<div id="content"></div>
								<c:import url="../../a_common/summernote.jsp"/>							
							</td>
						</tr>
					</table>
                </div>
                <div class="modal-footer modalBtnContainer-modifyEvent btnBox">
                    <button type="button" id="no" class="btn btn-danger" data-dismiss="modal" onclick="sweetConfirm('DELETE');">삭제</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</body>
<script>
	$(document).ready(function(){
		$('.contentTR').click(function(){
			
			var lNo = $(this).children('td').eq(0).text();
			
			$('#viewModal').modal("show");
			$.ajax({
				url: "lectureManageDetail.ap",
				data: { lNo:lNo },
				dataType: 'json',
				success: function(data){
					$('#userId').val(decodeURIComponent(data.name.replace(/\+/g, ' ')) + "(" + data.id + ")");
					$('#userPhone').val(data.phone);
					$('#record').val(decodeURIComponent(data.lectureRecord.replace(/\+/g, ' ')));
					$('#userEmail').val(data.email);
					$('#job').val(decodeURIComponent(data.lectureJob.replace(/\+/g, ' ')));
					$('#title').val(decodeURIComponent(data.lectureTitle.replace(/\+/g, ' ')));
					$('#lectureStart').val(data.lectureStart + "~" + data.lectureEnd + "(" + data.lectureTime + ")");
					$('#branchName').val(decodeURIComponent(data.branchName.replace(/\+/g, ' ')));
					$('#lectureFee').val(data.lectureFee);
					$('#maxpeople').val(data.maxpeople);
					//$('#content').val(decodeURIComponent(data.lectureContent.replace(/\+/g, ' ')));
					$('#lectureNo').val(data.lectureNo);
					$('#attendpeople').val(data.attendpeople);
					$('#lectureDate').val(data.lectureDate);
					
					switch(data.lectureStatus){
					case 'APPLY': data.lectureStatus = '신청'; break;
					case 'OPEN': data.lectureStatus = '모집중'; break;
					case 'CLOSE': data.lectureStatus = '정원마감'; break;
					case 'REJECT': data.lectureStatus = '거절'; break;
					case 'DELETE': data.lectureStatus = '삭제'; break;
					}
					$('#lectureStatus').val(data.lectureStatus);
					
					$('#no').css('visibility','visible');
					if($('#lectureStatus').val() != '신청'){
						$('#no').css('visibility','hidden');
					} 
						
					// sumernote 상세보기			
					$('#content').summernote({
						toolbar: false,
						height: 800,                 	// 에디터 높이
						minHeight: null,             	// 최소 높이  
						maxHeight: null,             	// 최대 높이
						lang: "ko-KR",					// 한글 설정
					});
					$('#content').summernote('code',decodeURIComponent(data.lectureContent.replace(/\+/g, ' ')));
					$('#content').summernote('disable');
				}
			});
		});
	});
	
	function statusUpdate(state){
		var lNo = $('#lectureNo').val();
		location.href="lectureUpdate.ap?lectureStatus=" + state + "&lNo=" + lNo + "&returnRoot=lectureHistory.mp";
	};
	
</script>
</html>