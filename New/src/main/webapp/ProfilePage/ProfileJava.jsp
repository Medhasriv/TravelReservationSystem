<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Account</title>
<body>
<%
    String userid = request.getParameter("Username");
    String pass = request.getParameter("Password");

    ApplicationDB db = new ApplicationDB();
    Connection con = db.getConnection(db.getInputDB());
    
    if (con != null) {
        try {
            Statement stmt = con.createStatement();

            ResultSet rs;
            rs = stmt.executeQuery("SELECT * FROM users WHERE username='" + userid + "' AND password='" + pass + "'");

            if (rs.next()) {
                session.setAttribute("user", userid);
            }

            rs.close();
            stmt.close();
        } catch (SQLException e) {
            out.println("SQL Error: " + e.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                out.println("Failed to close the database connection: " + e.getMessage());
            }
        }
    } else {
        out.println("Failed to establish SQL connection.");
    }

    if (session.getAttribute("user") == null) {
%>
    <p class='greet' style="color: white; width: 70%;">Visitor</p>
<%
    } else {
%>
    <p class='greet' style="color: white; width: 70%;">Welcome: <%= session.getAttribute("user") %></p>
<%
    }
%>



</body>
</html>