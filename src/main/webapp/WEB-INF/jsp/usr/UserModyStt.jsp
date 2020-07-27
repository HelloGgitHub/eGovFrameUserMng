<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>사용자 정보</title>
<%@ include file="/WEB-INF/jsp/cmm/head.jsp" %>
<script src="/js/egovframework/com/cmm/utl/EgovCmmUtl.js"></script>
<script src="/js/egovframework/com/cmm/utl/InputCk.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

	var iddbck 		= false;
    var caltype 	= "<%=request.getParameter("callType") %>";
    var userId 		= "<%=request.getParameter("userId") %>";


/*********************************************************
 * 초기화
 *********************************************************/
$(document).ready(function(){
	inputCellSet(caltype);
});


function inputCellSet(type) {
	//호출타입에 따라 입력환경 설정
	if(type == "r"){  //readOnly
		$("#btn_Update").attr("disabled",false);		//저장
		$("#inUserId").attr("readonly",true);
		$("#inUserNm").attr("readonly",true);
		$("#inUserSttus").attr("readonly",false);
		fn_DetailUser();
	}
}
//입력 필수값 체크
function required() {
	if($.trim($("#inUserId").val()).length == 0){
		alert("사용자아이디은(는) 필수 입력값입니다.");$("#inUserId").focus();return false;
	} else if($.trim($("#inUserNm").val()).length == 0){
		alert("사용자이름은(는) 필수 입력값입니다.");$("#inUserNm").focus();return false;
	}
}
   //입력값 길이 체크
function maxlength() { 
	if($.trim($("#inUserId").val()).length >= 20){
		alert("일반회원아이디은(는) 20자 이상 입력할수 없습니다.");$("#inUserId").focus();return false;
	} else if($.trim($("#inUserNm").val()).length >= 50){
		alert("일반회원이름은(는) 50자 이상 입력할수 없습니다.");$("#inUserNm").focus();return false;
	}
}
	

function fn_moveUserList(){
	location.href="/UserList";
}

/*************************
 * 사용자 정보 조회
 *************************/
function fn_DetailUser(){
	var pUserId="";
	if(userId == null || userId == ""){
		pUserId = $("#inUserId").val();
	}else{
		pUserId = userId;
	}

	var rtnData  = new Object();
	rtnData = fn_calApi("GETpath", "/user/detailInfo/"+pUserId, null, false);
	var arrlist = new Array();
	arrlist = rtnData.list;
	const obj2 = arrlist[0]; 
	
	$("#inUserId").val(pUserId);
	$("#inUserNm").val(obj2.userNm);
	$("#inUserSttus").val(obj2.sttus);
}


/*********************************************************
 * 사용자 정보 수정 
 ******************************************************** */
function fn_Update(){  //ok

	if(confirm("저장하시겠습니까?")){
		if(required()==false) return; //필수값 체크
		if(maxlength()==false) return; //최대 길이 체크
		
		var rtnData = new Object();
		var paramData = new Object();
		paramData.usrId					=	$("#inUserId").val();
		paramData.usrSttus				=	$("#inUserSttus").val();
		
		rtnData = fn_calApi("PUT", "/user/updateUsrState", paramData, false);
		
		alert(rtnData.RESULTMSG);
		inputCellSet("r");
	}
}





</script>
</head>

<body>
	<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2 >사용자 정보</h2>
	<!-- 등록폼 -->
	<table class="wTable" summary="사용자 정보를 출력합니다.">
	<caption>사용자 정보</caption>
	<colgroup>
		<col style="width: 22%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 사용자아이디 -->
		<tr>
			<th><label for="inUserId">사용자아이디</label> <span class="pilsu">*</span></th>
			<td class="left">
				<input id="inUserId" name="inUserId" title="아이디 입력" type="text" value="" size="20" maxlength="20"/>
			</td>
		</tr>
		
		<!-- 일반회원이름 -->
		<tr>
			<th><label for="inUserNm">사용자명</label> <span class="pilsu">*</span></th>
			<td class="left">
				<input id="inUserNm" name="inUserNm" title="사용자명" type="text" value="" size="50" maxlength="50"/>
			</td>
		</tr>
		
		<tr>
			<th><label for="inUserSttus">회원가입상태</label> <span class="pilsu">*</span></th>
			<td class="left">
				<select id="inUserSttus" name="inUserSttus" title="회원가입상태">
					<option value="" selected="selected">--선택하세요--</option>
					<option value="A">가입신청</option>
					<option value="P">승인</option>
<!-- 					<option value="D">삭제</option> -->
				</select>
			</td>
	</tr>
	</tbody>
	</table>
	<br/>
	<!-- 하단 버튼 -->
	<button title="저장" 		id="btn_Update" 	onclick="fn_Update();">저장</button>
	<br/>
</body>
</html>