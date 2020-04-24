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
	/* map */
	.branch-infoMap {
		background-color : yellow;
		width:100%; height:300px; border:1px solid #000; 
	}	
	
	/* 페이지 안 서브 메뉴 */
	ul.page-sub-menu li{
		list-style-type : none;
		display : inline-block;
		
		width : calc((100% / 3) - 10px); /* 100% / 3 중에서  3은 서브메뉴의 갯수를 적습니다. */
	}
	
	ul.page-sub-menu li a {
		display : block;
		border : 1px solid red;
		text-align : center;
		padding : 10px 0;
	 }
	 
	/* 주소와 전화번호 */
	.branch-info {
		text-align : center;
	}
	.branch-info div {
		display:inline-block;
		margin : 20px 50px 0;
	}
	
	/* 편의시설 */
	ul.cvc-box li {
		list-style-type : none;
		float : left;
		width : 30%;
		margin-right : 20px;
		padding : 20px 0;
	}
	
	ul.cvc-box img { 
		width : 42px; height : 42px;
		margin-right : 30px;
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
						<div class="branch-address"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> ${vBranch.branchAddress}</div>
						<div class="branch-tel"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> ${vBranch.branchTel}</div>
					</div>
				</div>
				<div class="content">
					<div class="inner">
						<ul class="page-sub-menu">
							<li><a href="#">지점 소개</a></li>
							<li><a href="#">공간소개</a></li>
							<li><a href="#">지점 위치</a></li>
						</ul>
						<div class="detail-box branch-infoText">
							안녕하세요. 코스모스 스터디센터(${vBranch.branchName})입니다.
							<br><br>
							${vBranch.branchContent}
							<br><br>
							[카페 무료이용 + 모임공간, 스터디룸, 스터디카페, 업무공간, 세미나실, 강의실, 화상인터뷰, 사업자등록, 복사, 프린트]
							<br>
							저희 지점은 최소 1명 ~ 최대 33명 수용가능한 모임공간이 준비되어 있으며,<br>
							개인공부를 위한 오픈형 독서실, '스마트카페'를 운영중에 있습니다.
							<br><br>
							문의사항은 방문, 전화해 주시면 친절히 안내해 드리겠습니다.
							출력을 위한 방문도 언제든 환영입니다.
							<br><br>
							합리적이고 효율적인 공간을 제공하는<br>
							코스모스 스터디센터(${vBranch.branchName})이 되겠습니다.
							<br><br>
							고맙습니다.
							
							<div>
								<h2>이용시간</h2>
								<p>${vBranch.branchTime}</p>
							</div>
							<div>
								<h2>지점 휴일</h2>
								<p>${vBranch.branchRest}</p>
							</div>
							<div>
								<h2>편의시설 및 서비스</h2>
								<ul class="cvc-box">
									<li><img src="resources/image/service/parking.png" alt=""><span>주차시설 </span></li>
									<li><img src="resources/image/service/drink.png" alt=""><span>음료제공 </span></li>
									<li><img src="resources/image/service/file.png" alt=""><span>견적서, 세금계산서 발급 </span></li>
									<li><img src="resources/image/service/wifi.png" alt=""><span>무선Wi-Fi </span></li>
									<li><img src="resources/image/service/securitycamera.png"><span>다중보안시스템 </span></li>
									<li><img src="resources/image/service/printer.png" alt=""><span>복합기 </span></li>
								</ul>
							</div>
						</div>
						<c:if test="${!empty vBranch.originalFileName}">
							<div class="detail-box branch-infoPhoto">
								<h2>지점 사진</h2>
								<c:forEach var="p" items=""> <!-- ${ vBranch.renameFileName } -->
									<div class="photo">
										<img src="${ contextPath }/resources/photo_uploadFiles/${ vBranch.renameFileName }" id="detailImg" class="detailImg">
									</div>	
								</c:forEach>
							</div>
						</c:if>
						<div class="detail-box branch-infoMap" id="branch-infoMap">
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
						<c:url var="vbUpForm" value="viewBranchUpForm.vb">
							<c:param name="vbNo" value="${vBranch.branchNo}"/>
							<c:param name="page" value="${page}"/>
						</c:url>
						<c:url var="vbList" value="viewBranchList.vb">
							<c:param name="page" value="${page}"/>
						</c:url>
						<button class="defaultBtn" onclick="location.href='${vbList}'">목록으로</button>
						<c:if test="${ sessionScope.loginUser.grade == 0}">
						<button class="defaultBtn" onclick="location.href='${vbUpForm}'">수정하기</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
</body>
</html>