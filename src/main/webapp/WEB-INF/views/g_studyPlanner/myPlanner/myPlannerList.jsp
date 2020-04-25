<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 플래너</title>
<!-- fullcalendar -->
	<link href='resources/js/plugins/fullcalendar/packages/core/main.css' rel='stylesheet' />
	<link href='resources/js/plugins/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
	<link href='resources/js/plugins/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
	<link href='resources/js/plugins/fullcalendar/packages/list/main.css' rel='stylesheet' />
	<link href='resources/css/calendar.css' rel='stylesheet' />
	<script src='resources/js/plugins/fullcalendar/packages/core/main.js'></script>
	<script src='resources/js/plugins/fullcalendar/packages/interaction/main.js'></script>
	<script src='resources/js/plugins/fullcalendar/packages/daygrid/main.js'></script>
	<script src='resources/js/plugins/fullcalendar/packages/timegrid/main.js'></script>
	<script src='resources/js/plugins/fullcalendar/packages/list/main.js'></script>
<!-- 템플릿 custom end -->

<style>
	.fc-event{
		border-color: white;
		background-color: white;
	}
	.fc-content{
		color: black;
		padding: 10px;
		font-size: 1.5rem;
		background-color: orange;
		font-family: 'Binggrae-Bold';
		text-align: center;
	}
	/* 모달 스타일 */
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
	
	/* 플래너 전용*/
	.conTopBox{
		width: 100%;
		background-color: white;
		padding: 1%;
	}
	.conTopBox h2 {
		margin: 0;
		font-size: 1.75em;
	}
	.exception>input {
		width: auto;
		height: auto;
	}
</style>
<script>
document.addEventListener('DOMContentLoaded', function() {
	 
	var calendarEl = document.getElementById('calendar');
	
	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
		header: {
		  left: 'today prevYear,prev',
		  center: 'title',
		  right: 'next,nextYear dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		},
		locale : "ko",					// 기본언어를 한국어로 설정
		//defaultDate: "2019-08-22",	// 첫 화면에서 보여질 기본 날짜 설정  
		navLinks: true, 				// 날짜를 클릭 했을때 상세페이지 보여지게 함
		// weekNumber: true,			// 주의 숫자를 표시
		businessHours: true, 			// 시간 표시
		editable: true,				// 등록된 스케쥴의 위치 이동
		selectable: false,				// 날짜에 드래그 사용
		events: [						// 스케쥴 데이터를 넣는 곳
			<c:forEach var="p" items="${ pList }">
			{
				title :	"${ p.planTitle }",
				start : "${ p.planStart }",	
				end : "${ p.planEnd }" + " 24:00",
				id: '${ p.planNo }',
				extendedProps: {
		        	content: '${ p.planContent }',
		        	menu: '${ p.planMenu }',
		        	emphasis: '${ p.emphasis }',
		        	likeCount: '${ p.likeCount }',
		        	hit: '${ p.hit }',
		        	creatDate: '${ p.createDate }',
		        	status: '${ p.planStatus }',
		        	openStatus: '${ p.openStatus }',
		        	userId: '${ p.id }',
		        	studyName: '${ p.studyName }',
		        	studyNo: '${ p.studyNo }',
		        	startDate: '${ p.planStart }',
		        	endDate: '${ p.planEnd }'
				}
			},			
			</c:forEach>
		],
		// 이벤트 클릭시 모달창에 값전달 후 모달 보여주기.
      	eventClick: function (info) {
			$('#openStatus').text(info.event.extendedProps.openStatus == 'Y' ? $('#open').attr('checked', 'checked') : $('#close').attr('checked', 'checked'));
			$('#categorySelect').val(info.event.extendedProps.studyNo).prop('selected', true);
			$('#title').text(info.event.title);
			$('#planDate').text(info.event.extendedProps.startDate + "~" + info.event.extendedProps.endDate);
			$('#planCreateDate').text(info.event.extendedProps.creatDate);
			$('#like').text(info.event.extendedProps.likeCount);
			$('#hit').text(info.event.extendedProps.hit);
			$('#viewModal').modal("show");
			
			$('#content').summernote({
				toolbar: false,
				height: 400,                 	// 에디터 높이
				minHeight: null,             	// 최소 높이  
				maxHeight: null,             	// 최대 높이
				lang: "ko-KR",					// 한글 설정
			});
			$('#content').summernote('code',info.event.extendedProps.content);
			$('#content').summernote('disable'); 
			},
		}); 

		calendar.render();
	});
</script>
</head>
<body>
	<div class="total-wrapper">
		<c:import url="../../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>나의 플래너</h1>
				</div>
				<div class="content">
					<div class="conTopBox">
						<h2>오늘의 할일</h2>
						<form>
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
							
							<c:forEach var="p" items="${ pList }">
								<c:if test="${ p.planMenu eq 'TODAY' && today >= p.planStart && today <= p.planEnd }">
									<input type="checkbox"><label>${ p.planTitle }</label>
								</c:if>
							</c:forEach>
						</form>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<section class="panel">
								<div class="panel-body">
              						<!-- schedule start -->
									<div id='calendar' style="position : relative;">
									</div>
              					</div>
            				</section>
          				</div>
					</div>
					<!-- 강연 상세보기 MODAL -->
			        <div id="viewModal" class="modal fade" tabindex="-1" role="dialog" >
			            <div class="modal-dialog modal-80size" role="document">
			                <div class="modal-content modal-80size">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                                aria-hidden="true">&times;</span></button>
			                        <h4 class="modal-title">플래너 상세 보기</h4>
			                        <span>좋아요 수 : </span><span id="like" class="modal-title"></span>
			                        <span>조회 수 : </span><span id="hit" class="modal-title"></span>
			                    </div>
			                    <div id="modalBody" class="modal-body">
			                        <!-- 내용 -->
			                        <form action="" method="post" onsubmit="">
				                        <table class="table">
											<tr>
												<th>카테고리</th>
												<td>
													<select id="categorySelect" name="categoryNo" disabled>
														<optgroup label="나의 공부목록">
															<c:forEach var="us" items="${ userStudyList }">
															
															
																<!-- category 기타가 완료되면 추가 할것 -> 기타면 기타의 이름이 보여지게  -->
																<%-- <c:if test="${ us.studyNo eq 97 || us.studyNo eq 98 || us.studyNo eq 99 }">
																	<option value="${ us.studyNo }">${ us.studyName }</option>
																</c:if> --%>
																	<option value="${ us.studyNo }">${ us.studyName }</option>
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
													<input type="radio" id="open" name="openStatus" value="Y" disabled>공개
													<input type="radio" id="close" name="openStatus" value="N" disabled>비공개
												</td>
											</tr>
											<tr>
												<th>제목</th>
												<td id="title"></td>
											</tr>
											<tr>
												<th>기간</th>
												<td id="planDate"></td>
											</tr>
											<tr>
												<th>작성일시</th>
												<td id="planCreateDate"></td>
											</tr>
											<tr>
												<td colspan="6" style="padding: 0;">
													<div id="content"></div>
													<c:import url="../../a_common/summernote.jsp"/>
												</td>
											</tr>
										</table>
									</form>
			                    </div>
			                </div><!-- /.modal-content -->
			            </div><!-- /.modal-dialog -->
			        </div><!-- /.modal -->
				</div>
			</div>
		</div>
		<c:import url="../../a_common/footer.jsp"/>
	</div>
</body>
</html>