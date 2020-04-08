<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a8fa7e4a9e7170fa234c76a796cecab"></script>
<title>Insert title here</title>
<style>
.wrap-div{width:100%; height:850px; margin:0 auto; }
    .div-left{width:30%; height:inherit; float:left;}
    	.left-top{width:100%; height:7%; border:1px solid #000; box-sizing: border-box;}
    	.left-mid{width:100%; height:86%; border:1px solid #000; box-sizing: border-box; border-top:0; border-bottom:0;}
    	.left-bot{width:100%; height:7%; border:1px solid #000; box-sizing: border-box;}
    	
    .div-right{width:70%; height:inherit; float:right;}
    	.right-top{width:100%; height:7%; border:1px solid #000; box-sizing: border-box; border-left:0;}
    	#right-map{width:100%; height:51%; border:1px solid #000; box-sizing: border-box; border-top:0; border-left:0; border-bottom:0;}
    	.right-content{width:100%; height:35%; border:1px solid #000; box-sizing: border-box;border-left:0; border-bottom:0; }
    		.right-content-left{width:60%; height:100%;  box-sizing: border-box; float:left; 
    							line-height:70px; padding-left:50px;}
    			.left-spot{width:100%; height:25%; box-sizing: border-box;}
    			.left-date{width:100%; height:25%; box-sizing: border-box;}
    			.left-name{width:100%; height:25%; box-sizing: border-box;}
    			.left-phone{width:100%; height:25%; box-sizing: border-box;}
    				.cl{width:30%;height:100%; box-sizing: border-box; float:left;}
    				.cr{width:70%;height:100%; box-sizing: border-box; float:right; }
    		.right-content-right{width:40%; height:100%;  box-sizing: border-box; float:right; 
    							 line-height:70px;padding-left:15px;}
    			.right-choose{width:100%; height:25%; box-sizing: border-box;}
    			.right-seat{width:100%; height:25%; box-sizing: border-box;}
    			.right-time{width:100%; height:25%; box-sizing: border-box;}
    	.right-agree{width:100%; height:7%; border:1px solid #000; box-sizing: border-box; border-top:0; border-left:0;}
    		.le-ag{width:60%; height:100%;  box-sizing: border-box; float:left; line-height:55px; padding-left:50px; }
    		.ri-ag{width:40%; height:100%;  box-sizing: border-box; float:right; line-height:55px;padding-left:0px; }
    		.ra-left{width:70%; float:left; font-size:16px;}
    		.ra-right{width:30%;float:right;}
    .che{width:15px;height:15px;}
    
  	nav{margin-left:20px;}
  	
  	.modal-dialog.modal-80size {width: 85%; height: 90%; margin: 0; padding: 0;}
	.modal-content.modal-80size {height: auto; min-height: 90%;}
	.modal {text-align: center;}
	@media screen and (min-width: 768px) {
  	.modal:before {display: inline-block; vertical-align: middle; content: " ";height: 95%;}
	}
	.modal-dialog {display: inline-block; text-align: left; vertical-align: middle;}
</style>
</head>
<body>
<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main" style="padding:0;">
				<div class="pageTitle">
					<h1>좌석예약</h1>
				</div>
				<div class="content">
						<div class="wrap-div form-inline" >
					        <div class="div-left">
					        	<div class="left-top"></div>
					        	<div class="left-mid">
					        		<table border="1" id="tab">
					        			<c:forEach var="s" items="${ branchList }">
					        				<tr>
					        					<th rowspan="3">
					        						<input type="radio">
					        					</th>
					        					<th>${ s.branchName }</th>
					        				</tr>
					        				<tr>
					        					<td>
					        					</td>
					        					<td>
					        						${ s.branchAddress }
					        					</td>
					        				</tr>
					        				<tr>
					        					<td>
					        					</td>
					        					<td>
					        						${ s.branchTel }
					        					</td>
					        				</tr>
					        			</c:forEach>
					        		</table>
					        	</div>
					            <div class="left-bot ">
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
					            </div>
					        </div>
					        <div class="div-right">
					            <div class="right-top"></div>
					       		<div id="right-map" >
									<script>
										var mapContainer = document.getElementById('right-map'), // 지도를 표시할 div 
									    mapOption = { 
									        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
									        level: 3 // 지도의 확대 레벨
									    };
									
									// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
										var map = new kakao.maps.Map(mapContainer, mapOption); 
								</script>
					       		</div>
					            <div class="right-content">
					            	<div class="right-content-left">
					            		<div class="left-spot">
					            			<div class="cl">● 예약지점</div>
					            			<div class="cr">부천점</div>
					            		</div>
					            		<div class="left-date">
					            			<div class="cl">● 예약일자</div>
					            			<div class="cr">
					            				<div class="box-title m-t-30"></div>
												<input class="form-control input-daterange-datepicker" type="text" name="daterange">
					            			</div>
					            		</div>
					            		<div class="left-name">
					            			<div class="cl">● 이름</div>
					            			<div class="cr">
					            				<input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요">
					            			</div>
					            		</div>
					            		<div class="left-phone">
					            			<div class="cl">● 휴대폰번호</div>
					            			<div class="cr">
					            				<input type="text" name="phone" class="form-control" placeholder="번호를 입력해주세요">
					            			</div>
					            		</div>
					            	</div>
					            	<div class="right-content-right">
					            		<div class="right-choose">
					            			<div class="cl">● 인원선택</div>
					            			<div class="cr">
					            				<input type="checkbox" class="che" name="onep">1인 &nbsp;&nbsp;&nbsp;
					            				<input type="checkbox" class="che" name="manyp">다인
					            			</div>
					            		</div>
					            		<div class="right-seat">
					            			<div class="cl">● 좌석선택</div>
					            			<div class="cr">
					            				<div id="seatChoose" class="btn btn-default">선택</div>
					            			</div>
					            			<script>
					            			$('#seatChoose').click(function(e){
					            				e.preventDefault();
					            				$('#seatModal').modal("show");
					            			});
					            			</script>
					            		</div>
					            		<div class="right-time">
					            			<div class="cl">● 이용시간</div>
					            			<div class="cr">
					            				<select style="width:150px;">
					            					<option selected>시간선택</option>
					            					<option>09:00 ~ 10:00</option>
					            					<option>10:00 ~ 11:00</option>
					            					<option>11:00 ~ 12:00</option>
					            					<option>12:00 ~ 13:00</option>
					            					<option>13:00 ~ 14:00</option>
					            					<option>14:00 ~ 15:00</option>
					            					<option>15:00 ~ 16:00</option>
					            					<option>16:00 ~ 17:00</option>
					            					<option>17:00 ~ 18:00</option>
					            					<option>18:00 ~ 19:00</option>
					            					<option>19:00 ~ 20:00</option>
					            					<option>20:00 ~ 21:00</option>
					            					
					            				</select>
					            			</div>
					            		</div>
					            		
					            	</div>
					            </div>
					            <div class="right-agree">
					            	<div class="le-ag">
					            		<div class="ra-left"><input type="checkbox" class="che">개인정보 수집 및 이용에 관한 동의(필수)</div>
					            		<div class="ra-right">[내용보기]</div>
					            	</div>
					            	<div class="ri-ag">
					            		<div class="ra-left"><input type="checkbox" class="che">마케팅  수신 동의(필수)</div>
					            		<div class="ra-right">[내용보기]</div>
					            	</div>
					            </div>
					        </div>
					    </div>
					<div class="btnBox inner">
						<button class="defaultBtn" onclick=""></button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
	
	<div class="modal fade" id="seatModal">
	  <div class="modal-dialog modal-80size" role="document">
	    <div class="modal-content modal-80size ">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<div >
        			<div>좌석선택</div>
        		</div>
		        	<form action="/reservation.se" method="post">
		        		<jsp:include page = "seatForm.jsp"/>
		        	</form>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
</body>
	<script src="${contextPath}/resources/js/plugins/datepicker/common.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/moment.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/bootstrap-datepicker.ko.min.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/daterangepicker.js"></script>
	<script src="${contextPath}/resources/js/plugins/datepicker/form-pickers-init.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</html>