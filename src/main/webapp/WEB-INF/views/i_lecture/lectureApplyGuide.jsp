<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강연 등록 신청</title>
<style>
	.content{
		background: white;
	}
	.content ul li{
		list-style-type: none;
		display: inline;
		margin: 5%;
	}
	.content h4{
		font-weight: bold;
		margin-bottom: 15px;
	}
	.content div{
		margin-bottom: 25px;
	}
</style>
</head>
<body>
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>강연 등록 신청</h1>
				</div>
				<div class="content">
					<div class="inner">
						<div class="content">
							<h4>● 신청 전 유의 사항</h4>
							<div>
								강연 신청은 고등학생 이상에 한해 가능합니다.<br>
								신청 완료 시 “강연 확정 대기 중” 상태이며, 지점에서 순차적으로 고객님께 전화를 드립니다.<br>
								신청하신 “강연 등록 신청” 내역은 로그인 후 [MY PAGE] > [강연내역] 에서 확인 할 수 있습니다.<br>
								정확한 지점 위치는 홈페이지에서 확인 해주세요.<br>
								강의장의 대여가능 여부 및 강연자의 이력사항, 강연경험 근거로 강연 등록이 완료 됩니다.<br>
							</div>
							<h4>● 이용요금</h4>
							<div>
								강의장 대여 요금은 1시간당 10만원입니다.<br>
								강의장 대여 요금은 "강연 확정 대기 중"상태 일 때는 취소 가능, 강연 등록이 "확정" 후 위약금이 발생합니다.<br>
								강연 등록 확정 후 7일 전(무료), 3일 전(이용요금의 50%)<br>
							</div>
							<h4>● 편의시설 및 서비스</h4>
							<ul>
								<li><img src="resources/image/service/parking.png" alt="" style="width: 42px;height: 42px;"><span>주차시설 </span></li>
								<li><img src="resources/image/service/drink.png" alt="" style="width: 42px;height: 42px;"><span>음료제공 </span></li>
								<li><img src="resources/image/service/file.png" alt="" style="width: 42px;height: 42px;"><span>견적서, 세금계산서 발급 </span></li>
							</ul>
							<ul>
								<li><img src="resources/image/service/wifi.png" alt="" style="width: 42px;height: 42px;"><span>무선Wi-Fi </span></li>
								<li><img src="resources/image/service/securitycamera.png" alt="" style="width: 42px;height: 42px;"><span>다중보안시스템 </span></li>
								<li><img src="resources/image/service/printer.png" alt="" style="width: 42px;height: 42px;"><span>복합기 </span></li>
							</ul>	
						</div>
					</div>
					<div class="btnBox inner">
						<button class="btn defaultBtn" onclick="location.href='lectureApplyForm.le'">등록 신청</button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp"/>
	</div>
</body>
</html>