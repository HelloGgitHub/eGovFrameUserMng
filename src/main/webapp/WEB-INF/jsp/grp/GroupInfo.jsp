<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>그룹</title>
<%@ include file="/WEB-INF/jsp/cmm/head.jsp" %>

<script type="text/javaScript" language="javascript" defer="defer">

var caltype 	= "<%=request.getParameter("callType") %>";
var groupId 	= "<%=request.getParameter("groupId") %>";

 /*********************************************************
  * 초기화
  ******************************************************** */
$(document).ready(function(){
	inputCellSet(caltype);
});

/*********************
 * 화면 기능 사용 정의
 *********************/
function inputCellSet(type) {
	//호출타입에 따라 입력환경 설정
	if(type == "c"){ //insert
		$("#btn_Insert").attr("disabled",false);
		$("#btn_Modify").attr("disabled",true);
		$("#btn_Update").attr("disabled",true);
		$("#btn_Delete").attr("disabled",true);
		$("#btn_UserList").attr("disabled",true);

		$("#inGroupId").val("");
	}else if(type == "r"){  //readOnly
		$("#btn_Insert").attr("disabled",true);
		$("#btn_Modify").attr("disabled",false);
		$("#btn_Update").attr("disabled",true);
		$("#btn_Delete").attr("disabled",false);
		$("#btn_UserList").attr("disabled",false);

		$("#inGroupId").attr("disabled",true);
		$("#inGroupNm").attr("disabled",true);
		$("#inGroupDc").attr("disabled",true);
		fn_DetailGroup();
	}else if(type == "u"){ //modify
		$("#btn_Insert").attr("disabled",true);
		$("#btn_Modify").attr("disabled",true);
		$("#btn_Update").attr("disabled",false);
		$("#btn_Delete").attr("disabled",false);
		$("#btn_UserList").attr("disabled",false);

		$("#inGroupId").attr("disabled",true);
		$("#inGroupNm").attr("disabled",false);
		$("#inGroupDc").attr("disabled",false);
	}
}

/*********************
 * 입력 필수값 체크
 *********************/
function required() {
	if($.trim($("#inGroupId").val()).length == 0){
		alert("그룹 아이디은(는) 필수 입력값입니다.");$("#inGroupId").focus();return false;
	}
}

/*********************
 * 입력값 길이 체크
 *********************/
function maxlength() {
	if($.trim($("#inGroupId").val()).length >= 20){
		alert("그룹아이디은(는) 20자 이상 입력할수 없습니다.");$("#inGroupId").focus();return false;
	} else if($.trim($("#inGroupNm").val()).length >= 50){
		alert("그룹명은(는) 50자 이상 입력할수 없습니다.");$("#inGroupNm").focus();return false;
	} else if($.trim($("#inGroupDc").val()).length >= 100){
		alert("그룹설명은(는) 100자 이상 입력할수 없습니다.");$("#inGroupDc").focus();return false;
	}
}
	

/*********************************************************
 * 그룹등록 신청
 ******************************************************** */
function fn_Insert(){

	if(confirm("등록하시겠습니까?")){
		if(required()==false) return; //필수값 체크
		if(maxlength()==false) return; //최대 길이 체크
	}
	
	var groupData = new Object();
	groupData.grpId	=	$("#inGroupId").val();
	groupData.grpNm	=	$("#inGroupNm").val();
	groupData.grpDc	=	$("#inGroupDc").val();

	var rtnData = new Object();
	rtnData = fn_calApi("POST", "/grp/addnew", groupData, false);

	alert(rtnData.RESULTMSG);
	inputCellSet("r");
}

/**************
 * 그룹 정보 조회
 **************/
function fn_DetailGroup(){
	
	var pGroupId="";
	if(groupId == null || groupId == ""){
		pGroupId = $("#inGroupId").val();
	}else{
		pGroupId = groupId;
	}
	
	var rtnData = new Object();
	var arrlist = new Array();
	rtnData = fn_calApi("GETpath", "/grp/detailInfo/"+pGroupId, null, false);
	arrlist = rtnData.list;
	const obj2 = arrlist[0];

	$("#inGroupId").val(obj2.group_id);
	$("#inGroupNm").val(obj2.group_nm);
	$("#inGroupDc").val(obj2.group_dc);
}

/*********************************************************
 * 그룹 수정 
 ******************************************************** */
function fn_Update(){

	if(confirm("저장 하시겠습니까?")){
		if(required()==false) return; //필수값 체크
		if(maxlength()==false) return; //최대 길이 체크
	}
	
	var groupData = new Object();
	groupData.grpId	=	$("#inGroupId").val();
	groupData.grpNm	=	$("#inGroupNm").val();
	groupData.grpDc	=	$("#inGroupDc").val();

	var rtnData = new Object();
	rtnData = fn_calApi("PUT", "/grp/modifyInfo", groupData, false);

	alert(rtnData.RESULTMSG);
	inputCellSet("r");
}

/*********************************************************
 * 그룹정보 삭제
 ******************************************************** */
function fn_Delete(){
	if(confirm("삭제 하시겠습니까?")){
		if(required()==false) return; //필수값 체크
	}
	
	var rtnData = new Object();
	var paramData = new Object();
	paramData.groupId = $("#inGroupId").val();
	//API호출
	rtnData = fn_calApi("DELETE", "/grp/deleteGrp", paramData, false);
	
	fn_moveGrpList();
}

/*************
 * 뒤로가기
 *************/
function fn_movebak(){
	window.history.back();	
}

/******************
 * 목록페이지로 돌아가기
 ******************/
function fn_moveGrpList(){
	location.href="/GroupList";
}

/******************
 * 사용자 목록페이지
 ******************/
function fn_UserList(){
	location.href=baseUrl+"/UserGroupSet?callType=c&groupId="+$("#inGroupId").val();
}

/******************
 * 수정
 ******************/
function fn_Modify(){
	inputCellSet("u");
}
	
</script>
</head>

<body>
	<div class="wTableFrm">
	<h2 >그룹 정보 </h2>
	<table class="wTable" summary="그룹관리의 그룹정보를 출력합니다.">
	<caption>그룹 정보</caption>
	<colgroup>
		<col style="width: 22%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 그룹아이디 -->
		<tr>
			<th><label for="inGroupId">그룹아이디</label> <span class="pilsu">*</span></th>
			<td class="left">
				<input id="inGroupId" name="inGroupId" title="아이디 입력" type="text" value="" size="20" maxlength="20" />
			</td>
		</tr>

		<!-- 그룹명 -->
		<tr>
			<th><label for="inGroupNm">그룹명</label></th>
			<td class="left">
				<input id="inGroupNm" name="inGroupNm" title="일반회원이름 입력" type="text" value="" size="50" maxlength="50"/>
			</td>
		</tr>
		
		<!-- 그룹 설명 -->
		<tr>
			<th><label for="inGroupDc">그룹 설명</label></th>
			<td class="left">
				<textarea id="inGroupDc" name="inGroupDc" title="비밀번호 입력" type="" style="resize: none;"></textarea>
			</td>
		</tr>
	</tbody>
	</table>
	<br>
	<!-- 하단 버튼 -->
<!-- 	<button title="뒤로가기" 		id="btn_movBak" 		onclick="fn_movebak();">뒤로가기</button>  -->
	<button title="등록" 			id="btn_Insert" 		onclick="fn_Insert();">등록</button>
	<button title="수정" 			id="btn_Modify" 		onclick="fn_Modify();">수정</button>
	<button title="저장" 			id="btn_Update" 		onclick="fn_Update();">저장</button>
	<button title="삭제" 			id="btn_Delete" 		onclick="fn_Delete();">삭제</button>
	<button title="사용자 목록" 	id="btn_UserList" 	onclick="fn_UserList();">사용자 등록</button>
	<br>

</body>
</html>