<%@ page contentType="text/html; charset=utf-8"
    import="java.util.Date,java.text.SimpleDateFormat"%>
<%
	String gestnam = (String) session.getAttribute("nam0");
	String talk = null;
	Object visitnam = null;
	Object visitsex = null;
	String visittmp = null;
	String vnmtmp = null;
	String sentencestr = (String) session.getAttribute("sentence0");
	int sentence = Integer.parseInt(sentencestr);

	String tmp;
	int kint=0;
	for(int i = 1; i <= sentence; i++)
	{
		tmp=(String)application.getAttribute( "visitnam"+i ); 
		if( tmp.equals( gestnam)) kint = i;
	}

	for(int i = kint; i <= sentence; i++)
	{
		tmp=(String) application.getAttribute("visitnam"+(i+1));
		application.setAttribute("visitnam"+i,tmp);
		tmp=(String) application.getAttribute("visitsex"+(i+1));
		application.setAttribute("visitsex"+i,tmp);
	}
	application.setAttribute("visitnam"+sentence,"");
	application.setAttribute("visitsex"+sentence,"");

	for(int i = sentence; i >= 2; i--)
	{
		talk = (String)application.getAttribute("talk" + (i - 1));
		application.setAttribute("talk" + i, talk);
	}

    Date dat = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
	String tim=sdf.format(dat);	
		
	String gestsex = (String) session.getAttribute("sex0");
	String tking;
	tking = "<tr><th bgcolor = cyan colspan=6 align=left>谢谢"
		+gestnam+gestsex+"生光顾！离开时间："+tim+"</th></tr>";
	application.setAttribute("talk1", tking);	
	String talkerstr = (String) application.getAttribute("talker0");	
	int talker = Integer.parseInt(talkerstr);		
	application.setAttribute("talker0", String.valueOf(talker - 1));
%>
<html>
<head>
	<script Language = "javascript">
<!--
	function logoutcls()	
	{
		self.close();
		top.close();
	}
-->
	</script>
</head>
<body onload="logoutcls()"></body>
</html>
