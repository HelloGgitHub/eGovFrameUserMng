<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>일반회원관리 등록</title>
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
     this.aa = new Array("mberId", "일반회원아이디은(는) 필수 입력값입니다.", new Function ("varName", "this.maxlength='20';  return this[varName];"));
     this.ab = new Array("mberNm", "일반회원이름은(는) 필수 입력값입니다.", new Function ("varName", "this.maxlength='50';  return this[varName];"));
     this.ac = new Array("password", "비밀번호은(는) 필수 입력값입니다.", new Function ("varName", " return this[varName];"));
     this.ad = new Array("passwordHint", "비밀번호힌트은(는) 필수 입력값입니다.", new Function ("varName", " return this[varName];"));
     this.ae = new Array("passwordCnsr", "비밀번호정답은(는) 필수 입력값입니다.", new Function ("varName", "this.maxlength='100';  return this[varName];"));
     this.af = new Array("areaNo", "집지역번호은(는) 필수 입력값입니다.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ag = new Array("middleTelno", "집중간전화번호은(는) 필수 입력값입니다.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ah = new Array("endTelno", "집마지막전화번호은(는) 필수 입력값입니다.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ai = new Array("moblphonNo", "핸드폰번호은(는) 필수 입력값입니다.", new Function ("varName", "this.maxlength='15';  return this[varName];"));
     this.aj = new Array("mberEmailAdres", "이메일주소은(는) 필수 입력값입니다.", new Function ("varName", "this.maxlength='50';  return this[varName];"));
     this.ak = new Array("zip", "우편번호은(는) 필수 입력값입니다.", new Function ("varName", "this.maxlength='6';  return this[varName];"));
     this.al = new Array("adres", "주소은(는) 필수 입력값입니다.", new Function ("varName", "this.maxlength='100';  return this[varName];"));
     this.am = new Array("mberSttus", "일반회원상태코드은(는) 필수 입력값입니다.", new Function ("varName", " return this[varName];"));
    } 
    function maxlength () { 
     this.aa = new Array("mberId", "일반회원아이디은(는) 20자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='20';  return this[varName];"));
     this.ab = new Array("mberNm", "일반회원이름은(는) 50자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='50';  return this[varName];"));
     this.ac = new Array("passwordCnsr", "비밀번호정답은(는) 100자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='100';  return this[varName];"));
     this.ad = new Array("areaNo", "집지역번호은(는) 4자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ae = new Array("middleTelno", "집중간전화번호은(는) 4자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.af = new Array("endTelno", "집마지막전화번호은(는) 4자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ag = new Array("mberFxnum", "팩스번호은(는) 15자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='15';  return this[varName];"));
     this.ah = new Array("moblphonNo", "핸드폰번호은(는) 15자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='15';  return this[varName];"));
     this.ai = new Array("mberEmailAdres", "이메일주소은(는) 50자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='50';  return this[varName];"));
     this.aj = new Array("adres", "주소은(는) 100자 이상 입력할수 없습니다.", new Function ("varName", "this.maxlength='100';  return this[varName];"));
    } 
    function password1 () { 
     this.aa = new Array("password", "비밀번호은(는) 8~20자 내에서 입력해야 합니다.", new Function ("varName", " return this[varName];"));
    } 
    function password2 () { 
     this.aa = new Array("password", "비밀번호은(는) 한글,특수문자,띄어쓰기는 허용되지 않습니다.", new Function ("varName", " return this[varName];"));
    } 
    function password3 () { 
     this.aa = new Array("password", "비밀번호은(는) 순차적인 숫자를 4개이상 연속해서 사용할수 없습니다.", new Function ("varName", " return this[varName];"));
    } 
    function password4 () { 
     this.aa = new Array("password", "비밀번호은(는) 반복되는 문자나 숫자를 4개이상 연속해서 사용할 수 없습니다.", new Function ("varName", " return this[varName];"));
    } 
    function IntegerValidations () { 
     this.aa = new Array("areaNo", "집지역번호은(는) integer 타입이어야 합니다.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ab = new Array("middleTelno", "집중간전화번호은(는) integer 타입이어야 합니다.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
     this.ac = new Array("endTelno", "집마지막전화번호은(는) integer 타입이어야 합니다.", new Function ("varName", "this.maxlength='4';  return this[varName];"));
    } 
    function email () { 
     this.aa = new Array("mberEmailAdres", "이메일주소은(는) 유효하지 않은 이메일 주소입니다.", new Function ("varName", "this.maxlength='50';  return this[varName];"));
    } 
</script>
<script type="text/javascript" src="/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js" ></script>
<script src="/js/egovframework/com/cmm/jquery.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fn_egov_init(){
		//모달 셋팅
	// 	fn_modal_setting();
	}
	/*********************************************************
	 * 모달셋팅
	 ******************************************************** */
	function fn_modal_setting(){
		//버튼에 모달 연결
		$("#btnMbrId").egovModal( "egovModal" );
		
		//타이틀 설졍
		$("#egovModal").setEgovModalTitle("아이디 중복 확인"); //아이디 중복 확인
		var content = "";
		content = content + "<div class='modal-alignL' style='margin:5px 0 0 0'>"+"사용할아이디 :"+"</div>"; //사용할아이디
		content = content + "<div class='modal-alignL'>"+"<input type='text' id='checkIdModal' name='checkIdModal' value='' size='20' maxlength='20' />"+"</div>";	
		content += "<div style='clear:both;'></div>";
		content += "<div id='divModalResult' style='margin:10px 0 0 0'>결과 : 중복확인을 실행하십시오.</div>"; //결과 : 중복확인을 실행하십시오.
		//모달 body 설정
		$("#egovModal").setEgovModalBody(content);
		var footer = "";
		//footer += "<div class='modal-btn'><button class='btn_s2' id='btnModalOk' onclick='fn_id_checkOk()'>확인</button></div>";
		//footer += "<div class='modal-btn'><button class='btn_s2' id='btnModalSelect' onclick='fn_id_check()'>조회</button></div>";
		footer += "<span class='btn_style1 blue' id='btnModalOk' onclick='fn_id_checkOk()'><a href='#'>확인</a></span>&nbsp;";
		footer += "<span class='btn_style1 blue' id='btnModalSelect' onclick='fn_id_check()'><a href='#'>조회</a></span>&nbsp;";
		//모달 footer 설정
		$("#egovModal").setEgovModalfooter(footer);
		
		//엔터이벤트처리
		$("input[name=checkIdModal]").keydown(function (key) {
			if(key.keyCode == 13){
				fn_id_check();	
			}
		});
		footer = null;
		content = null;
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
// 	        type : "GET", 													//전송방식을 지정한다 (POST,GET)
// 	        url : "http://192.168.56.1:8081/member/list",		//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
// 	        contentType: 'application/json; charset=utf-8',
	        
// 	        dataType : "json",											//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
// 	        error : function(){    										//error: whenError
// 	            alert("통신실패!!!!");
// 	        },
// 	        success : function(Parse_data){    					//success: whenSuccess,   function whenSuccess(resdata)
// 	            $("#ReturnData").html(Parse_data); 		//div에 받아온 값을 넣는다.
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
	<!-- 타이틀 -->
	<h2>로그인</h2>

	<!-- 등록폼 -->
	<table class="wTable" summary="일반회원관리의 내역에 대한 목록을 출력합니다.">
	<caption>일반회원관리 등록</caption>
	<colgroup>
		<col style="width: 22%;">
		<col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력/선택 -->
		<tr>
			<th><label for="userId">ID</label> <span class="pilsu">*</span></th>
			<td class="left">
				<input id="userId" name="userId" title="사용자ID" type="text" value="" size="50" maxlength="50"/>
				<div></div> 
			</td>
		</tr>
		<!-- 비밀번호 -->
		<tr>
			<th><label for="password">PASSWORD</label> <span class="pilsu">*</span></th>
			<td class="left">
			   <input id="password" name="password" title="비밀번호 입력" type="password" value="" size="50" maxlength="20"/>
			   <div></div> 
			</td>
		</tr>
	</tbody>
	</table>
	<br>
	<!-- 하단 버튼 --> 
	<button title="로그인" onclick="fn_login();" >로그인</button>
	
	<div id="loginTF"></div>
<!-- </form> -->

<!-- Egov Modal include  -->

</body>
</html>