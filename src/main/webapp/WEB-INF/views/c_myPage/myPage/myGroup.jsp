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
	
	.pageTitle:hover{color:#17955F; cursor:pointer;}
	
	#topArea{width:100%; display:inline-block; vertical-align:middle;}
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
	.modal-title{width:100%; text-align:center; cursor:pointer;}
	.modal-header>h2{margin-top:2%; margin-bottom:2%; }
	
	.modal-body{width:100%; display:inline-block; text-align:center; margin-bottom:2%;}
	.modal-body>div{width:100%; text-align:center;}
	.modal-body>div>div{width:90%; display:inline-block;}
	.modal-body>div>div>table{width:100%; display:table; font-size:18px; text-align:center; margin-top:20px; padding:0;}
	
	.btnBox{padding:0; margin:20px !important;}
	.defaultstyle{width: 30%; height: 40px; font-size: 16px; margin:0; padding:0;}
	
	.recList{width: 35px; height:auto; position:absolute; left:5%; margin-top:2%; cursor:pointer;}
	/* 모달 */
	
	
	/* 소메뉴 */
	div.content ul.nav-tabs {
		border-bottom-color: transparent;
	}
	
	div.content ul.nav-tabs {
		margin-bottom :70px;
		display:flex;
		justify-content: space-between;
	}
	
	div.content ul.nav-tabs>li {
		flex : 2 1 auto;
	}
	
	div.content ul.nav-tabs>li>a {
	    margin-right: 3px;
	    line-height: 1.42857143;
	    background-color: rgba(255, 255, 255, 0.5);
	    border: 1px solid #ddd;
	    border-radius: 4px 4px 0 0;
	    font-family: 'Binggrae';
	    text-align : center;
	}
	
	div.content ul.nav-tabs>li.active>a:focus, div.content ul.nav-tabs>li.active>a:hover {
	    color: #555;
	    /*cursor: default;*/
		cursor:pointer;
	    background-color: #fff;
	    border: 1px solid #ddd;
	}
	
	.nav>li>a {
	    position: relative;
	    display: block;
	    padding: 10px 15px;
	}
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
					<ul class="nav nav-tabs">
					  <li role="presentation" class="active"><a href="myPage.mp?id=${loginUser.id }">회원 정보</a></li>
					  <li role="presentation" class="active"><a href="myGroup.mp">마이 그룹</a></li>
					  <li role="presentation"><a href="lectureHistory.mp">강연 내역</a></li>
					  <li role="presentation"><a href="slHistory.mp">결제 내역</a></li>
					  <c:url var="memberDelete" value="memberDelete.mp">
					  	<c:param name="id" value="${loginUser.id}"/>
					  </c:url>
					  <li role="presentation"><a href="location.href='${memberDelete}'">회원 탈퇴하기</a></li>
					</ul>
				
					<div id="topArea">
						<div id="categoryArea">
							<span id="categoryOnce" style="cursor:pointer;">once</span>
							&nbsp;&nbsp;|&nbsp;&nbsp;
							<span id="categoryLong" style="cursor:pointer;">long</span>
						</div>
						
						<div id="optionArea">
							<label id="openOption">옵션 &or;</label>
							<div id="hiddenOption">
								<label id="optionLabel">참가 중인 그룹 &nbsp;&nbsp;</label>
								
								<div>
									<input class="tgl tgl-skewed" id="cb3" type="checkbox" style="cursor:pointer;"/>
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
							<ul class="pagination" id="pageListUl">
							</ul>
						</nav>

						<div id="searchArea">
							<div class="row">
								<!-- 비율은 본인 스타일대로 수정해서 사용하세요 -->
								<select id="searchType" name="searchType" style="width: 25%;"
									class="form-control search-select">
									<option>분류</option>
									<option value="title">그룹 명</option>
									<option value="bossNick">그룹장 닉네임</option>
								</select>
								<div class="input-group search-text" style="width: 73%;">
									<input id="searchText" name="searchText" type="text" class="form-control" style="border: none;" placeholder="검색어를 입력하세요.">
									<span class="input-group-btn">
										<button class="btn search-submit" type="button" id="searchSubmit" onclick="searchCheck();">검색</button>
									</span>
								</div><!-- /input-group -->
							</div>
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
							<table class="table table-hover" id="modalTable">
								<thead>
								<tr>
									<th>No</th>
									<th>구성원 닉네임</th>
									<th>그룹 참가일</th>
								</tr>
								</thead>
								
								<tbody>
								</tbody>
							</table>
						</div>
					</div>

					<div class="btnBox">
						<input type="button" class="defaultBtn defaultstyle" style="background:#94abc7;" id="exitGroup" value="그룹 나가기" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 그룹원 모달 -->
	
	<!-- 그룹장 모달 -->
	<div id="groupBossModal" class="modal fade" role="dialog">
		<div class="modal-dialog" style="width:40%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<%-- <img src="${contextPath }/resources/image/studyGroup/checklist.png" class="recList"> --%>
					<h2 class="modal-title modalTitle">그룹명</h2>
				</div>
				
				<div class="modal-body">
					<div>
						<div>
							<table class="table table-hover" id="modalMemberTable">
								<thead>
								<tr>
									<th>No</th>
									<th>구성원 닉네임</th>
									<th>그룹 참가일</th>
									<th style="width:20%;"></th>
								</tr>
								</thead>
								
								<tbody>
								</tbody>
							</table>
							<br>
							<table class="table table-hover" id="modalRecTable">
								<thead>
									<tr>
										<th>No</th>
										<th>모집 등록 날짜</th>
										<th>모집 기간</th>
										<th>모집 인원</th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
	
					<div class="btnBox" id="bossControl">
						<input type="button" class="defaultBtn defaultstyle" style="background:#4188e2;" id="updateGroup" value="그룹 수정">
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="defaultBtn defaultstyle" style="background:#94abc7;" id="deleteGroup" value="그룹 종료하기">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 그룹장 모달 -->
	
	<script>
		var trigerBox;
		var category = "none";
		var sgNo;
		var page;
		
		$(function() {
			$('#hiddenOption').css('display', 'none');

			category = "none";
			trigerBox = 'false';
			getGroupList('false'); //-> 실시간 업데이트가 목적이 아니라 옵션을 위해서니까 setinterval안쓰고 진행
			getGroupListPage('false');
		});
		
		function getGroupList(triger, type, page) {
			var userId = "${ loginUser.id }";
			if($('#categoryLong').css('color') == 'rgb(255, 255, 255)') {
				category = "long";
			} else if($('#categoryOnce').css('color') == 'rgb(255, 255, 255)') {
				category = "once";
			} else {
				category = "none";
			}
			
			var sendData;
			if(type=='search' || ($('#searchType').val() != '분류' && $('#searchText').val() != '')) {
				var searchType = $('#searchType').val();
				var searchText = $('#searchText').val();
				sendData = {"userId":userId, "triger":triger, "category":category, "searchType":searchType, "searchText":searchText};
			} else {
				sendData = {"userId":userId, "triger":triger, "category":category};
			}
			
			if(page) {
				var pageData = {"page":page};
				$.extend(true, sendData, pageData);
			}
			
			$.ajax({
				url: "groupList.mp",
				data: sendData,
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

					var number = data.length;
					if(data.length > 0) {
						for(var i in data) {
							$tr = $('<tr>');
							$td = $('<td>');
							
							$no = $('<td>').text(number/* data[i].no */);
							number--;
							
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
							
							var sgName = decodeURIComponent(data[i].sgName.replace(/\+/g, ' '));
							
							$studyName = $('<td>').text(decodeURIComponent(data[i].studyName.replace(/\+/g, ' ')));
							$sgName = $('<td class="title">').text(sgName);

							if(userId == data[i].id) {
								var $span;
								$td = $('<td>');
								$span = $('<span>').text(decodeURIComponent(data[i].nick.replace(/\+/g, ' ')));
								$img = $('<img src="${contextPath}/resources/image/studyGroup/user.png" style="width:17px; height:auto; margin-left:7px;" />');

								$span.append($img);
								$td.append($span);
								$bossNick = $td;
								$tr = $('<tr onclick="openGroupBossModal(this,' + data[i].sgNo +', \'' + sgName + '\');">');
							} else {
								$bossNick = $('<td>').text(decodeURIComponent(data[i].nick.replace(/\+/g, ' ')));
							}
							
							var print = "";
							
							if(userId == data[i].id) { //로그인 유저가 그룹장일 때
								if(data[i].sgStatus == 'D' || data[i].sgStatus == 'E') { //그룹장이 스터디 종료 or 다회로 변경되지 않음
									print = '스터디 종료';
									$tr = $('<tr onclick="openGroupBossModal(this,' + data[i].sgNo +', \'' + sgName + '\');">');
								} else {
									print = '스터디 진행 중';
									$tr = $('<tr onclick="openGroupBossModal(this,' + data[i].sgNo +', \'' + sgName + '\');">');
								}
							} else { //그룹원이 해당 그룹에 수락된 경우
								if(data[i].appStatus == 'Y') {
									if(data[i].sgStatus == 'D' || data[i].sgStatus == 'E') { //그룹장이 스터디 종료 or 다회로 변경되지 않음
										print = '스터디 종료';
										$tr = $('<tr onclick="openGroupModal(this,' + data[i].sgNo +', \'' + sgName + '\');">');
									} else {
										print = '스터디 진행 중';
										$tr = $('<tr onclick="openGroupModal(this,' + data[i].sgNo +', \'' + sgName + '\');">');
									}
								} else if(data[i].appStatus == 'E') { //수락 후 스스로 나간 경우
									print = '스터디 종료 (나감)';
								} else if(data[i].appStatus == 'O') { //수락 후 강퇴당한 경우
									print = '스터디 종료 (강퇴)';
								} else if(data[i].appStatus == 'R') { //수락 후 강퇴당한 경우
									print = '대기 중';
								} else if(data[i].appStatus == 'N') { //거절된 경우
									print = '거절';
								}
							}
							
							if(print == '스터디 진행 중')
								$appStatus = $('<td class="status" style="color:#67A261; font-weight:bold;">').text(print);
							else 
								$appStatus = $('<td class="status">').text(print);
							
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
			
			if(page) {
				getGroupListPage(trigerBox, category, page);
			}
		}
		
		function getGroupListPage(triger, type, page) {
			var userId = "${ loginUser.id }";
			if($('#categoryLong').css('color') == 'rgb(255, 255, 255)') {
				category = "long";
			} else if($('#categoryOnce').css('color') == 'rgb(255, 255, 255)') {
				category = "once";
			} else {
				category = "none";
			}
			
			var sendData;
			if(type=='search' || ($('#searchType').val() != '분류' && $('#searchText').val() != '')) {
				var searchType = $('#searchType').val();
				var searchText = $('#searchText').val();
				sendData = {"userId":userId, "triger":triger, "category":category, "searchType":searchType, "searchText":searchText};
			} else {
				sendData = {"userId":userId, "triger":triger, "category":category};
			}
			
			if(page) {
				var pageData = {"page":page};
				$.extend(true, sendData, pageData);
			}
			
			$.ajax({
				url: "groupListPage.mp",
				data: sendData,
				dataType: 'json',
				success: function(data) {
					var $pageListUl = $('#pageListUl');
					$pageListUl.html('');
					
					var $li;
					var $a;
					var $span;
					var $b;
					
					$li = $('<li>');
					
					//맨 처음으로, 이전
					if(data.currentPage <= 1) {
						$a = $('<a href="#" onclick="return false;">');
						//$span = $('<span aria-hidden="true">').text('≪');
						$span = $('<span class="icon-fast-backward">');
						
						$a.append($span);
						$li.append($a);
						$pageListUl.append($li);
						
						$a = $('<a href="#" onclick="return false;">');
						//$span = $('<span aria-hidden="true">').text('＜');
						$span = $('<span class="icon-to-start">');

						$a.append($span);
						$li.append($a);
						$pageListUl.append($li);
					} else if(data.currentPage > 1) {
						var gostr = "getGroupList('" + trigerBox + "','" + category + "');";
						$a = $('<a onclick="' + gostr + '">');
						//$span = $('<span aria-hidden="true">').text('≪');
						$span = $('<span class="icon-fast-backward">');

						$a.append($span);
						$li.append($a);
						$pageListUl.append($li);

						var go = data.currentPage - 1;
						var gostr = "getGroupList('" + trigerBox + "','" + category + "'," + go + ");";
						$a = $('<a onclick="' + gostr + '">');
						//$span = $('<span aria-hidden="true">').text('＜');
						$span = $('<span class="icon-to-start">');
						
						$a.append($span);
						$li.append($a);
						$pageListUl.append($li);
					}
					
					//페이지
					for(var i = data.startPage; i <= data.endPage; i++) {
						var gostr = "getGroupList('" + trigerBox + "','" + category + "'," + i + ");";
						if(i == data.currentPage)
							$a = $('<a href="#" class="pageBtn selectPageBtn" onclick="return false;">').text(i);
						else {
							$a = $('<a class="pageBtn" onclick="' + gostr + '">').text(i);
						}
						
						$li.append($a);
						$pageListUl.append($li);
					}

					//맨 마지막으로, 다음
					if(data.currentPage >= data.maxPage) {
						$a = $('<a href="#" onclick="return false;">');
						//$span = $('<span aria-hidden="true">').text('>');
						$span = $('<span class="icon-to-end">');
						
						$a.append($span);
						$li.append($a);
						$pageListUl.append($li);
						
						$a = $('<a href="#" onclick="return false;">');
						//$span = $('<span aria-hidden="true">').text('≫');
						$span = $('<span class="icon-fast-forward">');

						$a.append($span);
						$li.append($a);
						$pageListUl.append($li);
					} else if(data.currentPage < data.maxPage) {
						var go = data.currentPage + 1;
						var gostr = "getGroupList('" + trigerBox + "','" + category + "'," + go + ");";
						$a = $('<a onclick="' + gostr + '">');
						//$span = $('<span aria-hidden="true">').text('>');
						$span = $('<span class="icon-to-end">');

						$a.append($span);
						$li.append($a);
						$pageListUl.append($li);
						
						var gostr = "getGroupList('" + trigerBox + "','" + category + "'," + data.maxPage + ");";
						$a = $('<a onclick="' + gostr + '">');
						//$span = $('<span aria-hidden="true">').text('≫');
						$span = $('<span class="icon-fast-forward">');
						
						$a.append($span);
						$li.append($a);
						$pageListUl.append($li);
					}
				}
			})
		}
		
		function openGroupModal(e, sgno, sgName) {
			sgNo = sgno;
			
			$.ajax({
				url:"getGroupMember.mp",
				data:{sgno:sgno},
				dataType: 'json',
				success: function(data) {
					/*
					<th>No</th>
					<th>구성원 닉네임</th>
					<th>그룹 참가일</th>
					*/
					
					//$('.modalTitle').text($(e).children('.title').text());
					$('.modalTitle').text(sgName);
					
					$tableBody = $('#modalTable tbody');
					$tableBody.html('');
					
					var $tr;
					var no = data.length;
					
					if(data.length > 0) {
						for(var i in data) {
							$tr = $('<tr>');
							
							$tr.append('<td>' + no + '</td>');
							no--;
							$tr.append('<td>' + decodeURIComponent(data[i].nick.replace(/\+/g, ' ')) + '</td>');
							$tr.append('<td>' + data[i].appDlDate + '</td>');
							$tableBody.append($tr);
						}
					} else {
						$tableBody.append('<tr><td colspan=3>참여 중인 그룹원이 없습니다.</td></tr>');
					}
					
					$('#groupModal').modal("show");
				}
			});
		}
	
		function openGroupBossModal(e, sgno, sgName) {
			sgNo = sgno;
			
			$.ajax({
				url:"getGroupMember.mp",
				data:{sgno:sgno},
				dataType: 'json',
				success: function(data) {
					
					$('.modalTitle').text(sgName);

					$memberTableBody = $('#modalMemberTable tbody');
					$memberTableBody.html('');
					
					var $tr;
					var no = data.length;

					if(data.length > 0) {
						for(var i in data) {
							$tr = $('<tr>');
							
							data[i].nick = decodeURIComponent(data[i].nick.replace(/\+/g, ' '));
							
							sendNo = sgno;
							
							$tr.append('<td>' + no + '<input type="hidden" id="hidId" value="' + data[i].id + '"</td>');
							no--;
							$tr.append('<td>' + data[i].nick + '</td>');
							$tr.append('<td>' + data[i].appDlDate + '</td>');
							$tr.append('<td><input type="button" class="defaultBtn" style="background:#71acf8;" value="강퇴" onclick="deleteMemberAlert(this);"></td>');
							$memberTableBody.append($tr);
						}
					} else {
						$memberTableBody.append('<tr><td colspan=4>참여 중인 그룹원이 없습니다.</td></tr>');
					}
				}
			});

			$.ajax({
				url:"getGroupRec.mp",
				data:{sgno:sgno},
				dataType: 'json',
				success: function(data) {
					
					$recTableBody = $('#modalRecTable tbody');
					$recTableBody.html('');
					
					var $tr;
					var no = data.length;

					var today = new Date();
					var dd = today.getDate();
					var mm = today.getMonth()+1; // Jan is 0
					var yyyy = today.getFullYear();
					if(dd<10){ dd = '0'+dd }
					if(mm<10){ mm = '0'+mm }
					today = yyyy + '-' + mm + '-' + dd;

			        var todayArr = today.split('-');
			        var todayCompare = new Date(todayArr[0], parseInt(todayArr[1])-1, todayArr[2]);
					
					if(data.length > 0) {
						for(var i in data) {
							var endDate = data[i].recTerm.substr(13)
					        var endDateArr = endDate.split('-');
					        var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
							
							if(i == 0) {
								data[i].recTerm = data[i].recTerm.slice(0,21) + dd;
							}
							
							$tr = $('<tr>');
							
							$tr.append('<td>' + no + '</td>');
							no--;
							$tr.append('<td>' + data[i].recEnrollDate + '</td>');
							$tr.append('<td>' + data[i].recTerm + '</td>');
							$tr.append('<td>' + data[i].recNum + '</td>');
							
							if(endDateCompare >= todayCompare) {
								$tr.append('<td>모집 중</td>');
								$tr.append('<td><span class="glyphicon glyphicon-remove" aria-hidden="true" onclick="closeRec(this, ' + data[i].recNo + ', ' + sgno + ', \'' + sgName + '\');"></span></td>');
							} else {
								$tr.append('<td>모집 마감</td>');
								$tr.append('<td></td>');
							}
							
							$recTableBody.append($tr);
						}
					} else {
						$recTableBody.append('<tr><td colspan=5>등록된 모집이 없습니다.</td></tr>');
					}
				}
			});
			
			if($(e).children('.status').text() == '스터디 종료') {
				$('#bossControl').css('display','none');
			} else {
				$('#bossControl').css('display','block');
			}
			$('#groupBossModal').modal("show");
		}

		function sweetCheck(title, text, btnText, status){
			swal({
				title:title,
				text:text,
				type:"warning",
				showCancelButton: !0,
				confirmButtonColor:"#DD6B55",
				confirmButtonText:btnText,
				closeOnConfirm: !1
				},
				function(){
					if(btnText == '강퇴') deleteMember();
					else if(btnText == '종료') deleteGroup();
					else exitGroup();
				}
			)
		};
		
		var sendNo;
		var sendNick;
		var sendId;
		var groupName;
		function deleteMemberAlert(e) {
			sendNick = $(e).parent().parent().children().eq(1).text();
			sendId = $(e).parent().parent().find('input').val();
			
			sweetCheck("정말 '" + sendNick + "'님을 그룹에서 강퇴시키겠습니까?", "강퇴 후 복구할 수 없습니다.", "강퇴");
		}

		function deleteMember() {
			groupName = $('#groupBossModal').children().children().children().children().eq(1).text();
			$.ajax({
				url:"deleteMember.mp",
				data:{sgno:sendNo, id:sendId, groupName:groupName},
				dataType: 'json',
				success: function(data) {
					if(data == 'success') {
						$('#groupBossModal').modal("hide");
						sweetSuccess('그룹원을 강퇴');
					}
				}
			});
		}
		
		$('#deleteGroup').click(function() {
			groupName = $('#groupBossModal').children().children().children().children().eq(1).text();
			sweetCheck("정말 '" + groupName + "' 그룹을 종료하시겠습니까?", "그룹 종료 후 복구할 수 없습니다.", "종료");
		})
		
		function deleteGroup() {
			$.ajax({
				url:"deleteGroup.sg",
				data:{sgno:sgNo, groupName:groupName},
				dataType: 'json',
				success: function(data) {
					if(data == 'success') {
						sweetSuccess('스터디를 종료');
						$('#groupBossModal').modal("hide");

						getGroupList(trigerBox,category,page);
						getGroupListPage(trigerBox,category,page);
					}
				}
			})
		}
		
		$('#exitGroup').click(function() {
			groupName = $('#groupBossModal').children().children().children().children().eq(1).text();
			sweetCheck("정말 '" + groupName + "' 그룹에서 나가시겠습니까?", "그룹을 나가면 복구할 수 없습니다.", "나가기");
		})
		
		function exitGroup() {
			$.ajax({
				url:"exitGroup.sg",
				data:{sgno:sgNo, id:"${loginUser.id}", nick:"${loginUser.nick}", groupName:groupName},
				dataType: 'json',
				success: function(data) {
					if(data == 'success') {
						sweetSuccess('성공');
						$('#groupModal').modal("hide");
						
						getGroupList(trigerBox,category,page);
						getGroupListPage(trigerBox,category,page);
					}
				}
			})
		}
		
		$('#optionArea').mouseover(function() {
			$('#hiddenOption').css('display', 'block');
			$('#openOption').css({'background':'#6DBD6A', 'color':'white'});
		}).mouseout(function() {
			$('#hiddenOption').css('display', 'none');
			$('#openOption').css({'background':'transparent', 'color':'black'});
		});
		
		$('#updateGroup').click(function() {
			location.href = "updateGroupView.sg?sgno=" + sgNo;
		})
		
		$('.modalTitle').mouseover(function() {
			$('.modalTitle').css('color', '#6DBD6A');
		}).mouseout(function() {
			$('.modalTitle').css('color', 'black');
		}).click(function() {
			location.href = "recruitDetailView.sg?sgno=" + sgNo;
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
			if($('#categoryLong').css('color') == 'rgb(255, 255, 255)') {
				$('#categoryLong').css({'background':'transparent', 'color':'black'});
				$('#categoryLong').css('font-weight', 'normal');
				
				$('#categoryOnce').css({'background':'#6DBD6A', 'color':'white'});
				$('#categoryOnce').css('font-weight', 'bold');
			} else if($('#categoryOnce').css('color') == 'rgb(255, 255, 255)') {
				$('#categoryOnce').css({'background':'transparent', 'color':'black'});
				$('#categoryOnce').css('font-weight', 'normal');
			} else {
				$('#categoryOnce').css({'background':'#6DBD6A', 'color':'white'});
				$('#categoryOnce').css('font-weight', 'bold');
			}
			
			console.log(trigerBox);
			getGroupList(trigerBox);
			getGroupListPage(trigerBox);
		})
		
		$('#categoryLong').click(function() {
			if($('#categoryOnce').css('color') == 'rgb(255, 255, 255)') {
				$('#categoryOnce').css({'background':'transparent', 'color':'black'});
				$('#categoryOnce').css('font-weight', 'normal');
				
				$('#categoryLong').css({'background':'#6DBD6A', 'color':'white'});
				$('#categoryLong').css('font-weight', 'bold');
			} else if($('#categoryLong').css('color') == 'rgb(255, 255, 255)') {
				$('#categoryLong').css({'background':'transparent', 'color':'black'});
				$('#categoryLong').css('font-weight', 'normal');
			} else {
				$('#categoryLong').css({'background':'#6DBD6A', 'color':'white'});
				$('#categoryLong').css('font-weight', 'bold');
			}
			
			console.log(trigerBox);
			getGroupList(trigerBox);
			getGroupListPage(trigerBox);
		})
		
		function closeRec(e, recno, sgno, sgName) {
			$.ajax({
				url:"closeRec.mp",
				data:{recno:recno},
				dataType: 'json',
				success: function(data) {
					if(data == 'success') {
						$('.modalTitle').text(sgName);
						openGroupBossModal(e, sgno);
						sweetSuccess('모집을 마감');
					} else
						alert('모집 마감에 실패하였습니다.');
				}
			})
		}
		
		function searchCheck() {
			if($('#searchType').val() == '분류') {
				alert('검색 종류를 선택해주세요.');
			} else if($('#searchText').val() == '') {
				alert('검색어를 입력해주세요.');
			} else {
				getGroupList(trigerBox, 'seacrch');
				getGroupListPage(trigerBox, 'seacrch');
			}
		}
		
		$('.pageTitle').click(function() {
			location.reload();
		});
		
		$('#searchText').keydown(function (key) {
	        if(key.keyCode == 13) $('#searchSubmit').click();
	    });
	</script>

</body>
</html>