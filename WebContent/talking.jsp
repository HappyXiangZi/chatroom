<%@ page import="java.util.Date" contentType="text/html; charset=utf-8" %>
<%	
	String guestnam = (String) session.getAttribute("nam0");
	String talk = null; 
    //整体向后挪一行，本次发言填入首行
	String sentencestr = (String) session.getAttribute("sentence0");
	int sentence = Integer.parseInt(sentencestr);
	for(int i = sentence; i >= 2; i--)
	{
		talk = (String)application.getAttribute("talk" + (i - 1));
		application.setAttribute("talk" + i, talk);
	}
	Date dat = new Date(); 
	String hour = String.valueOf(dat.getHours());
	String minute = String.valueOf(dat.getMinutes());
	String second = String.valueOf(dat.getSeconds());
	String tim = hour + ":" + minute + ":" + second;	
	//接收frame1.jsp传来的发言（"txttalk"），前后加入姓名和时间，填入记录数组首行.
	String txttalk1=request.getParameter("txttalk");
	/*
	String talking = "<td><font size=4><b>" + guestnam +"：</b></td><td><font size=4><b>" +
	txttalk1 + "</b></font></td><td><font size=3 color = red>" + 
		tim + "</font></td>";
*/
	
	String talking = "<td><font size=3 color = green>" + guestnam +"【"+tim+"】 <br><font size=4 color = blue>" +
	txttalk1 + "</font></td>";
	application.setAttribute("talk1", talking);
	response.sendRedirect("frame0.jsp");
	
%>
