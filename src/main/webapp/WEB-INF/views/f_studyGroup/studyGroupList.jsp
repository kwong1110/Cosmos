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
	
	#searchArea{width:100%; display:inline-block; text-align:center; margin-top:5%;}
	.searchForm{width:60%; display:inline-block; transform:scale(1.3); margin-bottom:7%;}
	#reSearchText{width:70%; display:inline-block; vertical-align:middle; margin-left:3%;}
	#settingArea{width:90%; display:block; margin-bottom: 2%;}
	#categoryBtn{width:200px; display:inline-block; text-align:center;}
	
	#categoryHiddenArea{width:100%; display:inline; text-align:center;}
	.categoryDiv{width:100%; min-height:40px; border-radius:8px; margin-top:5px; padding-top:10px; padding-bottom:10px; padding-left:30px; vertical-align: middle; display:inline-block; text-align:left; background-color:lightgray;}
	.categoryLabel{width:115px; cursor:pointer; margin:0; padding:0; margin-right:50px;float:left; line-height:1.7;}
	
	.pointer{cursor:pointer;}
	
	#confirmArea{min-height:40px; margin-top:5px; padding-bottom:10px; padding-left:30px; vertical-align: middle; display:inline-block; float:right;}
	
	#sortArea{display:inline-block; float:right;}
	.sort{font-size:17px;}
	
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
	.recGroup{width:100%; display: inline-block; margin-bottom:3%; text-align:left; background:rgba(255,255,255,0.5); border-radius:20px; padding:15px 20px; cursor: pointer;}
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
	
	
	/*페이징*/
	.pagination a{border:none !important; background:transparent !important; color:black !important; width:43px !important; cursor:pointer !important;}
	.pagination .pageBtn{width:35px !important; height:35px !important;}
	.pagination .selectPageBtn{border-radius:50% !important; background:rgb(255,0,0,0.1) !important;}
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
						<div class="searchForm">
						<!-- 비율은 본인 스타일대로 수정해서 사용하세요 -->
						<select style="width: 20%;" id="searchType" class="form-control search-select">
							<option>분류</option>
							<option value="title">그룹 명</option>
							<option value="nick">그룹장 닉네임</option>
							<option value="content">그룹 내용</option>
							<option value="goal">그룹 목표</option>
						</select>
						<div class="input-group search-text" style="width: 78%;">
							<input type="text" id="searchText" class="form-control" style="border: none;" placeholder="검색어를 입력하세요.">
							<span class="input-group-btn">
								<button class="btn search-submit" id="allSearchBtn" type="button">검색</button>
							</span>
						</div><!-- /input-group -->
						</div>
					</div>
					
					<div id="settingArea" class="inner">
						<div id="categoryArea">
							<input type="button" class="defaultBtn" id="categoryBtn" value="카테고리">
							
							<div id="sortArea">
								<label class="sort" id="timeSort" onclick="categoryClickOption('sort', this);">최근 등록순</label>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<label class="sort" id="numAscSort" onclick="categoryClickOption('sort', this);">그룹 인원 적은순</label>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<label class="sort" id="numDescSort" onclick="categoryClickOption('sort', this);">그룹 인원 많은순</label>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<label class="sort" id="recCloseSort" onclick="categoryClickOption('sort', this);">모집 마감 임박순</label>
							</div>
							
							<div id="categoryHiddenArea">
								<div class="categoryDiv">
									<c:forEach var="item" items="${ branchList }">
										<section class="categoryLabel">
											<label class="pointer branchCategory" onclick="categoryClickOption('branch', this);">${ item.branchName }</label>
										</section>
									</c:forEach>
								</div>
								
								<div class="categoryDiv">
									<c:forEach items="${ studyList }" var="item" varStatus="status">
										<c:if test="${ (status.count mod 5) eq 1 }">
											<section class="categoryLabel">
												<label class="pointer studyCategory" onclick="categoryClickOption('study', this);">${ item }</label><br>
										</c:if>
										<c:if test="${ (status.count mod 5) ne 1 && (status.count mod 5) ne 0 }">
												<label class="pointer studyCategory" onclick="categoryClickOption('study', this);">${ item }</label><br>
										</c:if>
										<c:if test="${ (status.count mod 5) eq 0 }">
												<label class="pointer studyCategory" onclick="categoryClickOption('study', this);">${ item }</label>
											</section>
										</c:if>
									</c:forEach>
								</div>
								
								<div class="categoryDiv" id="typeOpArea" style="width:65%;">
									<section class="categoryLabel">
										<label class="pointer typeCategory" onclick="categoryClickOption('type', this);">once</label>
									</section>
									<section class="categoryLabel">
										<label class="pointer typeCategory" onclick="categoryClickOption('type', this);">long</label>
									</section>
								</div>
								
								<div class="categoryDiv" id="reSerchArea" style="width:65%; vertical-align:middle;">
									<label>결과 내 재검색</label>
									<input type="text" id="reSearchText" class="form-control" style="border: none;" placeholder="검색어를 입력하세요.">
								</div>
									
								<div style="width:35%; min-height:40px; float:right; display:inline-block; padding-top:8px; padding-left:10px; vertical-align: top;">
									<input type="button" class="defaultBtn" id="categoryRsetBtn" value="초기화" style="width:37%; height:100%;">
									<input type="button" class="defaultBtn" id="categorySerchBtn" value="검색" style="width:59%; height:100%; margin-left:3px;">
								</div>
							</div>
						</div>
					</div>
						
						<div id="listArea" class="inner">
						</div>
						
						<div id="bottomArea" class="inner">
							<!-- 페이징  -->
							<nav>
								<ul class="pagination" id="pageListUl">
								</ul>
							</nav>
						
							<c:if test="${not empty loginUser }">
							<div id="insertBtnArea">
								<c:if test="${ recCondition > 0 }">
								<input type="button" class="defaultBtn" onclick="location.href='insertRecView.sg'" value="모집 등록">
								&nbsp;&nbsp;&nbsp;
								</c:if>
								
								<input type="button" class="defaultBtn" onclick="location.href='insertGroupView.sg'" value="그룹 등록">
							</div>
							</c:if>
						</div>
					
					</div> <!-- content -->
				</div>
			</div>
		<c:import url="../a_common/footer.jsp"/>
		</div>
	
	<script>
		var searchPoint = "";
		
		$(function() {
			$('#categoryHiddenArea').css('display', 'none');
			$('#reSerchArea').css('display', 'none');
			
			getRecList();
			getPaging();
		})
		
		function getRecList(page) {
			var branchOp = "";
			var studyOp = "";
			var typeOp = "";
			for(var i = 0; i < $('.pointer').length; i++) {
				if($('.pointer').eq(i).css('color') == 'rgb(255, 255, 255)') {
					if(($('.pointer').eq(i).attr('class')).indexOf('branch') != -1) {
						branchOp = $('.pointer').eq(i).text();
					} else if($('.pointer').eq(i).attr('class').indexOf('study') != -1) {
						studyOp = $('.pointer').eq(i).text();
					} else if($('.pointer').eq(i).attr('class').indexOf('type') != -1) {
						typeOp = $('.pointer').eq(i).text();
					}
				}
			}
			
			var sortOp = "";
			for(var i = 0; i < $('.sort').length; i++) {
				if($('.sort').eq(i).css('color') == 'rgb(255, 255, 255)') {
					sortOp = $('.sort').eq(i).attr('id');
				}
			}
			
			var searchType = "";
			var searchText = "";
			var reSearchText = "";
			if(searchPoint == 'all') {
				searchType = $('#searchType').val();
				searchText = $('#searchText').val();
			} else if(searchPoint == 're') {
				searchType = $('#searchType').val();
				searchText = $('#searchText').val();
				reSearchText = $('#reSearchText').val();
			}
			
			var sendData;
			
			if(searchPoint == "") {
				sendData = {"branchOp":branchOp, "studyOp":studyOp, "typeOp":typeOp, "sortOp":sortOp};
			} else if(searchPoint == "all") {
				sendData = {"branchOp":branchOp, "studyOp":studyOp, "typeOp":typeOp, "sortOp":sortOp, "searchType":searchType, "searchText":searchText};
				$('#typeOpArea').css('width','100%');
				$('#reSerchArea').css('display','inline-block');
			} else if(searchPoint == "re") {
				sendData = {"branchOp":branchOp, "studyOp":studyOp, "typeOp":typeOp, "sortOp":sortOp, "searchType":searchType, "searchText":searchText, "reSearchText":reSearchText};
				$('#typeOpArea').css('width','100%');
				$('#reSerchArea').css('display','inline-block');
			}
			
			if(page) {
				var pageData = {"page":page};
				$.extend(true, sendData, pageData);
			}
			
			console.log("searchPoint : " + searchPoint);
			console.log("branchOp : " + branchOp);
			console.log("studyOp : " + studyOp);
			console.log("typeOp : " + typeOp);
			console.log("sortOp : " + sortOp);
			console.log("searchType : " + searchType);
			console.log("searchText : " + searchText);
			console.log("reSearchText : " + reSearchText);
			console.log("---------------------------");
			
			$.ajax({
				url:'getRecList.sg',
				data: sendData,
				dataType: 'json',
				async: false,
				success: function(data) {
					var $listArea = $('#listArea');
					$listArea.html('');
					var $label = $('<label style="padding:5px 8px 5px 8px; margin:30px; font-size:20px; background:#868686; color:white;">');
					var $notice = $('<label style="color:gray;">');
					
					if(data.length > 0) {
						if(searchPoint == 'all') {
							$notice.text($('#searchType option:checked').text() + '을(를) "' + $('#searchText').val() + '"로 검색한 결과입니다.');
							$listArea.append($notice);
						} else if(searchPoint == 're') {
							if($('#searchType').val() != '분류') {
								$notice.text($('#searchType option:checked').text() + '을(를) "' + $('#searchText').val() + '"로 검색한 결과 중 "' + $('#reSearchText').val() + '"을(를) 추가로 검색한 결과입니다.');
							} else {
								$notice.text('카테고리 선택 결과 중 "' + $('#reSearchText').val() + '"을(를) 추가로 검색한 결과입니다.');
							}
							$listArea.append($notice);
						}
						
						for(var i in data) {
							
							var $recGroup = $('<div class="recGroup" onclick="goToDetail(' + data[i].sgNo + ');">');
							var $firstInfo = $('<div class="firstInfo">');
							var $secondInfo = $('<div class="secondInfo">');
							var $thirdInfo = $('<div class="thirdInfo">');
							var $fourthInfo = $('<div class="fourthInfo">');

							$recGroup.append('<input type="hidden" value="' + data[i].sgNo + '">');
							
							var $span;
							if(data[i].sgStatus != 'Y')
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
							
							if(data[i].sgStatus == 'Y') {
								$secondInfo.append($('<label class="infoLabel">').text('그룹 인원'));
								$secondInfo.append($('<label class="infoContent">').text(data[i].msgNum + "명"));
							}
							
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
					} else {
						if(searchPoint != '') {
							$label.text(' 검색 결과가 없습니다. ');
							$listArea.append($label);
						} else {
							$label.text(' 조건에 맞는 결과가 없습니다. ');
							$listArea.append($label);
						}
					}
				}
			});

			if(page) {
				getPaging(page);
			}
		}
		
		function getPaging(page) {
			var branchOp = "";
			var studyOp = "";
			var typeOp = "";
			for(var i = 0; i < $('.pointer').length; i++) {
				if($('.pointer').eq(i).css('color') == 'rgb(255, 255, 255)') {
					if(($('.pointer').eq(i).attr('class')).indexOf('branch') != -1) {
						branchOp = $('.pointer').eq(i).text();
					} else if($('.pointer').eq(i).attr('class').indexOf('study') != -1) {
						studyOp = $('.pointer').eq(i).text();
					} else if($('.pointer').eq(i).attr('class').indexOf('type') != -1) {
						typeOp = $('.pointer').eq(i).text();
					}
				}
			}

			var sortOp = "";
			for(var i = 0; i < $('.sort').length; i++) {
				if($('.sort').eq(i).css('color') == 'rgb(255, 255, 255)') {
					sortOp = $('.sort').eq(i).attr('id');
				}
			}
			
			var searchType = "";
			var searchText = "";
			var reSearchText = "";
			if(searchPoint == 'all') {
				searchType = $('#searchType').val();
				searchText = $('#searchText').val();
			} else if(searchPoint == 're') {
				searchType = $('#searchType').val();
				searchText = $('#searchText').val();
				reSearchText = $('#reSearchText').val();
			}
			
			var sendData;
			
			if(searchPoint == "") {
				sendData = {"branchOp":branchOp, "studyOp":studyOp, "typeOp":typeOp, "sortOp":sortOp};
			} else if(searchPoint == "all") {
				sendData = {"branchOp":branchOp, "studyOp":studyOp, "typeOp":typeOp, "sortOp":sortOp, "searchType":searchType, "searchText":searchText};
			} else if(searchPoint == "re") {
				sendData = {"branchOp":branchOp, "studyOp":studyOp, "typeOp":typeOp, "sortOp":sortOp, "searchType":searchType, "searchText":searchText, "reSearchText":reSearchText};
			}
			
			if(page) {
				var pageData = {"page":page};
				$.extend(true, sendData, pageData);
			}
			
			$.ajax({
				url: "getPaging.sg",
				data: sendData,
				dataType: 'json',
				success: function(data) {
					console.log(data);
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
						$a = $('<a onclick="getRecList(1);">');
						//$span = $('<span aria-hidden="true">').text('≪');
						$span = $('<span class="icon-fast-backward">');

						$a.append($span);
						$li.append($a);
						$pageListUl.append($li);
						
						var go = data.currentPage - 1;
						$a = $('<a onclick="getRecList(' + go + ');">');
						//$span = $('<span aria-hidden="true">').text('＜');
						$span = $('<span class="icon-to-start">');
						
						$a.append($span);
						$li.append($a);
						$pageListUl.append($li);
					}
					
					//페이지
					for(var i = data.startPage; i <= data.endPage; i++) {
						console.log(i);
						
						if(i == data.currentPage)
							$a = $('<a href="#" class="pageBtn selectPageBtn" onclick="return false;">').text(i);
						else
							$a = $('<a class="pageBtn" onclick="getRecList(' + i + ');">').text(i);
						
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
						$a = $('<a onclick="getRecList(' + go + ');">');
						//$span = $('<span aria-hidden="true">').text('>');
						$span = $('<span class="icon-to-end">');

						$a.append($span);
						$li.append($a);
						$pageListUl.append($li);
						
						$a = $('<a onclick="getRecList(' + data.maxPage + ');">');
						//$span = $('<span aria-hidden="true">').text('≫');
						$span = $('<span class="icon-fast-forward">');
						
						$a.append($span);
						$li.append($a);
						$pageListUl.append($li);
					}
				}
			})
			
			searchPoint = "";
		}
		
		$('#categoryBtn').click(function() {
			if($('#categoryHiddenArea').css('display') == 'none') {
				$('#categoryHiddenArea').css('display', 'block');
			} else {
				$('#categoryHiddenArea').css('display', 'none');
				$('#listArea').css('margin-top', '2%');
			}
		})
		
		function goToDetail(sgno) {
			location.href = "recruitDetailView.sg?sgno=" + sgno;
		}
		
		function categoryClickOption(e, click) {
			var $where;
			if(e == 'branch') $where = $('.branchCategory');
			else if(e == 'study') $where = $('.studyCategory');
			else if(e == 'type') $where = $('.typeCategory');
			else $where = $('.sort');
			
			if(e == 'sort') {
				for(var i = 0; i < $where.length; i++) {
					if($where.eq(i).attr('id') == $(click).attr('id') && $where.eq(i).css('color') == 'rgb(255, 255, 255)') {
						$where.eq(i).css({'background':'transparent', 'color':'#333'});
						return;
					}
				}
			}
			
			for(var i = 0; i < $where.length; i++) {
				if($where.eq(i).css('color') == 'rgb(255, 255, 255)') {
					$where.eq(i).css({'background':'transparent', 'color':'#333'});
				}
			}
			
			$(click).css({'background':'#135D36', 'color':'white'});
		}
		
		$('#categoryRsetBtn').click(function() {
			for(var i = 0; i < $('.pointer').length; i++) {
				$('.pointer').eq(i).css({'background':'transparent', 'color':'#333'});
			}
			$('#reSearchText').val('');
			
			/* $('#typeOpArea').css('width','65%');
			$('#reSearchText').val('');
			$('#reSerchArea').css('display','none'); */
		})
		
		$('#categorySerchBtn').click(function() {
			$('#categoryBtn').click();
			
			if($('#reSearchText').val() != '') {
				searchPoint = "re";
			} else if($('#searchType').val() != '분류' && $('searchText').val() != '') {
				searchPoint = "all";
			} else {
				$('#typeOpArea').css('width','100%');
				$('#reSerchArea').css('display','inline-block');
				
				searchPoint = "";
			}
			
			getRecList();
			getPaging();
		})
		
		$('.sort').click(function() {
			if($('#searchType').val() != '분류' && $('#searchText').val().trim() != '') {
				if($('#reSearchText').val().trim() != '') {
					searchPoint = "re";
				} else {
					searchPoint = "all";
				}
				
				getRecList();
				getPaging();
			} else {
				getRecList();
				getPaging();
			}
		})
		
		$('#allSearchBtn').click(function() {
			if($('#categoryHiddenArea').css('display') != 'none') $('#categoryBtn').click();
			
			if($('#searchText').val().trim() != '') {
				if($('#searchType').val() != '분류') {
					$('#categoryRsetBtn').click();
					
					searchPoint = "all";
					
					getRecList();
					getPaging();
				} else {
					alert('검색분류를 선택해주세요.');
				}
			} else {
				alert('검색어를 입력해주세요.');
			}
		})
		
		$('.pageTitle').click(function() {
			location.reload();
		});
		
		$('#searchText').keydown(function (key) {
	        if(key.keyCode == 13) $('#allSearchBtn').click();
	    });
	</script>
</body>
</html>