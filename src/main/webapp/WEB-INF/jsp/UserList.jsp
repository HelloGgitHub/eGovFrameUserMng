<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<title>�Ϲ�ȸ������ ���</title>
<%@ include file="/WEB-INF/jsp/cmm/head.jsp" %>


<script type="text/javaScript" language="javascript" defer="defer">

var grdVal;

$(document).ready(function(){
	fn_Select();
});


function fn_Select(){
	
	$("#grd").empty();
	//APIȣ��
	var rtnData = new Object();
	rtnData = fn_calApi("GET", "/user/list", null, false);
	var arr = rtnData.list;
	
 	var ihtml = '';
 	ihtml = ihtml + '<table class="board_list" summary="�Ϲ�ȸ�������� ������ ���� ����� ����մϴ�.">';
 	ihtml = ihtml + '<colgroup><col style="width: 5%;"><col style="width: 3%;"><col style="width: 15%;"><col style="width: 15%;"><col style="width: 20%;"><col style="width: 13%;"><col style="width: 10%;"><col style="width: ;"></colgroup>';
 	ihtml = ihtml + '<thead>';
 	ihtml = ihtml + '<tr>';
 	ihtml = ihtml + '<th>��ȣ</th>';
 	ihtml = ihtml + '<th><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="��ü����üũ�ڽ�"></th>';
 	ihtml = ihtml + '<th class="board_th_link">���̵�</th>';
 	ihtml = ihtml + '<th>������̸�</th>';
 	ihtml = ihtml + '<th>������̸���</th>';
 	ihtml = ihtml + '<th>��ȭ��ȣ</th>';
 	ihtml = ihtml + '<th>�����</th>';
 	ihtml = ihtml + '<th>���Ի���</th>';
 	ihtml = ihtml + '</tr>';
 	ihtml = ihtml + '</thead>';
 	ihtml = ihtml + '<tbody class="ov">';
	
	for(var i =0; arr.length > i; i++){
		console.log(i+"===" + arr[i].userId + "***" + $("#sbscrbSttus").val() );
		if( $("#sbscrbSttus").val() == "0" || $("#sbscrbSttus").val() == arr[i].sttus){	
    	 	ihtml = ihtml + '<tr>';
    	 	ihtml = ihtml + '<td>' + (i+1) + '</td>';
    	 	ihtml = ihtml + '<td>';
    	 	ihtml = ihtml + '<input name="checkField" title="checkField" type="checkbox"/>';
    	 	ihtml = ihtml + '<input name="id" type="hidden" value="'+arr[i].userId+'"/>';
    	 	ihtml = ihtml + '</td>';
//     	 	ihtml = ihtml + '<td><button onclick="fn_SelectUser(\''+arr[i].userId+'\')">'+arr[i].userId+'</button></td>';
    	 	ihtml = ihtml + '<td><a onclick="fn_SelectUser(\''+arr[i].userId+'\')">'+arr[i].userId+'</a></td>';
    	 	ihtml = ihtml + '<td id="name">'+arr[i].userNm+'</td>';
    	 	ihtml = ihtml + '<td id="adres">'+arr[i].emailAdres+'</td>';
    	 	ihtml = ihtml + '<td id="telNo">'+arr[i].areaNo+')'+arr[i].middleTelno+'-'+arr[i].endTelno+'</td>';
    	 	ihtml = ihtml + '<td>2020-03-05</td>';

    	 	var sttus = "-";
    	 	if(arr[i].sttus == "A"){
    	 		sttus = "���Խ�û";
        	}else if(arr[i].sttus == "D"){
        		sttus = "����";
        	}else if(arr[i].sttus == "P"){
        		sttus = "����";
        	}
    	 	ihtml = ihtml + '<td>'+sttus+'</td>';
    	 	ihtml = ihtml + '</tr>';
		}
    }

 	ihtml = ihtml + '</tbody>';
 	ihtml = ihtml + '</table>';
 	
	var grd = document.getElementById("grd");
	grd.innerHTML = ihtml;
}


function fn_SelectUser(userId){
	location.href=baseUrl + "/UserInfo?callType=r&userId="+userId;
}


function fn_DeleteUser(){
	var ckId = new Array();
	ckId = checkFieldck();
	
	for(var i=0; ckId.length > i; i++){
		var userId = ckId[i];
		console.log(ckId.length + "===" +ckId[i] );
		
		var rtnData = new Object();
		var paramData = new Object();
		paramData.userId = userId;

		//APIȣ��
		rtnData = fn_calApi("DELETE", "/user/deleteUsr", paramData, false);
// 		alert(rtnData.RESULTCD);
	}
	fn_Select();



	return;
	
// 	for(var i=0; ckId.length > i; i++){
// 		var userId = ckId[i];
// 		console.log(ckId.length + "===" +ckId[i] );
// 	    $.ajax({
// 	        type : "DELETE", //���۹���� �����Ѵ� (POST,GET)
// 	        url : "http://localhost:9085/user/deleteUsr?userId="+userId,//ȣ�� URL�� �����Ѵ�. GET����ϰ�� �ڿ� �Ķ�Ƽ�͸� �ٿ��� ����ص��ȴ�.
// 	        dataType : "text",//ȣ���� �������� �����̴�. xml,json,html,text���� ���� ����� ����� �� �ִ�.
// 	        error : function(){    //error: whenError
// 	            alert("��Ž���!!!!");
// 	        },
// 	        success : function(data){    //success: whenSuccess,
// 	        	console.log("delete Data::"+data);
// 	        	fn_Select();
// 	        }
// 	    });
// 	}
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
	console.log("rowData : " + rowData);
	
	return rowData;
}

function fn_ArovUser(){
	location.href=baseUrl+"/UserInfo?callType=c&userId=";
}

</script>
</head>

<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle">�ڹٽ�ũ��Ʈ�� �������� �ʴ� ������������ �Ϻ� ����� ����Ͻ� �� �����ϴ�.</noscript>
<div class="board">
	<h1>ȸ������ ���</h1>
	<!-- �˻����� -->
	<div class="search_box" title="�� ���̾ƿ��� �ϴ� ������ ���� �˻� ������ �����Ǿ� �ֽ��ϴ�.">
		<ul>
			<li><!-- ����-->
                <select name="sbscrbSttus" id="sbscrbSttus" title="���Ի������� ����">
                    <option value="0" selected="selected" >����(��ü)</option><!-- ����(��ü) -->
                    <option value="A"  >���Խ�û</option><!-- ���Խ�û -->
                    <option value="D"  >����</option><!-- ���� -->
                    <option value="P"  >����</option><!-- ���� -->
                </select>
			</li>
<!-- 			<li>���� -->
<!--                 <select name="searchCondition" id="searchCondition" title="��ȸ���� ����"> -->
<!--                     <option value="0"  >ID</option>ID  -->
<!--                     <option value="1" selected="selected" >�̸�</option>Name -->
<!--                 </select> -->
<!-- 			</li> -->
			<!-- �˻�Ű���� �� ��ȸ��ư -->
			<li>
<!-- 				<input class="s_input" name="searchKeyword" type="text"  size="35" title="�˻��� �Է�" value=''  maxlength="255" > -->
				<input type="button" class="s_btn" onClick="fn_Select();" value="��ȸ" title="��ȸ ��ư" />
				<input type="button" class="s_btn" onClick="fn_DeleteUser();" value="����" title="���� ��ư" />
				<input type="button" class="s_btn" onClick="fn_ArovUser();" value="���" title="��� ��ư" />
<!-- 				<span class="btn_b"><a href="/egovframework-all-in-one/uss/umt/EgovMberInsertView.do" onClick="fnAddUserView(); return false;"  title="��� ��ư">���</a></span> -->
			</li>
		</ul>
	</div>

	<div id="grd"></div>
	<!-- paging navigation -->
	<div class="pagination">
		<ul>
			<li class="current"><a onClick="return false;">1</a></li>
		</ul>
	</div>
</div>
<input name="selectedId" type="hidden" />
<input name="checkedIdForDel" type="hidden" />
<input name="pageIndex" type="hidden" value="1"/>

</body>
</html>