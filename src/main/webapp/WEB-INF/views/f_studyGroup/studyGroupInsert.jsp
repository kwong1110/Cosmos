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
	table{text-align: center; border-spacing: 30px; border-collapse: separate;}
	
	.label{font-size: 18px; font-weight: bold;}
	
	#now_date{width:100px;}
	
	
	.inputStyle{
		border-radius: 4px;
		box-shadow: none;
		display: block;
		min-height: 30px;
		padding-left: 0.375rem;
		font-size: 10pt;
		color: #495057;
		border: 1px solid #ced4da;
		margin: 0;
	}
	
	.textareaStyle{
		resize: none;
	}
</style>
</head>
<body>
	<!-- view 초기 구조 -->
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>스터디 그룹 등록</h1>
				</div>
				<div class="content">
					
					<table>
						<tr>
							<td colspan=2><h1>스터디 그룹 등록</h1></td>
						</tr>
						<tr>
							<td class="label">그룹 명</td>
							<td><input type="text" class="inputStyle" style="width:500px"></td>
						</tr>
						<tr>
							<td class="label">공부 종류</td>
							<td>
								<select class="inputStyle" style="width:200px">
									<option>공부종류</option>
									<option>공부종류1</option>
									<option>공부종류2</option>
									<option>공부종류3</option>
									<option>공부종류4</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="label">모집 기간</td>
							<td style="display:inline;"><label id="now_date"></label> ~ <input type="date" class="inputStyle" style="font-size:10pt; width:100px;"></td>
						</tr>
						<tr>
							<td class="label">모집 인원</td>
							<td><input type="number" min="1" class="inputStyle"></td>
						</tr>
						<tr>
							<td colspan="2">그룹장을 제외하고 모집 할 인원을 입력해주세요.</td>
						</tr>
						<tr>
							<td class="label">모임 장소</td>
							<td>
								<select class="inputStyle">
									<option>노량진점</option>
									<option>부천점</option>
									<option>성남점</option>
									<option>신도림점</option>
									<option>한남점</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="label">모임 날짜</td>
							<td><input type="date" class="inputStyle"></td>
						</tr>
						<tr>
							<td class="label">그룹 목표</td>
							<td><input type="text" class="inputStyle" style="width:500px;"></td>
						</tr>
						<tr>
							<td class="label">그룹 내용</td>
							<td><textarea cols="80" rows="20" class="inputStyle textareaStyle" style="resize:none"></textarea></td>
						</tr>
					</table>
					<div class="btnBox">
						<button class="defaultBtn" onclick=""></button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<script>
	$(function() {
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; // Jan is 0
		var yyyy = today.getFullYear();
		 
		if(dd<10){ dd = '0'+dd }
		
		if(mm<10){ mm = '0'+mm }
		                            
		today = yyyy + '-' + mm + '-' + dd;
		$('#now_date').text(today);
		console.log(today);
	})
	</script>
</body>
</html>