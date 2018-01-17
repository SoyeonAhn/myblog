<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	if(id.equals("asdf")&&pwd.equals("1234")){
		session.setAttribute("MEMBERID", id);
		response.sendRedirect("/");	
	}else{
		response.sendRedirect("/");	
	}
	
    %>
    
    <%--//String id = request.getParameter("id");
//String pwd = request.getParameter("pwd");
//System.out.println(id);
//System.out.println(pwd);

//Cookies cookie = new Cookies(request);
//String id = cookie.getValue("AUTH");

//if(id.equals("asdf")&&pwd.equals("1234")) {
//	session.setAttribute("MEMBERID",id);
//}else{
//	session.setAttribute("MEMBERID",null);
//}--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>