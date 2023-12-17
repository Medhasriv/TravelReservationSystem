<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String question = request.getParameter("Question");

ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection(db.getTravelDB());	
Statement stmt = con.createStatement();

String query = "INSERT INTO Questions (Question) VALUES ('"+question+"')";
stmt.executeUpdate(query);

%>

Success!
<br>
<a href="UserQuestions.jsp">Back to Questions Page</a>
</body>
</html>