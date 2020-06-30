<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
	<title>일반회원관리 등록</title>
	
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="/css/egovframework/com/com.css">
	<script src="/js/egovframework/com/cmm/jquery.js"></script>
	<script src="/js/egovframework/com/cmm/jquery-1.4.2.min.js"></script>
	
	<script type="text/javaScript" language="javascript" defer="defer">
		/*********************************************************
		 * 초기화
		 ******************************************************** */
		function fn_egov_init(){
			
		}
		
		/*********************************************************
		 * 로그인
		 ******************************************************** */
		function fn_login(){
			var userData = new Object();
			userData.usrId				=	$("#userId").val();
			userData.password		=	$("#password").val();
			var jsonData = JSON.stringify(userData);
			console.log(jsonData);
			$.ajax({
				type:"POST",
				url:"http://localhost:9085/login/idpw",
				contentType: 'application/json; charset=utf-8',
	 			dataType:'json',
				data:jsonData,
				timeout:(1000*30),
				success:function(returnData){
					console.log(returnData);
					console.log(returnData.RESULTMSG);
	
					if(returnData.RESULTCD == 0){
						fn_movelogin();
					}else{
						alert(returnData.RESULTMSG);
						return;
					}
				},
				error:function(data){
					alert(data);
					return;
				}
			});
		}
	
		function fn_movelogin(){
			location.href="http://localhost:9085/UserList";
		}

		function fn_arovRequest(){
			location.href="http://localhost:9085/UserInfo?callType=c&userId=";
		}


		function fn_test(){

// 			opener.document.getElementById("usr").value="value1"; //dom 객체로 제어
// 			console.log($("#top",opener.document).val("usr")); // jQuery 방식 1
			console.log($("input[name=usr]", parent.document.top).val()); // 방식 2
// 			console.log($(opener.document).find("#usr").val("value3")); //방식 3
				 
// 			- opener.location.href="javascript:fun();"; //일반적인 방법
// 			$(opener.location).attr("href","javascript:fun();"); //jQuery 이용

			alert($('#top').contents().find('#usr').html());
// 			parent.top.document.getElementById("usr") = "dddddd";
// 			parent.parent.top.document.getElementById("usr") = "dddddd";
// 			parent.parent.parent.top.document.getElementById("usr") = "dddddd";
// 			parent.parent.parent.parent.top.document.getElementById("usr") = "dddddd";
// 			parent.parent.parent.parent.parent.top.document.getElementById("usr") = "dddddd";
// 			parent.parent.parent.parent.parent.parent.top.document.getElementById("usr") = "dddddd";
		}
	</script>
	</head>
<body>

	<from name="login" id="login">
		<div class="board">
			<h1>로그인</h1>
			<table class="wTable" summary="로그인">
			<colgroup>
				<col style="width: 22%; height:20px">
				<col style="width: 78%; height:20px">
			</colgroup>
			<tbody>
				<tr style="height:30px">
					<th><label for="userId">ID</label> <span class="pilsu">*</span></th>
					<td class="left">
						<input id="userId" name="userId" title="사용자ID" type="text" value="" size="50" maxlength="20" style="height:20px;width:100%;"/>
					</td>
				</tr>
				<!-- 비밀번호 -->
				<tr style="height:30px">
					<th><label for="password">PASSWORD</label> <span class="pilsu">*</span></th>
					<td class="left">
					   <input id="password" name="password" title="비밀번호 입력" type="password" value="" size="50" maxlength="20" style="height:20px;width:100%;"/>
					</td>
				</tr>
			</tbody>
			</table>
			<br>
			<!-- 하단 버튼 -->
			<button title="test" onclick="fn_test()">test</button> 
			<button title="로그인" onclick="fn_login()">로그인</button>
			<button title="회원가입" onclick="fn_arovRequest()">회원가입</button>
		</div>
	</from>
</body>
</html>