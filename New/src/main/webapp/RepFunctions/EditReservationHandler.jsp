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
String username = request.getParameter("username");
String name = request.getParameter("name");
String ticketNumber = request.getParameter("ticketNumber");
String flightNumber = request.getParameter("flightNumber");
String attribute = request.getParameter("attribute");
String attributeValue = request.getParameter("attributeValue");

ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection(db.getTravelDB());	
Statement stmt = con.createStatement();

String query;
//345678, 'Bob Johnson', 3, 126525, Class, Economy
if (attribute.equals("DepartureLocation") || attribute.equals("Destination") || attribute.equals("Class")) {
	query = "UPDATE Ticket SET " + attribute + " = '" + attributeValue + "' WHERE username = '" + username + "' AND TicketNumber = " + ticketNumber + " AND FlightNumber = " + flightNumber + " AND PassengerName = '" + name + "'";
} else {
	query = "UPDATE Ticket SET " + attribute + " = " + attributeValue + " WHERE username = '" + username + "' AND TicketNumber = " + ticketNumber + " AND FlightNumber = " + flightNumber + " AND PassengerName = '" + name + "'";
}

//stmt.executeUpdate(query);


try {
    //stmt = conn.createStatement();
    //String query = "YOUR SQL QUERY HERE"; // Replace with your actual query
    stmt.executeUpdate(query);
    out.println("<br>Success!!");
    // Other operations
} catch (SQLException e) {
    out.println("An error occurred: A wrong value was given.");
    // Log the exception if needed for debugging
}
%>
<br>
<a href="../RepLanding.jsp">Back to Landing Page</a>

</body>
</html>