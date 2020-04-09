<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>

<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap&subset=korean');
	body {font-family: 'Nanum Gothic', sans-serif; font-size: 1.6rem;}
	
	#topArea{width:100%; display:inline-block; vertical-align:middle;}
	#categoryArea{margin-left:5%; width:40%; float:left; background:red;}
	#searchArea{margin-right:5%; width:40%; float:right; background:pink;}
	
	#groupTable{width:90%; margin-top:5%; font-size:17px; margin-left: auto; margin-right: auto; /*background:yellow;*/}
	#groupTable tr{height:50px;}
	#groupTable td{text-align:center; vertical-align:middle;}
	#groupTable th{background: #67A261; font-size: 19px; font-weight:bold; text-align:center; vertical-align:middle;}
	
	.typeBadge{
		font-weight: bold;
		padding-left: 8px;
		padding-right: 8px;
		padding-top: 5px;
		padding-bottom: 5px;
		border-radius: 10rem;
		display: inline-block;
		font-size: 15px;
		line-height: 1;
		text-align: center;
		white-space: nowrap;
		vertical-align: baseline;
		outline: none;
		box-sizing: inherit;
		margin: 0;
	}
	
	.once{background-color: #70B667; color: #fff; margin-right:20px;}
	.long{background-color: #135D36; color: #fff; margin-right:20px;}
	
</style>

</head>
<body>
	<div class="total-wrapper">
		<c:import url="../../a_common/menubar.jsp"/>
		
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>마이 그룹</h1>
				</div>
				<div class="content">
				
					<div id="topArea">
						<div id="categoryArea">
							<label>once</label>
							&nbsp;&nbsp;|&nbsp;&nbsp;
							<label>long</label>
						</div>
						
						<div id="searchArea">
				  			<!-- 검색창 -->
				  			<!-- 드롭다운 + 검색 -->
							<form method="get" action="">
								<div class="input-group">
									<div class="input-group-btn">
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">분류 <span class="caret"></span></button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">분류</a></li>
											<li><a href="#">111</a></li>
											<li><a href="#">222</a></li>
											<li class="divider"></li>
											<li><a href="#">333</a></li>
										</ul>
									</div><!-- /btn-group -->
									<input type="text" class="form-control" placeholder="검색어를 입력하세요.">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button">검색</button>
									</span>
								</div><!-- /input-group -->
							</form>
						</div>
					</div>
					
					<table id="groupTable">
						<tr onclick="">
							<th>No</th>
							<th>그룹유형</th>
							<th>공부 종류</th>
							<th>그룹 명</th>
							<th>그룹장</th>
							<th>그룹 상태</th>
						</tr>
						<tr>
							<td>3</td>
							<td><span class="typeBadge long">long</span></td>
							<td>자격증</td>
							<td>그룹명 블라블라3</td>
							<td>그룹장닉네임3</td>
							<td>추가 모집 중</td>
						</tr>
						<tr>
							<td>2</td>
							<td><span class="typeBadge long">long</span></td>
							<td>대학생 학점관리</td>
							<td>그룹명 블라블라2</td>
							<td>그룹장닉네임2</td>
							<td>스터디 진행 중</td>
						</tr>
						<tr>
							<td>1</td>
							<td><span class="typeBadge once">once</span></td>
							<td>JAVA</td>
							<td>그룹명 블라블라1</td>
							<td>그룹장닉네임1</td>
							<td>스터디 종료</td>
						</tr>
					</table>
					
					<div style="width:100%; display:block; text-align:center; margin-top: 3%;">
						<!-- 페이징  -->
						<nav>
							<ul class="pagination">
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&lt;</span>
								</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#" aria-label="Next"> <span
										aria-hidden="true">&gt;</span>
								</a></li>
								<li><a href="#" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
		
		<c:import url="../../a_common/footer.jsp"/>
	</div>
	
	<!-- 모달 -->
	<div id="groupModal" class="modal fade" role="dialog">
		<div class="modal-dialog" style="width:45%;">
			<div class="modal-content" style="background: lightgray;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title" style="width:100%; text-align:center; margin:10px;">마이 쿠폰</h2>
				</div>
				
				<div class="modal-body" style="width:100%; display:inline-block; text-align:center;">
					
					<div style="width:90%; min-height: 330px; margin-top:5%; margin-bottom:5%; display:inline-block; text-align:center; border-radius:10px; background:white;">
						<div style="width:100%; height:120px; padding: 4%; padding-bottom: 1%;">
							<div style="width:50%; height:100%; float:left; padding-left:3%;">
								<div class="logo_green" style="height:100%; width:auto;"></div>
							</div>
							<div style="width:50%; height:100%; float:right; text-align:right; padding-right:5%; padding-top:3%;">
								<label style="font-size:35px; font-weight:normal;">3/10</label>
							</div>
						</div>
						
						<div style="width:100%; text-align:center;">
						<div style="width:85%; display:inline-block;">
							<table style="width:100%; display:table; text-align:center; border-collapse: separate; border-spacing: 0em 1.5em !important">
								<tr>
									<td style="display:inline-block; text-align:center;"><img src="${contextPath }/resources/image/alien.png" style="width:80px; height:auto; display:block;" /></td>
									<td><div style="width:70px; height:70px; display:inline-block; background:#A6A6A6; border-radius:50%;"></div></td>
									<td><div style="width:70px; height:70px; display:inline-block; background:#A6A6A6; border-radius:50%;"></div></td>
									<td><div style="width:70px; height:70px; display:inline-block; background:#A6A6A6; border-radius:50%;"></div></td>
									<td><div style="width:70px; height:70px; display:inline-block; background:#A6A6A6; border-radius:50%;"></div></td>
								</tr>
								<tr>
									<td><div style="width:70px; height:70px; display:inline-block; background:#A6A6A6; border-radius:50%;"></div></td>
									<td><div style="width:70px; height:70px; display:inline-block; background:#A6A6A6; border-radius:50%;"></div></td>
									<td><div style="width:70px; height:70px; display:inline-block; background:#A6A6A6; border-radius:50%;"></div></td>
									<td><div style="width:70px; height:70px; display:inline-block; background:#A6A6A6; border-radius:50%;"></div></td>
									<td><div style="width:70px; height:70px; display:inline-block; background:#A6A6A6; border-radius:50%;"></div></td>
								</tr>
							</table>
						</div>
						</div>
					</div>
					
					<div style="width:100%; text-align:center;">
					<div style="width:80%; display:inline-block;">
						<table style="width:100%; display:table; font-size:18px; display:table; text-align:center; border-collapse: separate; border-spacing: 0em 1.7em !important">
							<tr>
								<td>2020.00.00 00:00</td>
								<td>쿠폰 발급</td>
								<td>-10</td>
							</tr>
							<tr>
								<td>2020.00.00 00:00</td>
								<td>한남점 1인 3시간 좌석예약</td>
								<td>+1</td>
							</tr>
							<tr>
								<td>2020.00.00 00:00</td>
								<td>노량진점 6인 3시간 좌석예약</td>
								<td>+1</td>
							</tr>
						</table>
					</div>
					</div>
				</div>

				<div class="modal-footer" style="width:100%; text-align:center;">
					<nav>
						<ul class="pagination">
							<li><a href="#" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<li><a href="#" aria-label="Previous"> <span
									aria-hidden="true">&lt;</span>
							</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#" aria-label="Next"> <span
									aria-hidden="true">&gt;</span>
							</a></li>
							<li><a href="#" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 -->
	
	<script>
		$(function() {
			
		});
		
		$('#groupTable tr').mouseover(function() {
			$(this).css('background','rgba(103,162,97,0.2)');
		}).mouseout(function() {
			$(this).css('background','rgba(103,162,97,0)');
		});
		
	</script>

</body>
</html>