<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강연</title>
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
			editable: false,				// 등록된 스케쥴의 위치 이동
			selectable: false,				// 날짜에 드래그 사용
			events: [						// 스케쥴 데이터를 넣는 곳
				<c:forEach var="l" items="${ list }">
					{
						title :	"${ l.lectureTitle }",
						start : "${ l.lectureStart }",	
						end : "${ l.lectureEnd }",
						url : "lectureView.le?lectureNo=${ l.lectureNo }"
					},			
				</c:forEach>
	      	]
			, eventClick: function (event) {
				if(event.url) {
					$.ajax({
						type: "get",
						url: event.url,
						data: {
						
						},
						success: function(data) {
							
						}
					});
				}
			}
		});
	
		calendar.render();
	});
</script>
</head>
<body>
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>강연</h1>
				</div>
				<div class="content">
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
			        <div class="modal fade" tabindex="-1" role="dialog" id="viewModal">
			            <div class="modal-dialog" role="document">
			                <div class="modal-content">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                                aria-hidden="true">&times;</span></button>
			                        <h4 class="modal-title"></h4>
			                    </div>
			                    <div class="modal-body">
			                        <!-- 내용 -->
			                        <table class="inner table">
										<tr>
											<th>이름<input type="hidden" value="${ loginUser.id }" name="id"></th>
											<td><input type="text" value="${ loginUser.name }" readonly></td>
											<th colspan="5">이력 사항 / 강연 경험</th>
										</tr>
										<tr>
											<th>핸드폰 번호</th>
											<td><input type="text" value="${ loginUser.phone }" readonly></td>
											<td rowspan="3" colspan="5">
												<textarea name="lectureRecord"></textarea>
											</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td><input type="email" value="${ loginUser.email }" readonly></td>
										</tr>
										<tr>
											<th>직업</th>
											<td><input type="text" name="lectureJob"></td>
										</tr>
										<tr>
											<th rowspan="2">강연 제목</th>
											<td rowspan="2"><input type="text" name="lectureTitle"></td>
											<th>강연 일시</th>
											<td colspan="2">
												<input type="text" class="form-control input-daterange-timepicker" name="daterange" id="daterange">
												<input id="startDate" name="startDate" type="hidden"/>
												<input id="endDate" name="endDate" type="hidden"/>
											</td>
											<th>강연 장소</th>
											<td>
												<select id="placeSelect" name="branchNo">
													<c:forEach var="s" items="${ branchList }">
														<option value="${ s.branchNo }">${ s.branchName }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<th>참가비</th>
											<td colspan="1"><input type="number" step="1000" min="0" placeholder="1000 단위 입력 가능" name="lectureFee"></td>
											<th>강연 인원</th>
											<td colspan="2"><input type="number" step="10" min="0" max="30" placeholder="10 단위 입력 가능" name="maxpeople"></td>
										</tr>
										<tr>
											<th colspan="8">강연 내용</th>
										</tr>
										<tr>
											<td colspan="8" style="padding: 0;">
												<textarea id="summernote" style="resize: none" name="lectureContent"></textarea>
												<c:import url="../a_common/summernote.jsp"/>
											</td>
										</tr>
									</table>
			                    </div>
			                    <div class="modal-footer modalBtnContainer-modifyEvent">
			                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			                    </div>
			                </div><!-- /.modal-content -->
			            </div><!-- /.modal-dialog -->
			        </div><!-- /.modal -->
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
</body>
</html>