<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>

<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap&subset=korean');
	body {font-family: 'Nanum Gothic', sans-serif; font-size: 1.6rem;}
	
	.topAlign{display: block; text-align: center; margin-top: 3%;}
	#messageHiddenArea{width:100%; display: block; text-align: center;}
	#messageArea{width: 15%; height: 50px; display: inline-block; text-align: center; border-radius: 7px; background: gray;}
	#sendMessage{color: white; cursor: pointer;}
	
	#infoIconArea{width: 100%; display: block; text-align: center; padding-top: 50px; padding-bottom: 50px; background: lightgray;}
	
	.infoIconGroup{width: 120px; display: inline-block; text-align: center; margin-left: 30px; margin-right: 30px; background: white;}
	.iconStyle{width: 80px; height: auto; background: pink;}
	.infoStyle{max-width: 120px; line-height: 1; font-size: 22px; margin-top: 30px; background: pink;}
	
	.subTitle{width:100%; font-size: 22px; text-align:center; margin-bottom: 15px;}
	#groupContentStyle{width:80%; display: inline-block; background: rgba(0,0,0,0); border: 0; resize:none; white-space: pre-line; font-family: 'Nanum Gothic', sans-serif; font-size: 1.6rem; text-align: left;}
	#groupGoal{width:80%; display: inline-block;}
	
	.partStyle{width:100%; margin-top: 80px; margin-bottom: 40px; display: block; text-align:center;}
	
	#approachBtn{width: 20%; margin-bottom: 50px;}
	
	#approachListArea{width:100%; display: inline-block; text-align: center; background:yellow;}
	#approachListTable{width: 70%; text-align: center; background:white;}
	#approachListTable th{text-align: center; border: 1px solid black; padding: 8px;}
	#approachListTable td{text-align: center; border: 1px solid black; padding: 8px;}
	
	
</style>

</head>
<body>
	
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
				
					<h1>그룹 명</h1>
					<label id="bossNickname" class="topAlign">그룹장 닉네임</label>
					
					<div id="messageHiddenArea">
						<div id="messageArea">
							<label id="sendMessage">쪽지 보내기</label>
						</div>
					</div>
					
				</div>
				<div class="content">
					 
					<div id="infoIconArea" class="inner">
						<table style="display:inline-block;">
							<tr>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/book.png">
								</td>
								<td width="80px" rowspan=2></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/megaphone.png">
								</td>
								<td width="80px" rowspan=2></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/team.png">
								</td>
								<td width="80px" rowspan=2></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/place.png">
								</td>
								<td width="80px" rowspan=2></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/calendar.png">
								</td>
							</tr>
							<tr>
								<td>
									<label class="infoStyle">공부종류</label>
								</td>
								<td>
									<label class="infoStyle">마감 n일 전</label>
								</td>
								<td>
									<label class="infoStyle">2/6</label>
								</td>
								<td>
									<label class="infoStyle">한남점</label>
								</td>
								<td>
									<label class="infoStyle">2020.00.00</label>
								</td>
							</tr>
						</table>
					</div>
					
					<div id="infoIconArea" style="background:yellow;" class="inner">
						<table style="display:inline-block;">
							<tr>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/book.png">
								</td>
								<td width="80px" rowspan=2></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/megaphone.png">
								</td>
								<td width="80px" rowspan=2></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/team.png">
								</td>
								<td width="80px" rowspan=2></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/place.png">
								</td>
							</tr>
							<tr>
								<td>
									<label class="infoStyle">공부종류</label>
								</td>
								<td>
									<label class="infoStyle">마감 n일 전</label>
								</td>
								<td>
									<label class="infoStyle">2/6</label>
								</td>
								<td>
									<label class="infoStyle">한남점</label>
								</td>
							</tr>
						</table>
						<br><br>
						<table style="display:inline-block;" class="inner">
							<tr>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/calendar.png">
								</td>
								<td width="80px" rowspan=2></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/value.png">
								</td>
								<td width="80px" rowspan=2></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/speed.png">
								</td>
							</tr>
							<tr>
								<td>
									<label class="infoStyle">2020.00.00</label>
								</td>
								<td>
									<label class="infoStyle">10명</label>
								</td>
								<td>
									<label class="infoStyle">4회</label>
								</td>
							</tr>
						</table>
					</div>
					
					<div class="partStyle inner">
						<label class="subTitle">그룹 목적</label>
						<p id="groupGoal">그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적그룹목적</p>
					</div>
					
					
					<!-- <div class="partStyle inner" style="width:60%;"> -->
					<div class="inner" style="width:60%;">
						<label class="subTitle">그룹 규칙</label>
						<ul>
							<li>그룹규칙그룹규칙그룹규칙그룹규칙그룹규칙그룹규칙그룹규칙</li>
							<li>그룹규칙그룹규칙그룹규칙그룹규칙그룹규칙그룹규칙그룹규칙그룹규칙그룹규칙</li>
							<li>그룹규칙그룹규칙그룹규칙그룹규칙그룹규칙그룹규칙그룹규칙</li>
						</ul>
					</div>

					<div class="partStyle inner">
						<label class="subTitle">그룹 내용</label>
						<pre id="groupContentStyle">
그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용v
그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용
그룹내용pre-line


그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용
그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용

그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용그룹내용
그룹내용그룹내용그룹내용그룹내용
						</pre>
					</div>

					<div class="btnBox inner" style="width: 100%; text-align: center;">
						<input type="button" class="defaultBtn" id="approachBtn" value="참가 신청">
					</div>
					
					<div class="partStyle inner">
						<label class="subTitle">참가 신청 리스트</label>
						<div id="approachListArea">
							<!-- <table id="approachListTable" class="table table-hover"> -->
							<table class="table table-hover">
								<tr>
									<th>No</th>
									<th>참가 신청 날짜</th>
									<th>닉네임</th>
									<th>상태</th>
								</tr>
								<tr class="approachInfo" data-toggle="modal" data-target="#myModal">
									<td>3</td>
									<td>2020.00.00 00:00</td>
									<td>닉네임3</td>
									<td>대기중</td>
								</tr>
								<tr class="approachInfo" data-toggle="modal" data-target="#myModal">
									<td>2</td>
									<td>2020.00.00 00:00</td>
									<td>닉네임2</td>
									<td>대기중</td>
								</tr>
								<tr>
									<td>2</td>
									<td>2020.00.00 00:00</td>
									<td>닉네임2</td>
									<td>거절함</td>
								</tr>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog" style="width:20%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">참가 신청 내용</h4>
				</div>
				
				<div class="modal-body">
					<h3 style="width:100%; text-align:center; font-weight:bold;">닉네임</h3>
					<hr>
					
					<table style="font-size:18px;">
						<tr>
							<td colspan=3 style="font-weight:bold;"><label style="background:lightgray;">관심 공부 목록</label></td>
						</tr>
						<tr>
							<td style="min-width:20px">&#183;</td>
							<td style="min-width:70px">PEET</td>
							<td>3개월</td>
						</tr>
						<tr>
							<td>&#183;</td>
							<td>자격증</td>
							<td>1년</td>
						</tr>
					</table>
					
					<div style="width:100%; text-align:center; margin-top:40px;">
						<input type="button" class="btn btn-danger" value="수락" />
						&nbsp;
						<input type="button" class="btn btn-info" value="거절" />
					</div>

				</div>
				
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
					<label>2020.00.00 00:00</label>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function() {
			$('#messageHiddenArea').css('visibility', 'hidden');
		});
		
		$('#bossNickname').click(function() {
			if($('#messageHiddenArea').css('visibility') == 'hidden') {
				$('#messageHiddenArea').css('visibility', 'visible');
			} else {
				$('#messageHiddenArea').css('visibility', 'hidden');
			}
		}).mouseenter(function() {
			$('#bossNickname').css('color', 'green');
		}).mouseout(function() {
			$('#bossNickname').css('color', 'black');
		});
		
		$('.approachInfo').click(function() {
			
		});
	</script>
</body>
</html>