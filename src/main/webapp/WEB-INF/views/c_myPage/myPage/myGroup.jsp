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
	#bottomArea{width:100%; display:block; text-align:center; margin-top: 3%;}
	#categoryArea{margin-left:5%; width:40%; float:left;}
	#searchArea{width:45%; display:inline-block; padding:0; text-align:center;}
	
	#optionArea{margin:0; padding-right:5%; width:19.7%; float:right; display:block; text-align:right; pagging:0; vertical-align:middle; transform:scale(0.85); }
	#openOption{cursor:pointer; padding-left:4px; padding-right:4px;}
	#hiddenOption{display:block; text-align:center; position:absolute; border-radius:8px; padding:5px 14px; background:#A6A6A6; vertical-align:middle;}
	#optionLabel{display:inline-block; vertical-align:middle; color:white; font-weight:bold; font-size:17px;}
	#hiddenOption>div{margin-top:4px; display:inline-block; vertical-align:middle;}
	
	#groupTable{width:90%; margin-top:1%; font-size:17px; margin-left: auto; margin-right: auto; /*background:yellow;*/}
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
	
	/* 모달 */
	.modal-dialog{width:35%;}
	.modal-title{width:100%; text-align:center; }
	.modal-header>h2{margin-top:2%; margin-bottom:2%; }
	
	.modal-body{width:100%; display:inline-block; text-align:center; margin-bottom:2%;}
	.modal-body>div{width:100%; text-align:center;}
	.modal-body>div>div{width:90%; display:inline-block;}
	.modal-body>div>div>table{width:100%; display:table; font-size:18px; text-align:center; margin-top:20px; padding:0;}
	
	.btnBox{padding:0; margin:0 !important;}
	.defaultstyle{width: 30%; height: 40px; font-size: 16px; margin:0; padding:0;}
	
	.recList{width: 35px; height:auto; position:absolute; left:5%; margin-top:2%; cursor:pointer;}
	/* span.highlight{
		text-align:left;
		font-weight:bold;
		font-size:19px;
		background-color: #FFFFB3;
		content: " ";
		height: 30%;
	} */
	
	/* 모달 */
	
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
						
						<div id="optionArea">
							<label id="openOption">옵션 &or;</label>
							<div id="hiddenOption">
								<label id="optionLabel">참가 중인 그룹 &nbsp;&nbsp;</label>
								
								<div>
									<input class="tgl tgl-skewed" id="cb3" type="checkbox"/>
								    <label class="tgl-btn" data-tg-off="OFF" data-tg-on="ON" for="cb3"></label>
							    </div>
							</div>
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
					
					<div id="bottomArea">
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
						
						<div id="searchArea">
				  			<form method="get" action="">
								<div class="row">
									<!-- 비율은 본인 스타일대로 수정해서 사용하세요 -->
									<select style="width: 25%;" class="form-control search-select">
										<option>분류</option>
										<option>111</option>
										<option>222</option>
										<option>333</option>
									</select>
									<div class="input-group search-text" style="width: 73%;">
										<input type="text" class="form-control" style="border: none;" placeholder="검색어를 입력하세요."> <span class="input-group-btn">
											<button class="btn search-submit" type="button">검색</button>
										</span>
									</div>
									<!-- /input-group -->
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<c:import url="../../a_common/footer.jsp"/>
	</div>
	
	<div id="groupModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title modalTitle">그룹명</h2>
				</div>
				
				<div class="modal-body">
					
					<div style="">
						<div style="">
							<table class="table table-hover">
								<tr>
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

					<div class="btnBox">
						<input type="button" class="defaultBtn defaultstyle" value="그룹 나가기" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 그룹원 모달 -->
	
	<!-- 그룹장 모달 -->
	<div id="groupBossModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<img src="${contextPath }/resources/image/studyGroup/checklist.png" class="recList">
					<h2 class="modal-title">그룹명</h2>
				</div>
				
				<div class="modal-body">
					<div>
						<div>
							<table class="table table-hover">
								<tr>
									<th>No</th>
									<th>구성원 닉네임</th>
									<th>그룹 참가일</th>
									<th style="width:20%;"></th>
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
							<br>
							<table class="table table-hover">
								<tr>
									<th>No</th>
									<th>모집 등록 날짜</th>
									<th>모집 기간</th>
									<th>모집 인원</th>
								</tr>
								<tr>
									<td>5</td>
									<td>2020.00.00</td>
									<td>2020.00.00 ~ 2020.00.00</td>
									<td>3</td>
								</tr>
								<tr>
									<td>4</td>
									<td>2020.00.00</td>
									<td>2020.00.00 ~ 2020.00.00</td>
									<td>3</td>
								</tr>
								<tr>
									<td>3</td>
									<td>2020.00.00</td>
									<td>2020.00.00 ~ 2020.00.00</td>
									<td>3</td>
								</tr>
								<tr>
									<td>2</td>
									<td>2020.00.00</td>
									<td>2020.00.00 ~ 2020.00.00</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>2020.00.00</td>
									<td>2020.00.00 ~ 2020.00.00</td>
									<td>2</td>
								</tr>
							</table>
						</div>
					</div>
	
					<div class="btnBox">
						<input type="button" class="defaultBtn defaultstyle" value="그룹 수정">
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="defaultBtn defaultstyle" value="그룹 없애기">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 그룹장 모달 -->
	
	<script>
		$(function() {
			$('#hiddenOption').css('display', 'none');
		});
		
		$('#openOption').click(function() {
			if($('#hiddenOption').css('display') == 'none') {
				$('#hiddenOption').css('display', 'block');
			} else {
				$('#hiddenOption').css('display', 'none');
			}
		}).mouseover(function() {
			$('#openOption').css({'background':'#6DBD6A', 'color':'white'});
		}).mouseout(function() {
			$('#openOption').css({'background':'transparent', 'color':'black'});
		});
		
		$('.modalTitle').mouseover(function() {
			$('.modalTitle').css('color', '#6DBD6A');
		}).mouseout(function() {
			$('.modalTitle').css('color', 'black');
		})
		
		/* $('#groupTable tr').mouseover(function() {
			$(this).css('background','rgba(103,162,97,0.2)');
		}).mouseout(function() {
			$(this).css('background','rgba(103,162,97,0)');
		}); */
		
	</script>

</body>
</html>