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
	
	#searchArea{width:100%; display:inline-block; text-align:center;}
	#searchForm{width:60%; display:inline-block; transform:scale(1.3); margin-bottom:7%;}
	#settingArea{width:90%; display:block; margin-bottom: 2%;}
	#categoryBtn{width:200px; display:inline-block; text-align:center;}
	
	#categoryHiddenArea{width:100%; display:inline; text-align:center;}
	.categoryDiv{width:100%; min-height:40px; border-radius:8px; margin-top:5px; padding-top:10px; padding-bottom:10px; padding-left:30px; vertical-align: middle; display:inline-block; text-align:left; background-color:lightgray;}
	.categoryLabel{width:13%; cursor:pointer; margin:0; padding:0; margin-right:50px;float:left; line-height:1.7;}
	
	.pointer{cursor:pointer;}
	
	#confirmArea{min-height:40px; margin-top:5px; padding-bottom:10px; padding-left:30px; vertical-align: middle; display:inline-block; float:right;}
	
	#sortArea{display:inline-block; float:right;}
	
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
	
	#listArea{width:90%; display: block; text-align:center; margin-top:2%;}
	.recGroup{width:100%; display: inline-block; margin-bottom:5%; text-align:left; background:rgba(255,255,255,0.5); border-radius:20px; padding:15px 20px; cursor: pointer;}
	.recGroup:hover{background:rgba(255,255,255,0.9);}
	.firstInfo{}
	.secondInfo{}
	.thirdInfo{}
	.fourthInfo{}
	.infoTitle{margin-right:20px; font-size: 21px;}
	.infoLabel{margin-right:10px; font-size: 18px; vertical-align: middle;}
	.infoContent{margin-right:40px; font-size: 18px; font-weight:normal; vertical-align: middle;}
	.goalStyle{font-size: 18px; font-weight:normal; text-overflow:ellipsis; white-space:nowrap; max-width:80%; overflow:hidden; vertical-align: middle;}
	.groupContentStyle{font-size: 18px; max-width:78%; vertical-align: middle; overflow:hidden; text-overflow:ellipsis; line-height:1.5; word-wrap:break-word; display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical;}
	
	#bottomArea{width:100%; text-align:center; margin-top:0%;}
	#insertBtnArea{width:20%; display:inline; float:right;}
	
</style>

</head>
<body>
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>모집 중인 그룹</h1>
				</div>
				<div class="content">
					
					<!-- 검색창 -->
				  	<!-- 드롭다운 + 검색 -->
					<div class="inner" id="searchArea">
					<form method="get" action="" id="searchForm">
						<!-- 비율은 본인 스타일대로 수정해서 사용하세요 -->
						<select style="width: 20%;" class="form-control search-select">
							<option>분류</option>
							<option>그룹 명</option>
							<option>그룹장 닉네임</option>
							<option>그룹 내용</option>
							<option>그룹 목표</option>
						</select>
						<div class="input-group search-text" style="width: 78%;">
							<input type="text" class="form-control" style="border: none;" placeholder="검색어를 입력하세요.">
							<span class="input-group-btn">
								<button class="btn search-submit" type="button">검색</button>
							</span>
						</div><!-- /input-group -->
					</form>
					</div>
					
					<div id="settingArea" class="inner">
						<div id="categoryArea">
							<input type="button" class="defaultBtn" id="categoryBtn" value="카테고리">
							
							<div id="sortArea">
								<label class="sort" id="timeSort">최근 등록순</label>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<label class="sort" id="numAscSort">그룹 인원 적은순</label>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<label class="sort" id="numDescSort">그룹 인원 많은순</label>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<label class="sort" id="recCloseSort">모집 마감 임박순</label>
							</div>
							
							<div id="categoryHiddenArea">
								<div id="locDiv" class="categoryDiv">
									<c:forEach var="item" items="${ branchList }">
										<label class="categoryLabel">${ item.branchName }</label>
									</c:forEach>
								</div>
								
								<div id="studyDiv" class="categoryDiv">
									<c:forEach items="${ studyList }" var="item" varStatus="status">
										<c:if test="${ (status.count mod 5) eq 1 }">
												<section class="categoryLabel">
											<!-- <div class="categoryLabel"> -->
												<label class="pointer">${ item }</label><br>
										</c:if>
										<c:if test="${ (status.count mod 5) ne 1 && (status.count mod 5) ne 0 }">
												<label class="pointer">${ item }</label><br>
										</c:if>
										<c:if test="${ (status.count mod 5) eq 0 }">
												<label class="pointer">${ item }</label>
												</section>
											<!-- </div> -->
										</c:if>
									</c:forEach>
									</div>
								
									<div id="typeDiv" class="categoryDiv" style="width:65%; float:left; display:inline-block;">
										<label class="categoryLabel">once</label>
										<label class="categoryLabel">long</label>
									</div>
									
									<div style="width:35%; min-height:40px; float:right; display:inline-block; padding-top:8px; padding-left:10px; vertical-align: top;">
										<input type="button" class="defaultBtn" value="초기화" style="width:37%; height:100%;">
										<input type="button" class="defaultBtn" value="검색" style="width:59%; height:100%; margin-left:3px;">
									</div>
								</div>
							</div>
						</div>
						
						<div id="listArea" class="inner">
							<div class="recGroup">
								<div class="firstInfo">
									<span class="typeBadge once">once</span>
									<label class="infoTitle">공부 종류</label>
									<label class="infoTitle">스터디 그룹명</label>
								</div>
								<div class="secondInfo">
									<label class="infoLabel">모집 기간</label>
									<label class="infoContent">2020.00.00 ~ 2020.00.00</label>
									<label class="infoLabel">모집 현황</label>
									<label class="infoContent">2/6</label>
									<label class="infoLabel">그룹장</label>
									<label class="infoContent">그룹장 닉네임</label>
									<label class="infoLabel">모임 장소</label>
									<label class="infoContent">한남점</label>
								</div>
								<div class="thirdInfo">
									<label class="infoLabel">그룹 목표</label>
									<label class="goalStyle">fnewifnewlnfkenkvnldfkenkvnldnsvklndsklnkldnkcnsvklndsklnkldnkcdsnklndslknlkdnfldanklnfadlknskalnlasndksa;d;lsa;dasmdm</label>
								</div>
								<div class="fourthInfo">
									<p class="groupContentStyle">
									fnewifnewlnfkenkvnldnsvklndsklnkldnkcdsnklndslknlkdnfldanklnfadlknskalnlasndksa;d;lsa;dasmdm
									sfsf
									sdsffefegegegfnewifnewlnfkenkvnldnsvklndsklnkldnkcdsnklndslknlkdnfldanklnfadlknskalnlasndksa;d;lsa;dasmdm
									sfsf
									sdsffefegegeg
									</p>
								</div>
							</div>
							<div class="recGroup">
								<div class="firstInfo">
									<span class="typeBadge long">long</span>
									<label class="infoTitle">공부 종류</label>
									<label class="infoTitle">스터디 그룹명</label>
								</div>
								<div class="secondInfo">
									<label class="infoLabel">모집 기간</label>
									<label class="infoContent">2020.00.00 ~ 2020.00.00</label>
									<label class="infoLabel">모집 현황</label>
									<label class="infoContent">2/6</label>
									<label class="infoLabel">그룹장</label>
									<label class="infoContent">그룹장 닉네임</label>
									<label class="infoLabel">모임 장소</label>
									<label class="infoContent">한남점</label>
								</div>
								<div class="thirdInfo">
									<label class="infoLabel">그룹 목표</label>
									<label class="goalStyle">fnewifnewlnfkenkvnldfkenkvnldnsvklndsklnkldnkcnsvklndsklnkldnkcdsnklndslknlkdnfldanklnfadlknskalnlasndksa;d;lsa;dasmdm</label>
								</div>
								<div class="fourthInfo">
									<p class="groupContentStyle">
									fnewifnewlnfkenkvnldnsvklndsklnkldnkcdsnklndslknlkdnfldanklnfadlknskalnlasndksa;d;lsa;dasmdm
									sfsf
									sdsffefegegegfnewifnewlnfkenkvnldnsvklndsklnkldnkcdsnklndslknlkdnfldanklnfadlknskalnlasndksa;d;lsa;dasmdm
									sfsf
									sdsffefegegeg
									</p>
								</div>
							</div>
						</div>
						
						<div id="bottomArea" class="inner">
							<!-- 페이징  -->
							<nav>
								<ul class="pagination" id="pageUl">
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
						
							<div id="insertBtnArea">
								<input type="button" class="defaultBtn" onclick="location.href='insertRecView.sg'" value="모집 등록">
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="defaultBtn" onclick="location.href='insertGroupView.sg'" value="그룹 등록">
							</div>
						</div>
					
					</div> <!-- content -->
				</div>
			</div>
		<c:import url="../a_common/footer.jsp"/>
		</div>
	
	<script>
		$(function() {
			$('#categoryHiddenArea').css('display', 'none');
			
			getRecList();
			getPaging();
		})
		
		function getRecList() {
			$.ajax({
				url:'getRecList.sg',
				data: {},
				dataType: 'json',
				success: function(data) {
					console.log(data);
					
					var $listArea = $('#listArea');
					$listArea.html('');
					
					if(data.length > 0) {
						for(var i in data) {
							console.log(data[i]);
							
							var $recGroup = $('<div class="recGroup">');
							var $firstInfo = $('<div class="firstInfo">');
							var $secondInfo = $('<div class="secondInfo">');
							var $thirdInfo = $('<div class="thirdInfo">');
							var $fourthInfo = $('<div class="fourthInfo">');
							
							var $span;
							if(data[i].sgStatus == 'Y')
								$span = $('<span class="typeBadge once">').text('once');
							else
								$span = $('<span class="typeBadge long">').text('long');
							$firstInfo.append($span);
							$firstInfo.append($('<label class="infoTitle" style="color:#135D36">').text(decodeURIComponent(data[i].studyName.replace(/\+/g, ' '))));
							$firstInfo.append($('<label class="infoTitle">').text(decodeURIComponent(data[i].sgName.replace(/\+/g, ' '))));
							
							$secondInfo.append($('<label class="infoLabel">').text('모집 마감'));
							if(data[i].dCloseDate >= 1) {
								$secondInfo.append($('<label class="infoContent">').text(data[i].dCloseDate + "일 전"));
							} else {
								$secondInfo.append($('<label class="infoContent">').text("오늘"));
							}
							
							$secondInfo.append($('<label class="infoLabel">').text('모집 현황'));
							$secondInfo.append($('<label class="infoContent">').text(data[i].partNum + "/" + data[i].recNum));
							$secondInfo.append($('<label class="infoLabel">').text('그룹장'));
							$secondInfo.append($('<label class="infoContent">').text(decodeURIComponent(data[i].nick.replace(/\+/g, ' '))));
							$secondInfo.append($('<label class="infoLabel">').text('모임 장소'));
							$secondInfo.append($('<label class="infoContent">').text(decodeURIComponent(data[i].branchName.replace(/\+/g, ' '))));
							
							$thirdInfo.append($('<label class="infoLabel">').text('그룹 목표'));
							$thirdInfo.append($('<label class="goalStyle">').text(decodeURIComponent(data[i].sgGoal.replace(/\+/g, ' '))));

							$fourthInfo.append($('<label class="infoLabel">').text('그룹 내용'));
							$fourthInfo.append($('<p class="groupContentStyle">').text(decodeURIComponent(data[i].sgContent.replace(/\+/g, ' '))));
							
							$recGroup.append($firstInfo);
							$recGroup.append($secondInfo);
							$recGroup.append($thirdInfo);
							$recGroup.append($fourthInfo);
							$listArea.append($recGroup);
						}
					}
				}
			});
		}
		
		function getPaging() {
			$.ajax({
				url: "getPaging.sg",
				data: {},
				dataType: 'json',
				success: function(data) {
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
		
		$('#categoryBtn').click(function() {
			if($('#categoryHiddenArea').css('display') == 'none') {
				$('#categoryHiddenArea').css('display', 'block');
				$('#listArea').css('margin-top', '7%');
			} else {
				$('#categoryHiddenArea').css('display', 'none');
				$('#listArea').css('margin-top', '2%');
			}
		})
		
		$('.recGroup').click(function() {
			location.href="recruitDetailView.sg";
		})
		
		var target = "";
		$('.sort').click(function() {
			$('.sort').css({'background':'transparent', 'color':'black', 'font-weoght':'normal'});
			
			if(target != $(this).attr('id')) {
				$(this).css({'background':'#6DBD6A', 'color':'white', 'font-weight':'bold'});
			}
			
			target = $(this).attr('id');
		})
	</script>
</body>
</html>