<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="/css/egovframework/com/com.css">
	<script src="/js/egovframework/com/cmm/jquery-1.4.2.min.js"></script>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
</head>

<script type="text/javascript">
	function fn_leftMenu(cd){
		var baseUrl="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()%>";
		var url="";
		if(cd == 1){
			url="Login";
		} else if(cd == 2){
			url="UserList";
		} else if(cd == 3){
			url="UserInfo?callType=c&userId=";
		} else if(cd == 4){
			url="GroupList";
		} else if(cd == 5){
			url="GroupInfo?callType=c&groupId=";
		} else if(cd == 6){
			url="GroupUserSet?callType=c&userId=";
		} else if(cd == 7){
			url="UserGroupSet?callType=c&groupId=";
		} else if(cd == 88){
			url="/swagger-ui.html#/";
		} else if(cd == 99){
			url="/db-console";
		} else if(cd == 00){
			url="/download/eGovFrameUserMng.zip";
		}
		parent.body.location.href=url;
	}
</script>

<body>
	<input type="hidden" id="" name="lngCk" value="9"/>
	
	<br><span class="btn_b"><a href="" onClick="fn_leftMenu(1);" title="로그인" style="font-size: 15px;font-style: inherit;font-weight: bold;">- 로그인</a></span>
	<br>
	<br><span class="btn_b" style="font-size: 15px;font-style: inherit;font-weight: bold;">- 사용자 관리</span>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(3);" title="사용자" style="font-size: 15px;font-style: inherit;font-weight: bold;">사용자 등록</a></span>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(2);" title="사용자 목록" style="font-size: 15px;font-style: inherit;font-weight: bold;">사용자 목록</a></span>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(6);" title="사용자 그룹지정" style="font-size: 15px;font-style: inherit;font-weight: bold;">사용자 그룹지정</a></span>	
	<br>
	<br><span class="btn_b" style="font-size: 15px;font-style: inherit;font-weight: bold;">- 사용자 그룹 관리</span>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(5);" title="그룹 등록" style="font-size: 15px;font-style: inherit;font-weight: bold;">그룹 등록</a></span>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(4);" title="그룹 목록" style="font-size: 15px;font-style: inherit;font-weight: bold;">그룹 목록</a></span>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(7);" title="그룹 사용자지정" style="font-size: 15px;font-style: inherit;font-weight: bold;">그룹 사용자 지정</a></span>
	<br><br>
	<br><span class="btn_b" style="font-size: 15px;font-style: inherit;font-weight: bold;">- 개발환경</span>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(88);" title="로그인사용자관리 API명세" style="font-size: 15px;font-style: inherit;font-weight: bold;">API 명세</a></span>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(99);" title="로그인사용자관리 DB스키마" style="font-size: 15px;font-style: inherit;font-weight: bold;">DB 스키마</a></span>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(00);" title="소스 다운로드" style="font-size: 15px;font-style: inherit;font-weight: bold;">소스 다운로드</a></span>
</body>
</html>