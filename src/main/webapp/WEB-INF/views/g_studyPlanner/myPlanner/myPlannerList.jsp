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

	<!-- tooltip css (tooltip사용할 경우 주석 해제) -->
	<!-- <link href='resources/css/tooltip.css' rel='stylesheet' /> -->
<style>
	.fc-event{
		border-color: white;
		background-color: white;
	}
	.fc-content{
		color: black;
		padding: 10px;
		font-size: 1.5rem;
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
	
	.exception>input {
		width: auto;
		height: auto;
	}
	
	/* 플래너 전용*/
	
	.myIcon{
		color: rgba(0, 0, 0, 0.3);
		font-size: 3rem !important;
	}
	
	.myIcon:hover{
		color: rgba(0, 0, 0, 1);
		cursor: pointer;
	}
	
	/* 플래너 상단 박스 */
	.conTopBox{
		width: 100%;
		background-color: white;
		padding: 1%;
	}
	.conTopBox a {
		display: inline;
		vertical-align: middle;
	}
	.conTopBox h2 {
		display: inline;
		margin: 0;
		font-size: 1.75em;
	}
	
	
	/* 체크박스 체크시 */
	.checkOn {
		text-decoration:line-through;
		text-decoration-color: red;
	}
	
	/* 오른쪽 마우스 */
	.custom-menu {
	    z-index:1000;
	    font-size: 14px;
	    position: absolute;
	    background-color: white;
	    border: 1px solid lightgray;
		border-radius: 4px;
	    box-shadow: 2px 2px 3px 1px rgba(30, 30, 30, .4);
	}
	
	.custom-menu a {
		display: block;
		padding: 4px 23px 4px 23px;
		text-decoration: none;
		transition: ease .2s;
	}
	
	.custom-menu a:hover {
		background: rgb(186, 186, 186);
	}
</style>
<script>
document.addEventListener('DOMContentLoaded', function() {
	 
	var calendarEl = document.getElementById('calendar');
	var activeWeekends = true;
	
	var calendar = new FullCalendar.Calendar(calendarEl, {
		//주말 숨기기 & 보이기 버튼
		customButtons: {
		  viewWeekends: {
		    text: '주말',
		    click: function () {
		    	activeWeekends ? activeWeekends = false : activeWeekends = true;
		    	/* setOption을 통해 option을 동적으로 변경 */
		    	calendar.setOption('weekends', activeWeekends);
		    }
		  }
		},
		plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
		header: {
		  left: 'today viewWeekends prevYear,prev ',
		  center: 'title',
		  right: 'next,nextYear dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		},
		locale : "ko",					// 기본언어를 한국어로 설정
		//defaultDate: "2019-08-22",	// 첫 화면에서 보여질 기본 날짜 설정  
		navLinks: true, 				// 날짜를 클릭 했을때 상세페이지 보여지게 함
	// weekNumber: true,				// 주의 숫자를 표시
		businessHours: true, 			// 시간 표시
		editable: true,					// 등록된 스케쥴의 위치 이동
		selectable: true,				// 날짜에 드래그 사용
		displayEventTime: false,		// 캘린더에서 title에 시간표시 삭제
		timezone: "local",
		timeFormat: 'HH:mm',
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
			        	emphasis: '${ p.todayCheck }',
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
			info.event.extendedProps.openStatus == 'Y' ? $('#open').attr('checked', 'checked') : $('#close').attr('checked', 'checked');
			info.event.extendedProps.menu == 'TODAY' ? $('#today').attr('checked', 'checked') : $('#default').attr('checked', 'checked');
			$('#categorySelect').val(info.event.extendedProps.studyNo).prop('selected', true);
			$('#title').val(info.event.title);
			$('#planDate').val(info.event.extendedProps.startDate + "~" + info.event.extendedProps.endDate);
			$('#planCreateDate').text(info.event.extendedProps.creatDate);
			$('#like').text(info.event.extendedProps.likeCount);
			$('#hit').text(info.event.extendedProps.hit);
			$('#planNo').val(info.event.id);
			
			$('#content').summernote({
				toolbar: false,
				height: 400,                 	// 에디터 높이
				minHeight: null,             	// 최소 높이  
				maxHeight: null,             	// 최대 높이
				lang: "ko-KR",					// 한글 설정
			});
			$('#content').summernote('code',info.event.extendedProps.content);
			// $('#content').summernote('disable'); 
			
			$('#viewModal').modal("show");
		},
		
		// 날짜 클릭시
		dateClick: function(info) {
			insertPlan('DEFAULT', info.dateStr);
		},
		
		// popover
		eventRender: function(info) {
			
	      	/* 툴팁 사용할 경우 위의 style 주석도 해제 후 사용! */
	      	/*$(info.el).tooltip({
	      		title: info.event.extendedProps.content
	      	}) */

	      	// popover 시작
	      	var menuName;
	      	info.event.extendedProps.menu == 'TODAY' ? menuName='오늘의 할일' : menuName='기본';
	      	$(info.el).popover({
	            title: info.event.title,
	            content: $('<div />', {
	                //class: 'popoverInfoCalendar'
	           		 }).append('<p><strong>종류:</strong> ' + menuName + '</p>')
	            	.append('<p><strong>카테고리:</strong> ' + info.event.extendedProps.studyName + '</p>')
	            	.append('<p><strong>메모:</strong> ' + "메모칼럼 추가해야함" + '</p>'),
	            placement: 'top',
	            html: 'true',
	            trigger: 'hover',
	            animation: 'true',
	            container: 'body'
	      	})
		},
		
		// eventPositioned : 일정이 최종 위치에 배치 된 후 트리거 됨.
		// 렌더링 된 후 각 이벤트에 id값을 부여함.
		eventPositioned: function(info) { 
			// console.log(info);
			$(info.el).children().attr("id", info.event.id);
		},
		
		// 일정 리사이즈
		eventResize: function(info) {
			$('.popover.fade.top').remove();	// 리사이즈시, popover 잔상 제거. 
			
			// ajax로 연결해주어야함.
			alert(info.event.title + " end is now " + info.event.end.toISOString());
		
			if (!confirm("is this okay?")) {
				info.revert();
			}
		},
		
		//일정 드래그앤드롭
		eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
			$('.popover.fade.top').remove();

		    //주,일 view일때 종일 <-> 시간 변경불가
			if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
				if (draggedEventIsAllDay !== event.allDay) {
					sweetWrong('드래그앤드롭으로 종일<->시간 변경은 불가합니다.');
					location.reload();
					return false;
				}
			}

		    // 드랍시 수정된 날짜반영
		    //var newDates = calDateWhenDragnDrop(event);

		    //드롭한 일정 업데이트
		   /*  $.ajax({
		      type: "get",
		      url: "",
		      data: {
		        //...
		      },
		      success: function (response) {
		        alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
		      }
		    });*/

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
						<a onclick="insertPlan('TODAY');"><span class="material-icons myIcon">add_circle_outline</span></a>
						<form>
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
							
							<c:forEach var="p" items="${ pList }">
								<!-- jstl 오늘 날짜 불러오는 fmt를 통해 출력  -->
								<c:if test="${ p.planMenu eq 'TODAY' && today >= p.planStart && today <= p.planEnd }">
									<input type="checkbox" id="${ p.planNo }" name="todayTodo" value="${ p.planNo }" ${ p.todayCheck }>
									<label for="${ p.planNo }">${ p.planTitle }</label>
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
					<!-- 플랜 상세보기 MODAL -->
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
			                    <form action="updatePlan.sp" method="post" onsubmit="return checkEmptyValues(title, content, open, today);">
			                    <div id="modalBody" class="modal-body">
			                        <!-- 내용 -->
				                        <table class="table">
											<tr>
												<th>카테고리</th>
												<td>
													<input type="hidden" id="planNo" name="planNo"/>
													<select id="categorySelect" name="studyNo">
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
													<textarea id="content" class="summernote" placeholder="내용" name="planContent"></textarea>
													<c:import url="../../a_common/summernote.jsp"/>
												</td>
											</tr>
										</table>
				                    </div>
				                     <div class="modal-footer modalBtnContainer-modifyEvent btnBox">
				                        <button class="btn defaultBtn">수정</button>
				                        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deletePlan('planDetail');">삭제</button>
				                    </div>
			                    </form>
			                </div><!-- /.modal-content -->
			            </div><!-- /.modal-dialog -->
			        </div><!-- /.modal -->
			        <!-- 플랜 INSERT MODAL -->
			        <div id="insertModal" class="modal fade" tabindex="-1" role="dialog" >
			            <div class="modal-dialog modal-80size" role="document">
			                <div class="modal-content modal-80size">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                                aria-hidden="true">&times;</span></button>
			                        <h4 class="modal-title">플래너 작성하기</h4>
			                    </div>
			                    <div id="modalBody" class="modal-body">
			                        <!-- 내용 -->
			                        <form action="planInsert.sp" method="post" onsubmit="return checkEmptyValues(insertTitle, summernote, insertOpenStatus, planMenu);">
				                        <table class="table">
											<tr>
												<th>카테고리</th>
												<td>
													<input type="hidden" name="id" value="${ loginUser.id }"/>
													<select id="insertCategorySelect" name="studyNo">
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
													<input id="insertOpenStatus" type="radio" name="openStatus" value="Y"/>공개
													<input type="radio" name="openStatus" value="N"/>비공개
												</td>
											</tr>
											<tr>
												<th>제목</th>
												<td><input id="insertTitle" type="text" name="planTitle" placeholder="제목"/></td>
												<th>종류</th>
												<td class="exception"> 
													<input id="planMenu" type="radio" name="planMenu" value="TODAY"/>오늘의 할일
													<input type="radio" name="planMenu" value="DEFAULT"/>기본
												</td>
											</tr>
											<tr>
												<th>기간</th>
												<td><input type="text" class="form-control input-daterange-timepicker" name="daterange" id="daterange"></td>
											</tr>
											<tr>
												<th>작성일</th>
												<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
												<td>${ today }</td>
											</tr>
											<tr>
												<th colspan="4">내용</th>
											</tr>
											<tr>
												<td colspan="4" style="padding: 0;">
													<textarea id="summernote" placeholder="내용" name="planContent"></textarea>
													<c:import url="../../a_common/summernote.jsp"/>
												</td>
											</tr>
										</table>
										<div class="inner btnBox">
											<button id="applyBtn" class="btn defaultBtn">등록</button>
										</div>
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
	<script>
		$(function(){
			// 처음 로드 시에도 체크된 상태의 CSS가 남아있게 하기 
			$('input[name=todayTodo]:checked').next().addClass('checkOn');
			
			// 오른쪽 마우스
			// input... : 오늘의할일 우클릭시, fc-content : 캘린더 안의 이벤트 우클릭 시.
			$('input[name=todayTodo]+label, .fc-content').on("contextmenu", function(event) { 
				
				// console.log("클릭한 것의 planNo : " + $(this).attr('for'));
				// console.log("캘린더 클린한 것의 plan No :" + "$(this).attr('id'));
				
				var clickId;
				if($(this).prev().attr('name') == 'todayTodo'){
					clickId = $(this).attr('for');
				} else if($(this).attr('class') == 'fc-content') {
					clickId = $(this).attr('id');
				}
				
			    $("div.custom-menu").hide();
			    $customMenu = $("<div class='custom-menu'>")
			    .append($("<a onclick='viewPlan("+ clickId + ")'>상세보기</a>"))
			    .append($("<a onclick='deletePlan("+ clickId +")'>삭제</a>"))
			    .appendTo("body")
			    .css({top: event.pageY + "px", left: event.pageX + "px"});
			    return false;
			});
			
			$('html').on("click", function(event) {
			    $("div.custom-menu").hide();
			});
			
			// drops down으로 설정해야해서 다시 불러옴. drops만 불러오기가 안됨.
			$('.input-daterange-timepicker').daterangepicker({
			       timePicker: true,
			       timePickerIncrement: 60,
			       timePicker24Hour: true,
			       timePickerSeconds: false,
			       drops : 'down',
			      	"locale": {
			      		format: 'YYYY-MM-DD H:mm',
			      		buttonClasses: ['btn'],
			      		applyClass: 'okBtn',
			      		cancelClass: 'cancelBtn',
			      		"daysOfWeek": [
			                  "일",
			                  "월",
			                  "화",
			                  "수",
			                  "목",
			                  "금",
			                  "토"
			              ],
			              "monthNames": [
			                  "1월",
			                  "2월",
			                  "3월",
			                  "4월",
			                  "5월",
			                  "6월",
			                  "7월",
			                  "8월",
			                  "9월",
			                  "10월",
			                  "11월",
			                  "12월"
			              ],
			              "firstDay": 1
			      	}
			});
			
		});
		
		// plan 수정
		// 수정은 form의 action으로 처리.
		
		// plan 삭제 
		function deletePlan(clickId) {
			if(clickId == 'planDetail'){
				clickId = $('#planNo').val();
			}
			swal({
				title:"정말 삭제하시겠습니까 ?",
				text:"삭제 후 복구 할 수 없습니다.",
				type:"warning",
				showCancelButton: !0,
				confirmButtonColor:"#DD6B55",
				confirmButtonText:"삭제",
				closeOnConfirm: !1
				},
				function(){
					$.ajax({
						url: "deletePlan.sp",
						data: { planNo:clickId },
						dataType: 'json',
						success: function(data){
							if(data > 0){
								swal({
									title:'삭제하였습니다!',
									type:"success",
									closeOnConfirm: !1
									},
									function(){
										location.reload();
									}
								)
							}
						}
					});
				}
			)
		};
		
		// plan 상세보기
		function viewPlan(clickId) {
			$.ajax({
				url: "planDetail.sp",
				data: { planNo:clickId },
				dataType: 'json',
				success: function(data){
					// console.log(data);
					data.openStatus == 'Y' ? $('#open').attr('checked', 'checked') : $('#close').attr('checked', 'checked');
					data.planMenu == 'TODAY' ? $('#today').attr('checked', 'checked') : $('#default').attr('checked', 'checked');
					$('#categorySelect').val(data.studyNo).prop('selected', true);
					$('#title').val(decodeURIComponent(data.planTitle.replace(/\+/g, ' ')));
					$('#planDate').val(data.planStart + "~" + data.planEnd);
					$('#planCreateDate').text(data.createDate);
					$('#like').text(data.likeCount);
					$('#hit').text(data.hit);
					$('#planNo').val(data.planNo);
					
					/* $('#content').summernote({
						toolbar: false,
						height: 400,                 	// 에디터 높이
						minHeight: null,             	// 최소 높이  
						maxHeight: null,             	// 최대 높이
						lang: "ko-KR",					// 한글 설정
					}); */
					$('#content').summernote('code',decodeURIComponent(data.planContent.replace(/\+/g, ' ')));
					// $('#content').summernote('disable'); 
					$('#viewModal').modal("show");
				}
			});
		};
		
		// plan 등록
		function insertPlan(menu, dateStr) {
			// console.log(menu + " " + dateStr);

			$("input[name=planMenu]").attr('checked', false);
			
			if(menu == 'TODAY') {
				
				$("input[name=planMenu][value='TODAY']").attr('checked', 'checked');
	
				// 날짜클릭시 daterange 값을 현재 시간 기준으로 바꿔줌
				var date = new Date();
				var nowDate = moment().format('YYYY-MM-DD HH:00');
				var nowDatePlus = moment(date.getTime()).add("+1", "h").format('YYYY-MM-DD HH:00');	
				$('#daterange').val(nowDate + " - " + nowDatePlus);
		
			} else if(menu == 'DEFAULT'){
				
				$("input[name=planMenu][value='DEFAULT']").attr('checked', 'checked');
				
				// 날짜클릭시 daterange 값을 현재 시간 기준으로 바꿔줌
				var date = new Date();
				var time = moment().format('HH:00');
				var timePlus = moment(date.getTime()).add("+1", "h").format('HH:00');
				$('#daterange').val(dateStr + " " + time + " - " + dateStr + " " + timePlus);
			}
			
			$('#insertModal').modal("show");
		};
		
		// 오늘의 할일 체크
		$(function(){
			$('input[name=todayTodo]').change(function(){
				// console.log("클릭한 것의 체크여부 : " + $(this).is(':checked'));
				
				// 체크 시 해당 label에 CSS 추가
				$(this).is(':checked') ? $(this).next().addClass('checkOn') : $(this).next().removeClass('checkOn');
				
				// 전송할 변수 선언 후 체크 상태 업데이트
				var todayCheck;
				$(this).is(':checked') ? todayCheck = 'CHECKED' : todayCheck = 'N';
				
				var planNo = $(this).val(); 
				
				$.ajax({
					url: "todayCheck.sp",
					data: { todayCheck:todayCheck, planNo:planNo },
					dataType: 'json'
				});
			});
		});
		
		// summernote 사진 업로드
		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			folderRoot = "planner"
			data.append("folderRoot", folderRoot);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile.cm",
				contentType : false,
				processData : false,
				success : function(data) {
						// console.log("url확인 : " + data.url);
		            	//항상 업로드된 파일의 url이 있어야 한다.
						$(editor).summernote('insertImage', "${ contextPath }/resources/" + data.url);
					}
				});
		};
	</script>
	<script src="${contextPath}/resources/js/plugins/datepicker/moment.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.ko.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-timepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/daterangepicker.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/form-pickers-init.js"></script>
	
	<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
	<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>