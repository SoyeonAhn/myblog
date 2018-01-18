<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "util.Cookies" %>
<%--
Cookies cookie = new Cookies(request);

String idcookie = cookie.getValue("AUTH");
System.out.println(idcookie);
if(idcookie!=null){
	idcookie = cookie.getValue("AUTH");
}else{
	idcookie = "";
}
--%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOIN</title>
</head>
<body>
<div style = "text-align:center">
회원가입 페이지 입니다.<br>
</div>
	<form action = "/joincheck.jsp" method="post">
		<td><input type="submit" value = "아이디 중복 확인하기" /><br></td>
	</form>
<form action="/update.jsp" method="post">
<table border = "1">
<tr>
	<td>ID : </td>
	<td><input type="text" placeholder ="아이디를 입력하세요" name = "memberID" value = "<%--=idcookie--%>" required/><br></td>

</tr>
<tr>
	<td>PWD : </td>
	<td><input type="text" placeholder ="비밀번호를 입력하세요" name = "memberPWD" required/><br></td>
</tr>
<tr>
	<td>NAME : </td>
	<td><input type="text" placeholder ="이름을 입력하세요" name = "memberNAME"/><br></td>
</tr>
<tr>
	<td>EMAIL : </td>
	<td><input type="text" placeholder ="이메일을 입력하세요" name = "memberEMAIL" /><br></td>
</tr>
<tr>
	<td><br></td>
	<td><input type="submit" value = "submit 가입하기" /><br></td>
	<!-- <td><input type="button" value = "button 가입하기" /><br></td> -->
</tr>

</table>
</form>
</body>
</html>