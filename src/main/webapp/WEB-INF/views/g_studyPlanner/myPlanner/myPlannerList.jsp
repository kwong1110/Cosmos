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
<%-- <% 
	for (int i = 0; i < list.size(); i++) {
	ScheduleDTO dto = (ScheduleDTO)list.get(i);
%>	
		{
			title : '<%= dto.getSubject() %>',
			start : '<%= dto.getStartDate() %>',
			end : '<%= dto.getEndDate() %>'
		},
<%
	}
	%> --%>
		{
			title : '강연!!',
			start : "2020-04-08",
			end : "2020-04-08"
		}
      ]
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
				</div>
			</div>
		</div>
		<c:import url="../../a_common/footer.jsp"/>
	</div>
</body>
</html>