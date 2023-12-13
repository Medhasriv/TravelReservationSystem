<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create An Account</title>
<link href="CreateAccount.css" rel="stylesheet">
<body>
<div class="Input-Box">
        <div class="Header">
            <div class="Logo">Creation </div>
        </div>

        <div class="Input">
            <form action="CreateLogin2.jsp" method="POST">
                <input type="text" id="Username" name="Username" placeholder="User ID">
<br>
<input type="password" id="Password" name="Password" placeholder="Password">
<br>
<input type="text" id="Phone" name="Phone" placeholder="Phone">
<br>
<input type="text" id="DOB" name="DOB" placeholder="Date of Birth">
<br>
<input type="text" id="Name" name="Name" placeholder="Name">
<br>
<input type="text" id="Email" name="Email" placeholder="Email">
<br>

                <input type="submit" class="login" value="Log In">
            </form>
        </div>

        <div class="linebox">
            <div class="line"></div>
        </div>

    </div>

    <div class="Create-Box">
        <a href="LoginPage.jsp" class="create">Back To Login</a>
    </div>

</body>
</html>