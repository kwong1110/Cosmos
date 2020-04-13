<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a8fa7e4a9e7170fa234c76a796cecab&libraries=services"></script>
<title>Insert title here</title>
<style>
.wrap-div{width:100%; height:850px; margin:0 auto; }
    .div-left{width:30%; height:inherit; float:left;}
    	.left-top{width:100%; height:7%; border:1px solid #000; box-sizing: border-box;}
    	.left-mid{width:100%; height:86%; border:1px solid #000; box-sizing: border-box; border-top:0; border-bottom:0;}
    	.left-bot{width:100%; height:7%; border:1px solid #000; box-sizing: border-box;}
    	
    .div-right{width:70%; height:inherit; float:right;}
    	.right-top{width:100%; height:7%; border:1px solid #000; box-sizing: border-box; border-left:0;}
    	#right-top{line-height:55px; font-size:25px;}
    	#right-map{width:100%; height:51%; border:1px solid #000; box-sizing: border-box; border-top:0; border-left:0; border-bottom:0;}
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
    			.right-time{width:100%; height:25%; box-sizing: border-box;}
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
					        	<div class="left-top">
					        	</div>
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
					        				<div style="margin-left:20px; margin-right:20px;border-bottom:1px solid black;">
					        					<div style="margin-left:38px;"><b>${ s.branchName }</b></div>
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
					            <div class="right-top" id="right-top"> 
					            	<script>
						        		$('input[type=radio][name=branchAddress]').on('click',function(){
			            					var tmp = $('input[type=radio][name=branchAddress]:checked').val();
			            						/* $("#branchAddress").parent().parent().children().eq(0)[0].innerText; */
			            					$("#right-top").text(tmp);
			            				});
					        		</script>
					            </div>
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
										            content: '<div style="width:150px; text-align:center; padding:6px 0;"> '+ name +'</div>'
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
												<input class="form-control input-daterange-datepicker" type="text" name="daterange">
					            			</div>
					            		</div>
					            		<div class="left-name">
					            			<div class="cl">● 이름</div>
					            			<div class="cr">
					            				<input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요">
					            			</div>
					            		</div>
					            		<div class="left-phone">
					            			<div class="cl">● 휴대폰번호</div>
					            			<div class="cr">
					            				<input type="text" name="phone" class="form-control" placeholder="번호를 입력해주세요">
					            			</div>
					            		</div>
					            	</div>
					            	<div class="right-content-right">
					            		<div class="right-choose">
					            			<div class="cl">● 인원선택</div>
					            			<div class="cr">
					            				<input type="checkbox" class="che" name="onep">1인 &nbsp;&nbsp;&nbsp;
					            				<input type="checkbox" class="che" name="manyp">다인
					            			</div>
					            		</div>
					            		<div class="right-seat">
					            			<div class="cl">● 좌석선택</div>
					            			<div class="cr">
					            				<div id="seatChoose" class="btn btn-default" style="width:150px;">선택</div>
					            			</div>
					            			<script>
					            			$('#seatChoose').click(function(e){
					            				e.preventDefault();
					            				$('#seatModal').modal("show");
					            			});
					            			</script>
					            		</div>
					            		<div class="right-time">
					            			<div class="cl">● 이용시간</div>
					            			<div class="cr">
					            				<select style="width:150px;">
					            					<option selected>시간선택</option>
					            					<option>09:00 ~ 10:00</option>
					            					<option>10:00 ~ 11:00</option>
					            					<option>11:00 ~ 12:00</option>
					            					<option>12:00 ~ 13:00</option>
					            					<option>13:00 ~ 14:00</option>
					            					<option>14:00 ~ 15:00</option>
					            					<option>15:00 ~ 16:00</option>
					            					<option>16:00 ~ 17:00</option>
					            					<option>17:00 ~ 18:00</option>
					            					<option>18:00 ~ 19:00</option>
					            					<option>19:00 ~ 20:00</option>
					            					<option>20:00 ~ 21:00</option>
					            					
					            				</select>
					            			</div>
					            		</div>
					            		
					            	</div>
					            </div>
					            <div class="right-agree">
					            	<div class="le-ag">
					            		<div class="ra-left"><input type="checkbox" class="che">개인정보 수집 및 이용에 관한 동의(필수)</div>
					            		<div class="ra-right">[내용보기]</div>
					            	</div>
					            	<div class="ri-ag">
					            		<div class="ra-left"><input type="checkbox" class="che">마케팅  수신 동의(필수)</div>
					            		<div class="ra-right">[내용보기]</div>
					            	</div>
					            </div>
					        </div>
					    </div>
					<div class="btnBox inner">
						<button class="defaultBtn" onclick=""></button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<div class="modal fade" id="seatModal"> <!-- 좌석 모달창 부분 -->
	  <div class="modal-dialog modal-80size" role="document">
	    <div class="modal-content modal-80size ">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<div >
        			<div>좌석선택</div>
        		</div>
		        	<form action="/reservation.se" method="post">
		        		<jsp:include page = "seatForm.jsp"/>
		        	</form>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
</body>
	<script src="${contextPath}/resources/js/plugins/datepicker/common.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/moment.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.ko.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/daterangepicker.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/form-pickers-init.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</html>