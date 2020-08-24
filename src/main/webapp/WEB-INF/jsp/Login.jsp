<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<%@ include file="/WEB-INF/jsp/cmm/head.jsp" %>

<link type="text/css" rel="stylesheet" href="/css/egovframework/com/com.css">
<link type="text/css" rel="stylesheet" href="/css/egovframework/com/uat/uia/login.css">
<link type="text/css" rel="stylesheet" href="/css/test.css">

<script type="text/javaScript" language="javascript" defer="defer">
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	$(document).ready(function(){
		parent.parent.topFrame.document.all.infoImg.style.display = "none";
		parent.parent.topFrame.document.all.lgnUserId.value= "";
		parent.parent.topFrame.document.all.lgnMnt.value= "";
	});

	/*********************************************************
	 * 로그인
	 ******************************************************** */
	function fn_login(){
		var rtnData = new Object();
		var userData = new Object();
		
		userData.usrId				=	$("#userId").val();
		userData.password		=	$("#password").val();

		//API호출
		rtnData = fn_calApi("POST", "/login/idpw", userData, false);
		
		if(rtnData.RESULTCD == 0){
			parent.parent.topFrame.document.all.infoImg.style.display = "block";
			parent.parent.topFrame.document.all.lgnUserId.value= rtnData.list.userId;
			parent.parent.topFrame.document.all.lgnMnt.value= rtnData.list.userNm+" 님 환영합니다.";
			alert(rtnData.list.userNm+" 님 환영합니다.");
			fn_movelogin();
		}else {
			alert(rtnData.RESULTMSG);
			return;
		}
	}
	
	function fn_movelogin(){
		location.href="/UserList";
	}
	
	function fn_arovRequest(){
		location.href="/UserInfo?callType=c&userId=";
	}
	
</script>
</head>
<body style="inline-size: max-content;height: 300px;">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 일반로그인 -->
<div class="login_form">
	<input type="hidden" id="message" name="message" value="">
	
	<fieldset>
		<div class="login_input">
			<ul>
				<li>
					<label for="id">아이디</label>
					<input type="text" name="userId" id="userId" maxlength="20" title="아이디 " placeholder="아이디 ">
				</li>
				<li>
					<label for="password">비밀번호</label>
					<input type="password" name="password" id="password" maxlength="20" title="비밀번호 " placeholder="비밀번호 " onKeypress="javascript:if(event.keyCode==13) fn_login()" />
				</li>
				<li>
					<input type="button" class="btn_login" value="로그인" onclick="fn_login()"> <!-- 로그인  -->
				</li>
				<li>
					<ul class="btn_idpw" >
						<li><a href="#" onclick="fn_arovRequest()">회원가입</a></li> <!-- 회원가입  -->
					</ul>
				</li>
			</ul>
		</div>
	</fieldset>
</div>
</body>
</html>