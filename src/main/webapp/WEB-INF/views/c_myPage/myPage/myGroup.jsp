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
							<span id="categoryOnce">once</span>
							&nbsp;&nbsp;|&nbsp;&nbsp;
							<span id="categoryLong">long</span>
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
						<thead>
						<tr>
							<th style="width:5%;">No</th>
							<th style="width:9%;">그룹유형</th>
							<th style="width:15%;">공부 종류</th>
							<th>그룹 명</th>
							<th style="width:14%;">그룹장</th>
							<th style="width:16%;">상태</th>
						</tr>
						</thead>
						
						<tbody>
						</tbody>
					</table>
					
					<div id="bottomArea">
						<!-- 페이징  -->
						<nav>
							<ul class="pagination" id="pageUl">
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
		var trigerBox;
		
		$(function() {
			$('#hiddenOption').css('display', 'none');
			
			trigerBox = 'false';
			getGroupList('false'); //-> 실시간 업데이트가 목적이 아니라 옵션을 위해서니까 setinterval안쓰고 진행
			getGroupListPage('false');
		});
		
		function getGroupList(triger) {
			var userId = "${ loginUser.id }";
			var category = "";
			if($('#categoryLong').css('font-weight') == 'bold') {
				category = "long";
			} else if($('#categoryOnce').css('font-weight') == 'bold') {
				category = "once";
			}
			
			$.ajax({
				url: "groupList.mp",
				data: {userId:userId, triger:triger, category:category},
				dataType: 'json',
				success: function(data) {
					$tableBody = $('#groupTable tbody');
					$tableBody.html('');
					
					var $tr;
					var $td;
					var $img;
					var $span;
					var $no;
					var $sgStatus;
					var $studyName;
					var $sgName;
					var $bossNick;
					var $appStatus;
					
					if(data.length > 0) {
						for(var i in data) {
							$tr = $('<tr>');
							$td = $('<td>');
							
							$no = $('<td>').text(data[i].no);
							
							console.log(data[i].sgStatus);
							if(data[i].sgStatus == 'Y' || data[i].sgStatus == 'D') {//다회
								$td = $('<td>');
								$span = $('<span class="typeBadge long">').text('long');
								$td.append($span);
								
								$sgStatus = $td;
							} else {//일회
								$td = $('<td>');
								$span = $('<span class="typeBadge once">').text('once');
								$td.append($span);
								
								$sgStatus = $td;
							}
							
							$studyName = $('<td>').text(decodeURIComponent(data[i].studyName.replace(/\+/g, ' ')));

							if(userId == data[i].id) {
								var $label;
								$td = $('<td>');
								$label = $('<label>').text(decodeURIComponent(data[i].sgName.replace(/\+/g, ' ')));
								$img = $('<img src="${contextPath}/resources/image/studyGroup/user.png" style="width:15px; height:auto; />"');
								
								$label.append($img);
								$td.append($label);
								$sgName = $td;
								$tr = $('<tr onclick="openGroupBossModal();">');
							} else {
								$sgName = $('<td>').text(decodeURIComponent(data[i].sgName.replace(/\+/g, ' ')));
							}
							
							$bossNick = $('<td>').text(decodeURIComponent(data[i].nick.replace(/\+/g, ' ')));
							
							var print = "";
							if(data[i].appStatus == 'Y') {//수락된 경우
								if(data[i].sgStatus == 'D' || data[i].sgStatus == 'E') { //그룹장이 스터디 종료 or 다회로 변경되지 않음
									print = '스터디 종료';
									$tr = $('<tr onclick="openGroupModal();">');
								} else {
									print = '스터디 진행 중';
									$tr = $('<tr onclick="openGroupModal();">');
								}
							} else if(data[i].appStatus == 'E') { //수락 후 스스로 나간 경우
								print = '스터디 종료 /(나감/)';
							} else if(data[i].appStatus == 'O') { //수락 후 강퇴당한 경우
								print = '스터디 종료 /(강퇴/)';
							} else if(data[i].appStatus == 'R') { //수락 후 강퇴당한 경우
								print = '대기 중';
							} else if(data[i].appStatus == 'N') { //거절된 경우
								print = '거절';
							} else { //로그인 유저가 그룹장일 때
								if(data[i].sgStatus == 'D' || data[i].sgStatus == 'E') { //그룹장이 스터디 종료 or 다회로 변경되지 않음
									print = '스터디 종료';
									$tr = $('<tr onclick="openGroupModal();">');
								} else {
									print = '스터디 진행 중';
									$tr = $('<tr onclick="openGroupModal();">');
								}
							}
							$appStatus = $('<td>').text(print);
							
							$tr.append($no);
							$tr.append($sgStatus);
							$tr.append($studyName);
							$tr.append($sgName);
							$tr.append($bossNick);
							$tr.append($appStatus);
							$tableBody.append($tr);
							//추가 모집 중 경우 나누려면 모집 기간에 해당되는지 또 조인하고 확인해야됨.. 그냥 상세 들어가서 알아서 확인하는 걸로
						}
						
					} else {
						$tr = $('<tr>');
						$rContent = $('<td colspan=6>').text("그룹 리스트가 없습니다.");
						
						$tr.append($rContent);
						$tableBody.append($tr);
					}
					
				}
			})
		}
		
		function getGroupListPage(triger) {
			var userId = "${ loginUser.id }";
			var category = "";
			if($('#categoryLong').css('font-weight') == 'bold') {
				category = "long";
			} else if($('#categoryOnce').css('font-weight') == 'bold') {
				category = "once";
			}
			
			$.ajax({
				url: "groupListPage.mp",
				data: {userId:userId, triger:triger, category:category},
				dataType: 'json',
				success: function(data) {
					console.log('page:' + data);

					$pageUl = $('#pageUl');
					$pageUl.html('');
					
					var $li;
					var $a;
					var $span;
					var $b;
					
					$li = $('<li>');
					
					//맨 처음으로, 이전
					if(data.currentPage <= 1) {
						$a = $('<a href="#" aria-label="Previous" onclick="return false;">');
						$span = $('<span aria-hidden="true">').text('≪');
						
						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
						
						$a = $('<a href="#" aria-label="Previous" onclick="return false;">');
						$span = $('<span aria-hidden="true">').text('＜');

						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
					}
					else if(data.currentPage > 1) {
						$a = $('<a href="groupList.mp" aria-label="Previous">');
						$span = $('<span aria-hidden="true">').text('≪');

						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
						
						$a = $('<a href="groupList.mp?page=' + data.currentPage - 1 + '" aria-label="Previous">');
						$span = $('<span aria-hidden="true">').text('≫');
						
						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
					}
					
					//페이지
					for(var i = data.startPage; i <= data.endPage; i++) {
						console.log(i);
						
						if(i == data.currentPage)
							$a = $('<a href="#" onclick="return false;">').text(i);
						else
							$a = $('<a href="groupList.mp?page=' + i + '">').text(i);

						$li.append($a);
						$pageUl.append($li);
					}

					//맨 마지막으로, 다음
					if(data.currentPage >= data.maxPage) {
						$a = $('<a href="#" aria-label="Next" onclick="return false;">');
						$span = $('<span aria-hidden="true">').text('>');
						
						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
						
						$a = $('<a href="#" aria-label="Next" onclick="return false;">');
						$span = $('<span aria-hidden="true">').text('≫');

						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
					}
					else if(data.currentPage < data.maxPage) {
						$a = $('<a href="groupList.mp?page=' + data.currentPage + 1 + '" aria-label="Next">');
						$span = $('<span aria-hidden="true">').text('>');

						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
						
						$a = $('<a href="groupList.mp?page=' + data.maxPage + '"  aria-label="Next">');
						$span = $('<span aria-hidden="true">').text('≫');
						
						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
					}
				}
			})
		}
		
		function openGroupModal(e) {
			$('#groupModal').modal("show");
		}

		function openGroupBossModal(e) {
			$('#groupBossModal').modal("show");
		}
		
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
		
		$('#cb3').click(function() {
			if( $(this).prop('checked') ) {
				trigerBox = 'true';
				getGroupList('true');
				getGroupListPage('true');
			} else {
				trigerBox = 'false';
				getGroupList('false');
				getGroupListPage('false');
			}
		});
		
		$('#categoryOnce').click(function() {
			if($('#categoryOnce').css('font-weight') == 'bold') {
				$('#categoryOnce').css('font-weight', 'normal');
				
				getGroupList(trigerBox);
				getGroupListPage(trigerBox);
			} else {
				$('#categoryOnce').css('font-weight', 'bold');

				getGroupList(trigerBox);
				getGroupListPage(trigerBox);
			}
		})
		
		$('#categoryLong').click(function() {
			if($('#categoryLong').css('font-weight') == 'bold') {
				$('#categoryLong').css('font-weight', 'normal');
				
				getGroupList(trigerBox);
				getGroupListPage(trigerBox);
			} else {
				$('#categoryLong').css('font-weight', 'bold');
				
				getGroupList(trigerBox);
				getGroupListPage(trigerBox);
			}
		})
		
		function getMemberList() {
			
		}
		
		/* $('#groupTable tr').mouseover(function() {
			$(this).css('background','rgba(103,162,97,0.2)');
		}).mouseout(function() {
			$(this).css('background','rgba(103,162,97,0)');
		}); */
		
	</script>

</body>
</html>