<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*id_비밀번호 찾기*/

/*불릿기호 없애기*/
 ul{
   list-style:none;
   }

.id_pw_srh {width:100%;overflow:hidden}
.id_pw_srh li {float:left;width:50%}
.id_pw_srh li .srh_box {padding:23px 41px 34px}
.id_pw_srh li .ID {border-style:solid none solid solid;border-width:1px 0 1px 1px;border-color:#d8d8d8;}
.id_pw_srh li .ID h2 {margin-bottom:10px;font-size:22px;font-weight:900; color:#816950}
.id_pw_srh li .PW h2 {margin-bottom:10px;font-size:22px;font-weight:900; color:#816950}
.id_pw_srh li .PW {border-style:solid;border-width:1px;border-color:#d8d8d8;  }

.id_pw_srh li .srh_box .srh_top {text-align:center;font-size:13px}
.id_pw_srh li .srh_box .info {margin-top:24px;padding-top:20px;border-top:1px dashed #d2d2d2}
.id_pw_srh li .srh_box .info label {display:inline-block;width:83px;margin-right:12px;vertical-align:middle;font-weight:900;font-size:13px;color:#333333}
.id_pw_srh li .srh_box .info p {margin-bottom:5px}
.id_pw_srh li .srh_box .info p input {width:167px;height:21px;border:1px solid #d4d6d6}
.id_pw_srh li .ID button {display:block;width:145px;margin:26px auto 0;padding:7px 0;border:1px solid black;background-color:black;font-family:'Malgun Gothic','맑은 고딕';color:#FFFFFF}
.id_pw_srh li .PW button {display:block;width:145px;margin:26px auto 0;padding:7px 0;border:1px solid black;background-color:black;font-family:'Malgun Gothic','맑은 고딕';color:#FFFFFF}


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
					<ul class="id_pw_srh">
				 <li>  
						<div class="srh_box ID">
							<div class="srh_top">
								<h2>ID찾기</h2>
								회원가입시 등록한 정보로<br> 아이디를 찾을 수 있습니다.
							</div>
							<div class="find">
								<form name="id_form" method="post" action="findId.me" >
								<input type="hidden" name="s_type" value="id">
										<p>
											<label for="id_name">이름</label> <input type="text" name="name" class="form-control" width="200px" title="이름 입력">
										</p>
										<p> 
											<label for="id_mail">이메일</label><input type="text" name="email" class="form-control" size="30" title="가입시 이메일 입력" placeholder="가입시 등록한 이메일">
										</p> 
										<button type="submit"  onclick="showPopup();">찾기</button>
								</form>
							</div>
						</div>
					</li> 
					
					<li>
						<div class="srh_box PW">
							<div class="srh_top">
								<h2>비밀번호 찾기</h2>
								회원가입시 등록한 정보로<br> 비밀번호를 재설정할 수 있습니다.
							</div>
							<div class="find">
								<form name="pw_form" method="post" action="findPwd.me" onsubmit="">
								<input type="hidden" name="s_type" value="pw">
											<p>
												<label for="pw_name">ID</label> <input type="text" name="id" class="form-control" title="아이디 입력">
											</p>
											<p>
												<label for="pw_mail">이메일</label> <input type="text" name="email" class="form-control" title="가입시 이메일 입력" placeholder="가입시 등록한 이메일">
											</p>
										<button type="submit"  onclick="showPopup();">찾기</button>
								</form>
							</div>
						</div>
					</li>
				</ul>                                  
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
		<script>
	
		function showPopup() {
			window.open("", "a", "width=400, height=300, left=100, top=50");
		}
		</script>
</body>
</html>