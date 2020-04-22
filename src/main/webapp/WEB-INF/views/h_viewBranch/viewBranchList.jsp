<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 찾기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a8fa7e4a9e7170fa234c76a796cecab&libraries=services"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<style>
	.inner {
		background-color : aqua;
		height : 650px;
	}
	.div-left {
		float:left;
		width: 40%; 
	}
	.div-right {
	
		background-color:orange;
		width:60%;
		height : 100%;
		float : right;
	}
	.inner::after{
		content:"";
		display : block;
		clear:both;
	}
	#right-map{
		background-color : yellow;
		width:100%; height:100%; border:1px solid #000; box-sizing: border-box; border-left:0; border-bottom:0;}
		
	.branch-box {
		
		position : relative;
	}
	.detail {
		position : absolute; right : 20px; top : 10px;
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
					<h1>지점 리스트</h1>
				</div>
				<div class="content">
					<!-- 지점 찾기 wrapper -->
					<div class="inner">
						<div class="div-left">
							
							<!-- 검색창 -->
						  	<!-- 드롭다운 + 검색 -->
							<form method="get" action="">
								<div class="row">
									<div class="col-lg-6">
										<div class="input-group">
											<div class="input-group-btn">
												<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false">분류 <span class="caret"></span></button>
												<ul class="dropdown-menu" role="menu">
													<li><a href="#">분류</a></li>
													<li><a href="#">111</a></li>
													<li><a href="#">222</a></li>
													<li class="divider"></li>
													<li><a href="#">333</a></li>
												</ul>
											</div><!-- /btn-group -->
											<input type="text" class="form-control" style="border:none;" placeholder="검색어를 입력하세요.">
												<span class="input-group-btn">
													<button class="btn search-submit" type="button">검색</button>
												</span>
										</div>
										<!-- /input-group -->
									</div><!-- /.col-lg-6 -->
								</div><!-- /.row -->
							</form>
							
							<!-- 지점 리스트 -->
							<div class="left-mid">
				        			<c:forEach var="b" items="${vbList}">
				        				<div class="branch-box" style="margin-left:20px; margin-right:20px;border-bottom:1px solid black; height:102px;">
				        					<div style="margin-left:38px;"><b>코스모스 스터디센터 ${ b.branchName }</b></div>
				        					<c:url var="vbdetail" value="viewBranchDetail.vb">
												<c:param name="vbNo" value="${ b.branchNo }"/>
												<c:param name="page" value="${ pi.currentPage }"/>
											</c:url>
				        					<div class="detail"><a href="${vbdetail}">상세보기</a></div>
				        					<div style="overflow: hidden;white-space:nowrap;text-overflow : ellipsis;">
				        						<input type="radio" class="branchAddress" id="branchAddress" name="branchAddress" value="${ b.branchAddress }" style="width:20px; height:20px; margin-left:10px;" onclick="branchAddress(this);">&nbsp;${ b.branchAddress }
				        					</div>
				        					<div style="margin-left:38px;">${ b.branchTel }</div>
				        				</div>
				        			</c:forEach>
				        		
				        	</div> <!-- left-mid -->
				        	
				        	<!-- 지점 페이징  -->
							<div class="left-bot" style="text-align:center;">
								<ul class="pagination">
									<li>
										<c:if test="${ pi.currentPage eq pi.startPage }">
											<a aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</c:if>
										<c:if test="${ pi.currentPage ne pi.startPage }">
											<c:url var="start" value="viewBranchList.vb">
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
											<c:url var="before" value="viewBranchList.vb">
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
											<c:url var="pagination" value="viewBranchList.vb">
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
											<c:url var="after" value="viewBranchList.vb">
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
											<c:url var="max" value="viewBranchList.vb">
												<c:param name="page" value="${ pi.maxPage }"/>
											</c:url>
											<a href="${ max }" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</c:if>
									</li>
								</ul>		  
						    </div><!-- left-bot -->
					    </div>    
					
						<!-- 지도 -->
						<div class="div-right">
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
				       		</div> <!-- right-map  -->
							
						</div> <!-- div-right -->
					</div> <!-- div.inner -->
				</div> <!-- content -->
			</div> <!-- main -->
		</div> <!-- wrapper -->
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
</body>
</html>