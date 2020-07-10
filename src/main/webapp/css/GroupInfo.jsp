<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>사용자관리</title>
<%@ include file="/WEB-INF/jsp/cmm/head.jsp" %>

<script type="text/javaScript" language="javascript" defer="defer">

	var iddbck 		= false;
    var bCancel 	= false;
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
			//입력값
			$("#inGroupId").val("");
			//버튼
			$("#btn_Del").attr("disabled",true);
			$("#btn_Modify").attr("disabled",true);
	// 		$("#btn_Modify").css("display","none");
	// 		$("#btn_Del").css("display","none");
		}else if(type == "r"){  //readOnly
			//입력값
			$("#inGroupId").attr("disabled",true);
			$("#inGroupNm").attr("disabled",true);
			$("#inGroupdis").attr("disabled",true);
	
			//버튼
			$("#btn_Modify").attr("disabled",true);
			$("#btn_Del").attr("disabled",true);
			$("#btn_Arov").attr("disabled",true);
	// 		$("#btn_Modify").css("display","none");
	// 		$("#btn_Del").css("display","none");
	// 		$("#btn_Arov").css("display","none");
			
			fn_DetailGroup();
		}else if(type == "cr"){  //readOnly
			//입력값
			$("#inGroupId").attr("disabled",true);
	
			//버튼
			$("#btn_Modify").attr("disabled",false);
			$("#btn_Del").attr("disabled",false);
			$("#btn_Arov").attr("disabled",true);
	// 		$("#btn_Modify").css("display","block");
	// 		$("#btn_Del").css("display","block");
	// 		$("#btn_Arov").css("display","none");
		}else if(type == "u"){ //modify
			$("#btn_Arov").attr("disabled",true);
			$("#inGroupId").attr("readonly",true);
		}
	}

/*********************
 * 입력 필수값 체크
 *********************/
	function required() {
		if($.trim($("#inGroupId").val()).length == 0){
			alert("그룹아이디은(는) 필수 입력값입니다.");$("#inGroupId").focus();return;
		} else if($.trim($("#inGroupNm").val()).length == 0){
			alert("그룹명은 필수 입력값입니다.");$("#inGroupNm").focus();return;
		} else if($.trim($("#inGroupdis").val()).length == 0){
			alert("그룹설명은 필수 입력값입니다.");$("#inGroupdis").focus();return;
		}
	}

/*********************
 * 입력값 길이 체크
 *********************/
	function maxlength() {
		if($.trim($("#inGroupId").val()).length >= 20){
			alert("그룹아이디은(는) 20자 이상 입력할수 없습니다.");$("#inGroupId").focus();return false;
		} else if($.trim($("#inGroupNm").val()).length >= 50){
			alert("그룹명은(는) 50자 이상 입력할수 없습니다.");$("#inGroupNm").focus();return;
		} else if($.trim($("#inGroupdis").val()).length >= 100){
			alert("그룹설명은(는) 100자 이상 입력할수 없습니다.");$("#inGroupdis").focus();return;
		}
	}
	





/*********************************************************
 * 그룹등록 신청
 ******************************************************** */
	function fn_insert(){
	
		if(confirm("등록하시겠습니까?")){
			required(); //필수값 체크
			maxlength(); //최대 길이 체크
		}
		
		var groupData = new Object();
		groupData.grpId	=	$("#inGroupId").val();
		groupData.grpNm	=	$("#inGroupNm").val();
		groupData.grpDc	=	$("#inGroupdis").val();
	
		var rtnData = new Object();
		rtnData = fn_calApi("POST", "/grp/addnew", groupData, false);
	
		alert(rtnData.RESULTMSG);
		inputCellSet("cr");
		
	}

/**************
 * 그룹 정보 조회
 **************/
	function fn_DetailGroup(){
		
		var pGroupId="";
		if(groupId == null && groupId == ""){
			pGroupId = $("#inGroupId").val();
		}else{
			pGroupId = groupId;
		}
		
		console.log("detail param:===" + pGroupId );
		var rtnData = new Object();
		var arrlist = new Array();
		rtnData = fn_calApi("GETpath", "/grp/detailInfo/"+pGroupId, null, false);
		arrlist = rtnData.list;
		const obj2 = arrlist[0];
		$("#inGroupId").val(obj2.group_id);
		$("#inGroupId").attr("disabled",true);
		$("#inGroupNm").val(obj2.group_nm);
		$("#inGroupdis").val(obj2.group_dc);
	}

/*********************************************************
 * 그룹 수정 
 ******************************************************** */
	function fn_update(){
	
		if(confirm("저장 하시겠습니까?")){
			required(); //필수값 체크
			maxlength(); //최대 길이 체크
		}
		
		var groupData = new Object();
		groupData.grpId	=	$("#inGroupId").val();
		groupData.grpNm	=	$("#inGroupNm").val();
		groupData.grpDc	=	$("#inGroupdis").val();
	
		var rtnData = new Object();
		rtnData = fn_calApi("PUT", "/grp/modifyInfo", groupData, false);
	
		alert(rtnData.RESULTMSG);
		inputCellSet("cr");
	}

/*********************************************************
 * 그룹정보 삭제
 ******************************************************** */
	function fn_delete(){
		
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
		location.href="http://localhost:9085/GroupList";
	}

/******************
 * 사용자 목록페이지
 ******************/
	function fn_userList(){
		location.href=baseUrl+"/UserGroupSet?callType=c&groupId="+$("#inGroupId").val();
	}
	
	
</script>
</head>

<body>
	<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2 >그룹관리 </h2>
	<!-- 등록폼 -->
	<table class="wTable" summary="그룹관리의 그룹정보를 출력합니다.">
	<caption>그룹관리</caption>
	<colgroup>
		<col style="width: 22%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력/선택 -->
		<tr>
			<th><label for="inGroupId">그룹아이디</label> <span class="pilsu">*</span></th>
			<td class="left">
				<input id="inGroupId" name="inGroupId" title="아이디 입력" onchange="idmodify()" style="width:80%;" type="text" value="" size="20" maxlength="20"/>
<!-- 				<button id="btnUserId" class="btn_s2" onClick="fn_UserCk()" title="중복 아이디 검색">중복아이디 검색</button> -->
<!-- 				<button id="checkIdModal" name = "checkIdModal" class="btn_s2" onClick="fn_modal_setting()" title="중복 아이디 검색">중복아이디 검색</button> -->
			</td>
		</tr>
		<!-- 그룹명 -->
		<tr>
			<th><label for="inGroupNm">그룹명</label> <span class="pilsu">*</span></th>
			<td class="left">
				<input id="inGroupNm" name="inGroupNm" title="일반회원이름 입력" type="text" value="" size="50" maxlength="50"/>
			</td>
		</tr>
		<!-- 그룹 설명 -->
		
		<tr>
			<th><label for="inGroupdis">그룹 설명</label> <span class="pilsu">*</span></th>
			<td class="left">
<!-- 				<input id="grpdis" name="grpdis" title="비밀번호 입력" type=" value="" size="50" maxlength="20"/> -->
				<textarea id="inGroupdis" name="inGroupdis" title="비밀번호 입력" type="" style="resize: none;"></textarea>
			</td>
		</tr>
	</tbody>
	</table>
	<br>
	<!-- 하단 버튼 -->
	<button title="뒤로가기" 		id="btn_movBak" 		onclick="fn_movebak();">뒤로가기</button> 
	<button title="등록" 			id="btn_Arov" 			onclick="fn_insert();">등록</button>
	<button title="저장" 			id="btn_Modify" 		onclick="fn_update();">저장</button>
	<button title="삭제" 			id="btn_Del" 			onclick="fn_delete();">삭제</button>
	<button title="사용자 목록" 	id="btn_UserList" 	onclick="fn_userList();">사용자 목록 관리</button>
	<br>

</body>
</html>