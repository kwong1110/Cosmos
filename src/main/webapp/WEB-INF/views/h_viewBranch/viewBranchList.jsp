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
		height : 690px;
		border-top : 1px solid #000;
		border-bottom : 1px solid #000;
	}
	.div-left {
		float:left;
	}
	.div-right {
		width:550px;
		height : 100%;
		float : right;
	}
	.inner::after{
		content:"";
		display : block;
		clear:both;
	}
	#right-map{
		width:100%; height:100%; box-sizing: border-box; }
		
	.branch-box {
		position : relative;
		width:506px;
	}
	
	.branch-box:first-child {
		border-top:1px solid black;
	}
	
	.detail {
		position : absolute; right : 20px; top : 10px;
		text-decoration : underline;
	}
	
	.branch-box {
		border-bottom:1px solid black;
		padding : 9px 5px;
	}
	
	.left-mid {
		width: 100%;
		margin 0 auto;
	}
	
	/* 검색 */
	.search-form {
		margin-top : 5px;
		margin-bottom : 5px;
	}
	select.form-control{
		display : inline-block!important;
		width:120px;
	}
	select.form-control option:first-child {
		font-weight : bold;
		color : #000;
	}
	div.input-group, span.input-group-btn {
		display : inline-block!important;
	}
	div.input-group {		
		width: 330px;
	}
	
	div.input-group input.form-control {
		width:99%;
		padding:6px 10px;
		border-right:none;
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
						  	<form method="get" action="" class="search-form">
								<!-- 비율은 본인 스타일대로 수정해서 사용하세요 -->
								<select class="form-control" id="searchCondition" name="searchCondition" style="background : #67A261"><!--  search-select -->
									<option>분류</option>
									<option value="name">지점명</option>
									<option value="address">지역명</option>
								</select>
								<div class="input-group"><!-- search-text -->
									<input type="text" class="form-control" placeholder="검색어를 입력하세요." id="searchValue" name="searchValue">
									<span class="input-group-btn">
										<button class="btn search-submit" style="border:1px solid #ccc" type="button" onclick="searchBranch();">검색</button>
									</span>
								</div><!-- /input-group -->
							</form>
		
							<!-- 지점 리스트 -->
							<div class="left-mid">
				        			<c:forEach var="b" items="${vbList}">
				        				<div class="branch-box">
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
									<c:if test="${searchValue eq null}"><!-- 검색 안 한것 전체 값 가지고 오기 -->
									  <c:set var="loc" value="viewBranchList.vb" scope="page"/>
									</c:if>
									  <c:if test="${searchValue ne null} "><!-- 검색을 했다면 search.vb로 검색해서 가지고 오기 -->
									  <c:set var="loc" value="search.vb" scope="page"/>
									</c:if>
									<!-- 맨 처음으로 -->
									<li>
										<c:if test="${ pi.currentPage eq pi.startPage }">
											<a aria-label="Previous">
												<span class="icon-fast-backward"></span>
											</a>
										</c:if>
										<c:if test="${ pi.currentPage ne pi.startPage }">
											<c:url var="start" value="${loc}">
												<c:if test="${searchValue ne null}">
													<c:param name="searchCondition" value="${ searchCondition }"/>
													<c:param name="searchValue" value="${ searchValue }"/>
												</c:if>
												<c:param name="page" value="${ pi.startPage }"/>
											</c:url>
											<a href="${ start }" aria-label="Previous">
												<span class="icon-fast-backward"></span>
											</a>
										</c:if>
									</li>
									<!-- 이전  -->
									<li>
										<c:if test="${ pi.currentPage <= 1 }">
											<a aria-label="Previous">
												<span class="icon-to-start"></span>
											</a>
										</c:if>
										<c:if test="${ pi.currentPage > 1 }">
											<c:url var="before" value="${loc}">
												<c:if test="${searchValue ne null}">
													<c:param name="searchCondition" value="${ searchCondition }"/>
													<c:param name="searchValue" value="${ searchValue }"/>
												</c:if>
												<c:param name="page" value="${ pi.currentPage - 1 }"/>
											</c:url>
											<a href="${ before }" aria-label="Previous">
												<span class="icon-to-start"></span>
											</a>
										</c:if>
									</li>
									
									<!-- 페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<li><a class="pageBtn selectPageBtn">${ p }</a></li>
										</c:if>
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="${loc}">
												<c:if test="${searchValue ne null}">
													<c:param name="searchCondition" value="${ searchCondition }"/>
													<c:param name="searchValue" value="${ searchValue }"/>
												</c:if>
												<c:param name="page" value="${ p }"/>
											</c:url>
											<li><a href="${ pagination }">${ p }</a></li>
										</c:if>
									</c:forEach>
						
									<!-- 다음으로 -->
									<li>
										<c:if test="${ pi.currentPage >= pi.maxPage }">
											<a aria-label="Next">
												<span class="icon-to-end"></span>
											</a>
										</c:if>
										<c:if test="${ pi.currentPage < pi.maxPage }">
											<c:url var="after" value="${loc}">
												<c:if test="${searchValue ne null}">
													<c:param name="searchCondition" value="${ searchCondition }"/>
													<c:param name="searchValue" value="${ searchValue }"/>
												</c:if>
												<c:param name="page" value="${ pi.currentPage + 1 }"/>
											</c:url>
											<a href="${ after }" aria-label="Next">
												<span class="icon-to-end"></span>
											</a>
										</c:if>
									</li>
									<!-- 마지막으로 -->
									<li>
										<c:if test="${ pi.currentPage eq maxPage }">
											<a aria-label="Next">
												<span class="icon-fast-forward"></span>
											</a>
										</c:if>
										<c:if test="${ pi.currentPage ne maxPage }">
											<c:url var="max" value="${loc}">
												<c:if test="${searchValue ne null}">
													<c:param name="searchCondition" value="${ searchCondition }"/>
													<c:param name="searchValue" value="${ searchValue }"/>
												</c:if>
												<c:param name="page" value="${ pi.maxPage }"/>
											</c:url>
											<a href="${ max }" aria-label="Next">
												<span class="icon-fast-forward"></span>
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
									
									/* if(address1.indexOf("/")) {
										address1 = address1.split(" / ");
										address1.shift();
										address1.pop();
									} */
									
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
<script>
	function searchBranch(){
		var searchCondition = $("#searchCondition").val();
		var searchValue = $("#searchValue").val();
		// var userId = $("#userId").val(); // b.branchNo
		
		location.href="search.vb?searchCondition=" + searchCondition + "&searchValue=" + searchValue;
	}
	



</script>
</html>