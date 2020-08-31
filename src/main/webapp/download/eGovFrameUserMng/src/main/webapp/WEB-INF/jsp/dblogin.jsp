<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
Copyright 2004-2019 H2 Group. Multiple-Licensed under the MPL 2.0,
and the EPL 1.0 (https://h2database.com/html/license.html).
Initial Developer: H2 Group
-->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=0.9" />
    <title>H2 Console</title>

<%--     <%=request.getSession() %> --%>
    <script type="text/javascript">
//     	alert("self.name >>>" + self.name +"<<<");
//         if (self.name == 'h2result' || self.name == 'h2query' || self.name == 'h2menu') {
//             parent.location = "login.jsp";
//         }
        
		function init() {
<%-- 			alert("DB Console Login Start!!\n" + "<%=pageContext.getSession().getId()%>"); --%>
// 			document.getElementById("Connect").onclick = function(){
// 				document.getElementById('login').submit();
// 				return false;
// 			};
alert(${sessionId});
			
		    var f = document.createElement("form");
		    document.body.appendChild(f);
		    
		    f.name = "login";
		    f.id = "login";
		    f.action = "db-console/login.do?jsessionid=<%=pageContext.getSession().getId()%>";
			f.method = "post";
//  			    f.target = "location.href"; 
				
			f.appendChild(addData("language","en"));
			f.appendChild(addData("setting","Generic H2 (Embedded)"));
			f.appendChild(addData("name","Generic H2 (Embedded)"));
			f.appendChild(addData("driver","org.h2.Driver"));
			f.appendChild(addData("url","jdbc:h2:mem:testdb"));
			f.appendChild(addData("user","SA"));
			f.appendChild(addData("password",""));
			
			f.submit();
			
// 			alert("DB Console Login End!!");
		}



		function makeForm( actionURL ) {
		    var f = document.createElement("form");
		 
		    f.name = "frmHandle";
		    f.action = actionURL;
		    f.method = "post";
		    f.target = "";
		 
		    return f;
		}


		function addData(name, value) {
		    var elem = document.createElement("input");
		    elem.setAttribute("type", "hidden");
		    elem.setAttribute("name", name);
		    elem.setAttribute("value", value);
		    return elem;
		}

    </script>
</head>
<body style="margin: 20px" onload="init();">
    <form name="login" method="post" action="db-console/login.do?jsessionid=<%=pageContext.getSession().getId()%>" id="login">
    <p>
    	<h2>h2-console 로그인 페이지</h2>
    <input type="hidden" name="language" value="en">
    <table class="login" cellspacing="0" cellpadding="0">
	    <input type="hidden" name="setting" value="Generic H2 (Embedded)">
	    <input type="hidden" name="name" value="Generic H2 (Embedded)">
	    <input type="hidden" name="driver" value="org.h2.Driver">
	    <input type="hidden" name="url" value="jdbc:h2:mem:testdb">
	    <input type="hidden" name="user" value="SA">
	    <input type="hidden" name="password" value="">
    </table>
            <p class="error">${error}</p>
    </p>
	<br />
    <p class="error"></p>
    </form>
</body></html>