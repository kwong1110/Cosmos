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
	.adminList{
		width:600px;padding-top:50px;
	}
	div.adminList ul.nav-tabs {
		border-bottom-color: transparent;
	}
	
	div.adminList ul.nav-tabs {
		margin-bottom :30px;
		display:flex;
		justify-content: space-between;
	}
	
	div.adminList ul.nav-tabs>li {
		flex : 2 1 auto;
	}
	
	div.adminList ul.nav-tabs>li>a {
	    margin-right: 3px;
	    line-height: 1.42857143;
	    background-color: rgba(255, 255, 255, 0.5);
	    border: 1px solid #ddd;
	    border-radius: 4px 4px 0 0;
	    font-family: 'Binggrae';
	    text-align : center;
	}
	
 	div.adminList ul.nav-tabs>li.active>a:focus, div.content ul.nav-tabs>li.active>a:hover {
	    color: #555;
	    cursor: default;
	    background-color: #fff;
	    border: 1px solid #ddd;
	} 
	
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
/* td{padding: 5px}
 */

</style>
</head>
<body>
	<!-- view 초기 구조 -->
	<!-- import 경로는 알아서 바꿔줄것. -->
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div  align="center">	
				<div class="adminList" style="margin-bottom:0px;">
				<c:if test="${loginUser.name eq '본점관리자' }">
					<ul class="nav nav-tabs">
						<li role="presentation"><a href="adminPage.ap">본점관리자</a></li>
						<li role="presentation"><a href="reportList.ap">신고 목록</a></li>
						<li role="presentation"><a href="branchList.ap">지점 목록</a></li>
						<li role="presentation"><a href="enrollBranch.ap">지점 등록</a></li>
						<li role="presentation"><a href="allSeat.se">예약 현황</a></li>
					</ul>
				</c:if>
				</div>
			</div>
			<hr>
			<div class="main admin" style="padding:0px;" align="center">

				<div class="pageTitle">
					<h1>'${ loginUser.name }'님의 정보 보기</h1>
				</div>
				<c:if test="${loginUser.name eq '본점관리자' }">
				<a style="text-align:center; font-size:0.9em;">▶ COSMOS◀ 본점 관리자 어드민 페이지입니다.</a>
				</c:if>
			<%-- 	<c:if test="${loginUser.grade == 0 }">
				<a style="text-align:center; font-size:0.9em;">지점관리자 어드민 페이지입니다.</a>
				</c:if> --%>	
					<table class="inner table table-hover">
						<tr>
							<th>아이디</th>
							<td>${ loginUser.id }</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${ loginUser.name }</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>${ loginUser.nick }</td>
						</tr>
						<tr>
							<th>성별</th>
							<c:if test="${ loginUser.gender eq 'M'}">
								<td>남성</td>
							</c:if>
							<c:if test="${ loginUser.gender eq 'F'}">
								<td>여성</td>
							</c:if>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>${ loginUser.birth }</td>
						</tr>
						<tr>
							<th>핸드폰</th>
							<td>${ loginUser.phone }</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${ loginUser.email }</td>
						</tr>
					</table>
					<div class="btnBox inner">
						<button type="button" class="defaultBtn pwdUpBtn" onclick="">비밀번호 변경하기</button>
						<button type="button" class="defaultBtn" onclick="location.href='memberUpView.mp'">회원정보 수정하기</button>
					</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	<!-- 비밀번호 변경 MODAL -->
	<div id="pwdViewMODAL" class="modal fade" tabindex="-1" role="dialog" align="center">
		<div class="modal-dialog modal-80size" role="document">
			<div class="modal-content modal-80size">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">비밀번호 수정</h4>
                </div>
				<form action="memberPwdUp.mp" method="post">
					<table>
						<tr>
							<td>현재 비밀번호</td>
							<td><input type="password" name="pwd"></td>
						</tr>
						<tr>
							<td>새 비밀번호</td>
							<td><input type="password" name="newPwd1"></td>
						</tr>
						<tr>
							<td>새 비밀번호 확인</td>
							<td><input type="password" name="newPwd2"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="수정하기">
							</td>
						</tr>
					</table>
				</form>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<script>
		$(function(){
			$('.pwdUpBtn').click(function(){
				$('#pwdViewMODAL').modal("show");
				
				/* $.ajax({
					url: "memberPwdUp.mp",
					dataType: 'JSON',
					success: function(data){
						
					}
					
				}); */
			});
			
		});
	
	</script>
	
</body>
</html>