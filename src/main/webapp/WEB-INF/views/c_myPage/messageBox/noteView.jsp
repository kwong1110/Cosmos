<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보기</title>
<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/reset.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/note.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/plugins/sweetalert/sweetalert.css">
</head>
<body class="body">
<div class="content">
	<div class="note-header">
		<h2 class="title">
			<span class="cosmos">보낸 사람</span>
			| <c:out value="${note.noteFromId}"/>님
			<div data-toggle="modal" data-target="#report"aria-hidden="true" style="position:inline";> [ <span class="glyphicon glyphicon-thumbs-down"></span> ] 신고</div>
		</h2>
	</div>
	<form>
	<div class="note-body">
		<div>
			<span>받은 시간 : ${note.noteTime} &nbsp;</span>
			<!-- <button type="button" class="btn btn-report"> [ <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true">신고</span> ]</button> -->
		</div>
		<div class="note-content">
			<%-- ${note.noteContent} --%>
			<% pageContext.setAttribute("newLineChar", "\r\n"); %>
			${ fn:replace(note.noteContent, newLineChar, "<br>") }
		</div>
	</div>

	<!--푸터-->
	<c:url var="noteReply" value="noteInsertView.mp">
		<c:param name="noteToId" value="${note.noteFromId}"/>
	</c:url>
	<c:url var="noteDelete" value="noteDelete.mp">
		<c:param name="noteNo" value="${note.noteNo}"/>
	</c:url>
	<c:url var="noteStorage" value="noteStorage.mp">
		<c:param name="noteNo" value="${note.noteNo}"/>
	</c:url>
	<c:url var="noteList" value="noteList.mp">
		<c:param name="userId" value="${loginUser.id}"/>
	</c:url>
	<div class="btn-box">
		<button type="button" class="btn btnNote" onclick="location.href='${noteReply}'">답장</button>
		<button type="button" class="btn btnNote" onclick="return sweetConfirm();">삭제</button>
		<button type="button" class="btn btnNote" onclick="location.href='${noteStorage}'">보관함</button>
		<button type="button" class="btn btnNote" onclick="location.href='${noteList}'">목록으로</button>
	</div>
	</form>
</div>

<!-- 신고 모달 -->
	<div id="report" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-reportContent" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title reportTitle" style="text-align:center; 	font-family: 'Binggrae';">신고사유</h2>
				</div>
				<div id="reportReason">
					<div class="modal-body" align="center">
						<form>
							<table>
								<tr>
									<td><input type="radio" name="reason" data-value="0" id="r2" value="1" checked><label for="r1">스터디 모임 불참이 잦음</label></td>
									<td><input type="radio" name="reason" data-value="0" id="r2" value="2"><label for="r1">공부하지 않음</label></td>					
									<td><input type="radio" name="reason" data-value="0" id="r2" value="3"><label for="r1">타인 비하 발언</label></td>
								</tr>
								<tr>
									<td><input type="radio" name="reason" data-value="0" id="r2" value="4" ><label for="r1">유흥분위기 주도</label></td>					
									<td><input type="radio" name="reason" data-value="1" id="r2" value="0"><label for="r2">기타</label></td>
									<td><input type="text" name="text"></td>
								</tr>		
							</table>
							<div class="btnBox">
				        		<button type="button" class="btn" onclick="success()">신고</button>
							</div> 
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 신고모달 -->
</body>
<script>
	function statusUpdate(){
		location.href='${noteDelete}'		
	}
	
	
	
	// 신고하기 라디오버튼 활성화
	$(document).ready(function(){
 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=reason]").click(function(){
 
        if($("input[name='reason']:checked").data("value") == "1"){
            $("input:text[name=text]").attr("disabled",false);
            // radio 버튼의 value 값이 1이라면 활성화
 
        }else if($("input[name='reason']:checked").data("value") == "0"){
              $("input:text[name=text]").attr("disabled",true);
            // radio 버튼의 value 값이 0이라면 비활성화
        }
    });
   
	});
	
	// 신고 알럿
	function success(){
		alert("신고되었습니다.");
		
		// ajax
		
		var userId = "${ loginUser.id }";
		var reason = $("input[name='reason']:checked").val();
		var reasonText = $("input[name='text']").val();
		
		console.log(userId);
		console.log(reason);
		console.log(reasonText);
		
		var sendData = {"userId": userId, "reason":reason, "reasonText":reasonText, "targetId":'test'};
		// ★test라고 임의의 값으로 넣어준거를 나중에 신고당한 회원으로 교체해야함 ★
		
		$.ajax({
			url: "reportInsert.ap",
			data: sendData,
			dataType: 'json',
			success: function(data) {
				$("#report").modal('hide');
			}
		});
	}
	
</script>
	<!-- sweet alert -->
<script src="${contextPath}/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${contextPath}/resources/js/plugins/sweetalert/sweetalert.cosmos.js"></script>
</html>