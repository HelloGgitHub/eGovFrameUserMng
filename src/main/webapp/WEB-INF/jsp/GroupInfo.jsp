<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>사용자관리</title>

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
  * 초기화
  ******************************************************** */
$(document).ready(function(){
	inputCellSet(caltype);
});


function inputCellSet(type) {
	//호출타입에 따라 입력환경 설정
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
//입력 필수값 체크
function required() {
	if($.trim($("#inUserId").val()).length == 0){
		alert("사용자아이디은(는) 필수 입력값입니다.");$("#inUserId").focus();return;
	} else if($.trim($("#inUserNm").val()).length == 0){
		alert("사용자이름은(는) 필수 입력값입니다.");$("#inUserNm").focus();return;
	} else if($.trim($("#inPassword").val()).length == 0){
		alert("비밀번호은(는) 필수 입력값입니다.");$("#inPassword").focus();return;
	} else if($.trim($("#inPasswordHint").val()).length == 0){
		alert("비밀번호힌트은(는) 필수 입력값입니다.");$("#inPasswordHint").focus();return;
	} else if($.trim($("#inPasswordCnsr").val()).length == 0){
		alert("비밀번호정답은(는) 필수 입력값입니다.");$("#inPasswordCnsr").focus();return;
	} else if($.trim($("#inAreaNo").val()).length == 0){
		alert("집지역번호은(는) 필수 입력값입니다.");$("#inAreaNo").focus();return;
	} else if($.trim($("#inMiddleTelno").val()).length == 0){
		alert("집중간전화번호은(는) 필수 입력값입니다.");$("#inMiddleTelno").focus();return;
	} else if($.trim($("#inEndTelno").val()).length == 0){
		alert("집마지막전화번호은(는) 필수 입력값입니다.");$("#inEndTelno").focus();return;
	} else if($.trim($("#inMoblphonNo").val()).length == 0){
		alert("핸드폰번호은(는) 필수 입력값입니다.");$("#inMoblphonNo").focus();return;
	} else if($.trim($("#inUserEmailAdres").val()).length == 0){
		alert("이메일주소은(는) 필수 입력값입니다.");$("#inUserEmailAdres").focus();return;
	} else if($.trim($("#inZip").val()).length == 0){
		alert("우편번호은(는) 필수 입력값입니다.");$("#inZip").focus();return;
	} else if($.trim($("#inAdres").val()).length == 0){
		alert("주소은(는) 필수 입력값입니다.");$("#inAdres").focus();return;
	} else if($.trim($("#inUserSttus").val()).length == 0){
		alert("사용자상태코드은(는) 필수 입력값입니다.");$("#inUserSttus").focus();return;
	}
}
   //입력값 길이 체크
function maxlength() { 
	if($.trim($("#inUserId").val()).length >= 20){
		alert("일반회원아이디은(는) 20자 이상 입력할수 없습니다.");$("#inUserId").focus();return false;
	} else if($.trim($("#inUserNm").val()).length >= 50){
		alert("일반회원이름은(는) 50자 이상 입력할수 없습니다.");$("#inUserNm").focus();return;
	} else if($.trim($("#inPassword").val()).length >= 100){
		alert("비밀번호정답은(는) 100자 이상 입력할수 없습니다.");$("#inPassword").focus();return;
	} else if($.trim($("#inAreaNo").val()).length >= 4){
		alert("집지역번호은(는) 4자 이상 입력할수 없습니다.");$("#inAreaNo").focus();return;
	} else if($.trim($("#inMiddleTelno").val()).length >= 4){
		alert("집중간전화번호은(는) 4자 이상 입력할수 없습니다.");$("#inMiddleTelno").focus();return;
	} else if($.trim($("#inEndTelno").val()).length >= 4){
		alert("집마지막전화번호은(는) 4자 이상 입력할수 없습니다.");$("#inEndTelno").focus();return;
	} else if($.trim($("#inUserFxnum").val()).length >= 15){
		alert("팩스번호은(는) 15자 이상 입력할수 없습니다.");$("#inMoblphonNo").focus();return;
	} else if($.trim($("#inMoblphonNo").val()).length >= 15){
		alert("핸드폰번호은(는) 15자 이상 입력할수 없습니다.");$("#inMoblphonNo").focus();return;
	} else if($.trim($("#inUserEmailAdres").val()).length >= 50){
		alert("이메일주소은(는) 50자 이상 입력할수 없습니다.");$("#inUserEmailAdres").focus();return;
	} else if($.trim($("#inAdres").val()).length >= 100){
		alert("주소은(는) 100자 이상 입력할수 없습니다.");$("#inAdres").focus();return;
	}
}
	





/*********************************************************
 * 회원정보 변경
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
 * 회원가입 상태 변경
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
 * 회원정보 삭제
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
 * 회원등록 신청
 ******************************************************** */
function id_insert(){

	if(confirm("등록하시겠습니까?")){	
		required(); //필수값 체크
		maxlength(); //최대 길이 체크
		if($("#inPassword").val() != $("#inPassword2").val()){
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return;
        }
	}
	
	if(iddbck == false){
		alert("아이디 중복체크를 해주세요.");
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
 * 사용자ID 중복 체크
 **************/
function fn_UserCk(){
	if($.trim($("#inUserId").val()).length == 0){
		alert("사용자아이디은(는) 필수 입력값입니다.");$("#inUserId").focus();return;
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
				alert("사용가능한 ID입니다.");
				iddbck = true;
				return;
			}else{
				alert("해당 ID는 사용 할 수 없습니다.");
				return;
			}
			console.log(JSON.stringify(returnData));
		},
		error:function(){
			alert("통신오류");
			return;
		}
	});
}


/* input : userId
 * 사용자 정보 조회
 */
function fn_DetailUser(){
	var pUserId="";
	alert(userId);
	if(userId == null && userId == ""){
		alert("여기타면 안되");
		pUserId = $("#inUserId").val();
	}else{
		pUserId = userId;
	}
	
	
	console.log("detail param:===" + pUserId );
    $.ajax({
        type : "GET", //전송방식을 지정한다 (POST,GET)
        url : "http://localhost:9085/user/detailInfo/"+pUserId,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error : function(){    //error: whenError
            alert("통신실패!!!!");
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
 * ID입력값 변경 시 중복아이디 체크를 다시 한번 하도록!! 상태값 다시 변경
 **************/
function idmodify(){
	iddbck = false;
}

/*************
 * 뒤로가기
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
	<!-- 타이틀 -->
	<h2 >그룹관리 </h2>
	<!-- 등록폼 -->
	<table class="wTable" summary="일반회원관리의 내역에 대한 목록을 출력합니다.">
	<caption>그룹관리</caption>
	<colgroup>
		<col style="width: 22%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력/선택 -->
		<tr>
			<th><label for="inUserId">그룹아이디</label> <span class="pilsu">*</span></th>
			<td class="left">
				<input id="inUserId" name="inUserId" title="아이디 입력" onchange="idmodify()" style="width:80%;" type="text" value="" size="20" maxlength="20"/>
<!-- 				<button id="btnUserId" class="btn_s2" onClick="fn_UserCk()" title="중복 아이디 검색">중복아이디 검색</button> -->
<!-- 				<button id="checkIdModal" name = "checkIdModal" class="btn_s2" onClick="fn_modal_setting()" title="중복 아이디 검색">중복아이디 검색</button> -->
			</td>
		</tr>
		<!-- 그룹명 -->
		<tr>
			<th><label for="inUserNm">그룹명</label> <span class="pilsu">*</span></th>
			<td class="left">
				<input id="inUserNm" name="inUserNm" title="일반회원이름 입력" type="text" value="" size="50" maxlength="50"/>
			</td>
		</tr>
		<!-- 그룹 설명 -->
		
		<tr>
			<th><label for="inPassword">그룹 설명</label> <span class="pilsu">*</span></th>
			<td class="left">
<!-- 				<input id="grpdis" name="grpdis" title="비밀번호 입력" type=" value="" size="50" maxlength="20"/> -->
				<textarea id="grpdis" name="grpdis" title="비밀번호 입력" type="" style="resize: none;"></textarea>
			</td>
		</tr>
	</tbody>
	</table>
	<br>
	<!-- 하단 버튼 -->
	<button title="뒤로가기" 		id="btn_movBak" onclick="fn_movebak();" >뒤로가기</button> 
	<button title="회원가입신청" 	id="btn_Arov" 		onclick="id_insert();">등록</button>
	<button title="회원정보변경" 	id="btn_Modify" 	onclick="id_update();">저장</button>
	<button title="회원정보삭제" 	id="btn_Del" 		onclick="id_delete();">삭제</button>
	<br>

<!-- 비밀번호정답 -->
<!-- 우편번호검색 -->
 <input type="hidden" name="zip_url" value="/egovframework-all-in-one/sym/ccm/zip/EgovCcmZipSearchPopup.do" />
<!-- </form> -->

<!-- Egov Modal include  -->

</body>
</html>