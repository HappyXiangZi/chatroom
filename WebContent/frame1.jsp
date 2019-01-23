<%@ page contentType="text/html; charset=utf-8"%>
<%
	//取出在login.jsp中存入的本人姓名
	String guestnam = (String) session.getAttribute("nam0");
%>
<html>
<head>
	<script language = "javascript">
<!--
	function chk()
	{
		if(frm1.txttalk.value == "")return ; 
		else
		{
			frm1.submit(); 
			frm1.txttalk.value = ""; 
		}	
	}
	function lgot()
	{
		top.close();
	}
	function open1() {
		window.open("upload.jsp","toolbar=no,menubar=no,width=660,height=520");
		
	}
	function open2() {
		window.open("ListFileServlet","toolbar=no,menubar=no,width=660,height=520");
	}
-->
	</Script>
</head>
<body>
	<form name=frm1 action="talking.jsp" method=post  target="fram0">
	<%= guestnam %>:<br> 
	<textarea rows=2 cols=60 name="txttalk"></textarea><br>
	<input type=button value="发言" onClick = "chk()"> 
	<input  name=reset1 type=reset value=清除>&nbsp;
	<input type="button" value="文件上传" onclick="open1()">&nbsp;
	<input type="button" value="查看文件" onclick="open2()">&nbsp;
	
	</form>
	<form action="logout.jsp" method=post name=frm2>
	<input type=submit  value=退出聊天 >
	</form>
</body>
</html>
