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
	<%@ page import="java.sql.*"%>
	<%
	String userid = request.getParameter("Username");
	String pass = request.getParameter("Password");
	String name = request.getParameter("Name");
	String email = request.getParameter("Email");
	String mobile_number = request.getParameter("Phone");
	String dob = request.getParameter("DOB");

	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();

	ResultSet rs;
	rs = stmt.executeQuery("select * from users where username='" + userid + "'");
	if (rs.next()) {
		out.println("Username Already in use <a href='CreateAccount.jsp'>Create a Unique Account</a>");
		out.println("<p></p>");
		out.println("Misspelled <a href='../LoginPage/LoginPage.jsp'>Login</a>");
	} else {

		int x = stmt.executeUpdate("INSERT INTO users (username, password, phone, dob, name, email) VALUES ('" + userid
		+ "', '" + pass + "', '" + mobile_number + "', '" + dob + "', '" + name + "', '" + email + "')");

		session.setAttribute("user", userid);
		response.sendRedirect("../LandingPage.jsp");

	}
	%>

</body>
</html>