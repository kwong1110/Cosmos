<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a8fa7e4a9e7170fa234c76a796cecab&libraries=services"></script>
</head>
<body>
	<!-- view 초기 구조 -->
	<!-- import 경로는 알아서 바꿔줄것. -->
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>지점 찾기</h1>
				</div>
				<div class="content">
					<!-- 지점 찾기 wrapper -->
					<div class="inner">
						
						<!-- 지점 리스트 -->
						<div class="left-mid">
			        			<c:forEach var="s" items="${ branchList }">
			        				<div style="margin-left:20px; margin-right:20px;border-bottom:1px solid black; height:102px;">
			        					<div style="margin-left:38px;"><b>코스모스 스터디센터 ${ s.branchName }</b></div>
			        					<div style="overflow: hidden;white-space:nowrap;text-overflow : ellipsis;">
			        						<input type="radio"  class="branchAddress"id="branchAddress" name="branchAddress"  value="${ s.branchAddress }"style="width:20px; height:20px; margin-left:10px;" onclick="branchAddress(this);">&nbsp;${ s.branchAddress }
			        					</div>
			        					<div style="margin-left:38px;">${ s.branchTel }</div>
			        				</div>
			        			</c:forEach>
			        		
			        	</div>
			        	
			        	<!-- 지점 페이징  -->
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
					
					<!-- 지도 -->
					
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
					<div><a href="branchForm.vb">상세 폼 보기</a></div>
					<div class="btnBox inner">
						<button class="defaultBtn" onclick=""></button>
						
					</div>
				</div> <!-- div.inner -->
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
</body>
</html>