<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="/css/egovframework/com/com.css">
	<script src="/js/egovframework/com/cmm/jquery-1.4.2.min.js"></script>
</head>

<script type="text/javascript">
	function fn_leftMenu(cd){
// 		alert(cd);
		var url="";
		if(cd == 1){
			url="Login";
		} else if(cd == 2){

// 			alert(window.parent.frames["top"].document.getElementById("loginCk"););
// 			ex) $('audio', window.parent.frames["music"].document).get(0);
			
// 			alert($("#lngCk").val());
			
// 			alert(parent.parent.parent.document.getElementById("loginCk"));
// 			alert(parent.parent.document.getElementById("loginCk"));
// 			alert(parent.document.getElementById("loginCk"));

// 			alert(parent.parent.parent.top.document.getElementById("loginCk"));
// 			alert(parent.parent.top.document.getElementById("loginCk"));
// 			alert(parent.top.document.getElementById("loginCk"));
// 			alert(top.document.getElementById("loginCk"));
// 			alert(parent.getElementById("lngCk"));
			if(parent.top.document.getElementById("lngCk") == ""){
				
			}
			url="UserList";
		} else if(cd == 3){
			url="UserInfo?callType=c&userId=";
		}
		
		parent.body.location.href="http://localhost:9085/"+url;
			
	}

</script>

<body>
	<input type="hidden" id="" name="lngCk" value="9"/>
	<br>
	<span class="btn_b"><a href="" onClick="fn_leftMenu(1);"  title="로그인" style="font-size: 15px;font-style: inherit;font-weight: bold;">- 로그인 >></a></span>
	<br>
	<span class="btn_b"><a href="" onClick="fn_leftMenu(2);"  title="사용자 목록" style="font-size: 15px;font-style: inherit;font-weight: bold;">- 사용자 목록 >></a></span>
	<br>
	<span class="btn_b"><a href="" onClick="fn_leftMenu(3);"  title="사용자 상세정보" style="font-size: 15px;font-style: inherit;font-weight: bold;">- 사용자 상세정보 >></a></span>
</body>
</html>