<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/reset.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/plugins/datepicker/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/plugins/datepicker/daterangepicker.css">
<link rel="stylesheet" href="${contextPath}/resources/css/plugins/sweetalert/sweetalert.css">
	<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<!-- cosmos css -->
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${contextPath}/resources/css/layout-style.css">
</head>
<style>
	.loginTop, .loginMid {
		display: flex;
  		justify-content: center;
	}
	
	/* 로그인 창 색상 ------------------ */
	#loginModal .modal-content {
		background-color: rgb(23, 149, 95);
	}
	.loginMid {
		background-color: rgb(255, 255, 224);
	}
	div.loginBox input.loginBtn {
		padding : 7px 0;
	
	}
	
	div.btnBox button.btn2 {
		background: transparent;
		padding-left:3px;
		padding-right:3px;
	}
	
	div.btnBox button.btn2:focus {
		outline:0;
		box-shadow : none;
	}
	
	/* --------------------------- */
	
	.loginMid div{
		margin: 5px;
	}

	div.loginBox{
		width: 54%;
		margin: 20px auto;
	}
	.loginBox input{
		width: 100%;
		padding : 3px 5px;
	}
	
	/* 빙그레체에서는 password동그라미가 지원되지않아 설정해준 것. */
	input[type=password] {
        font-family: "serif";
        
        &::placeholder {
        	font-family: "Binggrae";
        }
    } 
    
    .user-area, .master-area {
    	width : 80%;
    	margin-left : auto;
    	margin-right : auto;
    }
    
    .oneLine {
    	color : rgba(255, 255, 255, 0.9);
    	letter-spacing : -1px;
    }
    
    .cosmos{
    	font-weight : bold;
    	font-size : 2rem;
    	padding-right:2px;
    }
    .btn-default {
    	width : 100%;
    	margin : 10px 0;
    	padding : 10px 0;
    	border : none;
    	background-image : none;
    	/* background-color:rgb(214, 223, 35);
    	color:#000; */
    	background-color:rgb(0, 0, 0);
    	color:#fff;
    	text-shadow : none;
    }
    
    .btn-default:hover {
    	background-color:rgb(214, 223, 35);
    }
    
    .user-menu {
    	font-size:1.4rem;
    	text-align : center;
    }
    
    .user-menu div {
    	display : inline-block;
    	margin-right : 10px;
    }
       
    .clear-fix::after {
    	content : "";
    	display:block;
    	clear : both;
    }
    
    .bar{
    	display : block;
    	margin:30px auto 0;
    	height:0.8px;
    	background-color: #000;
    	border:none;
    	width:80%;
    }
    
    /* menu */
    .menubar {
    	font-family: 'Binggrae';
    	color : rgba(255, 255, 255, 0.9);
    	width:100%;
    }
    
    .menuTitle > a,  .menuTitle > div > a{
    	display:block;
    	width:80%;
    	margin-left : auto;
    	margin-right:auto;
    	/* border-bottom : 1px dotted rgba(255, 255, 255, 0.9); */
    	padding : 12px 2px;
    }
    
    .s-menu > div > a {
    	display : block;
    	width:80%;
    	margin-left : auto;
    	margin-right:auto;
    }
    
    .s-menu{
    	display: none; 
    	
    	background-color:rgb(254, 245, 198);
    	color : #444;
    }
    
    .s-menu > div > a {
    	padding : 12px 0 12px 23px;
    }
    
    .menuTitle:hover{
    	background-color:rgba(100, 222, 109, 0.7);
    }
	.s-menu>div:hover {
		background-color:rgba(228, 208, 106, 0.2);
	}
	
	/* menu.on --------------------------------- */
	.menuTitle.on
	{
    	background-color:rgb(100, 222, 109);
    }
    .s-menu>div.on a::after {
    	content : " :: ";
    }
    /* ----------------------------------------- */
	
	.note-modalMask {
		position: absolute;
		left: 0;
		top: 0;
		z-index: 100;
		background: rgba(0, 0, 0, 0.4);
	}
	
	/* 쿠폰 모달 스타일 */
	.myCuponSize{width: 45%;}
	.myCuponColor{background: lightgray;}
	.myCuponTitle{width:100%; text-align:center; margin:10px;}
	.myCuponBody{width:100%; display:inline-block; text-align:center;}
	#cuponArea{width:80%; min-height: 330px; margin-top:5%; margin-bottom:5%; display:inline-block; text-align:center; border-radius:10px; background:white;}
	#cuponAreaTop{width:100%; height:120px; padding: 4%; padding-bottom: 1%;}
	#cuponLogo{width:50%; height:100%; float:left; padding-left:3%;}
	#cuponLogo div{height:100%; width:auto;}
	#cuponStampCount{width:50%; height:100%; float:right; text-align:right; padding-right:5%; padding-top:3%;}
	#cuponStampCount label{font-size:35px; font-weight:normal;}
	#stampArea{width:100%; text-align:center;}
	#stampArea>div{width:85%; display:inline-block;}
	#stampArea>div>table{width:100%; display:table; text-align:center; border-collapse: separate; border-spacing: 0em 1.5em !important}
	
	.emptyStamp{width:70px; height:70px; display:inline-block; background:#A6A6A6; border-radius:50%;}
	.iconStamp{text-align:center; vertical-align:middle;}
	.iconStamp img{width:80px; height:auto; display:inline-block; margin:0; padding:0;}
	
	#stampListArea{width:100%; text-align:center;}
	#stampListArea>div{width:80%; display:inline-block;}
	#stampListArea>div table{width:100%; display:table; font-size:18px; display:table; text-align:center; border-collapse: separate; border-spacing: 0em 1.7em !important}
	/* 쿠폰 모달 스타일 끝 */
</style>
<body>
	<!-- contextPath를 변수로 만들어 활용하기 -->
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
	<div class="header">
		<div class="logo imageBox" onclick="location.href='${ contextPath }'"></div>
		<div class="user-area">
			<c:if test="${ empty sessionScope.loginUser }">
				<div class="oneLine">
					<div><span class="cosmos">코스모스</span>에 오신 것을 환영합니다.</div>
					<div id="login" class="btn btn-default">로그인</div>
					<div class="user-menu">
						<div id="find" class="find">
							<a href="find.me"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>아이디 &middot; 비밀번호 찾기</a></div> 
						<div id="enroll" class="enroll"><a href="agree.me"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>회원가입</a></div>
					</div>
				</div>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser }">
				<c:if test="${ sessionScope.loginUser.grade == 1}">
					<div class="oneLine">
						<div>
							<span class="cosmos"><c:out value="${ loginUser.name }"/></span>님
						</div>
						<c:url var="logout" value="logout.me"/>				
						<div><button onclick="location.href='${logout}'" class="btn btn-default">로그아웃</button></div>
						<div class="user-menu clear-fix">

							<div class="noteBtn"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>쪽지</div>
<!-- 							<div onclick="popup();"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>쪽지</div> -->
							<div onclick="openCoupon();"><span class="glyphicon glyphicon-tags" aria-hidden="true"></span>쿠폰</div>

							<div>
								<c:url var="mypage" value="myPage.mp">
									<c:param name="id" value="${ loginUser.id }"/>
								</c:url>
							<a href="${mypage}"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>마이 페이지</a></div>
							<div data-toggle="modal" data-target="#report"aria-hidden="true"><span class="glyphicon glyphicon-thumbs-down"></span>신고</div>
						</div>
					</div>
				</c:if>
				<c:if test="${ sessionScope.loginUser.grade == 0}">
					<div class="oneLine">
						<div>
							<span class="cosmos"><c:out value="${ loginUser.name }"/></span>님
						</div>
						<c:url var="logout" value="logout.me"/>				
						<div><button onclick="location.href='${logout}'" class="btn btn-default">로그아웃</button></div>
						<div class="user-menu clear-fix">
				 			<div data-toggle="modal" data-target="#note"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>쪽지</div>
					<!--	<div onclick="openCoupon();"><span class="glyphicon glyphicon-tags" aria-hidden="true"></span>쿠폰</div>  -->
							<div><a href="adminPage.ap"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>관리자 페이지</a></div>
						</div>
					</div>
				</c:if>
			</c:if>
		</div>
		<%-- 관리자 페이지 메뉴  --%>
		<%-- 
		<div class="master-area">
			<c:if test="${ sessionScope.loginUser.grade == 0}">
				<div class="menuTitle" id="myPage">
					<div><a href="">관리자페이지</a></div>
					<div class="s-menu">	
						<div><a href="">신고목록</a></div>
						<div><a href="">강연관리</a></div>
						<div><a href="">좌석예약조회</a></div>
						<div><a href="">회원목록</a></div>
						<div><a href="enrollBranch.ap">지점등록</a></div>
						<div><a href="branchList.ap">지점목록</a></div>
					</div>
				</div>
			</c:if>
		</div> 
		--%>
		
		<hr class="bar">
		
		<div class="menubar">
			<div class="menuTitle"><a href="reservation.se"><span class="glyphicon glyphicon-education" aria-hidden="true"></span>좌석예약</a></div>
			<div class="menuTitle"><a href="listView.sg"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>그룹목록</a></div>
			<div class="menuTitle">
				<div><a href="#"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>플래너</a></div>
				<div class="s-menu">
					<div><a href="myPlannerList.sp">나의 플래너</a></div>
					<div><a href="allPlannerList.sp">모두의 플래너</a></div>								
				</div>
			</div>
			<div class="menuTitle"><a href="viewBranchList.vb"><span class="glyphicon glyphicon-tree-deciduous" aria-hidden="true"></span>지점찾기</a></div>
			<div class="menuTitle">
				<div><a href="#"><span class="glyphicon glyphicon-blackboard" aria-hidden="true"></span>강연</a></div>
				<div class="s-menu">
					<div><a href="lectureCalendar.le">강연 목록</a></div>
					<div><a href="lectureApplyGuide.le">강연자 신청</a></div>								
				</div>
			</div>
		</div>
	</div>
	
	<!-- 로그인 모달 창 -->
	<div class="modal fade" id="loginModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       		<div class="loginTop">
       			<div class="login_green imageBox"></div>
       		</div>
        	<div class="loginMid">
        		<div class="loginBox">
	        		<form action="login.me" method="post" onsubmit="return loginUser();">
	        			<div>
			        		<div>
		       					<input type="text" name="id" id="id" placeholder="아이디">
		       				</div>
		       				<div>
		       					<input type="password" name="pwd" id="pwd" placeholder="비밀번호">
		       				</div> 
	       					<div>
	       						<input type="submit" class="btn loginBtn" value="로그인">
	       					</div>
	       				</div>
		        		<div class="btnBox">
			        		<button type="button" class="btn btn2" onclick="location.href='find.me'"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>아이디 / 비밀번호 찾기</button>
			        		<button type="button" class="btn btn2" onclick="location.href='agree.me'"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>회원가입</button>
						</div> 
					</form>
				</div>		          	
	        </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- 쿠폰 모달 -->
	<div id="myCupon" class="modal fade" role="dialog">
		<div class="modal-dialog myCuponSize">
			<div class="modal-content myCuponColor">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title myCuponTitle">마이 쿠폰</h2>
				</div>
				
				<div class="modal-body myCuponBody">
					
					<div id="cuponArea">
						<div id="cuponAreaTop">
							<div id="cuponLogo">
								<div class="logo_green"></div>
							</div>
							<div id="cuponStampCount">
								<label><span id="stampCount"></span>/10</label>
							</div>
						</div>
						
						<div id="stampArea">
						<div>
							<table id="couponTable"></table>
						</div>
						</div>
					</div>
					
					<div id="stampListArea">
						<div>
							<table id="stampTable"></table>
						</div>
					</div>
				</div>

				<div class="modal-footer" style="width:100%; text-align:center;">
					<nav>
						<ul class="pagination" id="pageUl"></ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- 쿠폰 모달 -->
	<!-- 신고 모달 -->
	<div id="report" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content ">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title reportTitle" style="text-align:center">신고사유</h2>
				</div>
				<div id="reportReason">
					<div class="modal-body">
						<form>
							<table>
								<tr>
									<td><input type="radio" name="reason" data-value="0" id="r2" value="1" checked><label for="r1">스터디 모임 불참이 잦음</label></td>
									<td><input type="radio" name="reason" data-value="0" id="r2" value="2"><label for="r1">공부하지 않음</label></td>					
									<td><input type="radio" name="reason" data-value="0" id="r2" value="3"><label for="r1">타인 비하 발언</label></td>
								</tr>
								<tr>
									<td><input type="radio" name="reason" data-value="0" id="r2" value="4" ><label for="r1">유흥분위기 주도</label></td>					
									<td><input type="radio" name="reason" data-value="1" id="r2" value="0"><label for="r2">기타</label></td>
									<td><input type="text" name="text"></td>
								</tr>		
							</table>
							<div class="btnBox">
				        		<button type="button" class="btn" onclick="success()">신고</button>
							</div> 
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 신고모달 -->
	
	
</body>
<script>
	var idx = 0;
	
	$('#login').click(function(e){
		e.preventDefault();
		$('#loginModal').modal("show");
	});
	
	function loginUser(){
		
		var $errorDiv = $("<div class='error'>");
		if($('#id').val().trim().length != 0){
			$('.error').detach();
		}
		
		if($('#id').val().trim().length == 0){
			if(!$('#id').next().is($('.error'))){
				$('#id').parent().append($errorDiv);
				$('.error').text('아이디를 입력해주세요!');
				$('#id').focus();
			}
			return false;
		}
		
		if($('#pwd').val().trim().length == 0){
			if(!$('#pwd').next().is($('.error'))){
				$('#pwd').parent().append($errorDiv);
				$('.error').text('비밀번호를 입력해주세요!');
				$('#pwd').focus();
			}
			return false;
		}
		
		return true;
	}
	
	/* 메뉴 */
	$(function(){
		
		/* 하위 메뉴 슬라이드 */
		$("div.s-menu").css({display: "none"});
		
		$("div.menuTitle").click(function(){
			if($(this).find("div.s-menu").css("display") == "none"){
				$("div.s-menu").each(function(){
					if($(this).css("display") == "block"){
						$(this).slideUp("fast");
					}
				});
				$(this).find("div.s-menu").slideDown("fast");

			} else {
				// return false;
			}
			
		});
		
		/* 메뉴 고정 : 모든 메뉴 완성되면 구현하기 */
		var url = location.href;
		
		// 메인메뉴
		var mainMenu = new Array;
		mainMenu[0] = "reservation";
		mainMenu[1] = "listView";
		mainMenu[2] = "myPlanner"; // 미정
		mainMenu[3] = "viewBranch";
		mainMenu[4] = "lecture"; // 미정
		var getMain0 = url.indexOf(mainMenu[0]);
		var getMain1 = url.indexOf(mainMenu[1]);
		var getMain2 = url.indexOf(mainMenu[2]);
		var getMain3 = url.indexOf(mainMenu[3]);
		var getMain4 = url.indexOf(mainMenu[4]);
		
		// 서브메뉴 가지고 있는 메뉴 : 플래너
		var plannerSub = new Array;
		plannerSub[0] = "myPlannerList";
		plannerSub[1] = "allPlannerList"; // 미정
		var getPlannerSub0 = url.indexOf(plannerSub[0]);
		var getPlannerSub1 = url.indexOf(plannerSub[1]);
		
		// 서브메뉴 가지고 있는 메뉴 : 강연
		var lectureSub = new Array;
		lectureSub[0] = "lectureCalendar";
		lectureSub[1] = "lectureApplyGuide";
		var getLectureSub0 = url.indexOf(lectureSub[0]);
		var getLectureSub1 = url.indexOf(lectureSub[1]);
		
		if (getMain0 != -1) {
			$(".menuTitle:eq(0)").addClass("on");
		}

		if (getMain1 != -1) {
			$(".menuTitle:eq(1)").addClass("on");
		}

		if (getMain2 != -1) {	
			$(".menuTitle:eq(2)").addClass("on");
		}
		if (getPlannerSub0 != -1){	
			$(".menuTitle:eq(2)").addClass("on");
			$(".menuTitle:eq(2) > div.s-menu > div:first-child").addClass("on");
			$(".menuTitle:eq(2) > div.s-menu").css("display", "block");
		} 
		if (getPlannerSub1 != -1){
			$(".menuTitle:eq(2)").addClass("on");
			$(".menuTitle:eq(2) > div.s-menu > div:last-child").addClass("on");
			$(".menuTitle:eq(2) > div.s-menu").css("display", "block");
		} 
		if (getMain3 != -1) {
			$(".menuTitle:eq(3)").addClass("on");
		}

		if (getMain4 != -1) {
			$(".menuTitle:eq(4)").addClass("on");
		}
		if (getLectureSub0 != -1){
			$(".menuTitle:eq(4)").addClass("on");
			$(".menuTitle:eq(4) > div.s-menu > div:first-child").addClass("on");
			$(".menuTitle:eq(4) > div.s-menu").css("display", "block");
			
		} 
		if (getLectureSub1 != -1){
			$(".menuTitle:eq(4)").addClass("on");
			$(".menuTitle:eq(4) > div.s-menu > div:last-child").addClass("on");
			$(".menuTitle:eq(4) > div.s-menu").css("display", "block");
		} 
	});
	
	// 회원가입 성공시 로그인 창 바로 뜨기
	window.onload = function(){
		if( <%= request.getParameter("success") %> == 1){
			$("#login").trigger("click");
		}
	};

	
	$(function(){
		// sweetalert
		if("${ successMsg }" != ""){
			sweetSuccess("${ successMsg }");
		}
		
		if("${ updateMsg }" != ""){
			sweetUpdate("${ updateMsg }");
		}
		
		// 비밀번호,아이디 로그인 실패시
		if("${ wrongMsg }" != ""){
			sweetWrong("${ wrongMsg }");
			$("#login").trigger("click");
		}
		
		// 페이지 타이틀 클릭 시
		$('.pageTitle').click(function() {
	         location.reload();
	    });
	});
	
	// 쪽지 팝업 
	$(function(){
		$("body").append("<div class='note-modalMask'></div>");
		
		function maskInit(){
			var maskW = $(document).width();
			var maskH = $(document).height();
			$(".note-modalMask").css({"width" : maskW +"px", "height" : maskH + "px"});
		}
		
		function popup(){
			if("${loginUser.id}" != ""){
				var url = "noteList.mp?userId=" + "${loginUser.id}";
		        var name = "notePopup";
		        
		        var popLeft = Math.ceil(( window.screen.width - 700 )/2);
		        var popTop = Math.ceil(( window.screen.height - 670 )/2);
		        
		        var option = "width = 700, height = 670, top =" + popTop + ", left = " + popLeft +", location = no";
		        
		        child = window.open(url, name, option); 
			}
	    }
		
		/* $(window).resize(function(){
			maskInit();
			popup();
		}); */
		
		$(".noteBtn").click(function(){
			$(".note-modalMask").fadeIn();
			maskInit();
			popup();
		});
		
		$(".note-modalMask").click(function(){
			 child.close(); 
			$(".note-modalMask").fadeOut("fast");
		}); 
	});
	
	
	//쿠폰 팝업
	function openCoupon() {
		couponInfo();
		couponPaging();
		
		$('#myCupon').modal();
	}
	
	function couponInfo(page) {
		
		var sendData = {"id":"${ loginUser.id }"};
		
		if(page) {
			var pageData = {"page":page};
			$.extend(true, sendData, pageData);
		}
		
		$.ajax({
			url:"getCouponInfo.mp",
			data:sendData,
			dataType: 'json',
			success: function(data) {

				if(!page || page == 1) {
					var totalStamp = data[0].cTotalStamp;
					
					$('#stampCount').text(totalStamp);
					
					var $couponTable = $('#couponTable');
					$couponTable.html('');
					for(var j = 0; j < 10; j++) {
						var $tr;
						if(j < 5) {
							if(j == 0) $tr = $('<tr>');
							if(data[j] != undefined && totalStamp-1 >= j) $tr.append('<td class="iconStamp"><img src="${contextPath }/resources/image/alien.png" /></td>');
							else $tr.append('<td><div class="emptyStamp"></div></td>');
							if(j == 4) $couponTable.append($tr);
							
						} else {
							if(j == 5) $tr = $('<tr>');
							if(data[j] != undefined && totalStamp-1 >= j) $tr.append('<td class="iconStamp"><img src="${contextPath }/resources/image/alien.png" /></td>');
							else $tr.append('<td><div class="emptyStamp"></div></td>');
							if(j == 9) $couponTable.append($tr);
						}
					}
				}

				$stampTable = $('#stampTable');
				$stampTable.html('');
				if(data.length > 0) {
					for(var i in data) {
						var $tr = $('<tr>');
						
						$tr.append('<td style="width:30%;">' + data[i].cInsertDate + '</td>');
						$tr.append('<td>' + decodeURIComponent(data[i].cContent.replace(/\+/g, ' ')) + '</td>');
						$tr.append('<td style="width:15%;">' + data[i].cStamp + '</td>');
						$stampTable.append($tr);
					}
				} else {
					$stampTable.append('<tr><td>도장 내역이 없습니다.</td></tr>');
				}
			}
		})
		
		if(page) {
			couponPaging(page);
		}
	}
	
	function couponPaging(page) {
		
		var sendData = {"id":"${ loginUser.id }"};
		
		if(page) {
			var pageData = {"page":page};
			$.extend(true, sendData, pageData);
		}
		
		$.ajax({
			url:"getCouponPage.mp",
			data:sendData,
			dataType: 'json',
			success: function(data) {
				$pageUl = $('#pageUl');
				$pageUl.html('');
				
				if(data.listCount > 0) {
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
						$pageUl.append($li);
						
						$a = $('<a href="#" onclick="return false;">');
						//$span = $('<span aria-hidden="true">').text('＜');
						$span = $('<span class="icon-to-start">');

						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
					} else if(data.currentPage > 1) {
						$a = $('<a onclick="couponInfo(1);">');
						//$span = $('<span aria-hidden="true">').text('≪');
						$span = $('<span class="icon-fast-backward">');

						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
						
						var go = data.currentPage - 1;
						$a = $('<a onclick="couponInfo(' + go + ');">');
						//$span = $('<span aria-hidden="true">').text('＜');
						$span = $('<span class="icon-to-start">');
						
						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
					}
					
					//페이지
					for(var i = data.startPage; i <= data.endPage; i++) {
						console.log(i);
						
						if(i == data.currentPage)
							$a = $('<a href="#" class="pageBtn selectPageBtn" onclick="return false;">').text(i);
						else
							$a = $('<a class="pageBtn" onclick="couponInfo(' + i + ');">').text(i);
						
						$li.append($a);
						$pageUl.append($li);
					}

					//맨 마지막으로, 다음
					if(data.currentPage >= data.maxPage) {
						$a = $('<a href="#" onclick="return false;">');
						//$span = $('<span aria-hidden="true">').text('>');
						$span = $('<span class="icon-to-end">');
						
						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
						
						$a = $('<a href="#" onclick="return false;">');
						//$span = $('<span aria-hidden="true">').text('≫');
						$span = $('<span class="icon-fast-forward">');

						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
					} else if(data.currentPage < data.maxPage) {
						var go = data.currentPage + 1;
						$a = $('<a onclick="couponInfo(' + go + ');">');
						//$span = $('<span aria-hidden="true">').text('>');
						$span = $('<span class="icon-to-end">');

						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
						
						$a = $('<a onclick="couponInfo(' + data.maxPage + ');">');
						//$span = $('<span aria-hidden="true">').text('≫');
						$span = $('<span class="icon-fast-forward">');
						
						$a.append($span);
						$li.append($a);
						$pageUl.append($li);
					}
					
				}
			}
		})
	}
	
	
	
	// 신고하기 라디오버튼 활성화
	$(document).ready(function(){
 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=reason]").click(function(){
 
        if($("input[name='reason']:checked").data("value") == "1"){
            $("input:text[name=text]").attr("disabled",false);
            // radio 버튼의 value 값이 1이라면 활성화
 
        }else if($("input[name='reason']:checked").data("value") == "0"){
              $("input:text[name=text]").attr("disabled",true);
            // radio 버튼의 value 값이 0이라면 비활성화
        }
    });
   
});
	// 신고 알럿
	function success(){
		alert("신고되었습니다.");
		
		// ajax
		// callback
		var userId = "${ loginUser.id }";
		var reason = $("input[name='reason']:checked").val();
		var reasonText = $("input[name='text']").val();
		
		console.log(userId);
		console.log(reason);
		console.log(reasonText);
		
		var sendData = {"userId": userId, "reason":reason, "reasonText":reasonText, "targetId":'test'};
		// ★test라고 임의의 값으로 넣어준거를 나중에 신고당한 회원으로 교체해야함 ★
		
		$.ajax({
			url: "reportInsert.ap",
			data: sendData,
			dataType: 'json',
			success: function(data) {
				$("#report").modal('hide');
			}
		});
	}

	
</script>
	<!-- 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- cosmos js -->
<script src="${contextPath}/resources/js/common.js"></script>
	<!-- sweet alert -->
<script src="${contextPath}/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${contextPath}/resources/js/plugins/sweetalert/sweetalert.cosmos.js"></script>
</html>