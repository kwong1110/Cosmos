<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	.helpBtn{
		background: rgb(23, 149, 95); 
		border: 0; 
		outline: 0; 
		width: 30px; 
		height: 30px; 
		padding: 3px 11px; 
		margin: 5px; 
		font-size: 13px; 
		border-radius: 100%; 
		color: #FFF;
	}
	.tooltip-inner {
    	white-space: pre-wrap;
	}
	
	.panel{
		background-color: rgb(255, 253, 242) !important;
	}
	.panel-body{
		background-color: rgb(255, 253, 242) !important;
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
	
	/* 모달 배경색 변경 */
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
		/* select */
	#categorySelect,#insertCategorySelect {
		background-color: rgb(255, 255, 224);
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
	
		/* planColor selectBox */
	.planColor option[value="rgb(252, 124, 124)"] {
		background-color: rgb(252, 124, 124);
	}
	.planColor option[value="rgb(252, 197, 124)"] {
		background-color: rgb(252, 197, 124);
	}
	.planColor option[value="rgb(249, 255, 133)"] {
		background-color: rgb(249, 255, 133);
	}
	.planColor option[value="rgb(130, 255, 161)"] {
		background-color: rgb(130, 255, 161);
	}
	.planColor option[value="rgb(130, 236, 255)"] {
		background-color: rgb(130, 236, 255);
	}
	.planColor option[value="rgb(197, 130, 255)"] {
		background-color: rgb(197, 130, 255);
	}
	.planColor option[value="rgb(255, 130, 197)"] {
		background-color: rgb(255, 130, 197);
	}
	.planColor option[value="rgb(255, 255, 255)"] {
		background-color: rgb(255, 255, 255);
	}
	.planColor option[value="rgb(194, 194, 194)"] {
		background-color: rgb(194, 194, 194);
	}
	
	
	/* 플래너 상단 박스 */
	.conTopBox{
		width: 100%;
		background-color: rgb(255, 253, 242);
		padding: 1%;
	}
	.conTopBox a {
		display: inline;
		vertical-align: middle;
	}
	.conTopBox h2 {
		font-family: 'Binggrae';
		display: inline;
		margin: 0;
		font-size: 1.75em;
	}
	
	
	/* 체크박스 체크시 */
	.checkOn {
		text-decoration: line-through;
		text-decoration-color: red;
		text-decoration-style: solid;
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
	
	/* 팝 오버 */
	.popover-title {
	 	/* background-color: rgb(23, 149, 95) !important; */
	 	padding: 0 !important;
	 	margin: 0 !important;
	 	color: black;
	 	font-weight: bold;
	}
	
	/* 체크박스 스타일링 */
	.checkbox.custom {
		font-family: 'Binggrae';
		margin: 0;
		padding: 0;
		display: inline-block;
		width: 15%;
		margin-bottom: 20px;
	}
	
	input[type="checkbox"].custom {
		margin-left: 0;
		padding: 0;
	}
	
	input[type=checkbox].css-checkbox {
		position: absolute;
		overflow: hidden;
		clip: rect(0 0 0 0);
		height: 1px;
		width: 1px;
		margin: -1px;
		padding: 0px;
		border: 0;
	}
	
	input[type=checkbox].css-checkbox+label.css-label {
		padding-left: 33px;
		height: 21px;
		line-height: 20px;
		background-repeat: no-repeat;
		background-position: 0 0;
		font-size: 20px;
		vertical-align: middle;
		cursor: pointer;
		opacity: 1;
	}
	
	input[type=checkbox].css-checkbox+label.css-label:hover {
		opacity: 0.7;
	}
	
	input[type=checkbox].css-checkbox:checked+label.css-label {
	  background-position: 0 -21.5px;
	}
	
	.css-label {
	  background-image: url(http://codeopus.net/file/blog/check2.png);
	  background-size: 21px;
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
					end : "${ p.planEnd }",
					id: '${ p.planNo }',
					backgroundColor: "${ p.planColor }",
					allDay: '${ p.planAllday }' == 0 ? false : true,
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
			        	endDate: '${ p.planEnd }',
			        	planMemo: '${ p.planMemo }'== null || '${ p.planMemo }'== '' ? '메모없음' : '${ p.planMemo }',
			        	planAllday: '${ p.planAllday }' 
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
			$('#planDate').val(info.event.extendedProps.startDate + " - " + info.event.extendedProps.endDate);
			$('#planCreateDate').text(info.event.extendedProps.creatDate);
			$('#like').text(info.event.extendedProps.likeCount);
			$('#hit').text(info.event.extendedProps.hit);
			$('#planNo').val(info.event.id);
			info.event.extendedProps.planAllday == '1' ? $('#planAllday1').attr('checked', 'checked') : $('#planAllday0').attr('checked', 'checked');
			$('#planMemo').val(info.event.extendedProps.planMemo);
			$('#planColor').val(info.event.backgroundColor).prop('selected', true);
			$('#planColor').css('background-color', $('#planColor option:selected').val());
			
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
	            title: $('<div />', {
	                text: info.event.title
	              }).css({
	                'background-color': info.event.backgroundColor,
	                'padding' : '10px',
	              }),
	            content: $('<div />', {
	                //class: 'popoverInfoCalendar'
	           		 }).append('<p><strong>종류:</strong> ' + menuName + '</p>')
	            	.append('<p><strong>카테고리:</strong> ' + info.event.extendedProps.studyName + '</p>')
	            	.append('<p><strong>메모:</strong> ' + info.event.extendedProps.planMemo + '</p>'),
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
			/*
			// ajax로 연결해주어야함.
			alert(info.event.title + " 리사이즈 발동 " + info.event.end.toISOString());
		
			if (!confirm("?")) {
				info.revert();
			} */
		},
		
		//일정 드래그앤드롭
		eventDragStart: function (event, jsEvent, ui, view) {
		    draggedEventIsAllDay = event.allDay;
		},
		eventDrop: function (info) {
			$('.popover.fade.top').remove();
	
			var draggedEventIsAllDay;
			
			var newDates = {
				planStart: '',
				planEnd: '',
				planNo: info.event.id
			}
			
			console.log(moment(info.event.start).format('YYYY-MM-DD'));
			console.log(moment(info.event.end).format('YYYY-MM-DD'));
			
			if(info.event.end === null){
				newDates.planStart = moment(info.event.start).format('YYYY-MM-DD HH:mm');
				newDates.planEnd = newDates.planStart;
			} else {
				newDates.planStart = moment(info.event.start).format('YYYY-MM-DD HH:mm');
				newDates.planEnd = moment(info.event.end).format('YYYY-MM-DD HH:mm');
			} 
			
			// console.log("드롭 작동!");
			/* console.log(info.event.start);
			console.log(info.event.end);
			console.log(info.event.allDay);
			console.log("==== 데이터 변환 후 ====");
			console.log(newDates.planStart + " / " + newDates.planEnd); */
			
		    //주,일 view일때 종일 <-> 시간 변경불가
		    console.log(info.view.type)
			if (info.view.type === 'timeGridWeek' || info.view.type === 'timeGridDay') {
				if (draggedEventIsAllDay !== info.event.allDay) {
					swal({
						title: '드래그 앤 드롭으로 종일 ↔ 시간   변경은 불가합니다.',
						type:"error",
						},
						function(){
							location.reload();
						}
					)
					return false;
				}
			} 

		    //드롭한 일정 업데이트
		   $.ajax({
				type: "post",
				url: "dropPlanUpdate.sp",
				data: newDates,
				success: function(data) {
					if(data == "successdropPlanUpdate"){
						swal({
							title: "플랜 일정을 수정" + "하였습니다!",
							text: newDates.planStart + ' ~ ' + newDates.planEnd,
							type: "success",
						})
					}
					// 리로드 필요?
				}
		    });
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
								<c:if test="${ p.planMenu eq 'TODAY' && today >= fn:substring(p.planStart,0,10) && today <= fn:substring(p.planEnd,0,10) }">
									<div class="checkbox custom">
										<input type="checkbox" id="${ p.planNo }" class="css-checkbox" name="todayTodo" value="${ p.planNo }" ${ p.todayCheck }>
										<label for="${ p.planNo }" class="css-label">${ p.planTitle }</label>
									</div>
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
			                <div class="modal-content modal-80size modalCustom">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                                aria-hidden="true">&times;</span></button>
			                        <h4 class="modal-title">플래너 상세 보기</h4>
			                    </div>
			                    <form action="updatePlan.sp" method="post" onsubmit="return checkEmptyValues(title, content, open, today);">
			                    <div id="modalBody" class="modal-body">
			                        <!-- 내용 -->
				                    <div>
				                        <span>좋아요 수 : </span><span id="like"></span>
				                        <span>조회 수 : </span><span id="hit"></span>
			                        </div>
				                        <table class="table">
											<tr>
												<th>카테고리</th>
												<td>
													<input type="hidden" id="planNo" name="planNo"/>
													<select id="categorySelect" name="studyNo" class="form-control">
														<optgroup label="나의 공부목록">
															<c:forEach var="us" items="${ userStudyList }">
																<!-- category 기타가 완료되면 추가 할것 -> 기타면 기타의 이름이 보여지게  -->
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
												<th>하루종일</th>
												<td class="exception">
													<input id="planAllday1" type="radio" name="planAllday" value="1"/>O
													<input id="planAllday0" type="radio" name="planAllday" value="0"/>X
													<button type="button" class="helpBtn" data-toggle="tooltip" data-placement="bottom" title="하루종일을 선택하시면 시간을 입력하여도 저장되지않습니다.">?</button>
												</td>
											</tr>
											<tr>
												<th>작성일</th>
												<td id="planCreateDate"></td>
												<th>메모</th>
												<td class="exception">
													<input id="planMemo" type="text" name="planMemo" placeholder="메모"/>
													<button type="button" class="helpBtn" data-toggle="tooltip" data-placement="bottom" title="일정에 마우스올릴시 나타나는 간략한 메모">?</button>
												</td>
											</tr>
											<tr>
												<th>표시색상</th>
												<td>
													<select id="planColor" name="planColor" class="form-control planColor">
														<option value="rgb(252, 124, 124)"></option>
														<option value="rgb(252, 197, 124)"></option>
														<option value="rgb(249, 255, 133)"></option>
														<option value="rgb(130, 255, 161)"></option>
														<option value="rgb(130, 236, 255)"></option>
														<option value="rgb(197, 130, 255)"></option>
														<option value="rgb(255, 130, 197)"></option>
														<option value="rgb(255, 255, 255)"></option>
														<option value="rgb(194, 194, 194)"></option>
													</select>
												</td>
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
				                        <button type="button" class="btn cosmosBtn" data-dismiss="modal" onclick="deletePlan('planDetail');">삭제</button>
				                    </div>
			                    </form>
			                </div><!-- /.modal-content -->
			            </div><!-- /.modal-dialog -->
			        </div><!-- /.modal -->
			        <!-- 플랜 INSERT MODAL -->
			        <div id="insertModal" class="modal fade" tabindex="-1" role="dialog" >
			            <div class="modal-dialog modal-80size" role="document">
			                <div class="modal-content modal-80size modalCustom">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                                aria-hidden="true">&times;</span></button>
			                        <h4 class="modal-title">플래너 작성하기</h4>
			                    </div>
			                    <div id="modalBody" class="modal-body">
			                        <!-- 내용 -->
			                        <form action="planInsert.sp" method="post" onsubmit="return checkEmptyValues(insertTitle, summernote, insertOpenStatus, planMenu, planAllday);">
				                        <table class="table">
											<tr>
												<th>카테고리</th>
												<td>
													<input type="hidden" name="id" value="${ loginUser.id }"/>
													<select id="insertCategorySelect" name="studyNo" class="form-control">
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
															<c:if test="${ s.studyNo ne 97 && s.studyNo ne 98 && s.studyNo ne 99 }">
																<option value="${ s.studyNo }">${ s.studyName }</option>
															</c:if>
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
												<th>하루종일</th>
												<td class="exception">
													<input id="planAllday" type="radio" name="planAllday" value="1"/>O
													<input type="radio" name="planAllday" value="0"/>X
													<button type="button" class="helpBtn" data-toggle="tooltip" data-placement="bottom" title="하루종일을 선택하시면 시간을 입력하여도 저장되지않습니다.">?</button>
												</td>
											</tr>
											<tr>
												<th>작성일</th>
												<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
												<td>${ today }</td>
												<th>메모</th>
												<td class="exception">
													<input id="insertPlanMemo" type="text" name="planMemo" placeholder="메모"/>
													<button type="button" class="helpBtn" data-toggle="tooltip" data-placement="bottom" title="일정에 마우스올릴시 나타나는 간략한 메모">?</button>
												</td>
											</tr>
											<tr>
												<th>표시색상</th>
												<td>
													<select id="insertPlanColor" name="planColor" class="form-control planColor ">
														<option value="rgb(252, 124, 124)" selected></option>
														<option value="rgb(252, 197, 124)"></option>
														<option value="rgb(249, 255, 133)"></option>
														<option value="rgb(130, 255, 161)"></option>
														<option value="rgb(130, 236, 255)"></option>
														<option value="rgb(197, 130, 255)"></option>
														<option value="rgb(255, 130, 197)"></option>
														<option value="rgb(255, 255, 255)"></option>
														<option value="rgb(194, 194, 194)"></option>
													</select>
												</td>
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
			      		format: 'YYYY-MM-DD HH:mm',
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
			
			// tooltip
			$('[data-toggle="tooltip"]').tooltip();
			
			$('#planColor').on('change',function(){
				$('#planColor').css('background-color', $('#planColor option:selected').val());
			});
			
			$('#insertPlanColor').on('change',function(){
				$('#insertPlanColor').css('background-color', $('#insertPlanColor option:selected').val());
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
	<!-- end -->
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