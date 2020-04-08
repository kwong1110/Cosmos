<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  	
  	<!-- 검색창 -->
  	<!-- 드롭다운 + 검색 -->
	<form method="get" action="">
		<div class="row">
			<div class="col-lg-6">
				<div class="input-group">
					<div class="input-group-btn">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">분류 <span class="caret"></span></button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">분류</a></li>
							<li><a href="#">111</a></li>
							<li><a href="#">222</a></li>
							<li class="divider"></li>
							<li><a href="#">333</a></li>
						</ul>
					</div><!-- /btn-group -->
					<input type="text" class="form-control" placeholder="검색어를 입력하세요.">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">검색</button>
					</span>
				</div><!-- /input-group -->
			</div><!-- /.col-lg-6 -->
		</div><!-- /.row -->
	</form>
	
	<!-- DateRange Pick -->
	<div class="box-title m-t-30">Date Range Pick(여러개 선택)</div>
	<input class="form-control input-daterange-datepicker" type="text" name="daterange">
	
	<!-- Autoclose Datepicker -->
	<div class="box-title m-t-30">Autoclose Datedpicker(1개 선택)</div>
		<div class="input-group">
		<input type="text" class="form-control" id="datepicker-autoclose" placeholder="년/월/일"> <span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
	</div>
	
	<script src="${contextPath}/resources/js/plugins/datepicker/common.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/moment.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.ko.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/daterangepicker.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/form-pickers-init.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- 둘중 하나를 사용하더라도 밑의 script는 다 넣어주어야함! -->
</body>
</html>