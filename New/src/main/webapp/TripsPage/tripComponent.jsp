<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cs336.pkg.Flight" %>
<%@ page import="com.cs336.pkg.Trip" %>

<%
   Trip trip = (Trip)request.getAttribute("trip");
   if (trip == null) {
/*       out.println("DEBUG: Trip is null"); */
      trip = new Trip();
	
   } else {
      /* out.println("DEBUG: Trip is not null"); */
   }
%>
<html>
	<head>
	    <title>Trip Information</title>
	    	<meta charset="UTF-8">
			<link href="tripComponent.css" rel="stylesheet">
	</head>
	<body>
	    <div class="tripComponent">
	        <h2><%= trip.tripHeader() %></h2>
	        <p>Number of Stops: <%= trip.getNumStops() %></p>
	        <div class="flights-list">
	            <h3>Flights</h3>
	            <ul class="flight-items">
	                <% 
	                ArrayList<Flight> Tripflights = trip.getFlights();
	                for (Flight flight : Tripflights) { 
	                %>
	                    <li>Flight <%= flight.getflightNo() %>: <br>
	                    	<%= flight.getDepartureTime() %> FROM <%= flight.getdepartLocation() %> TO <%= flight.getArrivalTime() %> : <%= flight.getarriveLocation() %></li>
	                <% } %>
	            </ul>
	        </div>
	    </div>
	</body>
</html>

