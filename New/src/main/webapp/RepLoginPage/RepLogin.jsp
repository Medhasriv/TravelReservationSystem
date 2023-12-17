<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Customer Representative Login</title>
<link href="RepLogin.css" rel="stylesheet">
</head>
<body>
<div class="header2">Representative Login Portal</div>
<div class="Input-Box">
       <div class="Header">
            <a href="../LandingPage.jsp" class="Logo" style = "text-decoration: none;">MASM</a>
       </div>
       <div class="Input">
           <form action="RepLoginVerification.jsp" method="POST">
               <input type="text" id="Username" name="Username" placeholder="User ID">
               <br>
               <input type="password" id="Password" name="Password" placeholder="Password">
               <br>
               <input type="submit" class="login" value="Log In">
           </form>
       </div>
   </div>

</body>
</html>
