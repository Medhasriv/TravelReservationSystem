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
String flightNumber = request.getParameter("FlightNumber");


ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection(db.getTravelDB());	
Statement stmt = con.createStatement();
String query = "SELECT username FROM Waitlist WHERE FlightNumber = " + flightNumber;

ResultSet rs1;               

try {
	rs1 = stmt.executeQuery(query);

	out.println("<strong>Waitlist for Flight "+flightNumber+":</strong><br>");
	while(rs1.next()) {
		String username = rs1.getString("username");
	    
		out.println(username+"<br>");
	}
	
	out.println("<br><br>Success!!");
} catch (SQLException e) {
    out.println("An error occurred: Passed an invalid value for Flight Number");
}




/*
rs1 = stmt.executeQuery(query);

out.println("<strong>Waitlist for Flight "+flightNumber+":</strong><br>");
while(rs1.next()) {
	String username = rs1.getString("username");
    
	out.println(username+"<br>");
}
*/
%>

<a href="../RepLanding.jsp">Back to Landing Page</a>

<br>


</body>
</html>