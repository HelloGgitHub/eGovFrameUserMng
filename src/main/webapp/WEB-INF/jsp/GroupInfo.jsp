<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>����ڰ���</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="/css/egovframework/com/com.css">
<script src="/js/egovframework/com/cmm/jquery-1.4.2.min.js"></script>
<script src="/js/egovframework/com/cmm/jquery.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">

	var iddbck = false;
    var bCancel = false;
    var caltype 	= "<%=request.getParameter("callType") %>";
    var userId 		= "<%=request.getParameter("userId") %>";


 /*********************************************************
  * �ʱ�ȭ
  ******************************************************** */
$(document).ready(function(){
	inputCellSet(caltype);
});


function inputCellSet(type) {
	//ȣ��Ÿ�Կ� ���� �Է�ȯ�� ����
	if(type == "c"){ //insert
		$("#btn_Modify").attr("disabled",true);
		$("#btn_Modify").css("display","none"); 
		$("#btn_Del").attr("disabled",true);
		$("#btn_Del").css("display","none");
		$("#inUserId").val("");
		$("#inUserNm").val("");
		$("#inPassword").val("");
		$("#inPassword2").val("");
		$("#inPasswordHint").val("");
		$("#inPasswordCnsr").val("");
		$("#inSexdstnCode").val("");
		$("#inAreaNo").val("");
		$("#inMiddleTelno").val("");
		$("#inEndTelno").val("");
		$("#inUserFxnum").val("");
		$("#inMoblphonNo").val("");
		$("#inUserEmailAdres").val("");
		$("#inZip").val("");
		$("#inAdres").val("");
		$("#inDetailAdres").val("");
		$("#inUserSttus").attr("disabled",true);
		$("#inUserSttus").val("A");
	}else if(type == "r"){  //readOnly
		$("#btn_Arov").attr("disabled",true);
		$("#btn_Arov").css("display","none");
		$("#btn_Modify").attr("disabled",true);
		$("#btn_Modify").css("display","none"); 
		$("#btn_Del").attr("disabled",true);
		$("#btn_Del").css("display","none");
		$("#inUserId").attr("readonly",true);
		$("#btnUserId").attr("disabled",true);
		$("#inUserNm").attr("readonly",true);
		$("#inPassword").attr("readonly",true);
		$("#inPassword2").attr("readonly",true);
		$("#inPasswordHint").attr("readonly",true);
		$("#inPasswordCnsr").attr("readonly",true);
		$("#inSexdstnCode").attr("readonly",true);
		$("#inAreaNo").attr("readonly",true);
		$("#inMiddleTelno").attr("readonly",true);
		$("#inEndTelno").attr("readonly",true);
		$("#inUserFxnum").attr("readonly",true);
		$("#inMoblphonNo").attr("readonly",true);
		$("#inUserEmailAdres").attr("readonly",true);
		$("#inZip").attr("readonly",true);
		$("#inAdres").attr("readonly",true);
		$("#inDetailAdres").attr("readonly",true);
		$("#inUserSttus").attr("readonly",true);
		fn_DetailUser();
	}else if(type == "u"){ //modify
		$("#btn_Arov").attr("disabled",true);
		$("#inUserId").attr("readonly",true);
	}
}
//�Է� �ʼ��� üũ
function required() {
	if($.trim($("#inUserId").val()).length == 0){
		alert("����ھ��̵���(��) �ʼ� �Է°��Դϴ�.");$("#inUserId").focus();return;
	} else if($.trim($("#inUserNm").val()).length == 0){
		alert("������̸���(��) �ʼ� �Է°��Դϴ�.");$("#inUserNm").focus();return;
	} else if($.trim($("#inPassword").val()).length == 0){
		alert("��й�ȣ��(��) �ʼ� �Է°��Դϴ�.");$("#inPassword").focus();return;
	} else if($.trim($("#inPasswordHint").val()).length == 0){
		alert("��й�ȣ��Ʈ��(��) �ʼ� �Է°��Դϴ�.");$("#inPasswordHint").focus();return;
	} else if($.trim($("#inPasswordCnsr").val()).length == 0){
		alert("��й�ȣ������(��) �ʼ� �Է°��Դϴ�.");$("#inPasswordCnsr").focus();return;
	} else if($.trim($("#inAreaNo").val()).length == 0){
		alert("��������ȣ��(��) �ʼ� �Է°��Դϴ�.");$("#inAreaNo").focus();return;
	} else if($.trim($("#inMiddleTelno").val()).length == 0){
		alert("���߰���ȭ��ȣ��(��) �ʼ� �Է°��Դϴ�.");$("#inMiddleTelno").focus();return;
	} else if($.trim($("#inEndTelno").val()).length == 0){
		alert("����������ȭ��ȣ��(��) �ʼ� �Է°��Դϴ�.");$("#inEndTelno").focus();return;
	} else if($.trim($("#inMoblphonNo").val()).length == 0){
		alert("�ڵ�����ȣ��(��) �ʼ� �Է°��Դϴ�.");$("#inMoblphonNo").focus();return;
	} else if($.trim($("#inUserEmailAdres").val()).length == 0){
		alert("�̸����ּ���(��) �ʼ� �Է°��Դϴ�.");$("#inUserEmailAdres").focus();return;
	} else if($.trim($("#inZip").val()).length == 0){
		alert("�����ȣ��(��) �ʼ� �Է°��Դϴ�.");$("#inZip").focus();return;
	} else if($.trim($("#inAdres").val()).length == 0){
		alert("�ּ���(��) �ʼ� �Է°��Դϴ�.");$("#inAdres").focus();return;
	} else if($.trim($("#inUserSttus").val()).length == 0){
		alert("����ڻ����ڵ���(��) �ʼ� �Է°��Դϴ�.");$("#inUserSttus").focus();return;
	}
}
   //�Է°� ���� üũ
function maxlength() { 
	if($.trim($("#inUserId").val()).length >= 20){
		alert("�Ϲ�ȸ�����̵���(��) 20�� �̻� �Է��Ҽ� �����ϴ�.");$("#inUserId").focus();return false;
	} else if($.trim($("#inUserNm").val()).length >= 50){
		alert("�Ϲ�ȸ���̸���(��) 50�� �̻� �Է��Ҽ� �����ϴ�.");$("#inUserNm").focus();return;
	} else if($.trim($("#inPassword").val()).length >= 100){
		alert("��й�ȣ������(��) 100�� �̻� �Է��Ҽ� �����ϴ�.");$("#inPassword").focus();return;
	} else if($.trim($("#inAreaNo").val()).length >= 4){
		alert("��������ȣ��(��) 4�� �̻� �Է��Ҽ� �����ϴ�.");$("#inAreaNo").focus();return;
	} else if($.trim($("#inMiddleTelno").val()).length >= 4){
		alert("���߰���ȭ��ȣ��(��) 4�� �̻� �Է��Ҽ� �����ϴ�.");$("#inMiddleTelno").focus();return;
	} else if($.trim($("#inEndTelno").val()).length >= 4){
		alert("����������ȭ��ȣ��(��) 4�� �̻� �Է��Ҽ� �����ϴ�.");$("#inEndTelno").focus();return;
	} else if($.trim($("#inUserFxnum").val()).length >= 15){
		alert("�ѽ���ȣ��(��) 15�� �̻� �Է��Ҽ� �����ϴ�.");$("#inMoblphonNo").focus();return;
	} else if($.trim($("#inMoblphonNo").val()).length >= 15){
		alert("�ڵ�����ȣ��(��) 15�� �̻� �Է��Ҽ� �����ϴ�.");$("#inMoblphonNo").focus();return;
	} else if($.trim($("#inUserEmailAdres").val()).length >= 50){
		alert("�̸����ּ���(��) 50�� �̻� �Է��Ҽ� �����ϴ�.");$("#inUserEmailAdres").focus();return;
	} else if($.trim($("#inAdres").val()).length >= 100){
		alert("�ּ���(��) 100�� �̻� �Է��Ҽ� �����ϴ�.");$("#inAdres").focus();return;
	}
}
	





/*********************************************************
 * ȸ������ ����
 ******************************************************** */
function id_update(){
	var userData = new Object();
	
		userData.inUserId				=	$("#inUserId").val();
		userData.inUserNm				=	$("#inUserNm").val();
		userData.inPassword			=	$("#inPassword").val();
		userData.inPasswordHint		=	$("#inPasswordHint").val();
		userData.inPasswordCnsr		=	$("#inPasswordCnsr").val();
		userData.inSexdstnCode		=	$("#inSexdstnCode").val();
		userData.inAreaNo 				=	$("#inAreaNo").val();
		userData.inMiddleTelno		= 	$("#inMiddleTelno").val();
		userData.inEndTelno			=	$("#inEndTelno").val();
		userData.inUserFxnum		=	$("#inUserFxnum").val();
		userData.inMoblphonNo		=	$("#inMoblphonNo").val();
		userData.inUserEmailAdres	=	$("#inUserEmailAdres").val();
		userData.inZip					=	$("#inZip").val();
		userData.inAdres				=	$("#inAdres").val();
		userData.inDetailAdres		=	$("#inDetailAdres").val();
		userData.inUserSttus			=	$("#inUserSttus").val();
	var jsonData = JSON.stringify(userData);
	console.log(jsonData);
	
	$.ajax({
		type:"PUT",
		url:"http://192.168.56.1:8081/member/changeMbrInfo",
		contentType: 'application/json; charset=utf-8',
		dataType:'json',
		data:jsonData,
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
				alert("success");
			}else{
				alert("ERROR!");return;
			} 
		}
	});
}

/*********************************************************
 * ȸ������ ���� ����
 ******************************************************** */
function id_updateState(){
	var userData = new Object();
		userData.inUserId					=	$("#inUserId").val();
		userData.inUserSttus			=	$("#userState").val();
		
	var jsonData = JSON.stringify(userData);
	console.log(jsonData);
	
	$.ajax({
		type:"PUT",
		url:"http://192.168.56.1:8081/member/changeMbrState",
		contentType: 'application/json; charset=utf-8',
		dataType:'json',
		data:jsonData,
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
				alert("success");
			}else{
				alert("ERROR!");return;
			} 
		}
	});
}






















/*********************************************************
 * ȸ������ ����
 ******************************************************** */
function id_delete(){
	var userData = new Object();
		userData.inUserId				=	$("#inUserId").val();
	var jsonData = JSON.stringify(userData);
	console.log(jsonData);
	
	$.ajax({
		type:"DELETE",
		url:"http://192.168.56.1:8081/member/deleteMbrInfo",
		contentType: 'application/json; charset=utf-8',
		dataType:'json',
		data:jsonData,
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
				alert("success");
			}else{
				alert("ERROR!");return;
			} 
		}
	});
}
/*********************************************************
 * ȸ����� ��û
 ******************************************************** */
function id_insert(){

	if(confirm("����Ͻðڽ��ϱ�?")){	
		required(); //�ʼ��� üũ
		maxlength(); //�ִ� ���� üũ
		if($("#inPassword").val() != $("#inPassword2").val()){
            alert("��й�ȣ�� ��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
            return;
        }
	}
	
	if(iddbck == false){
		alert("���̵� �ߺ�üũ�� ���ּ���.");
		return;
	}
	
	var userData = new Object();
	userData.usrId					=	$("#inUserId").val();//
	userData.usrNm				=	$("#inUserNm").val();
	userData.password			=	$("#inPassword").val(); //
	userData.passwordHint		=	$("#inPasswordHint").val();  //
	userData.passwordCnsr		=	$("#inPasswordCnsr").val(); //
	userData.sexdstnCode		=	$("#inSexdstnCode").val();
	userData.areaNo 				=	$("#inAreaNo").val();  //
	userData.middleTelno			= 	$("#inMiddleTelno").val();
	userData.endTelno			=	$("#inEndTelno").val();
	userData.userFxnum			=	$("#inUserFxnum").val();
	userData.moblphonNo		=	$("#inMoblphonNo").val();
	userData.userEmailAdres	=	$("#inUserEmailAdres").val();
	userData.zip					=	$("#inZip").val();  //
	userData.adres				=	$("#inAdres").val(); //
	userData.detailAdres			=	$("#inDetailAdres").val();
	userData.usrSttus			=	$("#inUserSttus").val();

	var jsonData = JSON.stringify(userData);
	console.log(jsonData);
	
	$.ajax({
		type:"POST",
		url:"http://localhost:9085/user/arovRequest",
		contentType: 'application/json; charset=utf-8',
		dataType:'json',
		data:jsonData,
		timeout:(1000*30),
		success:function(returnData){
			console.log(returnData);
			alert(returnData.RESULTMSG);
			inputCellSet("r");
			return;
		},
		error:function(){
			alert("ERROR!");return;
		}
	});
}
/**************
 * �����ID �ߺ� üũ
 **************/
function fn_UserCk(){
	if($.trim($("#inUserId").val()).length == 0){
		alert("����ھ��̵���(��) �ʼ� �Է°��Դϴ�.");$("#inUserId").focus();return;
	}
	$.ajax({
		type:"GET",
		url:"http://localhost:9085/user/detailInfo/" + $("#inUserId").val(),
		contentType: 'application/json; charset=utf-8',
		timeout:(1000*30),
		success:function(returnData){
			
			var obj = JSON.parse(returnData);
			console.log(obj.list);
			console.log(obj.list.length);
			
			if(obj.list.length==0 || obj.list == null){
				alert("��밡���� ID�Դϴ�.");
				iddbck = true;
				return;
			}else{
				alert("�ش� ID�� ��� �� �� �����ϴ�.");
				return;
			}
			console.log(JSON.stringify(returnData));
		},
		error:function(){
			alert("��ſ���");
			return;
		}
	});
}


/* input : userId
 * ����� ���� ��ȸ
 */
function fn_DetailUser(){
	var pUserId="";
	alert(userId);
	if(userId == null && userId == ""){
		alert("����Ÿ�� �ȵ�");
		pUserId = $("#inUserId").val();
	}else{
		pUserId = userId;
	}
	
	
	console.log("detail param:===" + pUserId );
    $.ajax({
        type : "GET", //���۹���� �����Ѵ� (POST,GET)
        url : "http://localhost:9085/user/detailInfo/"+pUserId,//ȣ�� URL�� �����Ѵ�. GET����ϰ�� �ڿ� �Ķ�Ƽ�͸� �ٿ��� ����ص��ȴ�.
        dataType : "text",//ȣ���� �������� �����̴�. xml,json,html,text���� ���� ����� ����� �� �ִ�.
        error : function(){    //error: whenError
            alert("��Ž���!!!!");
        },
        success : function(data){    //success: whenSuccess,
        	console.log("detail>< Data::"+data);
			var arrlist = new Array();
        	const obj = JSON.parse(data)
        	arrlist = obj.list;
        	const obj2 = arrlist[0]; 
        	
        	console.log(">>>" + obj2.userNm);
 			$("#inUserId").val(pUserId);
			$("#btnUserId").enable = true;
			$("#inUserNm").val(obj2.userNm);
			$("#inPassword").val("");
			$("#inPassword2").val("");
			$("#inPasswordHint").val(obj2.passwordHint);
			$("#inPasswordCnsr").val(obj2.passwordCnsr);
			$("#inSexdstnCode").val(obj2.sexdstnCode);
			$("#inAreaNo").val(obj2.areaNo);
			$("#inMiddleTelno").val(obj2.middleTelno);
			$("#inEndTelno").val(obj2.endTelno);
			$("#inUserFxnum").val(obj2.usrFxnum);
			$("#inMoblphonNo").val(obj2.moblphonNo);
			$("#inUserEmailAdres").val(obj2.emailAdres);
			$("#inZip").val(obj2.zip);
			$("#inAdres").val(obj2.adres);
			$("#inDetailAdres").val(obj2.detailAdres);
			$("#inUserSttus").val(obj2.sttus);
        	
        }
    });
}

/**************
 * ID�Է°� ���� �� �ߺ����̵� üũ�� �ٽ� �ѹ� �ϵ���!! ���°� �ٽ� ����
 **************/
function idmodify(){
	iddbck = false;
}

/*************
 * �ڷΰ���
 *************/
function fn_movebak(){
	window.history.back();	
}

</script>
<style>
	.modal-content {width: 400px;}
</style>
</head>

<body>
<!-- 	<form id="mberManageVO" name="mberManageVO" >  -->


	<div class="wTableFrm">
	<!-- Ÿ��Ʋ -->
	<h2 >�׷���� </h2>
	<!-- ����� -->
	<table class="wTable" summary="�Ϲ�ȸ�������� ������ ���� ����� ����մϴ�.">
	<caption>�׷����</caption>
	<colgroup>
		<col style="width: 22%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- �Է�/���� -->
		<tr>
			<th><label for="inUserId">�׷���̵�</label> <span class="pilsu">*</span></th>
			<td class="left">
				<input id="inUserId" name="inUserId" title="���̵� �Է�" onchange="idmodify()" style="width:80%;" type="text" value="" size="20" maxlength="20"/>
<!-- 				<button id="btnUserId" class="btn_s2" onClick="fn_UserCk()" title="�ߺ� ���̵� �˻�">�ߺ����̵� �˻�</button> -->
<!-- 				<button id="checkIdModal" name = "checkIdModal" class="btn_s2" onClick="fn_modal_setting()" title="�ߺ� ���̵� �˻�">�ߺ����̵� �˻�</button> -->
			</td>
		</tr>
		<!-- �׷�� -->
		<tr>
			<th><label for="inUserNm">�׷��</label> <span class="pilsu">*</span></th>
			<td class="left">
				<input id="inUserNm" name="inUserNm" title="�Ϲ�ȸ���̸� �Է�" type="text" value="" size="50" maxlength="50"/>
			</td>
		</tr>
		<!-- �׷� ���� -->
		
		<tr>
			<th><label for="inPassword">�׷� ����</label> <span class="pilsu">*</span></th>
			<td class="left">
<!-- 				<input id="grpdis" name="grpdis" title="��й�ȣ �Է�" type=" value="" size="50" maxlength="20"/> -->
				<textarea id="grpdis" name="grpdis" title="��й�ȣ �Է�" type="" style="resize: none;"></textarea>
			</td>
		</tr>
	</tbody>
	</table>
	<br>
	<!-- �ϴ� ��ư -->
	<button title="�ڷΰ���" 		id="btn_movBak" onclick="fn_movebak();" >�ڷΰ���</button> 
	<button title="ȸ�����Խ�û" 	id="btn_Arov" 		onclick="id_insert();">���</button>
	<button title="ȸ����������" 	id="btn_Modify" 	onclick="id_update();">����</button>
	<button title="ȸ����������" 	id="btn_Del" 		onclick="id_delete();">����</button>
	<br>

<!-- ��й�ȣ���� -->
<!-- �����ȣ�˻� -->
 <input type="hidden" name="zip_url" value="/egovframework-all-in-one/sym/ccm/zip/EgovCcmZipSearchPopup.do" />
<!-- </form> -->

<!-- Egov Modal include  -->

</body>
</html>