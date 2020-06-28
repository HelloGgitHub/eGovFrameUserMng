<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Ϲ�ȸ������ ���</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="/css/egovframework/com/com.css">

<script src="/js/egovframework/com/cmm/jquery-1.4.2.min.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function(){

    $.ajax({
        type : "GET", //���۹���� �����Ѵ� (POST,GET)
        url : "http://localhost:9085/user/list",//ȣ�� URL�� �����Ѵ�. GET����ϰ�� �ڿ� �Ķ�Ƽ�͸� �ٿ��� ����ص��ȴ�.
        dataType : "text",//ȣ���� �������� �����̴�. xml,json,html,text���� ���� ����� ����� �� �ִ�.
        error : function(){    //error: whenError
            alert("��Ž���!!!!");
        },
        success : function(data){    //success: whenSuccess,
        	console.log(data);
        	
        	const obj = JSON.parse(data)
        	var arr = obj.list;

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
        		console.log(i+"===" + arr[i].userId);	
        	 	ihtml = ihtml + '<tr>';
        	 	ihtml = ihtml + '<td>' + i + '</td>';
        	 	ihtml = ihtml + '<td>';
        	 	ihtml = ihtml + '<input name="checkField" title="checkField 1" type="checkbox"/>';
        	 	ihtml = ihtml + '<input name="id" type="hidden" value="'+arr[i].userId+'"/>';
        	 	ihtml = ihtml + '</td>';
//         	 	ihtml = ihtml + '<td><a href="http://localhost:9085/login/idpw/'+arr[i].userId+'"  onclick="javascript:fnSelectUser('+arr[i].userId+'); return false;">'+arr[i].userId+'</a></td>';
//         	 	ihtml = ihtml + '<td><button onclick="fn_SelectUser('+arr[i].userId+')">'+arr[i].userId+'</button></td>';
        	 	ihtml = ihtml + '<td><button onclick="fn_SelectUser()">'+arr[i].userId+'</button></td>';
        	 	
        	 	ihtml = ihtml + '<td>'+arr[i].userNm+'</td>';
        	 	ihtml = ihtml + '<td>'+arr[i].emailAdres+'</td>';
        	 	ihtml = ihtml + '<td>'+arr[i].areaNo+')'+arr[i].middleTelno+'-'+arr[i].endTelno+'</td>';
        	 	ihtml = ihtml + '<td>2020-03-05</td>';
        	 	ihtml = ihtml + '<td>'+arr[i].sttus+'</td>';
        	 	ihtml = ihtml + '</tr>';
            }

         	ihtml = ihtml + '</tbody>';
         	ihtml = ihtml + '</table>';
         	
        	var grd = document.getElementById("grd");
        	grd.innerHTML = "<b><font color='red'>"+Math.random()+"</font></b>" + ihtml;
        }
    });
});

function fn_SelectUser(userid){
	alert(usrid);
	location.href="http://localhost:9085/UserInfo";
}

</script>
</head>

<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle">�ڹٽ�ũ��Ʈ�� �������� �ʴ� ������������ �Ϻ� ����� ����Ͻ� �� �����ϴ�.</noscript>

<form name="listForm"> 
<div class="board">
	<h1>�Ϲ�ȸ������ ���</h1>
	
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
			<li><!-- ���� -->
                <select name="searchCondition" id="searchCondition" title="��ȸ���� ����"><!--  -->
                    <option value="0"  >ID</option><!-- ID  -->
                    <option value="1" selected="selected" >�̸�</option><!-- Name -->
                </select>
			</li>
			<!-- �˻�Ű���� �� ��ȸ��ư -->
			<li>
				<input class="s_input" name="searchKeyword" type="text"  size="35" title="�˻��� �Է�" value=''  maxlength="255" >
				<input type="submit" class="s_btn" value="��ȸ" title="��ȸ ��ư" />
				<input type="button" class="s_btn" onClick="fnDeleteUser(); return false;" value="����" title="���� ��ư" />
				<span class="btn_b"><a href="/egovframework-all-in-one/uss/umt/EgovMberInsertView.do" onClick="fnAddUserView(); return false;"  title="��� ��ư">���</a></span>
			</li>
		</ul>
	</div>
</form>
<div id="grd"></div>
	<!-- paging navigation -->
	<div class="pagination">
		<ul>
			<li class="current"><a onClick="return false;">1</a></li>
		</ul>
	</div>

	<input name="selectedId" type="hidden" />
	<input name="checkedIdForDel" type="hidden" />
	<input name="pageIndex" type="hidden" value="1"/>
</div>


</body>
</html>