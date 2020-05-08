<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>

<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap&subset=korean');
	body {font-family: 'Nanum Gothic', sans-serif; font-size: 1.6rem;}
	
	#goMessage{margin:0; margin-bottom:3%; padding:0;}
	#bossNickname{display: block; text-align: center; cursor:pointer;font-size:18px;}
	#messageHiddenArea{width:100%; display: block; position:relative; text-align: center;}
	#messageArea{width: 20%; display: inline-block; padding:8px; text-align: center; border-radius: 7px; position:absolute; left: 50%; transform: translateX(-50%); background: gray;}
	#sendMessage{color: white; cursor: pointer; line-height:1;}
	
	#infoIconArea{width: 100%; display: block; text-align: center;}
	
	.infoIconGroup{width: 120px; display: inline-block; text-align: center; margin-left: 30px; margin-right: 30px;}
	.iconStyle{width: 80px; height: auto;}
	.infoStyle{min-width: 50px; line-height: 1; font-size: 22px;}
	.infoTitleStyle{max-width: 120px; font-size: 15px; margin-top:8px; color:#17955F;}
	
	.subTitle{width:100%; font-size: 22px; text-align:center; margin-bottom: 15px;}
	#groupContentStyle{min-width:30%; max-width:60%; display: inline-block; background: rgba(0,0,0,0); border: 0; resize:none; white-space: pre-line; font-family: 'Nanum Gothic', sans-serif; font-size: 1.6rem; text-align: left;}
	#groupGoal{width:80%; display: inline-block;}
	
	.partStyle{width:100%; display: block; text-align:center; margin-top:8%;}
	
	#approachBtn{width: 20%; margin-top:5%; margin-bottom: 5%;}
	
	#approachListArea{width:80%; display: inline-block; text-align: center;}
	
	
</style>

</head>
<body>
	
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>${ info.sgName }</h1>
				</div>
				
				<div id="goMessage">
					<label id="bossNickname">${ info.nick }</label>
					<c:if test="${ loginUser !=  null }">
					<div id="messageHiddenArea">
						<div id="messageArea">
							<label id="sendMessage">쪽지 보내기</label>
						</div>
					</div>
					</c:if>
				</div>
					
				<div class="content">
					 
					<div id="infoIconArea" class="inner">
					<c:if test="${ info.groupType eq 'recOnce' or info.groupType eq 'Once' }">
						<table style="display:inline-block;">
							<tr>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/book.png">
								</td>
								<td width="80px" rowspan=3></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/megaphone.png">
								</td>
								<td width="80px" rowspan=3></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/value.png">
								</td>
								<td width="80px" rowspan=3></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/place.png">
								</td>
								<td width="80px" rowspan=3></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/calendar.png">
								</td>
							</tr>
							<tr>
								<td>
									<label class="infoTitleStyle">공부 종류</label>
								</td>
								<td>
									<c:if test="${ info.groupType eq 'Once' }">
										<label class="infoTitleStyle">모집 마감 일</label>
									</c:if>
									<c:if test="${ info.groupType eq 'recOnce' }">
										<label class="infoTitleStyle">모집 마감</label>
									</c:if>
								</td>
								<td>
									<label class="infoTitleStyle">모집 현황</label>
								</td>
								<td>
									<label class="infoTitleStyle">모임 지점</label>
								</td>
								<td>
									<label class="infoTitleStyle">모임 날짜</label>
								</td>
							</tr>
							<tr>
								<td>
									<label class="infoStyle">${ info.studyName }</label>
								</td>
								<td>
									<c:if test="${ info.groupType eq 'Once' }">
										<label class="infoStyle">${ info.recTerm }</label>
									</c:if>
									<c:if test="${ info.groupType eq 'recOnce' }">
										<c:if test="${ info.dCloseDate ge 1 }">
											<label class="infoStyle">${ info.dCloseDate }일 전</label>
										</c:if>
										<c:if test="${ info.dCloseDate lt 1 }">
											<label class="infoStyle">오늘</label>
										</c:if>
									</c:if>
								</td>
								<td>
									<label class="infoStyle"><span id="partnum">${ info.partNum }</span>/${ info.recNum }</label>
								</td>
								<td>
									<label class="infoStyle">${ info.branchName }</label>
								</td>
								<td>
									<label class="infoStyle">${ info.rsgMetDate }</label>
								</td>
							</tr>
						</table>
					</c:if>
					
					<c:if test="${ info.groupType eq 'Multi' }">
						<table style="display:inline-block;">
							<tr>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/book.png">
								</td>
								<td width="80px" rowspan=3></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/place.png">
								</td>
								<td width="80px" rowspan=3></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/calendar.png">
								</td>
								<td width="80px" rowspan=3></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/team.png">
								</td>
								<td width="80px" rowspan=3></td>
								<td>
									<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/speed.png">
								</td>
							</tr>
							<tr>
								<td>
									<label class="infoTitleStyle">공부 종류</label>
								</td>
								<td>
									<label class="infoTitleStyle">모임 지점</label>
								</td>
								<td>
									<label class="infoTitleStyle">모임 주기</label>
								</td>
								<td>
									<label class="infoTitleStyle">그룹 인원</label>
								</td>
								<td>
									<label class="infoTitleStyle">모임 횟수</label>
								</td>
							</tr>
							<tr>
								<td>
									<label class="infoStyle">${ info.studyName }</label>
								</td>
								<td>
									<label class="infoStyle">${ info.branchName }</label>
								</td>
								<td>
									<label class="infoStyle">${ info.msgMetRule }</label>
								</td>
								<td>
									<label class="infoStyle">${ info.partMemNum }명</label>
								</td>
								<td>
									<label class="infoStyle">${ info.msgMet }회</label>
								</td>
							</tr>
						</table>
					</c:if>
					
					<c:if test="${ info.groupType eq 'recMulti' }">
					<table style="display:inline-block;">
						<tr>
							<td>
								<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/book.png">
							</td>
							<td width="80px" rowspan=3></td>
							<td>
								<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/megaphone.png">
							</td>
							<td width="80px" rowspan=3></td>
							<td>
								<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/value.png">
							</td>
							<td width="80px" rowspan=3></td>
							<td>
								<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/place.png">
							</td>
						</tr>
						<tr>
							<td>
								<label class="infoTitleStyle">공부 종류</label>
							</td>
							<td>
								<label class="infoTitleStyle">마감 기한</label>
							</td>
							<td>
								<label class="infoTitleStyle">모집 현황</label>
							</td>
							<td>
								<label class="infoTitleStyle">모임 지점</label>
							</td>
						</tr>
						<tr>
							<td>
								<label class="infoStyle">${ info.studyName }</label>
							</td>
							<td>
								<c:if test="${ info.dCloseDate ge 1 }">
									<label class="infoStyle">${ info.dCloseDate }일 전</label>
								</c:if>
								<c:if test="${ info.dCloseDate lt 1 }">
									<label class="infoStyle">오늘</label>
								</c:if>
							</td>
							<td>
								<label class="infoStyle"><span id="partnum">${ info.partNum }</span>/${ info.recNum }</label>
							</td>
							<td>
								<label class="infoStyle">${ info.branchName }</label>
							</td>
						</tr>
					</table>
					<br><br>
					<table style="display:inline-block;" class="inner">
						<tr>
							<td>
								<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/calendar.png">
							</td>
							<td width="80px" rowspan=3></td>
							<td>
								<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/team.png">
							</td>
							<td width="80px" rowspan=3></td>
							<td>
								<img class="iconStyle" src="${contextPath }/resources/image/studyGroup/speed.png">
							</td>
						</tr>
						<tr>
							<td>
								<label class="infoTitleStyle">모임 주기</label>
							</td>
							<td>
								<label class="infoTitleStyle">현재 그룹 인원</label>
							</td>
							<td>
								<label class="infoTitleStyle">모임 횟수</label>
							</td>
						</tr>
						<tr>
							<td>
								<c:choose>
									<c:when test="${fn:contains(info.msgMetRule,'요일')}">
										<label class="infoStyle">매주 ${ info.msgMetRule }</label>
									</c:when>
									<c:when test="${fn:contains(info.msgMetRule,'일')}">
										<label class="infoStyle">${ info.msgMetRule } 마다</label>
									</c:when>
									<c:otherwise>
										<label class="infoStyle">${ info.msgMetRule }</label>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<label class="infoStyle">${ info.partMemNum }명</label>
							</td>
							<td>
								<label class="infoStyle">${ info.msgMet }회</label>
							</td>
						</tr>
					</table>
					</c:if>
					</div>
					
					<div class="partStyle inner">
						<label class="subTitle">그룹 목적</label>
						<p id="groupGoal">${ info.sgGoal }</p>
					</div>
					
					
					<c:if test="${ info.groupType eq 'recMulti' or info.groupType eq 'Multi' }">
					<div class="partStyle inner"style="text-align:center;">
					<div style="display:inline-block; text-align:left; min-width:1%;">
						<label class="subTitle">그룹 규칙</label>
						<ul>
							<li>${ info.msgRule1 }</li>
							<c:if test="${not empty info.msgRule2 }">
								<li>${ info.msgRule2 }</li>
								<c:if test="${not empty info.msgRule3 }">
									<li>${ info.msgRule3 }</li>
								</c:if>
							</c:if>
						</ul>
					</div>
					</div>
					</c:if>
					
					<div class="partStyle inner">
						<label class="subTitle">그룹 내용</label>
						<pre id="groupContentStyle">${ info.sgContent }</pre>
					</div>
					
					<c:if test="${not empty loginUser }">
					<script>
						$(function() {
							var type = "${info.groupType}";
							if(type == 'recMulti' || type == 'recOnce') approach();
						})
					</script>
					<c:if test="${ loginUser.nick ne info.nick }">
						<div class="btnBox inner" id="appArea" style="width: 100%; text-align: center;"></div>
					</c:if>
					
					<c:if test="${ loginUser.nick eq info.nick }">
					<div class="partStyle inner" style="width:80%; padding-top:3%; padding-bottom:1%; border-radius:20px; background:rgb(255,255,255,0.65);">
						<label class="subTitle">참가 신청 리스트</label>
						<div id="approachListArea">
							<table id="approachListTable" class="table table-hover">
								<thead>
									<tr>
										<th>No</th>
										<th>참가 신청일</th>
										<th>닉네임</th>
										<th style="width:15%;">상태</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
					</c:if>
					</c:if>

				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<c:if test="${ loginUser.nick eq info.nick }">
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog" style="width:30%;">
			<div class="modal-content">
				<div class="modal-header" style="background:#17955F;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="color:white;">참가 신청 내용</h4>
					
					<h3 style="width:100%; text-align:center; color:white; font-weight:bold; margin-top:5%; margin-bottom:5%;" id="infoNick">닉네임</h3>
				</div>
				
				<div class="modal-body" id="myModalBody" style="background:#FFFFE0;">
					<label style="font-size:20px;/*  background:lightgray;  */font-weight:bold;">공부 기록 리스트</label>
					<label id="infoDate" style="float:right;">2020.00.00 00:00</label>
					<table style="font-size:18px; margin-top:4%; margin-left:7%;" id="infoList"></table>
				</div>
				
				<div class="modal-footer" style="background:#FFFFE0;">
					
					<c:if test="${ info.groupType eq 'recMulti' or info.groupType eq 'recOnce' }">
					<%-- <input type="hidden" id="infoRecNo" value="${ info.recNo }"> --%>
					<div style="width:100%;" id="confirmArea">
						<div id="hiddenConfirm">
							<input type="button" class="btn defaultBtn" onclick="confirmApproach('acc');" value="수락" />
							&nbsp;
							<input type="button" class="btn defaultBtn" onclick="confirmApproach('rej');" value="거절" />
						</div>
						<label id="hiddenLabel" style="font-size:20px;"></label>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	
	<script>
		$(function() {
			$('#messageHiddenArea').css('display', 'none');
			
			if("${ loginUser.nick }" == "${ info.nick }") {
				approachList();
			}
		});
		
		$('#bossNickname').click(function() {
			if($('#messageHiddenArea').css('display') == 'none') {
				$('#messageHiddenArea').css('display', 'block');
			} else {
				$('#messageHiddenArea').css('display', 'none');
			}
		}).mouseover(function() {
			$('#bossNickname').css('color', 'green');
		}).mouseout(function() {
			$('#bossNickname').css('color', 'black');
		});
		
		function sweetCheck(title, text, btnText){
			swal({
				title:title,
				text:text,
				type:"warning",
				showCancelButton: !0,
				confirmButtonColor:"#17955F",
				confirmButtonText:btnText,
				closeOnConfirm: !1
				},
				function(){
					$.ajax({
						url:url,
						data:sendData,
						dataType: 'json',
						success: function(data) {
							if($('#appArea').children().length == 0) {
								if(data == 'Y') {
									$('#appArea').append('<input type="button" class="defaultBtn" id="approachBtn" style="background:gray;" value="신청 완료" disabled="">');
								} else if(data == 'N') {
									$('#appArea').append('<input type="button" class="defaultBtn" id="approachBtn" onclick="approach();" value="참가 신청">');
								}
							} else if($('#appArea').children().length > 0) {
								sweetSuccess('신청');
								$('#appArea').html('');
								$('#appArea').append('<input type="button" class="defaultBtn" id="approachBtn" style="background:gray;" value="신청 완료" disabled="">');
							}
						}
					});
				}
			)
		};

		var url = "";
		var sendData;
		function approach() {
			if($('#appArea').children().length > 0) {
				url = "doAppGroup.sg";
				sendData = {"sgno":"${ info.sgNo }", "recno":"${ info.recNo }", "bossid":"${info.id}", "sgname":"${info.sgName}"};
			} else {
				url = "getAppInfo.sg";
				sendData = {"recno":"${ info.recNo }"};
			}
			
			if(url == "doAppGroup.sg") {
				sweetCheck('참가 신청하시겠습니까?','참가 신청은 모집 당 한 번만 가능합니다.','신청');
				return;
			}
			
			$.ajax({
				url:url,
				data:sendData,
				dataType: 'json',
				success: function(data) {
					if($('#appArea').children().length == 0) {
						if(data == 'Y') {
							$('#appArea').append('<input type="button" class="defaultBtn" id="approachBtn" style="background:gray;" value="신청 완료" disabled="">');
						} else if(data == 'N') {
							$('#appArea').append('<input type="button" class="defaultBtn" id="approachBtn" onclick="approach();" value="참가 신청">');
						}
					} else if($('#appArea').children().length > 0) {
						sweetSuccess('신청');
						$('#appArea').html('');
						$('#appArea').append('<input type="button" class="defaultBtn" id="approachBtn" style="background:gray;" value="신청 완료" disabled="">');
					}
				}
			});
		}
		
		function approachList() {
			$.ajax({
				url:"approachList.sg",
				data:{recno:"${ info.recNo }"},
				dataType: 'json',
				success: function(data) {
					
					console.log(data);
					
					var $tbody = $('#approachListTable tbody');
					$tbody.html('');
					
					var no = data.length;
					if(data.length > 0) {
						for(var i in data) {
							var $tr = $('<tr class="approachInfo" onclick="showInfo(this);">');
							var status;
							
							switch(data[i].asgStatus) {
							case 'R': status = "대기 중"; break;
							case 'Y': status = "수락"; break;
							case 'N': status = "거절"; break;
							case 'E': status = "나감"; break;
							case 'O': status = "강퇴"; break;
							}
							
							$tr.append('<td class="listId">' + no + '<input type="hidden" class="hid" value="' + data[i].id + '">' + '</td>');
							$tr.append('<td class="listDate">' + data[i].asgDate + '</td>');
							$tr.append('<td class="listNick">' + decodeURIComponent(data[i].nick.replace(/\+/g, ' ')) + '</td>');
							$tr.append('<td class="listStatus">' + status + '</td>');
							no--;
							
							$tbody.append($tr);
						}
					} else {
						$tbody.append('<tr><td colspan="4">들어온 참가 신청이 없습니다.</td></tr>');
					}
				}
			});
		}
		
		function showInfo(where) {
			console.log(where);
			var id = $(where).children('.listId').children('.hid').val();
			var nick = $(where).children('.listNick').text();
			var date = $(where).children('.listDate').text();
			
			$.ajax({
				url:"getAppUserInfo.sg",
				data:{id:id},
				dataType: 'json',
				success: function(data) {
					$modalBody = $('#myModalBody');
					$infoList = $('#infoList');
					$infoList.html('');
					$('#infoNick').text(nick);
					$('#infoDate').text(date);
					
					if(data.length > 0) {
						for(var i in data) {
							var $tr = $('<tr>');
							
							var study;
							if(data[i].studyNo >= 97) study = decodeURIComponent(data[i].studyEtc.replace(/\+/g, ' '));
							else study = decodeURIComponent(data[i].studyName.replace(/\+/g, ' '));
							
							$tr.append('<td style="min-width:30%;"><ul><li>' + study + '</li></ul></td>');
							$tr.append('<td colspan="' + data.length + '" style="width:20px;"></td>');
							$tr.append('<td>' + decodeURIComponent(data[i].spTerm.replace(/\+/g, ' ')) + '</td>');
							$infoList.append($tr);
						}
					} else {
						$infoList.append('<td colspan=3>공부 리스트가 비어있습니다.</td>');
					}
				}
			})
			
			if($(where).children('.listStatus').text() != '대기 중') {
				$('#hiddenConfirm').css('display', 'none');
				$('#hiddenLabel').css('display', 'block');
				$('#hiddenLabel').text($(where).children('.listStatus').text());
			} else {
				$('#hiddenLabel').css('display', 'none');
				$('#hiddenConfirm').css('display', 'block');
			}
			
			$('#myModal').modal();
		}
		
		function confirmApproach(type) {
			var recno = "${ info.recNo }";
			var sgname = "${ info.sgName }";
			var nick = $('#infoNick').text() + "";
			
			$.ajax({
				url:"confirmApproach.sg",
				data:{type:type, recno:recno, nick:nick, sgname:sgname},
				dataType: 'json',
				success: function(data) {
					if(data != null) {
						approachList();
						$('#partnum').html(data);
						
						$('#hiddenConfirm').css('display', 'none');
						$('#hiddenLabel').css('display', 'block');
						if(type == 'acc') {
							$('#hiddenLabel').text('수락');
						} else {
							$('#hiddenLabel').text('거절');
						}
					}
				}
			});
		}
		
		$('#sendMessage').click(function() {
			if("${loginUser.id}" != ""){
				var toNick = "${info.nick}";
				var url = "noteInsertView1.mp?toNick=" + toNick;
		        var name = "notePopup";
		        
		        var popLeft = Math.ceil(( window.screen.width - 700 )/2);
		        var popTop = Math.ceil(( window.screen.height - 670 )/2);
		        
		        var option = "width = 700, height = 670, top =" + popTop + ", left = " + popLeft +", location = no";
		        
		        child = window.open(url, name, option); 
			}
		})
	</script>
</body>
</html>