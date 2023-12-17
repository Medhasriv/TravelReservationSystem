<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Log in</title>
<link href="LoginPage.css" rel="stylesheet">
</head>
<body>


<div class="Input-Box">
        <div class="Header">
             <a href="../LandingPage.jsp" class="Logo" style = "text-decoration: none;">MASM</a>
        </div>

        <div class="Input">
            <form action="../LoginVerification/LoginVerification.jsp" method="POST">
                <input type="text" id="Username" name="Username" placeholder="User ID">
                <br>
                <input type="password" id="Password" name="Password" placeholder="Password">
                <br>
                <input type="submit" class="login" value="Log In">
            </form>
        </div>

        <div class="linebox">
            <div class="line"></div>
        </div>

    </div>

    <div class="Create-Box">
        <a href="../CreateAccountPage/CreateAccount.jsp" class="create">Create Online Account</a>
        <a href="../Admin/AdminLogin.jsp" class="create2">Admin</a>
    </div>

</body>
</html>