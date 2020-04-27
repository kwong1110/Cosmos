<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	resultArea {border: 1px solid black;}
	#resultBtn {
		padding : 8px 12px;
		border : 1px solid #cbcbcb;
		background : #fff;
		color : #000;
		box-shadow : inset 1px 1px 3px #e6e6e6;
		vertical-align: middle;
		font-weight : 700;
		font-size : 13pt;
		width: 80px; height:40px;
	}
</style>
</head>
<body>
	
	<div class="total-wrapper">
	<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>ID/PW찾기</h1>
				</div>
				<!-- ID/PW 검색박스 -->
				<div class="content">
					<div class=resultArea>
							<div class="find">
								<p style="text-align:center">회원님의 ID는  ${id} 입니다.</p>
								 
						</div>
				
						</div>
			                                 
					<div class="btnBox inner" align=center>
						<button type="submit" class="defaultBtn" id="login">로그인</button>
						<button name="취소" onclick='history.go(-1)' class="defaultBtn">취소</button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
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
							</form>
						</div>		        	
		        	</div>
	    		</div><!-- /.modal-content -->
		  	</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
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
</body>
</html>