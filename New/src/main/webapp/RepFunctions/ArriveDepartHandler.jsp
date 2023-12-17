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
String airportID = request.getParameter("AirportID");


ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection(db.getTravelDB());	
Statement stmt = con.createStatement();

String query = "SELECT\n" +
               "    t.FlightNumber,\n" +
               "    CASE\n" +
               "        WHEN a.AirportID = s.AirportID THEN 'Departing Flight'\n" +
               "        ELSE 'Arriving Flight'\n" +
               "    END AS FlightType\n" +
               "FROM\n" +
               "    Ticket t\n" +
               "JOIN\n" +
               "    Sells s ON t.FlightNumber = s.FlightNumber\n" +
               "JOIN\n" +
               "    Airport a ON s.AirportID = a.AirportID\n" +
               "WHERE\n" +
               "    a.AirportID = '" + airportID + "'\n" +
               "    AND (t.DepartureLocation = a.City OR t.Destination = a.City);";

//String query = "SELECT AirportID FROM Airport WHERE AirportID='"+airportID+"'";
ResultSet rs1;               
rs1 = stmt.executeQuery(query);




out.println("<strong>Arrivals and Departures at Airport with ID "+airportID+":</strong><br>");
while(rs1.next()) {
	//out.println("hi");
	int flightNumber = rs1.getInt("FlightNumber");
    String flightStatus = rs1.getString("FlightType");
    out.println("<br>Flight Number: " + flightNumber + ", Status: " + flightStatus);
    
    //out.println(rs1.getString("AirportID"));
}


%>

<br>
<a href="../RepLanding.jsp">Back to Landing Page</a>
</body>
</html>