<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
request.setCharacterEncoding("utf-8");

String memberID = request.getParameter("memberID");
String memberPWD = request.getParameter("memberPWD");
String memberNAME = request.getParameter("memberNAME");
String memberEMAIL = request.getParameter("memberEMAIL");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/chap14db?"+"useUnicode = true&characterEncoding = utf8";
	String dbUser = "root";
	String dbPass = "rootpw";
	
	String query = "select*from tablename where MEMBERID = '"+memberID+"'";
	
	//2.데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
	//3.Statement 생성
	stmt = conn.createStatement();
	
	rs= stmt.executeQuery(query); //SELECT 작업시 사용하는 executeQuery
	if(rs.next()){
%>
아이디 : <%=memberID %>
비밀번호 : <%=memberPWD %>
이름 : <%=memberNAME %>
이메일 : <%=memberEMAIL%>
 <%--=rs.getString("EMAIL") --%>
								
	<%}else{ %>
	<%=memberID %>의 로그인에 실패하였습니다.
<%}
	}catch(SQLException ex){%>	
	에러 발생 : <%=ex.getMessage() %>
	<%
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException ex){}
		if(stmt!=null)try{stmt.close();}catch(SQLException ex){}
		if(conn!=null)try{conn.close();}catch(SQLException ex){}
	}
	%>

</body>
</html>