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
			url="GroupInfo";
		}
		
		parent.body.location.href="http://localhost:9085/"+url;
			
	}

</script>

<body>
	<input type="hidden" id="" name="lngCk" value="9"/>
	<br>
	<span class="btn_b"><a href="" onClick="fn_leftMenu(1);"  title="�α���" style="font-size: 15px;font-style: inherit;font-weight: bold;">- �α��� >></a></span>
	<br>
	<span class="btn_b"><a href="" onClick="fn_leftMenu(2);"  title="����� ���" style="font-size: 15px;font-style: inherit;font-weight: bold;">- ����� ��� >></a></span>
	<br>
	<span class="btn_b"><a href="" onClick="fn_leftMenu(3);"  title="����� ������" style="font-size: 15px;font-style: inherit;font-weight: bold;">- ����� ������ >></a></span>
	<br>
	<span class="btn_b"><a href="" onClick="fn_leftMenu(4);"  title="�׷����" style="font-size: 15px;font-style: inherit;font-weight: bold;">- ����� �׷���� >></a></span>
<!-- 	<input type="text" id="usr" name="usr" value="left" style="text-align-last: end;media-volume-sliderthumb"/> -->
</body>
</html>