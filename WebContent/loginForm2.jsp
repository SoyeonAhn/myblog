<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8"%>
<%@ page import = "util.Cookies" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Login Form</title>
<style>
form {
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
</head>
<body>
	<h2>Login Form</h2>
<%
String msg = (String) request.getAttribute("msg");
System.out.println("msg는"+msg);

if(msg!=null){
%>
<label><b><%=msg%></b></label>
<%}%>
<%
Cookies cookie = new Cookies(request);
String idcookie = cookie.getValue("AUTH");
String remembercookie = cookie.getValue("REMEMBER");
System.out.println("remember : " + remembercookie);
if(remembercookie!=null){
	remembercookie = "checked = '' ";
}else{
	remembercookie = "";
}
/* 
if(remembercookie!=null){
	remembercookie = "checked = '' ";
}else{
	remembercookie = "";
} */
if(idcookie!=null){
	idcookie = cookie.getValue("AUTH");
}else{
	idcookie = "";
}

%>

	<form action="/LoginAction" method="post">
		<div class="imgcontainer">
			<img src='images/maxresdefault.jpg' alt="Avatar" class="avatar">
		</div>

		<label><b>Username</b></label> 
		<input id = "username" type="text" placeholder="Enter Username" name="id" value = "<%=idcookie%>" required> 			
			
		<label><b>Password</b></label>
		<input type="password" placeholder="Enter Password" name="pwd" required>

		<button type="submit">Login</button>
		<label> <input type="checkbox" <%=remembercookie %> name="remember">
		<!-- value = "checked" 가 있으면 value가 넘어가고 없으면 on/null이 넘어간다. -->
			Remember me
		</label>

		<div class="container" style="background-color: #f1f1f1">
			<button type="button" class="cancelbtn">Cancel</button>
			<span class="psw">Forgot <a href="#">password?</a></span>
		</div>
	</form>
</body>
</html>