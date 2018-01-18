    <%--
    String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	if(id.equals("asdf")&&pwd.equals("1234")){
		session.setAttribute("MEMBERID", id);
		response.sendRedirect("/");	
	}else{
		response.sendRedirect("/");	
	}	
    --%>   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
System.out.println("sessionLoginCheck 통과");
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
//String remember = request.getParameter("remember");
//로그인할 때 쓴 정보

/*String memberID = request.getParameter("memberID");
String memberPWD = request.getParameter("memberPWD");
String memberNAME = request.getParameter("memberNAME");
String memberEMAIL = request.getParameter("memberEMAIL");*/
//데이터베이스의 정보
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
	
	//String query = "select*from tablename where MEMBERID = '"+memberID+"'";
	String query = "select*from tablename order by MEMBERID";
	
	//2.데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
	//3.Statement 생성
	stmt = conn.createStatement();
	//4.SELECT 작업시 사용하는 executeQuery
	rs= stmt.executeQuery(query);
	System.out.println(rs.next());
	if(id.equals(rs.getString("MEMBERID"))&&pwd.equals(rs.getString("PASSWORD"))){
		//if(rs.getString("MEMBERID").equals(id)&&rs.getString("PASSWORD").equals(pwd)){
			session.setAttribute("MEMBERID", id);
			System.out.println("id 비밀번호 일치");
			RequestDispatcher reqDis = request.getRequestDispatcher("/");
			reqDis.forward(request, response);	
		}
	while(rs.next()){		
		System.out.println("while문");
		System.out.println(id);
		System.out.println(pwd);
		System.out.println(rs.getString("MEMBERID"));
		System.out.println(rs.getString("PASSWORD"));
		if(id.equals(rs.getString("MEMBERID"))&&pwd.equals(rs.getString("PASSWORD"))){
		//if(rs.getString("MEMBERID").equals(id)&&rs.getString("PASSWORD").equals(pwd)){
			session.setAttribute("MEMBERID", id);
			System.out.println("id 비밀번호 일치");
			RequestDispatcher reqDis = request.getRequestDispatcher("/");
			reqDis.forward(request, response);	
		}
	}
		
		request.setAttribute("msg", "id 또는 비밀번호가 틀립니다.");	
		System.out.println("id 비밀번호 불일치");
		//response.sendRedirect("/loginForm2.jsp");
		RequestDispatcher reqDis = request.getRequestDispatcher("/loginForm2.jsp");
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