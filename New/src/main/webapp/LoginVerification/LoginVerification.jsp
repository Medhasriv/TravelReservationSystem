<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("Username");   
    String pass = request.getParameter("Password");
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection(db.getInputDB());	
	Statement stmt = con.createStatement();
	
    ResultSet rs1;
    rs1 = stmt.executeQuery("select * from users where username='" + userid + "'");
    if (rs1.next()){
    	 ResultSet rs2;
    	    rs2 = stmt.executeQuery("select * from users where username='" + userid + "' and password='" + pass + "'");
    	    if (rs2.next()) {
    	    	session.setAttribute("user", userid); 
    	        response.sendRedirect("../LandingPage.jsp");
    	    } else {
    	        out.println("<a href='LoginPage.jsp'>Back to Login/Invalid Password</a>");
    	    }
    }
    else{
    	out.println("Error <a href= '../CreateAccountPage/CreateAccount.jsp'>Username doesn't exist  | Create An Account</a>");
    }
%>





</body>
</html>