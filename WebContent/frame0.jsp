<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
	<meta http-equiv="refresh" content =5 >
</head>
<body>
<%
	String talkerstr=(String)application.getAttribute("talker0");	
%>
	<font color = midnightgreen>
	<h4>【聊天室中现在有<%=talkerstr%>位访问者】</h4>
	</font>
	<table>
<%
	String sentencestr = (String) session.getAttribute("sentence0");
	int sentence = Integer.parseInt(sentencestr);
	for(int i = 1; i <= sentence; i++)
	{
%>
	<tr><%= application.getAttribute("talk" + i) %></tr>		
<%
	}
%>
	</table>
</body>
</html>
