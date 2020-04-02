<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
<link rel="stylesheet" href="${contextPath}/resources/css/reset.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${contextPath}/resources/css/layout-style.css">
<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="${contextPath}/resources/js/common.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
	/* .header{
		float:left;
		width: 12vw;
		height: 100vh;
		font-size: 18px;
		background-color: rgb(23, 149, 95);
	}
	.oneLine a,.oneLine div{
		display:inline-block;
		margin: 0px 7px 0px 7px;
	}
	.menubar div{
		margin: 10px 0px 10px 0px;
		text-align: center;
	}
	.imageBox{
		display:inline-block;
		width: 12vw;
		height: 9vw;
  		align-items: center;
	}*/
	.loginTop,.loginMid{
		display: flex;
  		justify-content: center;
  		align-items: center;
		text-align: center;  		
	}
	.loginMid div{
		margin: 5px;
	}
	.loginBtn{
		width: 100px;
	}
	.loginBox{
		width: 54%;
	}
	.loginBox input{
		width: 100%;
	}
	/* 빙그레체에서는 password동그라미가 지원되지않아 설정해준 것. */
	input[type=password] {
        font-family: "serif";
        
        &::placeholder {
        	font-family: "Binggrae";
        }
    } 
    
    .menubar, .user-area, .master-area {
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
    }
    
    .menuTitle {
    	padding : 10px 2px;
    	border-bottom : 1px dotted rgba(255, 255, 255, 0.9);
    }
    
    .s-menu > div {
    	padding : 10px 0 0px 23px;
    }
    
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
						<div id="find" class="find"><a href=""><span class="glyphicon glyphicon-search" aria-hidden="true"></span>아이디 &middot; 비밀번호 찾기</a></div> 
						<div id="enroll" class="enroll"><a href="enroll.me"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>회원가입</a></div>
					</div>
				</div>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser }">
				<div class="oneLine">
					<div>
						<span class="cosmos"><c:out value="${ loginUser.name }"/></span>님
					</div>
					<c:url var="logout" value="logout.me"/>				
					<div><button onclick="location.href='${logout}'" class="btn btn-default">로그아웃</button></div>
					<div class="user-menu clear-fix">
						<div><a href=""><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>쪽지</a></div>
						<div><a href=""><span class="glyphicon glyphicon-tags" aria-hidden="true"></span>쿠폰</a></div>
						<div><a href=""><span class="glyphicon glyphicon-user" aria-hidden="true"></span>마이 페이지</a></div>
					</div>
				</div>
			</c:if>
		</div>
		<div class="master-area">
			<c:if test="${ sessionScope.loginUser.grade == 0}">
				<div class="menuTitle" id="myPage">
					<div><a href="">관리자페이지</a></div>
					<div class="s-menu">	
						<div><a href="">신고목록</a></div>
						<div><a href="">강연관리</a></div>
						<div><a href="">좌석예약조회</a></div>
						<div><a href="">회원목록</a></div>
						<div><a href="">지점등록</a></div>
					</div>
				</div>
			</c:if>
		</div>
		
		<hr class="bar">
		
		<div class="menubar">
			<div class="menuTitle"><a href=""><span class="glyphicon glyphicon-education" aria-hidden="true"></span>좌석예약</a></div>
			<div class="menuTitle"><a href=""><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>그룹목록</a></div>
			<div class="menuTitle">
				<div><a href=""><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>플래너</a></div>
				<div class="s-menu">
					<div><a href="">나의 플래너</a></div>
					<div><a href="">모두의 플래너</a></div>								
				</div>
			</div>
			<div class="menuTitle"><a href=""><span class="glyphicon glyphicon-tree-deciduous" aria-hidden="true"></span>지점찾기</a></div>
			<div class="menuTitle">
				<div><a href=""><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>강연</a></div>
				<div class="s-menu">
					<div><a href="">강연 목록</a></div>
					<div><a href="">강연자 신청</a></div>								
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
        			<div class="logo imageBox"></div>
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
				        		<button type="button" class="btn">아이디 찾기</button>
				        		<button type="button" class="btn">비밀번호 찾기</button>
				        		<button type="button" class="btn">회원가입</button>
							</div>
						</form>
					</div>		        	
		        </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
<script>
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
	
	<% if(request.getParameter("msg") != null){ %>
		alert('<%=request.getParameter("msg")%>');
	<% } %>
</script>
</html>