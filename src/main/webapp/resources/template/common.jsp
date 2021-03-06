<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 초기 구조 -->
	<!-- import 경로는 알아서 바꿔줄것. -->
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>소제목</h1>
				</div>
				<div class="content">
					<!-- <div class="inner">
					</div>
					<table class="inner">
					</table> -->
					<div class="btnBox inner">
						<button class="defaultBtn" onclick=""></button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<!-- 페이징  -->
	<nav>
	  <ul class="pagination">
	    <li>
	      <a href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li>
	      <a href="#" aria-label="Previous">
	        <span aria-hidden="true">&lt;</span>
	      </a>
	    </li>
	    <li><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li>
	      <a href="#" aria-label="Next">
	        <span aria-hidden="true">&gt;</span>
	      </a>
	    </li>
	    <li>
	      <a href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
  	</nav>

	<!-- 페이징 수정 -->
	<nav>
		<ul class="pagination">
			<li>
				<a>
					<span class="icon-fast-backward"></span>
				</a>
			</li>
			<li>
				<a>
					<span class="icon-to-start"></span>
				</a>
			</li>
			
			<li><a href="#" class="pageBtn selectPageBtn">1</a></li>
			<li><a href="#" class="pageBtn">2</a></li>
			<li><a href="#" class="pageBtn">3</a></li>
			<li><a href="#" class="pageBtn">4</a></li>
			
			<li>
				<a>
					<span class="icon-to-end"></span>
				</a>
			</li>
			<li>
				<a>
					<span class="icon-fast-forward"></span>
				</a>
			</li>
		</ul>
	</nav>
	
	<!-- 검색창 -->
  	<!-- 드롭다운 + 검색 -->
	<form method="get" action="">
		<div class="row">
			<div class="col-lg-6">
					<!-- 비율은 본인 스타일대로 수정해서 사용하세요 -->
					<select style="width: 25%;" class="form-control search-select">
						<option>분류</option>
						<option>111</option>
						<option>222</option>
						<option>333</option>
					</select>
					<div class="input-group search-text" style="width: 73%;">
						<input type="text" class="form-control" style="border: none;" placeholder="검색어를 입력하세요.">
						<span class="input-group-btn">
							<button class="btn search-submit" type="button">검색</button>
						</span>
					</div><!-- /input-group -->
			</div><!-- /.col-lg-6 -->
		</div><!-- /.row -->
	</form>
	
	<!-- DateRange Pick -->
	<div class="box-title m-t-30">Date Range Pick(여러개 선택)</div>
	<input class="form-control input-daterange-datepicker" type="text" name="daterange">

	<!-- DateRangeTime pick -->
	<div class="box-title m-t-30">Date Range With Time(여러개 + 시간)</div>
	<input type="text" class="form-control input-daterange-timepicker" name="daterange">

	<!-- Autoclose Datepicker -->
	<div class="box-title m-t-30">Autoclose Datedpicker(1개 선택 )</div>
		<div class="input-group">
		<input type="text" class="form-control" id="datepicker-autoclose" placeholder="년/월/일"> <span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
	</div>
	
	
	<script src="${contextPath}/resources/js/plugins/datepicker/common.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/moment.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.ko.min.js"></script>
	<%-- <script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-timepicker.min.js"></script> --%>
	<script src="${contextPath}/resources/js/plugins/datepicker/daterangepicker.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/form-pickers-init.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- 둘중 하나를 사용하더라도 밑의 script는 다 넣어주어야함! -->
	
	<!-- 타임 피커 time picker -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"/>
	
	<input type="text" class="timepicker" name="startTime"/>
	
	<script>
		(function($) {
		    $(function() {
		        $('input.timepicker').timepicker({
		        	timeFormat: 'h:mm p',
		            interval: 60,
		            minTime: '10',
		            maxTime: '6:00pm',
		            defaultTime: '11',
		            startTime: '10:00',
		            dynamic: false,
		            dropdown: true,
		            scrollbar: true
		        });
		    });
		})(jQuery);
	</script>
	<!-- 밑의 연결은 맨위에 둘것. -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>