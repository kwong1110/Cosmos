<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세보기</title>
<style>
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
	
/* 	div.content ul.nav-tabs>li.active>a:focus, div.content ul.nav-tabs>li.active>a:hover {
	    color: #555;
	    cursor: default;
	    background-color: #fff;
	    border: 1px solid #ddd;
	} */
	
	.nav>li>a {
	    position: relative;
	    display: block;
	    padding: 10px 15px;
	}
	
 table.inner{
  	width: 70%;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
 /*  margin : 20px 10px; */
  valign:middle-aign;	
}



</style>
</head>
<body>
	<!-- view 초기 구조 -->
	<!-- import 경로는 알아서 바꿔줄것. -->
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main" align="center">
				
				<div class="pageTitle">
					<h1>관리자 페이지</h1>
				</div>
				<div class="content">	
					<ul class="nav nav-tabs">
					  <li role="presentation" class="active"><a href="#">본점관리자</a></li>
					  <li role="presentation"><a href="reportList.ap">신고 목록</a></li>
					  <li role="presentation"><a href="branchList.ap">지점 목록</a></li>
					  <li role="presentation"><a href="enrollBranch.ap">지점 등록</a></li>
					  <li role="presentation"><a href="">예약 현황</a></li>
					</ul>
				</div>
				
				<a>▶ COSMOS◀ 본점 관리자 어드민 페이지입니다.</a>
				<img src="${contextPath}/resources/image/main5.jpg" width="800" height="400">	
				
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
</body>
</html>