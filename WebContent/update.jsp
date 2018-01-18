<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.sql.*" %> 
 <%@ page import = "java.sql.PreparedStatement" %>
    <%
    System.out.println("update들어옴");
    
    request.setCharacterEncoding("utf-8");
    //join에서 받아오는 정보
    String memberID = request.getParameter("memberID");
    String memberPWD = request.getParameter("memberPWD");
    String memberNAME = request.getParameter("memberNAME");
    String memberEMAIL = request.getParameter("memberEMAIL");
    //제대로 왔나 확인
    System.out.println(memberEMAIL);
    
    int updateCount = 0;
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = null;
    //Statement stmt = null;
    PreparedStatement pstmt = null;
    
    try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/chap14db?"+"useUnicode = true&characterEncoding = utf8";
		String dbUser = "root";
		String dbPass = "rootpw";
		
		//2.데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		//3.Statement 생성
		//stmt = conn.createStatement();
		
		pstmt = conn.prepareStatement("insert into tablename values(?,?,?,?)");
		pstmt.setString(1,memberID);
		pstmt.setString(2,memberPWD);
		pstmt.setString(3,memberNAME);
		pstmt.setString(4,memberEMAIL);
		
		pstmt.executeUpdate();
		
    }catch(SQLException ex){
    	out.println(ex.getMessage());
    	ex.printStackTrace();
    }finally{
    	//if(stmt!=null)try{stmt.close();}catch(SQLException ex){}
    	if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
    	if(conn!=null)try{conn.close();}catch(SQLException ex){}
    	response.sendRedirect("/");
    }

    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>