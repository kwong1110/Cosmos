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
	
	#topArea{width:100%; display:inline-block; vertical-align:middle; margin-top:2%;}
	#categoryArea{margin-left:5%; width:40%; float:left;}
	#searchArea{margin-right:5%; width:40%; float:right;}
	
	#groupTable{width:90%; margin-top:2%; font-size:17px; margin-left: auto; margin-right: auto; /*background:yellow;*/}
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
	
	.table th{text-align:center;}
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
										<button class="btn" type="button">검색</button>
									</span>
								</div><!-- /input-group -->
							</form>
						</div>
					</div>
					
					<table id="groupTable" class="table table-hover">
						<tr>
							<th>No</th>
							<th>그룹유형</th>
							<th>공부 종류</th>
							<th>그룹 명</th>
							<th>그룹장</th>
							<th>그룹 상태</th>
						</tr>
						<tr data-toggle="modal" data-target="#groupModal">
							<td>4</td>
							<td><span class="typeBadge long">long</span></td>
							<td>자격증</td>
							<td>그룹명 블라블라4</td>
							<td>그룹장닉네임4</td>
							<td>추가 모집 중</td>
						</tr>
						<tr data-toggle="modal" data-target="#groupBossModal">
							<td>3</td>
							<td><span class="typeBadge long">long</span></td>
							<td>JAVA</td>
							<td>그룹명 블라블라3</td>
							<td>그룹장닉네임3</td>
							<td>스터디 종료 (나감)</td>
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
							<td>스터디 종료 (강퇴)</td>
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
	
	<!-- 그룹원 모달 -->
	<div id="groupModal" class="modal fade" role="dialog">
		<div class="modal-dialog" style="width:35%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title" style="width:100%; text-align:center; margin:10px;">그룹명</h2>
				</div>
				
				<div class="modal-body" style="width:100%; display:inline-block; text-align:center;">
					
					<div style="width:100%; text-align:center;">
					<div style="width:90%; display:inline-block;">
						<table class="table table-hover" style="width:100%; display:table; font-size:18px; text-align:center; margin-top:20px;">
							<tr style="background:lightgray;">
								<th>No</th>
								<th>구성원 닉네임</th>
								<th>그룹 참가일</th>
							</tr>
							<tr>
								<td>5</td>
								<td>닉네임5</td>
								<td>2020.00.00</td>
							</tr>
							<tr>
								<td>4</td>
								<td>닉네임4</td>
								<td>2020.00.00</td>
							</tr>
							<tr>
								<td>3</td>
								<td>닉네임3</td>
								<td>2020.00.00</td>
							</tr>
							<tr>
								<td>2</td>
								<td>닉네임2</td>
								<td>2020.00.00</td>
							</tr>
							<tr>
								<td>1</td>
								<td>닉네임1</td>
								<td>2020.00.00</td>
							</tr>
						</table>
					</div>
					</div>
				</div>

				<div class="btnBox" style="margin:0; padding:0; margin-bottom:40px;">
					<input type="button" class="defaultBtn" style="width: 40%; height: 40px; font-size: 16px; margin:0; padding:0;" value="그룹 나가기" />
				</div>
			</div>
		</div>
	</div>
	<!-- 그룹원 모달 -->
	
	<!-- 그룹장 모달 -->
	<div id="groupBossModal" class="modal fade" role="dialog">
		<div class="modal-dialog" style="width:35%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title" style="width:100%; text-align:center; margin:10px;">그룹명</h2>
				</div>
				
				<div class="modal-body" style="width:100%; display:inline-block; text-align:center;">
					
					<div style="width:100%; text-align:center;">
					<div style="width:90%; display:inline-block;">
						<table class="table table-hover" style="width:100%; display:table; font-size:18px; text-align:center; margin-top:20px;">
							<tr style="background:lightgray;">
								<th>No</th>
								<th>구성원 닉네임</th>
								<th>그룹 참가일</th>
								<th></th>
							</tr>
							<tr>
								<td>5</td>
								<td>닉네임5</td>
								<td>2020.00.00</td>
								<td><input type="button" class="defaultBtn" value="강퇴"></td>
							</tr>
							<tr>
								<td>4</td>
								<td>닉네임4</td>
								<td>2020.00.00</td>
								<td><input type="button" class="defaultBtn" value="강퇴"></td>
							</tr>
							<tr>
								<td>3</td>
								<td>닉네임3</td>
								<td>2020.00.00</td>
								<td><input type="button" class="defaultBtn" value="강퇴"></td>
							</tr>
							<tr>
								<td>2</td>
								<td>닉네임2</td>
								<td>2020.00.00</td>
								<td><input type="button" class="defaultBtn" value="강퇴"></td>
							</tr>
							<tr>
								<td>1</td>
								<td>닉네임1</td>
								<td>2020.00.00</td>
								<td><input type="button" class="defaultBtn" value="강퇴"></td>
							</tr>
						</table>
					</div>
					</div>
				</div>

				<div class="btnBox" style="margin:0; padding:0; margin-bottom:40px;">
					<input type="button" class="defaultBtn" style="width: 30%; height: 40px; font-size: 16px; margin:0; padding:0;" value="그룹 수정">
					&nbsp;&nbsp;&nbsp;
					<input type="button" class="defaultBtn" style="width: 30%; height: 40px; font-size: 16px; margin:0; padding:0;" value="그룹 없애기">
				</div>
			</div>
		</div>
	</div>
	<!-- 그룹장 모달 -->
	
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