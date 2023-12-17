<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link href="ProfilePage.css" rel="stylesheet">
</head>
<body>
	<%@ page import ="java.sql.*" %>
	
	
	
<%
    String userid = request.getParameter("Username");   
    String pass = request.getParameter("Password");
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection(db.getTravelDB());	
	Statement stmt = con.createStatement();
    ResultSet rs1;
    rs1 = stmt.executeQuery("select * from admin where adminuser='" + userid + "'");
    if (rs1.next()){
    	 ResultSet rs2;
    	    rs2 = stmt.executeQuery("select * from admin where adminuser='" + userid + "' and adminpass='" + pass + "'");
    	    if (rs2.next()) {
    	    	session.setAttribute("user", userid); // the username will be stored in the session
    	        response.sendRedirect("AdminSuccess.jsp");
    	    } else {
    	        out.println("Invalid password <a href='AdminLogin.jsp'>try again</a>");
    	    }
    }
    else{
    	out.println("Username doesn't exist <a href= 'NewAdminAcc.jsp'>Create An Account</a>");
    }
%>

</body>
</html>