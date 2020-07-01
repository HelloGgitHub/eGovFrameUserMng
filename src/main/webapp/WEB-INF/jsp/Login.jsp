<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
	<title>�α���</title>
	<%@ include file="/WEB-INF/jsp/cmm/head.jsp" %>
	<script type="text/javaScript" language="javascript" defer="defer">
		/*********************************************************
		 * �ʱ�ȭ
		 ******************************************************** */
		function fn_egov_init(){
			
		}
		
		/*********************************************************
		 * �α���
		 ******************************************************** */
		function fn_login(){
			var rtnData = new Object();
			var userData = new Object();
			userData.usrId				=	$("#userId").val();
			userData.password		=	$("#password").val();

			//APIȣ��
			rtnData = fn_calApi("POST", "/login/idpw", userData, false);
			
			if(rtnData.RESULTCD == 0){
				fn_movelogin();
			}else{
				alert(rtnData.RESULTMSG);
				return;
			}
		}
	
		function fn_movelogin(){
			location.href=baseUrl+"/UserList";
		}

		function fn_arovRequest(){
			location.href=baseUrl+"/UserInfo?callType=c&userId=";
		}









		

		function fn_test(){
			var userData = new Object();
			userData.usrId				=	$("#userId").val();
			userData.password		=	$("#password").val();

			var p="";
			var tUrl="";
			$.each(userData, function(key, value){
			    p = p + key + "=" + value+"&";
			});
			tUrl = "?"+p.substring(0,(p.length-1))
			alert(tUrl);
			
			for (const key in userData) {
				 console.log(key);
				 console.log(userData.key);
			}
		}

	</script>
	</head>
<body>

	<from name="login" id="login">
		<div class="board">
			<h1>�α���</h1>
			<table class="wTable" summary="�α���">
			<colgroup>
				<col style="width: 22%; height:20px">
				<col style="width: 78%; height:20px">
			</colgroup>
			<tbody>
				<tr style="height:30px">
					<th><label for="userId">ID</label> <span class="pilsu">*</span></th>
					<td class="left">
						<input id="userId" name="userId" title="�����ID" type="text" value="" size="50" maxlength="20" style="height:20px;width:100%;"/>
					</td>
				</tr>
				<!-- ��й�ȣ -->
				<tr style="height:30px">
					<th><label for="password">PASSWORD</label> <span class="pilsu">*</span></th>
					<td class="left">
					   <input id="password" name="password" title="��й�ȣ �Է�" type="password" value="" size="50" maxlength="20" style="height:20px;width:100%;"/>
					</td>
				</tr>
			</tbody>
			</table>
			<br>
			<!-- �ϴ� ��ư -->
			<button title="test" onclick="fn_test()">test</button> 
			<button title="�α���" onclick="fn_login()">�α���</button>
			<button title="ȸ������" onclick="fn_arovRequest()">ȸ������</button>
		</div>
	</from>
</body>
</html>