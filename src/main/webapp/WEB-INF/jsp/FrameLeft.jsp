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
</head>

<script type="text/javascript">
	function fn_leftMenu(cd){
		var url="";
		if(cd == 1){
			url="Login";
		} else if(cd == 2){
			if(parent.top.document.getElementById("lngCk") == ""){
			}
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
		}
		
		parent.body.location.href="http://localhost:9085/"+url;
	}

</script>

<body>
	<input type="hidden" id="" name="lngCk" value="9"/>
	<br/><span class="btn_b"><a href="" onClick="fn_leftMenu(1);" title="로그인" style="font-size: 15px;font-style: inherit;font-weight: bold;">1- 로그인 >></a></span>
	<br/>
	<br/><span class="btn_b"><a href="" onClick="fn_leftMenu(2);" title="사용자 목록" style="font-size: 15px;font-style: inherit;font-weight: bold;">2- 사용자 목록 >></a></span>
	<br/>&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(3);" title="사용자" style="font-size: 15px;font-style: inherit;font-weight: bold;">2-1 사용자 정보 >></a></span>
	<br/>&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(6);" title="사용자 그룹지정" style="font-size: 15px;font-style: inherit;font-weight: bold;">2-2 사용자 그룹지정 >></a></span>
	<br/>
	<br/><span class="btn_b"><a href="" onClick="fn_leftMenu(4);" title="그룹목록" style="font-size: 15px;font-style: inherit;font-weight: bold;">3- 사용자 그룹목록 >></a></span>
	<br/>&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(5);" title="사용자그룹" style="font-size: 15px;font-style: inherit;font-weight: bold;">3-1 사용자 그룹 >></a></span>
	<br/>&nbsp;<span class="btn_b"><a href="" onClick="fn_leftMenu(7);" title="그룹 사용자지정" style="font-size: 15px;font-style: inherit;font-weight: bold;">3-2 그룹 사용자지정 >></a></span>
	<!-- 	<input type="text" id="usr" name="usr" value="left" style="text-align-last: end;media-volume-sliderthumb"/> -->
</body>
</html>