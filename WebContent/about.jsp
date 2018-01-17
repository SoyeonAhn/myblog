<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String id = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ABOUT</title>
</head>
<body>
<%
String memberId = (String)session.getAttribute("MEMBERID");
    if(memberId!=null){%>
     	ABOUT 페이지 입니다!
    <%}else{
    	response.sendRedirect("/loginForm2.jsp");
    }
    %>
</body>
</html>