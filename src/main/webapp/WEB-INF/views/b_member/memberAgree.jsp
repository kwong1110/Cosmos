<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
<style>
	.policy_txt{
		margin-bottom:15px;
	}
	
	div.policy div {
		height : 285px;
	}
	
	.policy_txt div {
	    height: 150px;
	    padding: 15px;
	    margin-bottom: 10px;
	    font-size: 1.2rem;
	    line-height: 1.8;
	    border: 1px solid #ccc;
	    overflow-y: scroll;
	    background-color:#fff;
	}
	
	.policy_txt h3, .policy_txt h4 {
		font-size : 1.5rem;
	} 

	.inner {
		width:800px;
	}
	
	.s1 {
	    padding: 20px 0 0 0;
	    font-size: 1.5rem;
	    font-weight : bold;
	}
	
	.checks {
		text-align : right;
		font-size : 1.3rem;
		padding : 0 0 20px;
	}
	
	.checks label {
		vertical-align : middle;
		margin-left : 5px;
		margin-bottom : -2px;
		font-weight : normal;
	}
</style>
</head>
<body>
	<!-- view 초기 구조 -->
	<!-- import 경로는 알아서 바꿔줄것. -->
	<div class="total-wrapper">
		<c:import url="../a_common/menubar.jsp" />
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>이용약관</h1>
				</div>
				<div class="content">
					<div class="inner">
						<form>
								<div class="policy_txt policy">
									<div>
										<h3>제 1 장 총칙</h3>
										<br>
										<h4>제1조(목적)</h4>
										이 약관은 ㈜피투피시스템즈(이하 ‘회사’ 또는 ‘토즈’라 합니다.)가 이 제공하는 모든 서비스(이하 ‘서비스’라
										합니다.)와 관련하여 정당한 방법으로 이용함에 있어 필요한 이용 조건, 절차 및 당사자간의 권리, 의무 등
										기본적인 사항을 규정하는 것을 목적으로 합니다.<br /> <br />

										<h4>제2조(용어의 정의)</h4>
										본 약관에서 사용하는 용어는 다음과 같이 정의합니다. <br> ① 서비스: 토즈의 브랜드를 사용하는
										온라인과 오프라인을 포함하는 모든 상품 및 서비스를 말하며, 회사가 제공한 API를 이용하여 제3자가 개발 또는
										구축한 프로그램이나 서비스를 통하여 고객 또는 회원에게 제공되는 경우를 포함합니다.<br> ② 토즈
										멤버십 회원: (이하 ‘회원’이라 합니다.) 토즈 멤버십 또는 서비스 사이트를 통해 본 약관 제 6 조에 정해진
										회원가입 절차에 따라 가입하여 정상적으로 서비스를 이용할 수 있는 권한을 부여 받은 고객을 말하며, 회원은
										일반회원과 기업회원으로 구분됩니다.<br> ③ 사이트: 토즈가 운영하는 브랜드들의 사이트를 말하며,
										이는 총 4개의 사이트로 구성되어 있습니다.<br> ④ 고객: 토즈 멤버십 및 회사가 제공하는 서비스를
										이용하는 회원 또는 비회원을 말합니다. <br> ⑤ 아이디(ID): (이하 “아이디” 또는 “계정”이라
										합니다.) 회원식별과 회원의 서비스 이용을 위하여 토즈 멤버십 및 사이트를 통해 회원이 입력하고 회사가 승인하는
										이메일(E-Mail)형식의 문자와 숫자의 조합을 의미합니다.<br> ⑦ 토즈 지점 및 센터: (이하
										“지점”이라 합니다.) 토즈 브랜드를 사용하는 모든 직영, 위탁 지점 및 프랜차이즈 계약을 통해 운영되는 전
										센터를 말합니다.<br> ⑧ 직원 및 운영자: (이하 “운영자”라 합니다.) 토즈 멤버십 또는 지점
										서비스의 전반적인 관리와 원활한 운영을 위하여 회사가 선정한 자를 의미합니다.<br> <br>


										<h4>제3조 (약관의 효력 및 개정)</h4>
										① 본 약관은 그 내용을 회사가 사이트에 게시하고, 고객이 회사의 서비스를 이용함으로써 그 효력이 발생됩니다.
										<br> ② 본 약관은 수시로 개정 가능하며 약관을 개정하고자 할 경우 회사는 개정된 약관을 적용하고자
										하는 날(이하 “효력 발생일”이라 함)로부터 최소 14일 이전에 약관이 개정된다는 사실과 개정된 내용 등을 아래
										규정된 방법 중 1가지 이상의 방법으로 회원에게 통지합니다. 다만, 회원에게 불리하게 약관내용이 변경되는
										경우에는 최소한 30일 이상의 사전 유예기간을 두고 고지합니다. <br> ③ -이메일(E-mail)
										통보 <br> ④ -토즈 멤버십 앱 Push, 공지사항 <br> ⑤ -휴대전화 메시지(SMS,
										LMS등) <br> ⑥ -서비스 사이트 또는 앱 공지사항 내 고지 <br> <br>
										⑦ -지점 내 게시 <br> ⑧ -기타 회원 가입 시, 회원이 제공한 연락처 정보 등을 이용한 전화
										안내 등의 방법 <br> ⑨ 회사가 이메일(E-mail)통보의 방법으로 본 약관이 개정된 사실 및
										개정된 내용을 회원에게 고지하는 경우에는 회원 아이디로 사용되는 이메일(E-mail) 주소로 통보하며 이 경우,
										당사가 적법한 통보를 완료한 것으로 봅니다. <br> ⑩ 본 규정에 의하여 개정된 약관은 원칙적으로 그
										효력 발생일로부터 장래를 향하여 유효합니다. <br> ⑪ 본 약관의 개정과 관련하여 이의가 있는 회원은
										회원탈퇴를 할 수 있으며 개정된 약관의 효력 발생일까지 탈퇴하지 않거나 회사에 이의를 제기하지 않는 경우 변경된
										약관에 동의한 것으로 봅니다. <br> ⑫ 본 규정의 통지방법 및 통지의 효력은 본 약관의 각 조항에서
										규정하는 개별적인 또는 전체적인 통지의 경우에 이를 준용합니다. <br /> <br />

										<h4>제4조(약관 외 준칙)</h4>
										① 회사가 제공하는 서비스의 구체적 내용에 따라 개별 서비스에 대한 약관 및 운영청잭 (이하 “운영정책 등”)을
										둘 수 있으며, 해당 내용이 본 약관과 상충할 경우에는 운영정책 등이 우선하여 적용됩니다. <br> ②
										본 약관에서 정하지 아니한 사항이나 해석에 대해서는 운영정책 등 및 관계법령 또는 상관례에 따릅니다.<br />
										<br />

										<h4>제5조(서비스 개요)</h4>
										① 회사가 본 약관에 정해진 바에 따라 멤버십 회원에게 토즈가 제공하는 사이트의 주요 서비스 항목은 아래와
										같습니다.<br /> 가. 토즈 사이트><br /> 회사가 제공하는 브랜드에 대한 설명과 공간 정보 제공 및
										검색, 예약과 관련된 전반적인 기능을 제공합니다.<br /> <br /> 나. 토즈 모임센터 사이트<br />
										토즈 모임센터 소개를 비롯하여 모임센터의 공간 정보 제공 및 검색, 예약과 관련된 전반적인 기능을 제공합니다.<br />
										<br /> 다. 토즈 스터디센터 사이트<br /> 토즈 스터디센터 소개를 비롯하여 스터디센터의 공간 정보
										제공 및 검색, 예약과 관련된 전반적인 기능을 제공합니다.<br /> <br /> 라. 토즈 워크센터 사이트<br />
										토즈 워크센터 소개를 비롯하여 워크센터의 공간 정보 제공 및 검색, 예약과 관련된 전반적인 기능을 제공합니다.<br />
										<br /> 마. 기타 서비스<br /> 회사는 상기 각 호의 서비스 이외에도 추가적인 서비스를 개발하여
										고객에게 제공 할 수 있습니다.<br /> ② 본 약관은 제 2 장 제 6 조 ① 항에서 사이트 및 앱을 통해
										회원가입을 하지 않았을 경우 위 서비스 이용에 제한이 있을 수 있습니다. <br /> ③ 고객에게 제공되는
										서비스는 회사의 운영정책이나 사정에 따라 변경 될 수 있습니다. <br /> <br />

										<h3>제 2 장 회원</h3>
										<br />
										<h4>제6조(회원가입)</h4>
										① 회원으로 가입하고자 하는 고객은 당사자가 정한 가입신청서에 정해진 사항을 기입한 후 본 약관과 ‘개인정보의
										수집 및 이용 동의’에 동의함으로써 회원가입을 신청하며, 회사는 이러한 신청에 대하여 승낙함으로써 체결됩니다.<br />
										회사는 휴대폰번호 인증 시 본인 명의자에 의한 이용신청이 아닌 경우 회사가 정한 절차에 따라 서비스 이용을
										제한할 수 있습니다.<br /> ② 회사는 가입신청자의 신청에 대하여 회사가 제공하는 서비스 이용을 승낙함을
										원칙으로 합니다. 다만, 회사는 다음 각 호에 해당하는 신청에 대하여는 가입을 제한하거나 가입 승낙을 철회 할
										수 있습니다.<br /> 가. 가입신청자가 본 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단
										회사의 회원 재가입 승낙을 얻은 경우에는 예외로 합니다.<br /> 나. 회원자격 상실 후 3개월
										이내(정지기간)에 재가입을 신청하는 경우. <br /> 다. 허위의 정보를 기재하거나, 회사가 제시하는 내용을
										기재하지 않은 경우. 허위정보를 기재한 회원은 일체의 권리를 주장할 수 없고, 관련법에 따라 처벌을 받을 수
										있으며, 회사는 추후 이용 계약을 해지할 수 있습니다. <br /> 라. 부정한 용도 또는 영리를 추구할
										목적으로 서비스를 이용하는 경우<br /> 마. 멤버십 회원의 귀책사유로 인하여 승인이 불가능하거나 기타
										규정한 제반 사항을 위반하며 신청하는 경우 <br /> 바. 유료서비스의 경우, 가입신청자에 대하여 파산,
										회생 또는 이와 유사한 절차가 개시되었거나 개시신청이 있은 경우<br /> 사. 만 14세 아동이 이용신청을
										하는 경우<br /> 아. 기타 본 약관에 위배되거나 위법 또는 부당한 이용신청임이 확인된 경우 회사가
										합리적인 판단에 의하여 필요하다고 인정하는 경우<br /> 자. 관계법령에 위배되거나 사회의 안녕과 질서,
										미풍약속을 저해할 수 있는 목적으로 신청한 경우 <br /> ③ 토즈 멤버십 회원과 서비스 이용에 따른
										결제자가 다를 경우 회사는 이를 확인하기 위하여 제 증명을 요구할 수 있습니다.<br /> ④ 회사는 서비스
										관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우 승낙을 유보할 수 있습니다. <br /> <br />

										<h4>제7조(회원탈퇴 및 자격상실)</h4>
										① 회원은 언제든지 사이트 또는 앱을 통해 회원탈퇴를 요청할 수 있으며, 회원의 요청에 따라 조속히 회원탈퇴에
										필요한 제반 절차를 수행합니다. <br /> ② 회원탈퇴가 완료되면 적립된 포인트와 쿠폰은 소멸되며 환불처리는
										이용중인 서비스 및 지점의 규정에 의합니다.<br /> ③ 회원이 다음 각 호에 해당하는 경우, 회사는 당해
										회원에 대한 통보로써 회원 자격을 상실시키거나 3개월간 정지시킬 수 있습니다. 다만, 다 호의 경우에는 회원에
										대한 통보 없이 자격이 상실됩니다.<br /> 가. 회원 가입 신청 시, 허위 내용을 등록하거나 타인의 명의를
										도용한 경우<br /> 나. 고객이 부정적립, 부정사용 등 토즈 멤버십의 포인트 및 쿠폰을 부정한 방법 또는
										목적으로 이용 한 경우<br /> - ‘부정적립’이라 함은 회원이 실제 지점 및 앱 내 결제를 하지 않았거나
										이벤트에 참여하지 않았음에도 불구하고 회원에게 포인트 적립 또는 쿠폰이 발급 된 경우를 말합니다.<br />
										- 부정적립 된 포인트 및 쿠폰은 회원 자격 상실 통보와 함께 즉시 소멸하고 이에 대하여 회원은 어떠한 권리도
										주장 할 수 없습니다. 또한 부정적립 된 포인트 및 쿠폰을 이용하여 제공받은 혜택으로 서비스를 이용하여
										부당이득이 발생한 경우 회원 당사자 또는 부정적립 동조자가 회사에 대한 민,형사상 책임을 집니다.<br />
										다. 회원이 사망한 경우<br /> 라. 토즈 및 지점의 서비스 이용을 부당하게 방해하거나 그 정보를 도용하는
										등 관련 법령을 위반하여 전자거래질서를 위협하는 경우<br /> 마. 기타 본 약관에 규정된 회원의 의무를
										위반한 경우<br /> ④ 본 조 제 ① 항에 의한 회원탈퇴 또는 제 ② 항에 의한 회원자격상실이 확정되는
										시점은 아래와 같습니다.<br /> 가. 회원탈퇴 요청일 또는 회원자격상실 통보일에 회원탈퇴 또는 자격상실이
										확정되며 적립 된 포인트 및 보유 쿠폰은 확정일을 기준으로 자동 소멸처리 됩니다.<br /> 나. 사망으로
										인한 자격상실의 경우에는 회원 사망일에 자격상실이 확정됩니다<br /> ⑤ 본 조 ① 항에 따라 회원자격이
										상실된 경우에는 상실된 날로부터 3개월간 재가입 할 수 없습니다. 회원자격이 정지된 경우에는 해당 자격
										정지기간(3개월)동안 회원탈퇴 후 재가입 할 수 없습니다. 회사는 위 재가입의 제한기간 동안 회원의 재가입을
										통제하기 위하여 필요한 최소한의 정보 (성명, 이메일, 휴대전화번호)를 계속 보관합니다.<br /> <br />

										<h4>제8조(회원에 대한 통지)</h4>
										① 회원에 대한 통지를 하는 경우 회원이 등록한 이메일(E-mail)주소 또는 Push메시지 등으로 할 수
										있습니다.<br /> ② 회사는 불특정 다수 회원에 대한 통지의 경우 서비스 게시판 등에 게시함으로써
										개별통지에 갈음할 수 있습니다.<br /> ③ 회사는 회원이 3년 이상 로그인 하지 않으면, 휴면계정으로
										간주하고 회사가 제공하는 서비스 이용을 제한할 수 있습니다. 휴면계정으로 지정된 이후 다시 서비스를 이용하려면
										회사가 정하는 본인 확인 절차에 따라 해제를 하여야 합니다.<br /> ④ 휴면계정으로 지정된 이후 90일
										이내에 해제 신청을 하지 않은 경우 계정은 탈퇴처리 되며, 이에 따른 탈퇴 처리 후 회원에게 이를 통지합니다.<br />

										<br />

										<h3>제 3 장 서비스의 제공 및 이용</h3>
										<br />
										<h4>제9조 (서비스의 이용개시)</h4>
										① 회사는 회원의 가입신청의 자동승낙이 이루어진 시점부터 서비스를 개시합니다. 단, 일부 서비스의 경우에는
										지정된 일자부터 서비스를 개시합니다.<br /> ② 회사의 업무상 또는 기술상의 장애로 인하여 서비스를
										개시하지 못하는 경우에는 서비스 사이트 및 앱에 공지하거나 회원에게 이를 통지합니다.<br /> <br />

										<h4>제10조 (서비스의 이용시간)</h4>
										회사가 제공하는 서비스의 이용은 연중무휴, 1일 24시간을 원칙으로 합니다. 다만, 지점 이용시간은 각 지점의
										특성상 유동적일 수 있으며, 업무상이나 기술상의 이유로 서비스가 일시 중지될 수 있고, 운영상의 목적으로 회사가
										정한 기간에는 서비스가 일시 중지될 수 있습니다. 이러한 경우 회사는 사전 또는 사후에 이를 공지합니다.<br />
										<br />

										<h4>제11조 (서비스의 변경 및 중지)</h4>
										① 회사는 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 있습니다.<br />
										② 회사는 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다.<br />
										가. 서비스 설비의 보수 등 공사로 인한 부득이한 경우<br /> 나. 회원이 회사의 영업활동을 방해하는 경우<br />
										다. 정전, 제반 설비의 장애 또는 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우<br />
										라. 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우<br /> ③ 서비스의 내용, 이용방법,
										이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전에 해당
										서비스 내 “공지사항”화면 등 회원이 충분히 인지할 수 있는 방법으로 게시합니다.<br /> ④ 다만, 회사가
										사전에 공지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다. <br /> ⑤ 회원은 수시로
										제 ② 항과 제 ③ 항에 의한 서비스 사이트를 확인하여야 하며, 공지사항 미확인으로 인해 발생하는 회원의 피해에
										대해서 회사는 책임을 지지 않습니다. 다만, 유료서비스의 변경 등 회원에게 중대하고 명백한 피해가 예상되는
										경우에는 본 약관에서 정한 방법으로 회원에게 통지합니다. <br /> ⑥ 회사는 무료로 제공되는 서비스의 일부
										또는 전부를 회사의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련 법에 특별한
										규정이 없는 한 회원에게 별도의 보상을 하지 않습니다. <br /> <br />

										<h4>제12조 (예약)</h4>
										① 공간 이용계약은 ‘회원’만 할 수 있습니다.<br /> ② 공간 이용 계약의 성립 시기는 ‘회원’이
										‘사이트’에서 공간예약 완료 후 ‘회사’가 예약완료로 승인한 시점으로 합니다.<br /> ③ ‘회원’은
										‘사이트’의 예약 확인 페이지에서 예약에 대한 내용 확인 및 예약취소를 할 수 있습니다.<br /> ④
										‘회원’은 공간 예약 후 공간 이용시간 30분 이전까지 예약취소를 할 수 있으며, 이후에는 취소가 불가능합니다.<br />
										⑤ ‘회사’는 공간의 예약취소에 관한 구체적인 사항을 별도의 이용정책으로 정할 수 있습니다. <br /> <br />

										<h4>제13조 (정보의 제공 및 광고의 게재)</h4>
										① 회사는 서비스를 운영함에 있어 회사의 서비스 관련 각종 정보 및 광고를 사이트와 토즈 멤버십 앱을 포함한
										서비스 화면에 게재하거나 SMS/MMS 및 스마트폰 Push알람 서비스로 제공받는데 동의한 경우 회사는
										SMS/MMS 및 스마트폰 Push알람 서비스로 관련 정보를 제공할 수 있습니다.<br /> ② 회원은 서비스
										화면 및 서비스 사이트 등에 게재되어 있는 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써
										발생하는 손실과 손해에 대해서 회사는 어떠한 책임도 부담하지 않습니다. <br /> ③ 회원은 관련법에 따른
										거래 관련정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 수신거절을 할 수 있습니다.<br /> ④
										회원은 회사가 제공하는 서비스와 관련하여 게시물 또는 기타 정보를 변경, 수정, 제한하는 등의 조치를 취하지
										않습니다. <br /> <br />

										<h3>제 4 장 계약당사자의 의무</h3>
										<br />
										<h4>제14조 (“회사“의 의무)</h4>
										① 회사는 관련법과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 안정적인 서비스를 제공하기 위해
										최선을 다하여 노력합니다.<br /> ② 회사는 서비스 제공과 관련하여 취득한 회원의 신상정보를 승낙 없이 제
										3자에게 누설, 배포하지 않습니다. 다만, 관계법령에 의한 수사상의 목적으로 관계기간으로부터 요구 받은 경우나
										방송통신심의위원회의 요청이 있는 경우 등 법률의 규정에 따른 적법한 절차에 의한 경우에는 그러하지 않습니다.<br />
										③ 회사는 서비스와 관련한 회원의 불만사항이 접수되는 경우 이를 신속하게 처리하여야 하며, 신속한 처리가 곤란한
										경우 그 사유와 처리 일정을 서비스 화면에 게재하거나 이메일(E-mail) 등을 통하여 동 회원에게 통지합니다.<br />
										④ 회사가 제공하는 서비스로 인하여 회원에게 손해가 발생한 경우, 그러한 손해가 회사의 고의나 중과실에 기해
										발생한 경우에 한하여 회사에서 책임을 부담하며, 그 책임의 범위는 통상손해에 한합니다.<br /> ⑤ 회사는
										정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법, 전기통신사업법 등 서비스의 운영, 유지와 관련
										있는 법규를 준수합니다.<br /> <br />

										<h4>제15조(회원의 의무 및 자격존속기간)</h4>
										① 회원은 서비스를 이용 할 때, 다음 각 호의 행위를 하여서는 안됩니다.<br /> 가. 회원가입 시 허위
										사실을 기재하거나, 다른 회원의 ID 및 비밀번호를 도용, 부정하게 사용하거나, 휴대폰 명의자 허락 없이
										휴대폰인증을 수행하는 행위<br /> 나. 회사의 서비스 정보를 이용하여 얻은 정보를 회사의 사전 승낙 없이
										복제 또는 유통시키거나 상업적으로 이용하는 행위<br /> 다. 타인의 명예를 손상시키거나 불이익을 주는 행위<br />
										라. 회사 또는 제 3자의 저작권 등 기타 권리는 침해하는 행위<br /> 마. 이메일(E-Mail),
										SMS/MMS 전송 시 음란물을 게재하거나 음란사이트를 연결하는 행위<br /> 바. 공공질서 및 미풍양속에
										위반되는 내용의 정보, 문장, 도형, 음성 등을 타인에게 유포하는 행위<br /> 사. 서비스와 관련된 설비의
										오 동작이나 정보 등의 파괴 및 혼란을 유발시키는 악성코드 자료를 등록 또는 유포하는 행위<br /> 아.
										타인으로 가장하는 행위 및 타인과의 관계를 허위로 명시하는 행위<br /> 자. 자기 또는 타인에게 재산상의
										이익을 주거나 타인에게 손해를 가할 목적으로 허위의 정보를 유통 시키는 행위<br /> 차. 윤락행위를
										알선하거나 음행을 매개하는 내용의 정보를 유통시키는 행위<br /> 카. 회사의 직원이나 운영자를 가장하거나
										사칭하여 또는 타인의 명의를 도용하여 글을 게시하거나 이메일(E-mail) 을 발송하는 행위<br /> 타.
										기타 불법적이거나 부당한 행위<br /> 파. 회원은 관계 법령, 본 약관의 규정, 이용안내 및 서비스상에
										공지한 주의사항, 회사가 통지하는 사항 등을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는
										안됩니다.<br /> 하. 회원의 자격은 제 7조 규정에 의하여 상실될 때까지 존속합니다. <br /> <br />

										<h4>제16조 (알람 서비스에 대한 회사의 의무와 책임)</h4>
										① 회사는 회원에게 SMS, 이메일, 앱 Push 알람을 보낼 수 있습니다. <br /> ② 회사는
										Push알람 서비스 사용 여부를 설정할 수 있는 기능 제공을 통해 Push 알람 서비스에 대한 회원의 동의를 제
										13조에 규정하여 진행합니다. <br /> ③ 회원은 사용자간 서비스 이용에 의한 Push알람 전송에 따라
										불편을 초래할 시 회사는 책임을 지지 않으며, 불편을 초래한 회원에게 이용제약을 줄 수 있습니다.<br />
										<br />

										<h4>제17조 (회원 관리에 대한 의무와 책임)</h4>
										① 회원이 앱 내에서 일부 서비스 이용 시 이용요금이 익월 통신요금에 부과될 수 있으므로, 회원은 회원
										ID(고유번호) 및 Password(비밀번호) 관리를 철저히 하여야 합니다.<br /> ② 회원
										ID(고유번호)와 Password(비밀번호)의 관리 소홀, 부정 사용에 의하여 발생하는 모든 결과에 대한 책임은
										회원 본인에게 있으며, 회사의 시스템 고장 등 회사의 책임 있는 사유로 발생하는 문제에 대해서는 회사가 책임을
										집니다.<br /> ③ 회사는 회원의 안전한 개인정보보호를 위하여 비정기적 3개월 이상의 주기로 비밀번호를
										변경하도록 권고할 수 있으며, 이를 위한 기술적 조치를 제공할 수 있습니다.<br /> ④ 회원은 본인의
										ID(고유번호) 및 Password(비밀번호)를 제3자에게 이용하게 해서는 안되며, 회원 본인의 ID(고유번호)
										및 Password(비밀번호)를 도난 당하거나 제3자가 사용하고 있음을 인지하는 경우에는 바로 회사에 통보하고
										회사의 안내가 있는 경우 그에 따라야 합니다.<br /> <br />

										<h4>제18조 (저작권 등의 귀속 및 이용제한)</h4>
										① 회사가 작성한 저작물에 대한 소유권, 저작권, 특허권, 상표권 기타 지적재산권은 회사에 귀속합니다.<br />
										② 회원은 서비스를 이용함으로써 얻은 정보를 회사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 등 기타
										방법에 의하여 이용하거나 제3자에게 이용하게 하여서는 안됩니다. <br /> ③ 회원은 서비스의 이용권한,
										기타 이용 계약상 지위를 타인에게 양도, 증여할 수 없습니다 .<br /> <br />

										<h3>제 5 장 개인정보보호</h3>
										<br />
										<h4>제19조 (이용자의 개인정보보호)</h4>
										① 회사는 관련법령이 정하는 바에 따라 회원 등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력합니다.
										회원의 개인정보보호법에 관한 사항은 관련법령 및 회사가 정하는 “개인정보처리방침”에 정한 바에 따릅니다.<br />
										② 회사는 개인정보 보호를 위하여 회원의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌
										등을 포함한 회원의 개인정보의 분실, 도난, 유출 동의 없는 제3자 제공, 변조 등으로 인한 회원의 손해에
										대하여 모든 책임을 집니다.<br /> ③ 회사는 제 2장 제 6조 1항에 규정을 통해 회원으로부터 개인정보의
										수집, 제공, 및 활용에 관한 동의를 받습니다. (정보관리 책임자 : 조연주 팀장 1588-5935)<br />
										④ 회원 및 그 법정대리인은 회원탈퇴를 통해 언제든지 개인정보의 수집, 제공 및 활용에 대한 동의를 철회할 수
										있으며, 본인의 개인정보에 대한 열람 및 오류 정정을 요구할 수 있습니다.<br /> <br />

										<h4>제 20 조 (개인정보의 위탁)</h4>
										① 회사는 수집된 개인정보의 취급 및 관리 등의 업무(이하 “업무”)를 스스로 수행함을 원칙으로 하나, 필요한
										경우 업무의 일부 또는 전부를 회사가 선정한 회사에 위탁할 수 있습니다. 개인정보의 위탁에 관한 사항은 관련
										법령 및 회사가 정하는 “개인정보처리방침”에 따릅니다.<br /> <br />

										<h3>제 6 장 손해배상 및 기타</h3>
										<br />
										<h4>제21조 (손해배상)</h4>
										① 회원이 본 약관의 규정을 위반함으로 인하여 회사에 손해가 발생하게 되는 경우, 본 약관을 위반한 회원은
										회사에 발생하는 모든 손해를 배상하여야 합니다.<br /> ② 회원이 서비스를 이용함에 있어 행한 불법행위나
										본 약관 위반행위로 인하여 회사가 당해 회원 이외의 제 3자로부터 손해배상 청구 또는 소송을 비롯한 각종
										이의제기를 받는 경우 당해 회원은 자신의 책임과 비용으로 회사를 면책시켜야 하며, 당해 회원은 그로 인하여
										회사에 발생한 모든 손해를 배상하여야 합니다.<br /> <br />

										<h4>제22조 (면책사항)</h4>
										① 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한
										책임이 면제됩니다.<br /> ② 회사는 회원의 귀책사유로 인한 서비스의 이용장애에 대하여 책임을 지지
										않습니다.<br /> ③ 회사는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지
										않으며 서비스를 통하여 얻은 자료로 인한 손해 등에 대하여도 책임을 지지 않습니다. 회사는 회원이 서비스 사이트
										및 앱에 게재한 정보, 자료, 사실의 신뢰도 및 정확성 등 내용에 대하여는 책임을 지지 않습니다.<br />
										④ 회사는 회원 상호간 또는 회원과 제3자 상호간에 서비스를 매개로 발생한 분쟁에 대해서는 개입할 의무가 없으며
										이로 인한 손해를 배상할 책임도 없습니다. <br /> <br />


										<h4>제23조 (관할법원)</h4>
										① 서비스 이용과 관련하여 회사와 회원 사이에 분쟁이 발생한 경우, 회사와 회원은 분쟁의 해결을 위해 성실히
										협의합니다. ② 본 조 제 1항의 협의에서도 분쟁이 해결되지 않을 경우 양 당사자는 민사소송법상의 관할법원에
										소를 제기 할 수 있습니다 <br /> <br /> 부칙<br /> 이 약관은 2018년 01월 02일부터
										적용됩니다. <br /> <br />
									</div>
								</div>
								<div class="checks"><input type="checkbox"
									id="policy_chk1"><label for="policy_chk1">위
										이용약관 내용에 동의합니다.</label></div>

								<h2 class="s1">개인정보수집 및 이용에 대한 안내</h2>
								<div class="policy_txt">
									<div>
										<h3>개인정보의 수집 및 이용 목적</h3>
										<br /> “회사”가 “회원”의 개인정보를 수집하는 것은 수집한 정보를 바탕으로 아래 &lt;개인정보 수집
										목적 세부사항&gt;의 각 호와 같이 원활한 서비스 제공을 위한 것이며, 보다 나은 서비스 혜택 제공을 위해
										다양한 방법 (전화, SMS, 우편 등)을 통해 서비스 관련 정보를 회원 여러분에게 제공할 수 있습니다.

										&lt;개인정보 수집 목적 세부사항&gt; ① 서비스 제공 계약의 성립 및 유지 종료를 위한 본인확인,
										개인식별, 가입의사 확인, "회원"에 대한 고지사항 전달, 공간 예약 및 결제, 불량회원의 부정 이용 방지와
										비인가 사용 방지, 고객 문의 및 불만처리 등 CS대응 ② 신규 서비스(제품) 개발 및 특화, 인구통계학적
										특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악 또는 서비스의 검토, 개선에 필요한 설문조사 및 분석,
										회원의 서비스 이용에 대한 통계 ③ 서비스 관련 각종 이벤트 및 행사 관련 정보 안내를 위한 SMS, 이메일,
										DM발송, 전화 등의 마케팅 활동.
									</div>
								</div>
								<div class="policy_txt">
									<div>
										<h3>개인정보의 수집 항목</h3>
										<br /> “회사”는 회원 여러분에게 다양한 서비스를 제공하기 위해 아래와 같은 개인정보를 수집하고
										있습니다. “회사”는 회원 여러분의 소중한 인권을 침해할 우려가 있는 민감한 정보 (인종, 사상 및 신조,
										정치적 성향이나 범죄기록, 의료정보 등)는 어떠한 경우에도 수집하지 않으며, 만약 불가피하게 수집하는 경우에는
										반드시 회원 여러분에게 사전 동의를 구할 것입니다. ① 회원가입 필수항목 : 이메일, 비밀번호, 이름,
										생년월일, 휴대전화번호, 사업자번호(기업회원), 기업명(기업회원) ② 서비스 이용 또는 사업처리 과정에서
										생성/수집되는 각종 거래 및 개인성향정보 : 공간 예약 및 결제 기록, OS버전, 단말기 기기명, 고유기기 식별
										값, 접속 기록, 접속 IP정보, 쿠키(Cookie), 기기고유번호 등.
									</div>
								</div>
								<div class="policy_txt">
									<div>
										<h3>개인정보의 보유 및 이용기간</h3>
										<br /> ①“회사”는 회원가입일로부터 서비스를 제공하는 기간에 한하여 회원 여러분의 개인정보를 보유하고
										이용하게 됩니다. ②“회사”는 회원 여러분이 서비스 탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를
										철회할 때, 수집 및 이용목적이 달성되거나 보유 및 이용기간이 종료되면 해당 개인정보를 즉시 파기합니다. 단,
										관계법령의 규정에 의하여 보존할 필요가 있는 경우 “회사”는 관계법령에서 정한 일정한 기간 동안 여러분의 정보를
										안전하게 보관합니다. 이 경우 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다. -
										TOZ 이용내역 및 문의 내역 : 5년 - 회원의 이용기록 확인을 위한 로그 내역 : 5년
									</div>
								</div>
								<div class="checks"><input type="checkbox"
									id="policy_chk2"><label for="policy_chk2">개인정보
										수집 및 이용에 동의합니다.</label></div>
						</form>
					</div>

					<div class="btnBox inner">
						<button type="button" class="btn btn-info goJoin">다음</button>
						<button type="button" class="btn btn-danger" onclick="javascript:history.back();">취소</button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../a_common/footer.jsp" />
	</div>
	
	<script type="text/javascript">
		$(function(){
			$('.goJoin').on('click', function(){
				if(!$('input#policy_chk1').is(':checked')) {
					alert("이용약관에 동의하여야 합니다.");
					return;
				}
	
				if(!$('input#policy_chk2').is(':checked')) {
					alert("개인정보 수집 및 이용에 동의하여야 합니다.");
					return;
				}
	
				location.href = "enroll.me";
			});
		});
	</script>
	
	
</body>
</html>