<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>�Ϲ�ȸ������ ���</title>
<script src="/js/egovframework/com/cmm/jquery-1.4.2.min.js"></script>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="/css/egovframework/com/com.css">

<script type="text/javascript"> 
     var bCancel = false; 
    function validateMberManageVO(form) {
        if (bCancel)
      return true; 
        else 
       return validateRequired(form) && validateMaxLength(form) && validatePassword1(form) && validatePassword2(form) && validatePassword3(form) && validatePassword4(form) && validateInteger(form) && validateEmail(form); 
   }
    function required () { 
     this.aa = new Array("mberId", "�Ϲ�ȸ�����̵���(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", "this.maxlength='20';  return this[varName];"));
     this.ab = new Array("mberNm", "�Ϲ�ȸ���̸���(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", "this.maxlength='50';  return this[varName];"));
     this.ac = new Array("password", "��й�ȣ��(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", " return this[varName];"));
     this.ad = new Array("passwordHint", "��й�ȣ��Ʈ��(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", " return this[varName];"));
     this.ae = new Array("passwordCnsr", "��й�ȣ������(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", "this.maxlength='100';  return this[varName];"));
     this.af = new Array("areaNo", "��������ȣ��(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ag = new Array("middleTelno", "���߰���ȭ��ȣ��(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ah = new Array("endTelno", "����������ȭ��ȣ��(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ai = new Array("moblphonNo", "�ڵ�����ȣ��(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", "this.maxlength='15';  return this[varName];"));
     this.aj = new Array("mberEmailAdres", "�̸����ּ���(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", "this.maxlength='50';  return this[varName];"));
     this.ak = new Array("zip", "�����ȣ��(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", "this.maxlength='6';  return this[varName];"));
     this.al = new Array("adres", "�ּ���(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", "this.maxlength='100';  return this[varName];"));
     this.am = new Array("mberSttus", "�Ϲ�ȸ�������ڵ���(��) �ʼ� �Է°��Դϴ�.", new Function ("varName", " return this[varName];"));
    } 
    function maxlength () { 
     this.aa = new Array("mberId", "�Ϲ�ȸ�����̵���(��) 20�� �̻� �Է��Ҽ� �����ϴ�.", new Function ("varName", "this.maxlength='20';  return this[varName];"));
     this.ab = new Array("mberNm", "�Ϲ�ȸ���̸���(��) 50�� �̻� �Է��Ҽ� �����ϴ�.", new Function ("varName", "this.maxlength='50';  return this[varName];"));
     this.ac = new Array("passwordCnsr", "��й�ȣ������(��) 100�� �̻� �Է��Ҽ� �����ϴ�.", new Function ("varName", "this.maxlength='100';  return this[varName];"));
     this.ad = new Array("areaNo", "��������ȣ��(��) 4�� �̻� �Է��Ҽ� �����ϴ�.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ae = new Array("middleTelno", "���߰���ȭ��ȣ��(��) 4�� �̻� �Է��Ҽ� �����ϴ�.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.af = new Array("endTelno", "����������ȭ��ȣ��(��) 4�� �̻� �Է��Ҽ� �����ϴ�.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ag = new Array("mberFxnum", "�ѽ���ȣ��(��) 15�� �̻� �Է��Ҽ� �����ϴ�.", new Function ("varName", "this.maxlength='15';  return this[varName];"));
     this.ah = new Array("moblphonNo", "�ڵ�����ȣ��(��) 15�� �̻� �Է��Ҽ� �����ϴ�.", new Function ("varName", "this.maxlength='15';  return this[varName];"));
     this.ai = new Array("mberEmailAdres", "�̸����ּ���(��) 50�� �̻� �Է��Ҽ� �����ϴ�.", new Function ("varName", "this.maxlength='50';  return this[varName];"));
     this.aj = new Array("adres", "�ּ���(��) 100�� �̻� �Է��Ҽ� �����ϴ�.", new Function ("varName", "this.maxlength='100';  return this[varName];"));
    } 
    function password1 () { 
     this.aa = new Array("password", "��й�ȣ��(��) 8~20�� ������ �Է��ؾ� �մϴ�.", new Function ("varName", " return this[varName];"));
    } 
    function password2 () { 
     this.aa = new Array("password", "��й�ȣ��(��) �ѱ�,Ư������,����� ������ �ʽ��ϴ�.", new Function ("varName", " return this[varName];"));
    } 
    function password3 () { 
     this.aa = new Array("password", "��й�ȣ��(��) �������� ���ڸ� 4���̻� �����ؼ� ����Ҽ� �����ϴ�.", new Function ("varName", " return this[varName];"));
    } 
    function password4 () { 
     this.aa = new Array("password", "��й�ȣ��(��) �ݺ��Ǵ� ���ڳ� ���ڸ� 4���̻� �����ؼ� ����� �� �����ϴ�.", new Function ("varName", " return this[varName];"));
    } 
    function IntegerValidations () { 
     this.aa = new Array("areaNo", "��������ȣ��(��) integer Ÿ���̾�� �մϴ�.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ab = new Array("middleTelno", "���߰���ȭ��ȣ��(��) integer Ÿ���̾�� �մϴ�.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ac = new Array("endTelno", "����������ȭ��ȣ��(��) integer Ÿ���̾�� �մϴ�.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
    } 
    function email () { 
     this.aa = new Array("mberEmailAdres", "�̸����ּ���(��) ��ȿ���� ���� �̸��� �ּ��Դϴ�.", new Function ("varName", "this.maxlength='50';  return this[varName];"));
    } 
</script>
<script type="text/javascript" src="/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js" ></script>
<script src="/js/egovframework/com/cmm/jquery.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
	/*********************************************************
	 * �ʱ�ȭ
	 ******************************************************** */
	function fn_egov_init(){
		//��� ����
	// 	fn_modal_setting();
	}
	/*********************************************************
	 * ��޼���
	 ******************************************************** */
	function fn_modal_setting(){
		//��ư�� ��� ����
		$("#btnMbrId").egovModal( "egovModal" );
		
		//Ÿ��Ʋ ����
		$("#egovModal").setEgovModalTitle("���̵� �ߺ� Ȯ��"); //���̵� �ߺ� Ȯ��
		var content = "";
		content = content + "<div class='modal-alignL' style='margin:5px 0 0 0'>"+"����Ҿ��̵� :"+"</div>"; //����Ҿ��̵�
		content = content + "<div class='modal-alignL'>"+"<input type='text' id='checkIdModal' name='checkIdModal' value='' size='20' maxlength='20' />"+"</div>";	
		content += "<div style='clear:both;'></div>";
		content += "<div id='divModalResult' style='margin:10px 0 0 0'>��� : �ߺ�Ȯ���� �����Ͻʽÿ�.</div>"; //��� : �ߺ�Ȯ���� �����Ͻʽÿ�.
		//��� body ����
		$("#egovModal").setEgovModalBody(content);
		var footer = "";
		//footer += "<div class='modal-btn'><button class='btn_s2' id='btnModalOk' onclick='fn_id_checkOk()'>Ȯ��</button></div>";
		//footer += "<div class='modal-btn'><button class='btn_s2' id='btnModalSelect' onclick='fn_id_check()'>��ȸ</button></div>";
		footer += "<span class='btn_style1 blue' id='btnModalOk' onclick='fn_id_checkOk()'><a href='#'>Ȯ��</a></span>&nbsp;";
		footer += "<span class='btn_style1 blue' id='btnModalSelect' onclick='fn_id_check()'><a href='#'>��ȸ</a></span>&nbsp;";
		//��� footer ����
		$("#egovModal").setEgovModalfooter(footer);
		
		//�����̺�Ʈó��
		$("input[name=checkIdModal]").keydown(function (key) {
			if(key.keyCode == 13){
				fn_id_check();	
			}
		});
		footer = null;
		content = null;
	}
	/*********************************************************
	 * �α���
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
// 				if(status == "success") {
					console.log(returnData);
					alert(returnData.RESULTMSG);
					
					alert("success");
// 					$('#loginTF').append(returnData);
// 				}else{
// 					 alert("ERROR!");return;
// 				} 
			}
		});
	}

// 	function callMemberList () {
// 	    $.ajax({
// 	    	crossOrigin: true,
// 	        type : "GET", 													//���۹���� �����Ѵ� (POST,GET)
// 	        url : "http://192.168.56.1:8081/member/list",		//ȣ�� URL�� �����Ѵ�. GET����ϰ�� �ڿ� �Ķ�Ƽ�͸� �ٿ��� ����ص��ȴ�.
// 	        contentType: 'application/json; charset=utf-8',
	        
// 	        dataType : "json",											//ȣ���� �������� �����̴�. xml,json,html,text���� ���� ����� ����� �� �ִ�.
// 	        error : function(){    										//error: whenError
// 	            alert("��Ž���!!!!");
// 	        },
// 	        success : function(Parse_data){    					//success: whenSuccess,   function whenSuccess(resdata)
// 	            $("#ReturnData").html(Parse_data); 		//div�� �޾ƿ� ���� �ִ´�.
// 	            console.log(Parse_data);
// 	        }
// 	    });
// 	}
	 
</script>
	<style>
		.modal-content {width: 400px;}
	</style>
</head>

<body>
<!-- <form id="login" name="login" >  -->
	<div class="wTableFrm">
	<!-- Ÿ��Ʋ -->
	<h2>�α���</h2>

	<!-- ����� -->
	<table class="wTable" summary="�Ϲ�ȸ�������� ������ ���� ����� ����մϴ�.">
	<caption>�Ϲ�ȸ������ ���</caption>
	<colgroup>
		<col style="width: 22%;">
		<col style="width: ;">
	</colgroup>
	<tbody>
		<!-- �Է�/���� -->
		<tr>
			<th><label for="userId">ID</label> <span class="pilsu">*</span></th>
			<td class="left">
				<input id="userId" name="userId" title="�����ID" type="text" value="" size="50" maxlength="50"/>
				<div></div> 
			</td>
		</tr>
		<!-- ��й�ȣ -->
		<tr>
			<th><label for="password">PASSWORD</label> <span class="pilsu">*</span></th>
			<td class="left">
			   <input id="password" name="password" title="��й�ȣ �Է�" type="password" value="" size="50" maxlength="20"/>
			   <div></div> 
			</td>
		</tr>
	</tbody>
	</table>
	<br>
	<!-- �ϴ� ��ư --> 
	<button title="�α���" onclick="fn_login();" >�α���</button>
	
	<div id="loginTF"></div>
<!-- </form> -->

<!-- Egov Modal include  -->

</body>
</html>