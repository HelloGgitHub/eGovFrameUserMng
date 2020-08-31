<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>사용자 관리 목록</title>
<%@ include file="/WEB-INF/jsp/cmm/head.jsp" %>

<script type="text/javaScript" language="javascript" defer="defer">

var grdVal;

$(document).ready(function(){
	fn_Select();
});


function fn_Select(){
	
	$("#grd").empty();
	//API호출
	var rtnData = new Object();
	rtnData = fn_calApi("GET", "/user/list", null, false);
	var arr = rtnData.list;
	
 	var ihtml = '';
 	ihtml = ihtml + '<table class="board_list" summary="사용자 목록을 출력합니다.">';
 	ihtml = ihtml + '<colgroup><col style="width: 5%;"><col style="width: 3%;"><col style="width: 15%;"><col style="width: 15%;"><col style="width: 20%;"><col style="width: 13%;"><col style="width: 20%;"><col style="width: ;"></colgroup>';
 	ihtml = ihtml + '<thead>';
 	ihtml = ihtml + '<tr>';
 	ihtml = ihtml + '<th>번호</th>';
 	ihtml = ihtml + '<th><input type="checkbox" name="checkAll" id="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택체크박스"></th>';
 	ihtml = ihtml + '<th class="board_th_link">아이디</th>';
 	ihtml = ihtml + '<th>이름</th>';
 	ihtml = ihtml + '<th>이메일</th>';
 	ihtml = ihtml + '<th>전화번호</th>';
 	ihtml = ihtml + '<th>등록일시</th>';
 	ihtml = ihtml + '<th>가입상태</th>';
 	ihtml = ihtml + '</tr>';
 	ihtml = ihtml + '</thead>';
 	ihtml = ihtml + '<tbody class="ov">';

	var cnt = 0;
	for(var i =0; arr.length > i; i++){
		if( $("#sbscrbSttus").val() == "0" || $("#sbscrbSttus").val() == arr[i].sttus){	
    	 	ihtml = ihtml + '<tr>';
    	 	ihtml = ihtml + '<td>' + (cnt+1) + '</td>';
    	 	ihtml = ihtml + '<td>';
    	 	ihtml = ihtml + '<input name="checkField" title="checkField" type="checkbox"/>';
    	 	ihtml = ihtml + '<input name="id" type="hidden" value="'+arr[i].userId+'"/>';
    	 	ihtml = ihtml + '</td>';
    	 	ihtml = ihtml + '<td><a onclick="fn_SelectUser(\''+arr[i].userId+'\')">'+arr[i].userId+'</a></td>';
    	 	ihtml = ihtml + '<td id="name">'+arr[i].userNm+'</td>';
    	 	ihtml = ihtml + '<td id="adres">'+arr[i].emailAdres+'</td>';
    	 	ihtml = ihtml + '<td id="telNo">'+arr[i].areaNo+')'+arr[i].middleTelno+'-'+arr[i].endTelno+'</td>';
    	 	ihtml = ihtml + '<td>'+arr[i].changedt+'</td>';
    	 	var sttus = "-";
    	 	if(arr[i].sttus == "A"){
    	 		sttus = "가입신청";
        	}else if(arr[i].sttus == "P"){
        		sttus = "승인";
        	}
    	 	ihtml = ihtml + '<td><a onclick="fn_SelectUserSttus(\''+arr[i].userId+'\')">'+sttus+'</a></td>';
    	 	ihtml = ihtml + '</tr>';

    	 	cnt++;
		}
    }

    if(cnt == 0){
    	ihtml = ihtml + '<tr>';
	 	ihtml = ihtml + '<td colspan=8> 조회 결과가 없습니다</td>';
	 	ihtml = ihtml + '</tr>';
    }

 	ihtml = ihtml + '</tbody>';
 	ihtml = ihtml + '</table>';
 	
	var grd = document.getElementById("grd");
	grd.innerHTML = ihtml;
}

function fn_SelectUser(userId){
	location.href="/UserInfo?callType=r&userId="+userId;
}

function fn_SelectUserSttus(userId){
	location.href="/UserModyStt?callType=r&userId="+userId;
}

function fn_Delete(){
	var ckId = new Array();
	ckId = checkFieldck();
	
	for(var i=0; ckId.length > i; i++){
		var userId = ckId[i];
		
		var rtnData = new Object();
		var paramData = new Object();
		paramData.userId = userId;

		//API호출
		rtnData = fn_calApi("DELETE", "/user/delete", paramData, false);
 		alert(rtnData.RESULTMSG);
	} 
	fn_Select();
}

function checkFieldck(){
	var rowData = new Array();
	var checkbox = $("input[name=checkField]:checked");
	checkbox.each(function(i) {
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();
		var id = td.eq(2).text();
		rowData.push(id);
	});
	return rowData;
}

function fn_Insert(){
	location.href="/UserInfo?callType=c&userId=";
}

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
	<h1>사용자 관리 목록</h1>
	<!-- 검색영역 -->
	<div class="search_box" title="이 레이아웃은 하단 정보를 대한 검색 정보로 구성되어 있습니다.">
		<ul>
			<li><!-- 상태-->
                <select name="sbscrbSttus" id="sbscrbSttus" title="가입상태조건 선택">
                    <option value="0" selected="selected" >상태(전체)</option><!-- 상태(전체) -->
                    <option value="A"  >가입신청</option><!-- 가입신청 -->
                    <option value="D"  >삭제</option><!-- 삭제 -->
                    <option value="P"  >승인</option><!-- 승인 -->
                </select>
			</li>
			<!-- 검색키워드 및 조회버튼 -->
			<li>
				<input type="button" class="s_btn" onClick="fn_Select();" 	value="조회" title="조회 버튼" />
				<input type="button" class="s_btn" onClick="fn_Delete();" 	value="삭제" title="삭제 버튼" />
				<input type="button" class="s_btn" onClick="fn_Insert();" 	value="등록" title="등록 버튼" />
			</li>
		</ul>
	</div>
	<div id="grd"></div>
</div>

</body>
</html>