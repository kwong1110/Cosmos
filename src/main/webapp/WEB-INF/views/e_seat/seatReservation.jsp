<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a8fa7e4a9e7170fa234c76a796cecab&libraries=services"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<style>
.wrap-div{width:100%; height:870px; margin:0 auto; }
    .div-left{width:30%; height:inherit; float:left;}
    	.left-top{width:100%; height:7%; border:1px solid #000; box-sizing: border-box;}
    	.left-mid{width:100%; height:93%; border:1px solid #000; box-sizing: border-box; border-bottom:0;}
    	.left-bot{width:100%; height:7%; border:1px solid #000; box-sizing: border-box; border-top:0;}
    	
    .div-right{width:70%; height:inherit; float:right;}
    	.right-top{width:100%; height:7%; border:1px solid #000; box-sizing: border-box; border-left:0;}
    	#right-top{line-height:55px; font-size:25px;}
    	#right-map{width:100%; height:54%; border:1px solid #000; box-sizing: border-box; border-left:0; border-bottom:0;}
    	.right-content{width:100%; height:39%; border:1px solid #000; box-sizing: border-box;border-left:0; border-bottom:0; }
    		.right-content-left{width:57%; height:100%;  box-sizing: border-box; float:left; 
    							line-height:70px; padding-left:40px;}
    			.left-spot{width:100%; height:20%; box-sizing: border-box;}
    			.left-period{width:100%; height:20%; box-sizing: border-box;}
    			.left-date{width:100%; height:20%; box-sizing: border-box;}
    			.left-name{width:100%; height:20%; box-sizing: border-box;}
    			.left-phone{width:100%; height:20%; box-sizing: border-box;}
    				.cl{width:30%;height:100%; box-sizing: border-box; float:left;}
    				.cr{width:70%;height:100%; box-sizing: border-box; float:right; }
    		.right-content-right{width:43%; height:100%;  box-sizing: border-box; float:right; 
    							 line-height:70px;padding-left:5px;}
    			.right-group{width:100%; height:20%; box-sizing: border-box;}				 
    			.right-choose{width:100%; height:20%; box-sizing: border-box;}
    			.right-seat{width:100%; height:20%; box-sizing: border-box;}
    			.right-chooseSeat{width:100%; height:20%; box-sizing: border-box;}
    			.right-price{width:100%; height:20%; box-sizing: border-box;}
    	.right-agree{width:100%; height:7%; border:1px solid #000; box-sizing: border-box; border-top:0; border-left:0;}
    		.le-ag{width:57%; height:100%;  box-sizing: border-box; float:left; line-height:55px; padding-left:40px; }
    		.ri-ag{width:43%; height:100%;  box-sizing: border-box; float:right; line-height:55px;padding-left:0px; }
    		.ra-left{width:70%; float:left; font-size:16px;}
    		.ra-right{width:30%;float:right;}
   
    .che{width:15px;height:15px;} /* 인원선택 체크박스 css */
    .rad{width:15px;height:15px;}/* 라디오버튼 css */
  	nav{margin-left:20px;}
  	
  	
  	.modal-dialog.modal-80size {width: 85%; height: 90%; margin: 0; padding: 0;}
	.modal-content.modal-80size {height: auto; min-height: 90%;}
	.modal {text-align: center;}
	@media screen and (min-width: 768px) {
  	.modal:before {display: inline-block; vertical-align: middle; content: " ";height: 95%;}
	}
	.modal-dialog {display: inline-block; text-align: left; vertical-align: middle;}
	
	 .seatOn{
		background-color: red !important;
	} 
</style>
</head>
<body><!-- onload="brAddress();" -->
<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper"> 
			<div class="main" style="padding:0;">
				<div class="pageTitle">
					<h1>좌석예약</h1>
				</div>
				<div class="content">
				
						<div class="wrap-div form-inline" >
					        <div class="div-left">
					        	<!-- <div class="left-top">
					        	     </div> -->
					        	<div class="left-mid">
					        			<c:forEach var="s" items="${ branchList }">
					        				<div style="margin-left:20px; margin-right:20px;border-bottom:1px solid black; height:102px;">
					        					<div style="margin-left:38px;">
					        						<b>
					        							코스모스 스터디센터 ${ s.branchName }
					        						</b>
					        					</div>
					        					<div style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">
					        						<input type="radio"  class="branchAddress"id="branchAddress" name="branchAddress"  value="${ s.branchNo }"style="width:20px; height:20px; margin-left:10px;" onclick="branchAddress(this);">&nbsp;${ s.branchAddress }
					        					</div>
					        					<div style="margin-left:38px;">${ s.branchTel }</div>
					        				</div>
					        			</c:forEach>
					        		
					        	</div>
					            <div class="left-bot" style="text-align:center;">
									  <ul class="pagination">
										<li>
											<c:if test="${ pi.currentPage eq pi.startPage }">
												<a aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
												</a>
											</c:if>
											<c:if test="${ pi.currentPage ne pi.startPage }">
												<c:url var="start" value="reservation.se">
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
												<c:url var="before" value="reservation.se">
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
												<c:url var="pagination" value="reservation.se">
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
												<c:url var="after" value="reservation.se">
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
												<c:url var="max" value="reservation.se">
													<c:param name="page" value="${ pi.maxPage }"/>
												</c:url>
												<a href="${ max }" aria-label="Next">
													<span aria-hidden="true">&raquo;</span>
												</a>
											</c:if>
										</li>
									</ul>
					            </div>
					        </div>
					        <div class="div-right">
					            <!-- <div class="right-top" id="right-top"> 
					            	<script>
						        		$('input[type=radio][name=branchAddress]').on('click',function(){
			            					var tmp = $('input[type=radio][name=branchAddress]:checked').val();
			            						/* $("#branchAddress").parent().parent().children().eq(0)[0].innerText; */
			            					$("#right-top").text(tmp);
			            				});
					        		</script>
					            </div> -->
					       		<div id="right-map" >
									<script type="text/javascript">
										function brAddress(){
												var mapContainer = document.getElementById('right-map'), // 지도를 표시할 div 
											    mapOption = {
											        center: new kakao.maps.LatLng(37.49898969752637, 127.03285209192696), // 지도의 중심좌표
											        level: 3 // 지도의 확대 레벨
											    };  
											
											// 지도를 생성합니다    
											var map = new kakao.maps.Map(mapContainer, mapOption); 
											
											// 주소-좌표 변환 객체를 생성합니다
											var geocoder = new kakao.maps.services.Geocoder();
											
											// 주소로 좌표를 검색합니다
											geocoder.addressSearch('서울 강남구 테헤란로14길 6', function(result, status) {
											
											    // 정상적으로 검색이 완료됐으면 
											     if (status === kakao.maps.services.Status.OK) {
											
											        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
											
											        // 결과값으로 받은 위치를 마커로 표시합니다
											        var marker = new kakao.maps.Marker({
											            map: map,
											            position: coords
											        });
											
											        // 인포윈도우로 장소에 대한 설명을 표시합니다
											        var infowindow = new kakao.maps.InfoWindow({
											            content: '<div style="width:150px;text-align:center;padding:6px 0;">KH정보교육원</div>'
											        });
											        infowindow.open(map, marker);
											
											        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											        map.setCenter(coords);
											    } 
											});    
										}
										window.onload=brAddress;
										</script>
									<script>
									function branchAddress(e){
										var address1 = $(e).parent()[0].innerText;
										var name = $(e).parent().parent().children().eq(0)[0].innerText;
										console.log(address1);
										console.log(name);
										var zonecode="";
										
										var mapContainer = document.getElementById('right-map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(37.49898969752637, 127.03285209192696), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };  
										
										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 
										
										// 주소-좌표 변환 객체를 생성합니다
										var geocoder = new kakao.maps.services.Geocoder();
										
										// 주소로 좌표를 검색합니다
										geocoder.addressSearch(address1, function(result, status) {
										
										    // 정상적으로 검색이 완료됐으면 
										     if (status === kakao.maps.services.Status.OK) {
										
										        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
										
										        // 결과값으로 받은 위치를 마커로 표시합니다
										        var marker = new kakao.maps.Marker({
										            map: map,
										            position: coords
										        });
										
										        // 인포윈도우로 장소에 대한 설명을 표시합니다
										        var infowindow = new kakao.maps.InfoWindow({
										            content: '<div style="width:170px; text-align:center; padding:6px 0;"> '+ name +'</div>'
										        });
										        infowindow.open(map, marker);
										
										        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										        map.setCenter(coords);
										    } 
										});    
									}
									</script>
					       		</div>
					            <div class="right-content">
					            	<div class="right-content-left">
					            		<div class="left-spot">
					            			<div class="cl">● 예약지점</div>
					            			<div class="cr" id="reserStore">
					            				<script>
					            				$('input[type=radio][name=branchAddress]').on('click',function(){
					            					var tmp = $('input[type=radio][name=branchAddress]:checked').parent().parent().children().eq(0)[0].innerText;
					            					$("#reserStore").text(tmp);
					            				});
					            				</script>
					            			</div>
					            		</div>
					            		<div class="left-period">
					            			<div class="cl">● 예약유형</div>
					            			<div class="cr">
					            				<input type="radio" class="rad" id="onePeriod" name="period"  value="시간권" > 시간권 &nbsp;&nbsp;
					            				<input type="radio" class="rad" id="sevenPeriod" name="period" value="7일권"> 7일권 &nbsp;&nbsp;
					            				<input type="radio" class="rad" id="thirtyPeriod" name="period" value="30일권" > 30일권 
					            			</div>
					            		</div>
					            				<script>
					            				$("input:radio[name='period']").on('click',function(){
					            					switch($(this).val()){
						            					case'시간권': $('.input-single-timepicker').css('display', 'none'); 
						            							  $('.input-daterange-timepicker').css('display', 'inline-block'); 
						            							  $("input[name='reserPeople']").attr('disabled',false).prop('checked',false);break;
						            							  
						            					case'7일권': $('.input-daterange-timepicker').css('display', 'none');
						            							  $('.input-single-timepicker').css('display', 'inline-block'); 
						            							  $("input[name='reserPeople']").attr('disabled',true).prop('checked',false);break;
						            							 
						            					case'30일권': $('.input-daterange-timepicker').css('display', 'none');
						            							    $('.input-single-timepicker').css('display', 'inline-block');
						            							    $("input[name='reserPeople']").attr('disabled',true).prop('checked',false); break;
					            						}
				            					});
					            				</script>
					            		<div class="left-date">
					            			<div class="cl">● 예약일자</div>
					            			<div class="cr" id="cr1">
					            				<div class="box-title m-t-30"></div>
												<input type="text" class="form-control input-daterange-timepicker" name="daterange" id="daterange" style="width:265px; display:none;">
												<input type="text" class="form-control input-single-timepicker" name="daterange1" id="daterange1" style="width:265px; display:none; text-align:center;" >
					            			</div>
					            		</div>
					            		<div class="left-name">
					            			
					            			<div class="cl">● 이름</div>
					            			<div class="cr">
					            				<input type="hidden" value="${ loginUser.id }" name="id">
					            				<input type="text" name="name" class="form-control" value="${ loginUser.name }" readonly style="width:265px; text-align:center;">
					            			</div>
					            		</div>
					            		<div class="left-phone">
					            			<div class="cl">● 휴대폰번호</div>
					            			<div class="cr">
					            				<input type="text" name="phone" class="form-control" value="${ loginUser.phone }" readonly style="width:265px; text-align:center;">
					            			</div>
					            		</div>
					            	</div>
					            	<div class="right-content-right">
					            		<div class="right-group">
					            			<div class="cl">● 그룹선택</div>
					            			<div class="cr">
					            				<select name="group" style="width:150px;">
						            				<c:forEach var="se" items="${ sgList }"> 
												    	<option value="${ se.sgNo }">${ se.sgName }</option>
												    </c:forEach>
												</select>
					            			</div>
					            		</div>
					            		<div class="right-choose">
					            			<div class="cl">● 인원선택</div>
					            			<div class="cr">
					            				<input type="radio" class="rad" id="onep" name="reserPeople" value="1"> 1인 &nbsp;
					            				<input type="radio" class="rad" id="fourp" name="reserPeople" value="4"> 4인 &nbsp;
					            				<input type="radio" class="rad" id="sixp" name="reserPeople" value="6"> 6인 &nbsp;
					            				<input type="radio" class="rad" id="eightp" name="reserPeople" value="8 "> 8인
					            			</div>
					            		</div>
					            		<div class="right-seat">
					            			<div class="cl">● 좌석선택</div>
					            			<div class="cr">
					            				<div id="seatChoose" class="btn defaultBtn" style="width:150px;">선택</div>
					            			</div>
					            			<script>
						            			$('#seatChoose').click(function(e){
						            				$(".chair").parent().removeClass("seatOn");
						            				
						            				var money=$('#userPrice').text();
						            				var strMoney=money.split('원');
						            				var branchNo = $("input:radio[name='branchAddress']:checked").val();
						            				var reserType = $("input:radio[name='period']:checked").val();
						            				var reserDate;
						            				var reserPeople;
						            					if($("input:radio[name='period']:checked").val() == '시간권'){
						            						reserDate = $('#daterange').val();
						            						reserPeople = $("input:radio[name='reserPeople']:checked").val();
						            					}else if($("input:radio[name='period']:checked").val() == '7일권' || $("input:radio[name='period']:checked").val() == '30일권'){
						            						reserDate = $('#daterange1').val();
						            						reserPeople = 1;
						            					}
						            				var	chooseSeat = $("#chooseSeat").text();
						            				var dkanrjsk={branchNo:branchNo, reserType:reserType, reserDate:reserDate, id:'${ loginUser.id }', reserPeople:reserPeople, chooseSeat:chooseSeat, totalFee:strMoney[0]};
						            				 $.ajax({
						            					url : "overlap.se",
						            					type : "post",
						            					dataType: 'json',
						            					data: dkanrjsk,
						            					success : function(data){
						            						e.preventDefault();
						            						 //console.log(data);
							            					if(data.length > 0){ 
							            						for(var i in data){
								            						console.log(data[i].reserSort + "-" + data[i].seatNo);
																	if($('#'+ data[i].reserSort + "-" + data[i].seatNo).val()){
																		$('#'+ data[i].reserSort + "-" + data[i].seatNo).parent().addClass('seatOn');
																	}
							            						}
							            					}
						            						
							            					
								            				$('#seatModal').modal("show");
						            					}
						            					 
						            				}) ;
						            			});
					            			</script>
					            		</div>
					            		<div class="right-chooseSeat">
					            			<div class="cl">● 선택좌석</div>
					            			<div class="cr" id="chooseSeat">
					            				
					            			</div>
					            		</div>
					            		<div class="right-price">
					            			<div class="cl">● 이용요금</div>
					            			<div class="cr" id="userPrice">
					            			
					            			</div>
					            		</div>
					            	</div>
					            </div>
					            <div class="right-agree">
					            	<div class="le-ag">
					            		<div class="ra-left"><input type="checkbox" class="che">개인정보 수집 및 이용에 관한 동의(필수)</div>
					            		<div class="ra-right" id="personInfo">[내용보기]</div>
					            		<script>
					            			$('#personInfo').click(function(e){
				            					e.preventDefault();
				            					$('#personInfoModal').modal("show");
				            				});
					            		</script>
					            	</div>
					            	<div class="ri-ag">
					            		<div class="ra-left"><input type="checkbox" class="che">마케팅  수신 동의(선택)</div>
					            		<div class="ra-right"><a>[내용보기]</a></div>
					            	</div>
					            </div>
					        </div>
					    </div>
					<div class="btnBox inner">
						<!-- <input type="button" class="defaultBtn"> -->
						 <button class="defaultBtn" onclick="buy()" value="결제">결제</button> 
					</div>
					
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<div class="modal fade" id="seatModal" role="dialog"> <!-- 좌석 모달창 부분 -->
	  <div class="modal-dialog modal-80size" >
	    <div class="modal-content modal-80size ">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<div >
        			<div>좌석선택</div>
        		</div>
		        	<form action="/reservation.se" method="post">
		        		<jsp:include page = "seatForm.jsp"/>
		        		<script>
					    	 $('.left-top1-table-cell, .big, .six1, .six2, .four1, .four2, .four3, .four4').on('click',function(){
					    		var chooseSeat = $(this).children().val();
					    		$("#chooseSeat").text(chooseSeat);
					    		
					    		var check = confirm(chooseSeat + "자리를 선택하시겠습니까?");
					    		if(check == true){
					    			$('#seatModal').modal("hide");
					    			var price =  $('#chooseSeat').text();
					    			var strPrice = price.split('-');
					    			
					    			var fullDate = $('#daterange').val();
					    			var startDate = fullDate.substr(0,10);
					    			var startTime = fullDate.substr(11,2);
					    			var endDate = fullDate.substr(18,11).trim();
					    			var endTime = fullDate.substr(29,3).trim();

					    			var fullDate1 = $('#daterange1').val();
					    			var startDate1 = fullDate1.substr(0,10);
					    			var startTime1 = fullDate1.substr(11,2);
					    			
					    			<c:forEach var="se" items="${ sortList }">
					    				 if(strPrice[0] == "${se.reserSort}"){
					    					result = (endTime-startTime) * "${se.reserFee}"
						    					if("${se.reserSort}" == 'Z'){
						    						console.log($("input:radio[name='period']:checked").val());
						    						if($("input:radio[name='period']:checked").val() == '7일권'){
						    							result = "${se.reserFee}"
						    						} else if($("input:radio[name='period']:checked").val() == '30일권'){
						    							result = "${se.reserFee}" * 3 + 5000;
						    						}
						    					}
					    				};		
					    			</c:forEach>
					    				$('#userPrice').text(result+'원');
					    		}
					    	}); 
					    </script>
		        	</form>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="modal fade" id="personInfoModal" role="dialog"> <!-- 개인정보내용 -->
	  <div class="modal-dialog" >
	    <div class="modal-content">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<div >
        			<h3 class="color_red" style="background:red; color:white; height:30px;">개인정보 수집 이용 동의 전문</h3>
        		</div>
					<div class="layer_conts">
						<p class="sub_title">부스예약 신청 시, <br>아래와 같이 고객님의 개인정보를 수집하고 있습니다.</p>
						<ul>
							<li>개인정보 수집범위 : 예약지점, 성별, 방문희망 일자</li>
							<li>개인정보 수집 및 이용목적 : 예약 확인</li>
							<li>개인정보 수집 및 보유기간 : 이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용 목적이 달성되면 지체 없이 파기하며 보유기간은 최대 3년을 넘기지 않는 것을 원칙으로 한다.</li>
						</ul>
        			
		       </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- 결제부분 -->
		<script>
			var money=$('#userPrice').text();
			var strMoney=money.split('원');
			var branchNo = $("input:radio[name='branchAddress']:checked").val();
			var reserType = $("input:radio[name='period']:checked").val();
			var reserDate;
			var reserPeople;
				if($("input:radio[name='period']:checked").val() == '시간권'){
					reserDate = $('#daterange').val();
					reserPeople = $("input:radio[name='reserPeople']:checked").val();
				}else if($("input:radio[name='period']:checked").val() == '7일권' || $("input:radio[name='period']:checked").val() == '30일권'){
					reserDate = $('#daterange1').val();
					reserPeople = 1;
				}
			var	chooseSeat = $("#chooseSeat").text();
			
			var dkanrjsk={branchNo:branchNo, reserType:reserType, reserDate:reserDate, id:'${ loginUser.id }', reserPeople:reserPeople, chooseSeat:chooseSeat, totalFee:strMoney[0]};
			
			function buy(){
				var buy = confirm("정말로 구매하시겠습니까?");
				$.ajax({
			    	   url : "seatBuy.se",
			    	   type : "post",
			    	   data : dkanrjsk,
			    	   success : function(data) {
			    		   console.log(data);
			    	        alert("성공"); 
			    	        location.href="lectureHistory.mp";
			    	    }
			       });
				/* if(buy){
					var IMP = window.IMP; 
					IMP.init('imp05073510'); 
					IMP.request_pay({
					    pg : 'html5_inicis', 
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : '주문명:결제테스트',
					    amount : strMoney[0],
					    buyer_email : '${ loginUser.email }',
					    buyer_name : '${ loginUser.name }',
					    buyer_tel : '${ loginUser.phone }',
					    buyer_addr : '서울특별시 강남구 삼성동',
					    buyer_postcode : '123-456',
					    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
					}, function(rsp) {
					    if ( rsp.success ) {
					        var msg = '${loginUser.name}님';
					        msg += '결제 금액 ' + rsp.paid_amount + '원이 결제 되었습니다.';
					      	$.ajax({
					    	   url : "seatBuy.se",
					    	   type : "post",
					    	   data : JSON.stringify(obj),
					    	   contentType: "application/json",
					       });
					       
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					    }
					    alert(msg);
					});				
				} */
			}	
		</script>
	
</body>
	<!-- 싱글타임피커 -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

	<!-- 데이트레인지피커 -->
	<script src="${contextPath}/resources/js/plugins/datepicker/common.min.js"></script> <!-- 데이트피커필요한스크립트 -->
	<script src="${contextPath}/resources/js/plugins/datepicker/moment.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.ko.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/daterangepicker.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/form-pickers-init.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</html>