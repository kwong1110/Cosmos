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
<!-- fullcalendar end -->
<style>
	.fc-content{
		color: black;
		padding: 4px;
		font-size: 1.5rem;
		font-family: 'Binggrae-Bold';
		text-align: center;
		white-space:pre-wrap !important;
		word-break: keep-all !important;
		background-color: rgb(252, 197, 124) !important;
		border-radius: 15px;
	}
	.fc-content:hover {
		background-color: rgb(235, 183, 115) !important;
	 	border-radius: 15px;
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
			// weekNumber: true,			// 주의 숫자를 표시
			businessHours: true, 			// 시간 표시
			editable: false,				// 등록된 스케쥴의 위치 이동
			selectable: false,				// 날짜에 드래그 사용
			displayEventTime: false,		// 캘린더에서 title에 시간표시 삭제
			events: [						// 스케쥴 데이터를 넣는 곳
				<c:forEach var="l" items="${ llist }">
					{
						title :	"${ l.lectureTitle }",
						start : "${ l.lectureStart }",	
						end : "${ l.lectureEnd }",
						id: '${ l.lectureNo }',
						extendedProps: {
				        	record: '${ l.lectureRecord }',
				        	content: '${ l.lectureContent }',
				        	fee: '${ l.lectureFee }',
				        	maxPeople: '${ l.maxpeople }',
				        	attendPeople: '${ l.attendpeople }',
				        	createDate: '${ l.lectureDate }',
				        	status: '${ l.lectureStatus }',
				        	userId: '${ l.id }',
				        	job: '${ l.lectureJob }',
				        	name: '${ l.name }',
				        	branchName: '${ l.branchName }',
				        	startDate: '${  l.lectureStart }',
				        	endDate: '${ l.lectureEnd }'
						}
					},			
				</c:forEach>
	      	],
	      	// 이벤트 클릭시 모달창에 값전달 후 모달 보여주기.
	      	eventClick: function (info) {
				$('#userId').text(info.event.extendedProps.name + "(" + info.event.extendedProps.userId + ")");
				$('#job').text(info.event.extendedProps.job);
					// 치환해준것을 다시 줄바꿈으로 바꾸는 과정
				$('#record').val(info.event.extendedProps.record.replace(/<br>/gi,"\r\n"));
				$('#title').text(info.event.title);
				$('#branchName').text(info.event.extendedProps.branchName);
				$('#fee').text(info.event.extendedProps.fee);
				$('#lectureDate').text(info.event.extendedProps.startDate + "~" + info.event.extendedProps.endDate);
				$('#maxPeople').text(info.event.extendedProps.maxPeople);
				$('#attendPeople').text(info.event.extendedProps.attendPeople);
				$('#lectureNo').val(info.event.id);
				//$('#content').val(info.event.extendedProps.content);
				$('#viewModal').modal("show");
				
				<c:forEach var="lL" items="${ lectureList }">
					if("${ lL.lectureNo }" == info.event.id){
						$('#lectureBuy').children().css('display','none');
						$('#lectureBuy').append('<div class="attendLecture">').text('이미 신청한 강연 입니다.');
					} else {
						$('#lectureBuy').text("");
						$('#lectureBuy').children().css('display','none');
						$('#lectureBuy').append('<button type="button" class="btn defaultBtn" data-dismiss="modal" onclick="lectureBuy()">참가신청</button>');
					}
				</c:forEach>
				
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
			//일정에 hover시 요약 (popover, tooltip을 못불러온다..)
			/* eventRender: function(info) {
				var tooltip = new Tooltip(info.el, {
			        title: info.event.extendedProps.record,
			        placement: 'top',
			        container: 'body'
			   	});
			} */
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
			        <div id="viewModal" class="modal fade" tabindex="-1" role="dialog" >
			            <div class="modal-dialog modal-80size" role="document">
			                <div class="modal-content modal-80size modalCustom">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                                aria-hidden="true">&times;</span></button>
			                        <h4 class="modal-title">강연 상세 보기</h4>
			                    </div>
			                    <div id="modalBody" class="modal-body">
			                        <!-- 내용 -->
			                        <form>
				                        <table class="table">
											<tr>
												<th colspan="2"><input type="hidden" id="lectureNo"/>이름</th>
												<td colspan="2" id="userId"></td>
												<th colspan="2">이력 사항 / 강연 경험</th>
											</tr>
											<tr>
												<th colspan="2">직업</th>
												<td colspan="2" id="job"></td>
												<td rowspan="3" colspan="2">
													<textarea id="record" name="lectureRecord" readonly></textarea>
												</td>
											</tr>
											<tr>
												<th colspan="2">강연 제목</th>
												<td colspan="2" id="title"></td>
											</tr>
											<tr>
												<th>강연 장소</th>
												<td id="branchName"></td>
												<th>강연 인원</th>
												<td id="maxPeople"></td>
											</tr>
											<tr>
												<th>참가비</th>
												<td id="fee"></td>
												<th>참가 인원</th>
												<td id="attendPeople"></td>
												<th>강연 일시</th>
												<td id="lectureDate"></td>
											</tr>
											<tr>
												<th colspan="6">강연 내용</th>
											</tr>
											<tr>
												<td colspan="6" style="padding: 0;">
													<div id="content"></div>
													<c:import url="../a_common/summernote.jsp"/>
												</td>
											</tr>
										</table>
									</form>
			                    </div>
			                    <div id="lectureBuy" class="modal-footer modalBtnContainer-modifyEvent btnBox">
			                    	<div>*참가 신청을 누르면 결제페이지로 이동합니다.</div>
			                        <button type="button" class="btn defaultBtn" data-dismiss="modal" onclick="lectureBuy()">참가신청</button>
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
<script>
	$(function(){
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
	});
	function lectureBuy(){
		
		var lectureFee = $('#fee').text();
		var lectureNo = $('#lectureNo').val();
		var id = '${ loginUser.id }';
		
		var IMP = window.IMP; 
		IMP.init('imp05073510'); 
		IMP.request_pay({
		    pg : 'kakao', 
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '강연 참가',
		    amount : lectureFee,
		    buyer_email : '${ loginUser.email }',
		    buyer_name : '${ loginUser.name }',
		    buyer_tel : '${ loginUser.phone }',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		    	 var msg = '${ loginUser.name }님께서 ';
			        msg += rsp.paid_amount + '원을 결제하였습니다.';
			        $.ajax({
				    	   url : "lectureBuy.le",
				    	   type : "post",
				    	   data : {lectureNo:lectureNo, id:id},
				    	   success : function(data) {
				    	        swal({
				    	    		title: "",
				    	    		text: msg,
				    	    		type:"success",
				    	    		showCancelButton: !0,
				    	    		confirmButtonColor:"#DD6B55",
				    	    		confirmButtonText:"확인",
				    	    		closeOnConfirm: !0
				    	    		},
				    	    		function(){
				    	    			location.href="slHistory.mp";
				    	    		}
				    	    	)
				    	    }
				       });
		       
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        sweetWrong(msg);
	
		    }
		   
		});				
	} 
</script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</html>