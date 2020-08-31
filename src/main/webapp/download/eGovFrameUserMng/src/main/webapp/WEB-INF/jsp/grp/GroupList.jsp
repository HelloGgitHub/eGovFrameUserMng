<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>사용자 그룹 목록</title>
<%@ include file="/WEB-INF/jsp/cmm/head.jsp" %>

<script type="text/javaScript" language="javascript" defer="defer">

var grdVal;

/**************
 * 초기화
 **************/
$(document).ready(function(){
	fn_Select();
});

/**************
 * 그룹 목록 조회
 **************/
function fn_Select(){
	
	$("#grd").empty();
	//API호출
	var rtnData = new Object();
	rtnData = fn_calApi("GET", "/grp/list", null, false);
	var arr = rtnData.list;
	
 	var ihtml = '';
 	ihtml = ihtml + '<table class="board_list" summary="그룹목록을 출력합니다.">';
 	ihtml = ihtml + '<colgroup><col style="width: 5%;"><col style="width: 3%;"><col style="width: ;"><col style="width: 15%;"><col style="width: 30%;"></colgroup>';
 	ihtml = ihtml + '<thead>';
 	ihtml = ihtml + '<tr>';
 	ihtml = ihtml + '<th>번호</th>';
 	ihtml = ihtml + '<th><input type="checkbox" name="checkAll" id="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택체크박스"></th>';
 	ihtml = ihtml + '<th class="board_th_link">그룹명</th>';
 	ihtml = ihtml + '<th>인원</th>';
 	ihtml = ihtml + '<th>등록일시</th>';
 	ihtml = ihtml + '</tr>';
 	ihtml = ihtml + '</thead>';
 	ihtml = ihtml + '<tbody class="ov">';
 	
 	var cnt = 0;
	for(var i =0; arr.length > i; i++){
   	 	ihtml = ihtml + '<tr>';
   	 	ihtml = ihtml + '<td>' + (i+1) + '</td>';
   	 	ihtml = ihtml + '<td>';
   	 	ihtml = ihtml + '<input id="checkField" name="checkField" title="checkField" type="checkbox"/>';
   	 	ihtml = ihtml + '<input id="id_'+(i+1)+'" name="id_'+(i+1)+'" type="hidden" value="'+arr[i].group_id+'">';
   	 	ihtml = ihtml + '</td>';
   	 	ihtml = ihtml + '<td><a onclick="fn_SelectGrp(\''+arr[i].group_id+'\')">'+arr[i].group_nm+'</a></td>';
   		ihtml = ihtml + '<td id="userCnt_'+(i+1)+'" name="userCnt_'+(i+1)+'"><a onclick="fn_SelectUserCnt(\''+arr[i].group_id+'\')">'+arr[i].usrcnt+'</a></td>';
   	 	ihtml = ihtml + '<td id="adres_'+(i+1)+'" name="adres_'+(i+1)+'">'+arr[i].group_creat_de+'</td>';
   	 	ihtml = ihtml + '</tr>';
   	 	cnt++;
    }

    if(cnt == 0){
    	ihtml = ihtml + '<tr>';
	 	ihtml = ihtml + '<td colspan=5> 조회 결과가 없습니다</td>';
	 	ihtml = ihtml + '</tr>';
    }
	
 	ihtml = ihtml + '</tbody>';
 	ihtml = ihtml + '</table>';
 	
	var grd = document.getElementById("grd");
	grd.innerHTML = ihtml;
}

/**************
 * 그룹정보 조회 화면으로 이동
 **************/
function fn_SelectGrp(groupId){
	var pageType= "r";
	location.href="/GroupInfo?callType="+pageType+"&groupId="+groupId;
}

/**************
 * 그룹별 사용자 목록 조회 화면 이동
 **************/
function fn_SelectUserCnt(groupId){
	var pageType= "r";
	location.href="/UserGroupSet?callType="+pageType+"&groupId="+groupId;
}

/**************
 * 그룹 정보 삭제
 **************/
function fn_Delete(){
	var ckId = new Array();
	ckId = checkFieldck();
	
	for(var i=0; ckId.length > i; i++){
		var ckNum = ckId[i];
		var rtnData = new Object();
		var paramData = new Object();
		paramData.groupId = $("#id_"+ckNum).val();

		//API호출
		rtnData = fn_calApi("DELETE", "/grp/deleteGrp", paramData, false);
	}
	fn_Select();
}

/**************
 * 체크 박스 체크 내용 확인
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
 * 등록화면으로 이동
 **************/
function fn_Insert(){
	location.href="/GroupInfo?callType=c&groupId=";
}

/**************
 * 체크박스 전체 선택
 **************/
function fncCheckAll(){
	if($("#checkAll").prop("checked")){
        $("input[name=checkField]").prop("checked",true);
    }else{
        $("input[name=checkField]").prop("checked",false);
    }
}

</script>
</head>

<body style="height: 700px;">
<!-- javascript warning tag  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div class="board">
	<h1>사용자 그룹 목록</h1>
	<!-- 검색영역 -->
	<div class="search_box" title="이 레이아웃은 하단 정보를 대한 검색 정보로 구성되어 있습니다.">
		<ul>
			<li>
				<input type="button" class="s_btn" onClick="fn_Select();" 	value="조회" title="조회 버튼" />
				<input type="button" class="s_btn" onClick="fn_Delete();"	value="삭제" title="삭제 버튼" />
				<input type="button" class="s_btn" onClick="fn_Insert();" 	value="등록" title="등록 버튼" />
			</li>
		</ul>
	</div>
	<div id="grd"></div>
</div>

</body>
</html>