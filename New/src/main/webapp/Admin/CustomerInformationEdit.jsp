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
<div class="Create-Box">
  <%
    String userid = request.getParameter("Username");
    String pass = request.getParameter("Password");
    String phone = request.getParameter("Phone");
    String dob = request.getParameter("DOB");
    String name = request.getParameter("Name");
    String email = request.getParameter("Email");
    
    ApplicationDB db = new ApplicationDB();
    Connection con = db.getConnection(db.getTravelDB());
    Statement stmt = con.createStatement();
    
    
    ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE username='" + userid + "'");
    
    if (rs.next()) {
        
        int updateResult = stmt.executeUpdate("UPDATE users SET password='" + pass + "',email='" + email + "', name='" + name + "', dob='" + dob + "', phone='" + phone + "' WHERE username='" + userid + "'");
        
        session.setAttribute("user", userid);
        response.sendRedirect("CustomerInformation.jsp");
    } else {
        
        response.sendRedirect("CustomerInformationEditForm.jsp?error=UserNotFound");
    }
%>
</div>

</body>
</html>