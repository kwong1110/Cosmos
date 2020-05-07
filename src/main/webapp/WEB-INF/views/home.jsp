<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스모스</title>
<style>
	div.total-wrapper {
		line-height : 12px;
		font-size:14px;
	}
	ul, li {
		list-style-type:none;
	}
	
	em {
	    font-style: normal;
	}
	
	/* 전체 박스  */
	.main{
		background : url(${contextPath}/resources/image/main7.jpg) no-repeat center center;
		background-size:cover;
		height:100%;
	}
	
	/* 안에 내용 박스 */
	.inner {
		
	}
	
	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=*/
	/* 배너 박스 */
	.main_data {
		min-width:1000px;
		max-width:1000px;

		height : 407px;
		position:fixed;
		bottom: 100px;
	}
	
	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=*/
	/* 배너 배경 */
	.data_output_list_bg{
		opacity : 0;
		width: 1000px;
		height : 280px;
		background: rgba(255, 255, 255, 0.9);
		position:absolute;
		left:0;
		top:0;
	}
	
	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=*/
	/* 숨겨져 있다 위로 튀어 올라오는 배너, 각 배너 아이템들의 최상위 박스 */
	.data_output_list {
		padding : 0 30px 0 60px;
		width: 1000px;
		height : 280px;
		position:absolute;
		left:0;
		top:0;
	}
	
	/*------------------------------------------*/
	/* 각 배너 최상위 박스 */
	.data_output_item {
		display : none;
		padding : 100px 0 0 50px;
		position : absolute;
		left:0;
		top:0;
	}
	
	/*------------------------------------------*/
	/* 각 배너 타이틀 */
	.data_output_tit {
		background: rgb(255, 0, 0);
		color : #fff;
		text-align : left;
		padding : 15px 30px;
		height : 100px;
		
		position : absolute;
		top:-20px;
		left:20px;
		
		width:135px;
		
	}
	
	/*------------------------------------------*/
	/* 각 배너 왼쪽 영역 */
	.data_output_desc{
		float:left;
		width : 450px;
		border:1px solid green;
	}
	
	/* 각 배너 왼쪽 영역 안에 있는 헤드라인 */
	.data_desc_m {
	    margin-bottom: 10px;
	    font-size: 25px;
	    font-weight: 400;
	    color: #333;
	    line-height: 34px;
	}

	/*------------------------------------------*/
	/* 각 배너 오른쪽 영역 */	
	.data_desc_list{
		border:1px solid red;
		float:right;
	}
	
	/* 각 배너 오른쪽 영역 안에 있는 아이템 */
	.data_desc_list .data_desc_item {
		float:left;
	}
	
	.data_desc_item div {
		width:150px;
		height : 80px;
	}
	
	.data_desc_item span {
	    display: block;
	    text-align: center;
	}
	
	.data_desc_item em {
	    display: block;
	    margin-top: 3px;
	    font-size: 13px;
	    opacity: 0.7;
	    text-align: center;
	}
	
	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=*/
	/* 배너 닫기 버튼 */
	.btn_output_close {
		display:none;
		position : absolute;
		right : 0;
		top : 0;
	}
	
	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=*/
	/* 탭 최상위 박스 */
	.data_input_list {
		position : absolute;
		bottom: 0;	
	}
	
	/* 탭 박스 */
	.data_input_item {
		float:left;
	}
	
	.data_input_item div {
		display: block;
	    padding: 30px 0;
	    width: 250px;
	    text-align: center;
	    background-color: #000;
	    background-color: rgba(0, 0, 0, 0.3);
	    background-position: center 30px;
	    transition: all .2s ease-out;
	    position: relative;
	}
	
	.data_input_item span {
	    display: inline-block;
	    color: #fff;
	}
	
	.data_input_item em {
	    display: block;
	    margin-top: 3px;
	    font-size: 13px;
	    opacity: 0.7;
	    color: #fff;
	}
	
	.data_input_item div:hover {
	    opacity: 0.7;
	    color: rgb(255, 255, 255);
	}

</style>
</head>
<body>
	<div class="total-wrapper">
		<c:import url="a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">				
				<!-- S:content -->
				<div class="content">
					<div class="inner">
						<div class="main_data">
							<div class="data_output_list_bg"></div>
							<div class="data_output_list">
								<div class="data_output_item item0  clear-fix">
									<p class="data_output_tit"><span>전체<br>지점 수</span></p>
									<div class="data_output_desc data_desc">
										<p class="data_desc_m"><span>전국 <b>100</b>개의 지점 수</span></p>
										<p class="data_desc_s">코스모스 센터는 <br>최대, 최다 규모의 경쟁력을 갖춘 공간 서비스 브랜드입니다.</p>
									</div>
									<ul class="data_desc_list clear-fix">
										<li class="data_desc_item">
											<div>
												<span><b>100</b></span>
												<em>100</em>
											</div>
										</li>
										<li class="data_desc_item">
											<div>
												<span><b>100</b></span>
												<em>100</em>
											</div>
										</li>
										<li class="data_desc_item">
											<div>
												<span><b>100</b></span>
												<em>100</em>
											</div>
										</li>
									</ul>
								</div>
								<!-- 전제 지점 수 -->
								<div class="data_output_item item1 clear-fix">
									<p class="data_output_tit"><span>전 지점<br>좌석 수</span></p>
									<div class="data_output_desc data_desc">
										<p class="data_desc_m"><span>코스모스 공간의 좌석은<br><b>100</b>개 입니다.</span></p>
										<p class="data_desc_s">결과와 성과를 만들어가는 여러분을 위한 자리가<br>준비되어 있습니다.</p>
									</div>
									<ul class="data_desc_list clear-fix">
										<li class="data_desc_item">
											<div>
												<span><b>100</b></span>
												<em>100</em>
											</div>
										</li>
										<li class="data_desc_item">
											<div>
												<span><b>100</b></span>
												<em>100</em>
											</div>
										</li>
										<li class="data_desc_item">
											<div>
												<span><b>100</b></span>
												<em>100</em>
											</div>
										</li>
									</ul>
								</div>
								<!-- 전체 좌석 수 -->
								<div class="data_output_item item2 clear-fix">
									<p class="data_output_tit"><span>모집 중인<br>그룹</span></p>
									<div class="data_output_desc data_desc">
										<p class="data_desc_m"><span>코스모스에서<br> 현재 모집 중인 그룹 수<b>100</b>개</span></p>
										<p class="data_desc_s">코스모스 센터는 여러 명이 같이 공부를 하거나 과제를 할 수 있도록 <br>스터디 그룹 매칭 과정을 진행하고 있습니다.</p>
									</div>
									<ul class="data_desc_list clr">
										<li class="data_desc_item">
											<div>
												<span><b>100</b></span>
												<em>100</em>
											</div>
										</li>
										<li class="data_desc_item">
											<div>
												<span><b>100</b></span>
												<em>100</em>
											</div>
										</li>
										<li class="data_desc_item">
											<div>
												<span><b>100</b></span>
												<em>100</em>
											</div>
										</li>
									</ul>
								</div>
								<!-- 모집 중인 그룹 -->
								<div class="data_output_item item3 clear-fix">
									<p class="data_output_tit"><span>강연 목록</span></p>
									<div class="data_output_desc data_desc">
										<p class="data_desc_m"><span>현재 진행하는 강연 수<b>100</b>개</span></p>
										<p class="data_desc_s">온/오프라인 연계를 통해 차별화된 서비스를 경험하실 수 있습니다.<br>코스모스 센터에서 시행되는 강연 목록을 확인하세요.</p>
									</div>
									<ul class="data_desc_list clear-fix">
										<li class="data_desc_item">
											<div>
												<span><b>100</b></span>
												<em>100</em>
											</div>
										</li>
										<li class="data_desc_item">
											<div>
												<span><b>100</b></span>
												<em>100</em>
											</div>
										</li>
										<li class="data_desc_item">
											<div>
												<span><b>100</b></span>
												<em>100</em>
											</div>
										</li>
									</ul>
								</div>
								<!-- 강연 목록 -->
							</div>
							<button type="button" class="btn_output_close"><span class="blind">&times;</span></button>
							<ul class="data_input_list clear-fix">
								<li class="data_input_item">
									<div>
										<span><b>100</b> 센터</span>
										<em>전체 지점 수</em>
									</div>
								</li>
								<li class="data_input_item">
									<div>
										<span><b>100</b> 개</span>
										<em>전 지점 좌석 수</em>
									</div>
								</li>
								<li class="data_input_item">
									<div>
										<span><b>100</b> 그룹</span>
										<em>모집 중 그룹</em>
									</div>
								</li>
								<li class="data_input_item">
									<div>
										<span><b>100</b> 강연</span>
										<em>강연 목록</em>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- E:content -->
			</div>
		</div>
		<c:import url="a_common/footer.jsp"/>
	</div>
	<!-- E:total-wrapper -->
</body>

<script>
	$(function(){
		var $tab = $(".data_input_item div");
		// $(".tab-box .ctn1").addClass("ctnOn");

		$tab.hover(function() {
			// data_output_list_bg 보이기
			// data_output_item 보이기
			// data_output_tit 보이기
			// btn_output_close 보이기
			$(".data_output_list_bg").css("opacity", 1);
			$(".data_output_item").css("display", "block");
			$(".btn_output_close").css("opacity", 1);
		}, function(){
			$(".data_output_list_bg").css("opacity", 0);
			$(".data_output_item").css("display", "none");
			$(".btn_output_close").css("opacity", 0);
		});
	});

</script>

</html>
