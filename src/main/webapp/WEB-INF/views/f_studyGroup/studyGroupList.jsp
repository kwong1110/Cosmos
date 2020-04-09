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
	
	#searchArea{width:100%; display:block; margin-bottom: 10%;}
	#categoryBtn{width:200px; display:inline-block; text-align:center;}
	
	#categoryHiddenArea{width:100%; display:inline; text-align:center;}
	.categoryDiv{width:100%; min-height:40px; margin-top:5px; padding-top:10px; padding-bottom:10px; padding-left:30px; vertical-align: middle; display:inline-block; text-align:left; background-color:lightgray;}
	.categoryLabel{width:11%; cursor:pointer; margin:0; padding:0; margin-right:50px;float:left; line-height:1.7;}
	
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
	
	#listArea{width:100%; display: block; text-align:center; background:lightgray;}
	.recGroup{width:75%; display: inline-block; margin-bottom:8%; text-align:left; background:white; cursor: pointer;}
	.firstInfo{}
	.secondInfo{}
	.thirdInfo{}
	.fourthInfo{}
	.infoTitle{margin-right:20px; font-size: 19px;}
	.infoLabel{margin-right:8px; font-size: 15px; vertical-align: middle;}
	.infoContent{margin-right:20px; font-size: 15px; font-weight:normal; vertical-align: middle;}
	.goalStyle{font-size: 15px; font-weight:normal; text-overflow:ellipsis; white-space:nowrap; max-width:80%; overflow:hidden; vertical-align: middle;}
	.groupContentStyle{font-size: 15px; max-width:88%; vertical-align: middle; font-size:1em; overflow:hidden; text-overflow:ellipsis; line-height:1.5; height:3em; word-wrap:break-word; display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical;}
	
	#bottomArea{width:100%; text-align:center; margin-top:5%;}
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
					<div class="inner" style="width:100%; display:block; text-align:center;">
					<form method="get" action="" style="width:50%;">
						<div class="input-group">
							<div class="input-group-btn">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">분류 <span class="caret"></span></button>
								<ul class="dropdown-menu" role="menu">
									<li>그룹 명</li>
									<li>그룹장 닉네임</li>
									<li>그룹 내용</li>
									<li>그룹 목표</li>
								</ul>
							</div><!-- /btn-group -->
							<input type="text" class="form-control" placeholder="검색어를 입력하세요.">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">검색</button>
							</span>
						</div><!-- /input-group -->
					</form>
					</div>
					
					<div id="searchArea" class="inner">
						<div id="categoryArea">
							<input type="button" class="defaultBtn" id="categoryBtn" value="카테고리">
							
							<div id="sortArea">
								<label>최근 등록순</label>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<label>그룹 인원 적은순</label>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<label>그룹 인원 많은순</label>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<label>모집 마감 임박순</label>
							</div>
							
							<div id="categoryHiddenArea">
								<div id="locDiv" class="categoryDiv">
									<label class="categoryLabel">노량진점</label>
									<label class="categoryLabel">부천점</label>
									<label class="categoryLabel">성남점</label>
									<label class="categoryLabel">신도림점</label>
									<label class="categoryLabel">한남점</label>
								</div>
								
								<div id="studyDiv" class="categoryDiv">
									<div class="categoryLabel">
										<label class="pointer">대학생 학점관리</label><br>
										<label class="pointer">일반/학사 편입</label><br>
										<label class="pointer">대학원생</label><br>
										<label class="pointer">로스쿨생</label><br>
										<label class="pointer">자격증</label>
									</div>
									<div class="categoryLabel">
										<label class="pointer">공무원</label><br>
										<label class="pointer">임용 초등</label><br>
										<label class="pointer">임용 중등</label><br>
										<label class="pointer">임용 유아</label><br>
										<label class="pointer">임용 특수</label>
									</div>
									<div class="categoryLabel">
										<label class="pointer">공인회계사</label><br>
										<label class="pointer">공인중계사</label><br>
										<label class="pointer">세무사</label><br>
										<label class="pointer">고시</label><br>
										<label class="pointer">취업</label>
									</div>
									<div class="categoryLabel">
										<label class="pointer">이직</label><br>
										<label class="pointer">어학</label><br>
										<label class="pointer">PEET</label><br>
										<label class="pointer">MEET</label><br>
										<label class="pointer">LEET</label>
									</div>
									<div class="categoryLabel">
										<label class="pointer">자바</label><br>
										<label class="pointer">C</label><br>
										<label class="pointer">파이썬</label><br>
										<label class="pointer">데이터 베이스</label><br>
										<label class="pointer">해킹/보안</label>
									</div>
									<div class="categoryLabel">
										<label class="pointer">기타</label>
									</div>
								</div>
								
								<div id="typeDiv" class="categoryDiv" style="width:65%; float:left; display:inline-block;">
									<label class="categoryLabel">once</label>
									<label class="categoryLabel">long</label>
								</div>
								
								<div style="width:35%; min-height:40px; float:right; display:inline-block; padding-top:8px; padding-left:10px; vertical-align: top;">
									<input type="button" class="defaultBtn" value="초기화" style="width:37%; height:100%;">
									<input type="button" class="defaultBtn" value="검색" style="width:59%; height:100%; margin-left:3px;">
								</div>
								
								<!-- 
								<div id="confirmArea">
									<input type="button" class="defaultBtn" value="초기화">
									&nbsp;
									<input type="button" class="defaultBtn" value="검색">
								</div>
								 -->
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
					
						<div id="insertBtnArea">
							<input type="button" class="defaultBtn" onclick="location.href='insertRecView.sg'" value="모집 등록">
							&nbsp;&nbsp;&nbsp;
							<input type="button" class="defaultBtn" onclick="location.href='insertGroupView.sg'" value="그룹 등록">
						</div>
					</div>

				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<script>
		$(function() {
			$('#categoryHiddenArea').css('display', 'none');
		})
		
		$('#categoryBtn').click(function() {
			if($('#categoryHiddenArea').css('display') == 'none') {
				$('#categoryHiddenArea').css('display', 'block');
			} else {
				$('#categoryHiddenArea').css('display', 'none');
			}
		})
		
		$('.recGroup').click(function() {
			location.href="recruitDetailView.sg";
		})
	</script>
</body>
</html>