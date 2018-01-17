<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "util.Cookies" %>
  
    <%
    /*String id = request.getParameter("id");
    Cookies cookie = new Cookies(request);
    String id = cookie.getValue("AUTH");
    if(id!=null){
        response.addCookie(
    			Cookies.createCookie("AUTH", id, "/", 60*60)
    			);	      
    }
    id=null;*/
    session.invalidate();
    response.sendRedirect("/");
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃</title>
</head>
<body>
로그아웃하셨습니다.

</body>
</html>