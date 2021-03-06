<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>그룹 사용자 목록관리</title>
<%@ include file="/WEB-INF/jsp/cmm/head.jsp" %>

<script type="text/javaScript" language="javascript" defer="defer">

var caltype 		= "<%=request.getParameter("callType") %>";
var groupId 		= "<%=request.getParameter("groupId") %>";
var grdRowCnt 	= 0;
	
/**************
  * 초기화
  **************/
$(document).ready(function(){
	inputCellSet(caltype);
	fn_Select();
});

/**************
 * 화면 기능 사용 정의
 **************/
function inputCellSet(type) {
	//호출타입에 따라 입력환경 설정
	if(type == "c"){ //insert
		alert("해당 화면은 '그룹 목록'의 조회 내용을 통해 실행되어야 정상 동작합니다.");
		$("#inGroup").attr("readonly",true);
		$("#inGroupNm").attr("readonly",true);
	}else if(type == "r"){  //readOnly
		$("#inGroup").attr("readonly",true);
		$("#inGroupNm").attr("readonly",true);
		fn_DetailGroup();
	}

	$("#inGroup").val(groupId);
}

/**************
 * 입력 필수값 체크
 **************/
function required() {
	if($.trim($("#inGroup").val()).length == 0){
		alert("그룹 아이디은(는) 필수 입력값입니다.");$("#inGroup").focus();return;
	}
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
	var rtnData = new Object();
	var arrlist = new Array();
	rtnData = fn_calApi("GETpath", "/grp/detailInfo/"+pGroupId, null, false);
	arrlist = rtnData.list;
	const obj2 = arrlist[0];
	$("#inGroup").val(obj2.group_id);
	$("#inGroup").attr("disabled",true);
	$("#inGroupNm").val(obj2.group_nm);
	$("#inGroupNm").attr("disabled",true);
}

/**************
 * 뒤로가기
 **************/
function fn_movebak(){
	window.history.back();	
}

/**************
 * 그룹 목록 조회
 **************/
function fn_Select(){
	
	$("#setGroup").empty();
	//API호출
	var rtnData = new Object();
	var rtnData = new Object();
	
	rtnData = fn_calApi("GET", "/grp/usrList?groupId="+$("#inGroup").val(), null, false);
	var arr = rtnData.list;

 	var ihtml = '';
 	ihtml = ihtml + '<table class="board_list" summary="그룹목록을 출력합니다.">';
 	ihtml = ihtml + '<colgroup><col style="width: 5%;"><col style="width: 3%;"><col style="width: 30%;"><col style="width: ;"><col style="width: 30%;"></colgroup>';
 	ihtml = ihtml + '<thead>';
 	ihtml = ihtml + '<tr>';
 	ihtml = ihtml + '<th>번호</th>';
 	ihtml = ihtml + '<th><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택체크박스"></th>';
 	ihtml = ihtml + '<th class="board_th_link">사용자ID</th>';
 	ihtml = ihtml + '<th>사용자명</th>';
 	ihtml = ihtml + '<th>가입일시</th>';
 	ihtml = ihtml + '</tr>';
 	ihtml = ihtml + '</thead>';
 	ihtml = ihtml + '<tbody class="ov">';

	var lopCnt = 0;
	for(var i =0; arr.length > i; i++){
		lopCnt = (i+1);
   	 	ihtml = ihtml + '<tr>';
   	 	ihtml = ihtml + '<td>' + lopCnt + '</td>';
   	 	ihtml = ihtml + '<td>';
   	 	ihtml = ihtml + '<input id="checkField" name="checkField" title="checkField" type="checkbox"/>';
   	 	ihtml = ihtml + '<input id="id_'+(i+1)+'" name="id_'+(i+1)+'" type="hidden" value="'+arr[i].usr_id+'">';
   	 	ihtml = ihtml + '</td>';
   	 	ihtml = ihtml + '<td id="userId_'+(i+1)+'" name="userId_'+(i+1)+'">'+arr[i].usr_id+'</td>';
	   	ihtml = ihtml + '<td id="userNm_'+(i+1)+'" name="userNm_'+(i+1)+'">'+arr[i].usr_nm+'</td>';
	   	ihtml = ihtml + '<td id="addDt_'+(i+1)+'" name="addDt_'+(i+1)+'">'+arr[i].add_dt+'</td>';
   	 	ihtml = ihtml + '</tr>';
    }
	grdRowCnt=lopCnt;
 	ihtml = ihtml + '</tbody>';
 	ihtml = ihtml + '</table>';
 
	var grd = document.getElementById("grdlist");
	grd.innerHTML = ihtml;
}


/**************
 * 그룹 추가
 **************/
function fn_RowAdd(){
	grdRowCnt++;	
	$("#setGroup").empty();
	//API호출
	var rtnData = new Object();
	rtnData = fn_calApi("GET", "/user/list", null, false);
	var arr = rtnData.list;
 	var ihtml = '';

	var dopDonBox = "";
	for(var i =0; arr.length > i; i++){
		dopDonBox = dopDonBox + '<option value="'+arr[i].userId+'">'+arr[i].userNm+'</option>'; 
    }
	
	ihtml = ihtml + '<table class="board_list" style="border-top: 1px solid #d2d2d2;" summary="사용자목록을 출력합니다.">';
	ihtml = ihtml + '<tbody class="ov">';
	ihtml = ihtml + '<colgroup><col style="width: 5%;"><col style="width: 3%;"><col style="width: 30%;"><col style="width: ;"><col style="width: 30%;"></colgroup>'; //<col style="width: 15%;">
 	ihtml = ihtml + '<tr>';
 	ihtml = ihtml + '<td>' + grdRowCnt + '</td>';
 	ihtml = ihtml + '<td>';
 	ihtml = ihtml + '<input id="checkField" name="checkField" title="checkField" type="checkbox"  checked="checked" />';
 	ihtml = ihtml + '<input id="id_'+grdRowCnt+'" name="id_'+grdRowCnt+'" type="hidden" value="'+''+'">';
 	ihtml = ihtml + '</td>';
 	ihtml = ihtml + '<td id="userId_'+grdRowCnt+'" name="userId_'+grdRowCnt+'">'+''+'</td>';
 	ihtml = ihtml + '<td>';
 	ihtml = ihtml + '<select id="userNm_'+grdRowCnt+'" name="userNm_'+grdRowCnt+'" title="사용자ID" onchange="fn_selectSetUserId('+grdRowCnt+')">';
 	ihtml = ihtml + '<option value="" selected="selected">--선택하세요--</option>';
 	ihtml = ihtml + dopDonBox
 	ihtml = ihtml + '</td>';
 	ihtml = ihtml + '<td id="addDt_'+grdRowCnt+'" name="addDt_'+grdRowCnt+'">'+''+'</td>';
 	ihtml = ihtml + '</tr>';
 	ihtml = ihtml + '</tbody>';
 	ihtml = ihtml + '</table>';
 	
	var grd = document.getElementById("grdlist");
	grd.insertAdjacentHTML('beforeend', ihtml);
}

/**************
 * 사용자 그룹 제거
 **************/
function fn_Delete(){
	var inCnt = 0;
	var ckId = new Array();
	ckId = checkFieldck();
	
	for(var i=0; ckId.length > i; i++){
		var ckNum = ckId[i];
		var rtnData = new Object();
		var paramData = new Object();
		if("" == $("#userId_"+ckNum).html()){
			alert("선택된 사용자가 없습니다.\n번호 : " + ckNum);
			return;
		}
		paramData.userId = $("#userId_"+ckNum).html();
		paramData.groupId = $("#inGroup").val();
		//API호출
		rtnData = fn_calApi("DELETE", "/grp/usrSbt", paramData, false);
		if(rtnData.RESULTCD==0){
			inCnt++;
		}
	}
	
	if(inCnt == 0){
		alert("삭제 할 정보가 없습니다.");
	}else {
		alert("삭제 되었습니다.");
	}
	fn_Select();
}

/**************
 * 사용자 그룹 추가
 **************/
function fn_Insert(){
	var ckId = new Array();
	ckId = checkFieldck();
	
	for(var i=0; ckId.length > i; i++){
		var ckNum = ckId[i];
		var rtnData = new Object();
		var paramData = new Object();
		if("" == $("#userId_"+ckNum).html()){
			alert("선택된 사용자가 없습니다.\n번호 : " + ckNum);
			return;
		}
		paramData.userId = $("#userNm_"+ckNum).val();
		paramData.grpId = $("#inGroup").val();

		//API호출
		rtnData = fn_calApi("POST", "/grp/usrAdd", paramData, false);
		alert($("#userNm_"+ckNum+" option:selected").text() + "(은)는 " + rtnData.RESULTMSG);
	}
	fn_Select();
}

/**************
 * 체크박스 여부 확인
 **************/
function checkFieldck(){
	var rowData = new Array();
	var checkbox = $("input[name=checkField]:checked");
	
	checkbox.each(function(i) {
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();
		var id = td.eq(0).text();
		rowData.push(id);
	});
	return rowData;
}

/**************
 * 입력창 값 셋팅
 **************/
function fn_selectSetUserId(row){
	var usrID = $("#userNm_"+row).val();
	var usrNm = "";
	$("#userId_"+row).html(usrID);
}

</script>
</head>

<body style="height: 700px;">
	<div class="wTableFrm">
		<h2 >그룹</h2>
		<table class="wTable" summary="그룹정보">
			<caption>그룹</caption>
			<colgroup>
				<col style="width: 22%;"><col style="width: ;">
			</colgroup>
			<tbody>
				<tr>
					<th><label for="inGroup">그룹ID</label></th>
					<td class="left">
						<input id="inGroup" name="inGroup" title="아이디" type="text" value="" size="20" maxlength="20" style="width:100%;"/>
					</td>
				</tr>
				<tr>
					<th><label for="inGroupNm">그룹명</label></th>
					<td class="left">
						<input id="inGroupNm" name="inGroupNm" title="그룹명" type="text" value="" size="50" maxlength="50" style="width:100%;"/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	<div class="wTableFrm">
		<h2>사용자 목록</h2>
		<div id="grdlist"></div>
	</div>
	<br>
	<!-- 하단 버튼 -->
	<button title="추가" 		id="btn_RowAdd" 		onclick="fn_RowAdd();">추가</button>
	<button title="저장" 		id="btn_Insert" 		onclick="fn_Insert();">저장</button>
	<button title="삭제" 		id="btn_Delete" 		onclick="fn_Delete();">삭제</button>
	<br>
</body>
</html>