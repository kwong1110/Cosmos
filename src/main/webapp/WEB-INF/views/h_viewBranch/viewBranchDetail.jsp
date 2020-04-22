<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 상세보기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a8fa7e4a9e7170fa234c76a796cecab&libraries=services"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<style>
	.branch-infoMap {
		background-color : yellow;
		width:100%; height:300px; border:1px solid #000; }
	}	

</style>

</head>
<body>
	<!-- view 초기 구조 -->
	<!-- import 경로는 알아서 바꿔줄것. -->
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>코스모스 스터디센터 (${vBranch.branchName})</h1>
					<div class="branch-info">
						<div class="branch-address">${vBranch.branchAddress}</div>
						<div class="branch-tel">${vBranch.branchTel}</div>
					</div>
				</div>
				<div class="content">
					<div class="inner">
						<div class="branch-subTitle">
							<div>지점 소개</div>
							<div>공간소개</div>
							<div>지점 위치</div>
						</div>
						<div class="branch-infoText">
							
							
						</div>
						<div class="branch-infoPhoto">
							
						</div>
						<div class="branch-infoMap" id="branch-infoMap">
							<input type="hidden" name="branchAddress" value="${vBranch.branchAddress}" id="branchAddress">
							<input type="hidden" name="branchName" value="${vBranch.branchName}" id="branchName">
							<script type="text/javascript">
									function brAddress(){
											var address = document.getElementById("branchAddress").value; 
											var name = document.getElementById("branchName").value;
											var mapContainer = document.getElementById('branch-infoMap'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(37.49898969752637, 127.03285209192696), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };  
										
										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 
										
										// 주소-좌표 변환 객체를 생성합니다
										var geocoder = new kakao.maps.services.Geocoder();
										
										// 주소로 좌표를 검색합니다
										geocoder.addressSearch(address, function(result, status) {
										
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
										            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + name + '</div>'
										        });
										        infowindow.open(map, marker);
										
										        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										        map.setCenter(coords);
										    } 
										});    
									}
									window.onload=brAddress;
								</script>
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
</body>
</html>