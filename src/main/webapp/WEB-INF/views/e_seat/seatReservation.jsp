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
<style>
.wrap-div{width:100%; height:850px; margin:0 auto; }
    .div-left{width:30%; height:inherit; float:left;}
    	.left-top{width:100%; height:7%; border:1px solid #000; box-sizing: border-box;}
    	.left-mid{width:100%; height:93%; border:1px solid #000; box-sizing: border-box; border-bottom:0;}
    	.left-bot{width:100%; height:7%; border:1px solid #000; box-sizing: border-box; border-top:0;}
    	
    .div-right{width:70%; height:inherit; float:right;}
    	.right-top{width:100%; height:7%; border:1px solid #000; box-sizing: border-box; border-left:0;}
    	#right-top{line-height:55px; font-size:25px;}
    	#right-map{width:100%; height:58%; border:1px solid #000; box-sizing: border-box; border-left:0; border-bottom:0;}
    	.right-content{width:100%; height:35%; border:1px solid #000; box-sizing: border-box;border-left:0; border-bottom:0; }
    		.right-content-left{width:60%; height:100%;  box-sizing: border-box; float:left; 
    							line-height:70px; padding-left:50px;}
    			.left-spot{width:100%; height:25%; box-sizing: border-box;}
    			.left-date{width:100%; height:25%; box-sizing: border-box;}
    			.left-name{width:100%; height:25%; box-sizing: border-box;}
    			.left-phone{width:100%; height:25%; box-sizing: border-box;}
    				.cl{width:30%;height:100%; box-sizing: border-box; float:left;}
    				.cr{width:70%;height:100%; box-sizing: border-box; float:right; }
    		.right-content-right{width:40%; height:100%;  box-sizing: border-box; float:right; 
    							 line-height:70px;padding-left:15px;}
    			.right-choose{width:100%; height:25%; box-sizing: border-box;}
    			.right-seat{width:100%; height:25%; box-sizing: border-box;}
    			.right-chooseSeat{width:100%; height:25%; box-sizing: border-box;}
    			.right-price{width:100%; height:25%; box-sizing: border-box;}
    	.right-agree{width:100%; height:7%; border:1px solid #000; box-sizing: border-box; border-top:0; border-left:0;}
    		.le-ag{width:60%; height:100%;  box-sizing: border-box; float:left; line-height:55px; padding-left:50px; }
    		.ri-ag{width:40%; height:100%;  box-sizing: border-box; float:right; line-height:55px;padding-left:0px; }
    		.ra-left{width:70%; float:left; font-size:16px;}
    		.ra-right{width:30%;float:right;}
   
    .che{width:15px;height:15px;} /* 인원선택 체크박스 css */
    
  	nav{margin-left:20px;}
  	
  	
  	.modal-dialog.modal-80size {width: 85%; height: 90%; margin: 0; padding: 0;}
	.modal-content.modal-80size {height: auto; min-height: 90%;}
	.modal {text-align: center;}
	@media screen and (min-width: 768px) {
  	.modal:before {display: inline-block; vertical-align: middle; content: " ";height: 95%;}
	}
	.modal-dialog {display: inline-block; text-align: left; vertical-align: middle;}
	
	
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
					        				<%-- <tr>
					        					<th rowspan="3" style="width:10%; vertical-align:middle;">
					        						<input type="radio" name="branchAddress" checked="checked" value="${ s.branchAddress }" style="width:20px; height:20px; text-align:center;">
					        					</th>
					        					<th style="width:90%;">${ s.branchName }</th>
					        				</tr>
					        				<tr>
					        					<td style="width:90%;">
					        						${ s.branchAddress }
					        					</td>
					        				</tr>
					        				<tr>
					        					
					        					<td style="width:90%;">
					        						${ s.branchTel }
					        					</td>
					        				</tr> --%>
					        				<div style="margin-left:20px; margin-right:20px;border-bottom:1px solid black; height:100px;">
					        					<div style="margin-left:38px;"><b>코스모스 스터디센터 ${ s.branchName }</b></div>
					        					<div><input type="radio"  class="branchAddress"id="branchAddress" name="branchAddress" value="${ s.branchAddress }"style="width:20px; height:20px; margin-left:10px;" onclick="branchAddress(this);">&nbsp;${ s.branchAddress }</div>
					        					<div style="margin-left:38px;">${ s.branchTel }</div>
					        				</div>
					        			</c:forEach>
					        		
					        	</div>
					            <div class="left-bot ">
					            	<nav>
									  <ul class="pagination">
									    <li>
									      <a href="#" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
									    <li>
									      <a href="#" aria-label="Previous">
									        <span aria-hidden="true">&lt;</span>
									      </a>
									    </li>
									    <li><a href="#">1</a></li>
									    <li><a href="#">2</a></li>
									    <li><a href="#">3</a></li>
									    <li><a href="#">4</a></li>
									    <li><a href="#">5</a></li>
									    <li>
									      <a href="#" aria-label="Next">
									        <span aria-hidden="true">&gt;</span>
									      </a>
									    </li>
									    <li>
									      <a href="#" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li>
									  </ul>
								  	</nav>
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
					       			
										<!-- <div id="map" style="width:100%;height:100%;"></div> -->
										
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
									<script >
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
					            				/* function branchAddress(e){
					            					var checkedVal=$(e).parent().parent().children().eq(0)[0].innerText;
					            					$("#reserStore").html(checkedVal);
					            				} */
					            				/*var st = $("input:radio[name=branchAddress]:checked").val();
					            				console.log(st);
					            				$("#reserStore").html(st);*/
					            				/* var tmp = $("#branchAddress").parent().parent().children().eq(0)[0].innerText;
					            				console.log(tmp);
					            				console.log(${ s.branchAddress });
					            				$("#reserStore").text(tmp); */
					            				$('input[type=radio][name=branchAddress]').on('click',function(){
					            					var tmp = $('input[type=radio][name=branchAddress]:checked').parent().parent().children().eq(0)[0].innerText;
					            					console.log(tmp);
					            						/* $("#branchAddress").parent().parent().children().eq(0)[0].innerText; */
					            					$("#reserStore").text(tmp);
					            				});
					            				</script>
					            			</div>
					            		</div>
					            		<div class="left-date">
					            			<div class="cl">● 예약일자</div>
					            			<div class="cr">
					            				<div class="box-title m-t-30"></div>
												<input type="text" class="form-control input-daterange-timepicker" name="daterange" id="daterange" style="width:270px;">
					            			</div>
					            		</div>
					            		<div class="left-name">
					            			<div class="cl">● 이름</div>
					            			<div class="cr">
					            				<input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요" style="width:270px;">
					            			</div>
					            		</div>
					            		<div class="left-phone">
					            			<div class="cl">● 휴대폰번호</div>
					            			<div class="cr">
					            				<input type="text" name="phone" class="form-control" placeholder="번호를 입력해주세요" style="width:270px;">
					            			</div>
					            		</div>
					            	</div>
					            	<div class="right-content-right">
					            		<div class="right-choose">
					            			<div class="cl">● 인원선택</div>
					            			<div class="cr">
					            				<input type="checkbox" class="che" name="onep">1인 &nbsp;&nbsp;
					            				<input type="checkbox" class="che" name="fourp">4인 &nbsp;&nbsp;
					            				<input type="checkbox" class="che" name="sixp">6인
					            			</div>
					            		</div>
					            		<div class="right-seat">
					            			<div class="cl">● 좌석선택</div>
					            			<div class="cr">
					            				<div id="seatChoose" class="btn defaultBtn" style="width:150px;">선택</div>
					            			</div>
					            			<script>
					            			$('#seatChoose').click(function(e){
					            				e.preventDefault();
					            				$('#seatModal').modal("show");
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
					            				 <%-- ${ sortList } --%>
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
					    		// console.log(chooseSeat);
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
					    			console.log(fullDate);
					    			console.log(startDate);
					    			console.log(startTime);
					    			console.log(endDate);
					    			console.log(endTime);
					    			
					    			<c:forEach var="d" items="${ sortList }">
				    				if(strPrice[0] == "${ d.reserSort }"){
				    					result = (endTime-startTime) * "${d.reserFee}"
				    				};
				    				</c:forEach>
					    			
					    			$('#userPrice').text(result+'원');
					    		}
					    		/* var price =  $('#chooseSeat').text();
            				 	console.log(price); */
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
		<!-- <script>
			var IMP = window.IMP; 
			IMP.init('imp05073510'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			IMP.request_pay({
			    pg : 'html5_inicis', 
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 14000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		</script>
	 -->
</body>
	<script src="${contextPath}/resources/js/plugins/datepicker/common.min.js"></script> <!-- 데이트피커필요한스크립트 -->
	<script src="${contextPath}/resources/js/plugins/datepicker/moment.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.ko.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/daterangepicker.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/form-pickers-init.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</html>