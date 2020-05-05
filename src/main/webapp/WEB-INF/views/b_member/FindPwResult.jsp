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
					<div class=resultArea style="border:1px solid black; width:70%; height:160px; margin:auto" >
							<div class="find">
								<p style="text-align:center;line-height:160px">회원님의 임시 비밀번호를  ${email}로 발송하였습니다.</p>	
							</div>
					</div>
				
				</div>                               
				<div class="btnBox inner" align=center>
					<button type="submit" class="defaultBtn" onclick="showLogin();">로그인</button>
					<button name="취소" onclick="history.back()" class="defaultBtn">취소</button>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
		<script>
		function showLogin() {
			$('#login').click();
		}
	</script>
</body>
</html>