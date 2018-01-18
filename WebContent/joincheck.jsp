<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "util.Cookies" %>

 <%
request.setCharacterEncoding("utf-8");

//로그인할 때 쓴 정보
String memberID = request.getParameter("memberID");

System.out.println("joinCheck 통과");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Session Login Check</title>
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
	
	String query = "select*from tablename order by MEMBERID";
	
	//2.데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
	//3.Statement 생성
	stmt = conn.createStatement();
	//4.SELECT 작업시 사용하는 executeQuery
	rs= stmt.executeQuery(query);
	System.out.println("rs.next()" + rs.next());
	System.out.println("id : " + memberID);
	if(memberID.equals(rs.getString("MEMBERID"))){
		System.out.println(memberID + " : 이미 사용하고 있는 ID입니다. 다른 ID를 입력해주세요");
		RequestDispatcher reqDis = request.getRequestDispatcher("/join");
		reqDis.forward(request, response);	
	}
	while(rs.next()){		
		System.out.println("while문");
		System.out.println(memberID);
		System.out.println(rs.getString("MEMBERID"));
		if(memberID.equals(rs.getString("MEMBERID"))){
			System.out.println(memberID + " : 이미 사용하고 있는 ID입니다. 다른 ID를 입력해주세요");
			RequestDispatcher reqDis = request.getRequestDispatcher("/join");
			reqDis.forward(request, response);	
		}
	}
		
		System.out.println(memberID + " : 해당 ID는 사용이 가능합니다.");
/*  		response.addCookie(
				Cookies.createCookie("AUTH", id, "/", 60*60)
				);	*/
		RequestDispatcher reqDis = request.getRequestDispatcher("/join");
		reqDis.forward(request, response);	
						
}catch(SQLException ex){
	out.println(ex.getMessage());
	ex.printStackTrace();
}finally{
	if(stmt!=null)try{stmt.close();}catch(SQLException ex){}
	//if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	if(conn!=null)try{conn.close();}catch(SQLException ex){}
}
%>
</body>
</html>   
    