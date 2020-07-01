<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
	<style>
       /* The Modal (background) */
       .modal {
           display: none; /* Hidden by default */
           position: fixed; /* Stay in place */
           z-index: 1; /* Sit on top */
           left: 0;
           top: 0;
           width: 100%; /* Full width */
           height: 100%; /* Full height */
           overflow: auto; /* Enable scroll if needed */
           background-color: rgb(0,0,0); /* Fallback color */
           background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
       }
   
       /* Modal Content/Box */
       .modal-content {
           background-color: #fefefe;
           margin: 15% auto; /* 15% from the top and centered */
           padding: 10px;
           border: 1px solid #888;
           width: 30%; /* Could be more or less, depending on screen size */                          
       }

	</style>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="/css/egovframework/com/com.css">
	<script src="/js/egovframework/com/cmm/jquery-1.4.2.min.js"></script>
	<script src="/js/egovframework/com/cmm/jquery.js"></script>
	<script src="/js/egovframework/com/cmm/jquery-ui_1.12.1.js"></script>
	<script src="/js/egovframework/com/cmm/showModalDialog.js"></script>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	
	<script type="text/javaScript" language="javascript" defer="defer">

		var baseUrl="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()%>";
		var pageUrl= document.location.href;
		/*********************************************************
		 * Ajax 호출
		 ******************************************************** */
		function fn_calApi(cType, cPath, cParam, sync){
			
			console.log("Call Type::"+cType+"\nPath::"+cPath+"\nparam::"+cParam+"\nsync::"+sync);
			var rval = new Object();
			var userData = new Object();
			var tUrl = "";
			if((cType=="GET"||cType=="DELETE") && cParam != null){
				var p = "";
				$.each(cParam, function(key, value){
				    p = p + key + "=" + value+"&";
				});
				tUrl = baseUrl+"/"+cPath+"?"+p.substring(0,(p.length-1));
				alert(tUrl);
			}else{
				tUrl = baseUrl+cPath
			}
			var jsonData = JSON.stringify(cParam);
			
			$.ajax({
				type: cType,
				url: tUrl,
				contentType: 'application/json; charset=utf-8',
	 			dataType:'text',
				data:jsonData,
				async: sync,
				timeout:(1000*30),
				success:function(data){
					console.log("response Data : " + data);
					const obj = JSON.parse(data);
					rval = obj;
					console.log(rval.RESULTMSG);
				},
				error:function(data){
					alert(data);
					return;
				}
			});
			return rval;
		}

		function close_pop(flag) {
		    $('#myModal').hide();
		}

		function fn_testhd (){
			$('#myModal').show();
		}
		
	</script>
	</head>
	
	<body>

		<div id="myModal" class="modal">
			<div class="modal-content">
				<table>
					<tr>
						<td style="text-align: center;">
							<b>
								&nbsp;&nbsp;<span style="font-size: 13pt;">&nbsp;&nbsp;비밀번호변경</span>
							</b>
						</td>
						<td style="align-items: center;text-align-last: end;">
							<img src="/images/egovframework/com/cmm/btn/btn_del.png" border='0' align='close' onClick="close_pop();" alt='닫기' style="cursor:pointer;"  />
						</td>
					</tr>
				</table>
				
				<table class="wTable" >
					<tr>
						<th><p style="text-align: center; line-height: 1;">사용자ID</p></th>
						<td style="padding: 5px 5px;">
							<input type="text" id="layUserId" name="layUserId" value="TESTUSER" disabled="true">
						</td>
					</tr>
					<tr>
						<th><p style="text-align: center; line-height: 1;">기존패스워드</p></th>
						<td style="padding: 5px 5px;">
							<input type="password" id="layAsisPwd" name="layAsisPwd" value="1234" >
						</td>
					</tr>
					<tr>
						<th><p style="text-align: center; heline-height: 1;">변경할 패스워드</p></th>
						<td style="padding: 5px 5px;">
							<input type="password" id="layTobePwd" name="layTobePwd" value="4444" >
						</td>
					</tr>
					<tr>
						<th><p style="text-align: center; line-height: 1;">패스워드 확인</p></th>
						<td style="padding: 5px 5px;">
							<input type="password" id="layTobePwd2" name="layTobePwd2" value="5555" >
						</td>
					</tr>
				</table>
				<tr>
					<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 3px;padding-top: 3px;margin-top:3px;" onClick="modifyPassword();">
						<b><span class="pop_bt" style="font-size: 12pt;">확  인</span></b>
					</div>
				</tr>
			</div>
		</div>



</body>
</html>