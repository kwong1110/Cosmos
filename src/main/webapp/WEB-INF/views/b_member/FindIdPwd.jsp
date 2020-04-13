<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*id_비밀번호 찾기*/
.id_pw_srh {width:100%;overflow:hidden}
.id_pw_srh li {float:left;width:50%}
.id_pw_srh li .srh_box {padding:23px 41px 34px}
.id_pw_srh li .or {border-style:solid none solid solid;border-width:1px 0 1px 1px;border-color:#d8d8d8;background:white;}
.id_pw_srh li .or h2 {margin-bottom:10px;font-size:22px;font-weight:900;color:#da6700}
.id_pw_srh li .br h2 {margin	-bottom:10px;font-size:22px;font-weight:900;color:#816950}
.id_pw_srh li .br {border-style:solid;border-width:1px;border-color:#d8d8d8; background:white;  }

.id_pw_srh li .srh_box .srh_top {text-align:center;font-size:13px}
.id_pw_srh li .srh_box .info {margin-top:24px;padding-top:20px;border-top:1px dashed #d2d2d2}
.id_pw_srh li .srh_box .info label {display:inline-block;width:83px;margin-right:12px;vertical-align:middle;font-weight:900;font-size:13px;color:#333333}
.id_pw_srh li .srh_box .info p {margin-bottom:5px}
.id_pw_srh li .srh_box .info p input {width:167px;height:21px;border:1px solid #d4d6d6}
.id_pw_srh li .or button {display:block;width:145px;margin:26px auto 0;padding:7px 0;border:1px solid black;background-color:black;font-family:'Malgun Gothic','맑은 고딕';color:#FFFFFF}
.id_pw_srh li .br button {display:block;width:145px;margin:26px auto 0;padding:7px 0;border:1px solid black;background-color:black;font-family:'Malgun Gothic','맑은 고딕';color:#FFFFFF}


</style>
</head>
<body>
	
	<div class="total-wrapper">
	<c:import url="../a_common/menubar.jsp"/>
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>ID찾기</h1>
				</div>
				<div class="content">
					<ul class="id_pw_srh">
					<li>
						<div class="srh_box or">
							<div class="srh_top">
								<h2>ID찾기</h2>
								내정보에 등록한 정보로<br> 아이디를 찾을 수 있습니다.
							</div>
							<div class="find">
								<form name="id_form" method="post" action="search_idpw.me" onsubmit="return chk_idform(this)">
								<input type="hidden" name="s_type" value="id">
									<fieldset>
										<label></label>
										<p><label for="id_name">이름</label></p> <input type="text" name="me_name" class="form-control" width="200px" title="이름 입력">
										<p><label for="id_mail">이메일</label></p> <input type="text" name="me_email" class="form-control" size="30" title="가입시 이메일 입력" placeholder="가입시 등록한 이메일">
										<button type="submit">찾기</button>
									</fieldset>
								</form>
							</div>
						</div>
					</li>
					<li>
						<div class="srh_box br">
							<div class="srh_top">
								<h2>비밀번호 찾기</h2>
								내정보에 등록한 정보로<br> 비밀번호를 재설정할 수 있습니다.
							</div>
							<div class="find">
								<form name="pw_form" method="post" action="search_idpw.me" onsubmit="return chk_pwform(this)">
								<input type="hidden" name="s_type" value="pw">
									<fieldset>
										<label></label>
										<p><label for="pw_name">ID</label> <input type="text" name="me_id" class="form-control" title="아이디 입력"></p>
										<p><label for="pw_mail">이메일</label> <input type="text" name="me_email" class="form-control" title="가입시 이메일 입력" placeholder="가입시 등록한 이메일"></p>
										<button type="submit">찾기</button>
									</fieldset>
								</form>
							</div>
						</div>
					</li>
				</ul>
					<div class="btnBox inner" align=center>
						<button type="submit" class="defaultBtn">로그인</button>
						<button name="취소" onclick='history.go(-1)' class="defaultBtn">취소</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>