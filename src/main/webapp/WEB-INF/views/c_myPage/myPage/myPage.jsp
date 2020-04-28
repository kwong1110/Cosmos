<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세보기</title>
<style>
	ul.nav-tabs {
		margin-bottom :20px;
		border-bottom : none;
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
					  <li role="presentation"><a href="#">My Group</a></li>
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
						
						<%-- 
						<c:url var="bupView" value="bupView.bo">
							<c:param name="bId" value="${ board.bId }"/>
							<c:param name="page" value="${ page }"/>
						</c:url>
						<c:url var="bdelete" value="bdelete.bo">
							<c:param name="bId" value="${ board.bId }"/>
						</c:url>
						<c:url var="blist" value="blist.bo">
							<c:param name="page" value="${ page }"/>
						</c:url>
						
						<c:if test="${ loginUser.id eq board.bWriter }">
						<tr>
							<td colspan="2" align="center">
								<button onclick="location.href='${ bupView }'">수정하기</button>
								<button onclick="location.href='${ bdelete }'">삭제하기</button>
							</td>
						</tr>
						</c:if> 
						--%>
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
				
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<script>
		$(function(){
			$('.pwdUpBtn').click(function(){
				$('#pwdViewMODAL').modal("show");
				$.ajax({
					url: "memberPwdUpView.mp",
					dataType: 'JSON',
					success: function(data){
						
					}
					
				});
			});
			
		});
	
	</script>
	
	
	
	
	
	
	
</body>
</html>