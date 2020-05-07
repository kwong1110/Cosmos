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
	
	div.content ul.nav-tabs>li.active>a:focus, div.content ul.nav-tabs>li.active>a:hover {
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
	
	/* 타이틀 이렇게 하면 어떨까? */
	div.pageTitle h1{
		font-family: 'Nanum Gothic', sans-serif;
		letter-spacing:-2px;
	}
</style>
</head>
<body>
	<!-- view 초기 구조 -->
	<!-- import 경로는 알아서 바꿔줄것. -->
	<div class="total-wrapper">
		<c:import url="../../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				
				<div class="pageTitle">
					<h1>'${ loginUser.name }'님의 정보 보기</h1>
				</div>
				<div class="content">
					<ul class="nav nav-tabs">
					  <li role="presentation" class="active"><a href="#">회원 정보</a></li>
					  <li role="presentation" class="active"><a href="myGroup.mp">My Group</a></li>
					  <li role="presentation"><a href="#">강연 내역</a></li>
					  <li role="presentation"><a href="#">결재 내역</a></li>
					  <c:url var="memberDelete" value="memberDelete.mp">
					  	<c:param name="id" value="${loginUser.id}"/>
					  </c:url>
					  <li role="presentation"><a href="location.href='${memberDelete}'">회원 탈퇴하기</a></li>
					</ul>	
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
						<tr>
							<th>공부 중인 항목</th>
							<td>
							<c:forEach var="s" items="${ pList }">
								<c:choose>
									<c:when test="${ s.studyName eq '기타1' }">
										${ s.studyEtc } : ${ s.spTerm }
									</c:when>
									<c:when test="${ s.studyName eq '기타2' }">
										${ s.studyEtc } : ${ s.spTerm }<br>
									</c:when>
									<c:when test="${ s.studyName eq '기타3' }">
										${ s.studyEtc } : ${ s.spTerm }<br>
									</c:when>
									<c:otherwise>
										${ s.studyName } : ${ s.spTerm }
									</c:otherwise>
								</c:choose>
								<br>
							</c:forEach>
							</td>
						</tr>
					</table>
					<div class="btnBox inner">
						<button type="button" class="defaultBtn pwdUpBtn" onclick="">비밀번호 변경하기</button>
						<button type="button" class="defaultBtn" onclick="location.href='memberUpView.mp'">회원정보 수정하기</button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../../a_common/footer.jsp"/>
	</div>
	<!-- 비밀번호 변경 MODAL -->
	<div id="pwdViewMODAL" class="modal fade" tabindex="-1" role="dialog" >
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