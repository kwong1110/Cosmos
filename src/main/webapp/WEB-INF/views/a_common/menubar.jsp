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
<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="${contextPath}/resources/js/common.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
	.header{
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
	}
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
</style>
<body>
	<!-- contextPath를 변수로 만들어 활용하기 -->
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
	<div class="header">
		<div class="menubar">
			<div class="logo imageBox" onclick="location.href='${ contextPath }'"></div>
			<c:if test="${ empty sessionScope.loginUser }">
				<div class="oneLine">
					<div id="login" class="btn btn-default">로그인</div> 
					<div id="enroll"><a href="enroll.me">회원가입</a></div>
				</div>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser }">
				<div>
					<c:out value="${ loginUser.name }님 "/>
				</div>
				<c:url var="logout" value="logout.me"/>				
				<div><button onclick="location.href='${logout}'" class="btn">로그아웃</button></div>
				<div class="oneLine">
					<div><a href="">메</a></div>
					<div><a href="">쿠</a></div>
					<div><a href="">마</a></div>
				</div>
			</c:if>
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
			<div class="menuTitle"><a href="">좌석예약</a></div>
			<div class="menuTitle"><a href="">그룹목록</a></div>
			<div class="menuTitle">
				<div><a href="">플래너</a></div>
				<div class="s-menu">
					<div><a href="">나의 플래너</a></div>
					<div><a href="">모두의 플래너</a></div>								
				</div>
			</div>
			<div class="menuTitle"><a href="">지점찾기</a></div>
			<div class="menuTitle">
				<div><a href="">강연</a></div>
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