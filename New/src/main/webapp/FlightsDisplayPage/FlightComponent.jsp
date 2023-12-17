<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.cs336.pkg.*"%>
<%@ page import="java.time.LocalDateTime"%>

<html>
<head>
<title>Flight Information</title>
<meta charset="UTF-8">
<link href="FlightComponent.css" rel="stylesheet">
</head>
<body>
	<div class="FlightComponent">
		<%
		Trip ShoppingCart = new Trip();
		ArrayList<Flight> flightListings = (ArrayList<Flight>) request.getAttribute("Flights");
		if (flightListings.size() == 0) {
			Flight flight = new Flight("0000", LocalDateTime.now(), LocalDateTime.now(), "Location1", "Location2", 0, 100,
			100.00f, "AirlineCompany");
		%>
		<h2><%=flight.getAirlineCompany()%>
			(Flight Number:
			<%=flight.getflightNo()%>)
		</h2>
		<div class="PriceDisplay">
			$<%=flight.getPrice()%>
		</div>
		<p>
			<%=flight.departTimeToString().replace("T", " ")%>:
			<%=flight.getdepartLocation()%>
		</p>
		<p>
			<%=flight.arrivalTimeToString().replace("T", " ")%>:
			<%=flight.getarriveLocation()%>
		</p>
		<button onClick="" class="button" type="Submit">
			Add to Cart
			<!-- <a href="../CartPage/CartPage.jsp"></a> -->
			<%
			ShoppingCart.addFlight(flight);
			session.setAttribute("ShoppingCart", ShoppingCart);
			response.sendRedirect("CartPage/CartPage.jsp");
			%>
		</button>
		<%
		} else {
		for (Flight flight : flightListings) {
		%>
		<h2><%=flight.getAirlineCompany()%>
			(Flight No:
			<%=flight.getflightNo()%>)
		</h2>
		<div class="PriceDisplay">
			$<%=flight.getPrice()%>
		</div>
		<p>
			<%=flight.departTimeToString().replace("T", " ")%>:
			<%=flight.getdepartLocation()%>
		</p>
		<p>
			<%=flight.arrivalTimeToString().replace("T", " ")%>:
			<%=flight.getarriveLocation()%>
		</p>
		<form action="" method="post">
			<input type="hidden" name="flightId"
				value="<%=flight.getflightNo()%>">
			<button onClick="" id="addToCartButton" name="addToCartButton"
				class="button" type="Submit">
				<a href="../CartPage/CartPage.jsp">Add to Cart</a>
			</button>
		</form>



		<%
		// Check if the form is submitted
		if ("post".equalsIgnoreCase(request.getMethod())) {
			
			// Check if the button is clicked
			if (request.getParameter("addToCartButton") != null) {
				// Retrieve the flightId from the form
				String flightId = request.getParameter("flightId");

				// Find the corresponding flight from the flightListings
				Flight selectedFlight = null;
				for (Flight fly : flightListings) {
					if (fly.getflightNo().equals(flightId)) {
						selectedFlight = fly;
						break;
					}
				}

				// Perform the logic to add the selected flight to the shopping cart
				if (selectedFlight != null) {
					
					ShoppingCart.addFlight(selectedFlight);
			// Set session attribute
			session.setAttribute("ShoppingCart", ShoppingCart);
			//response.sendRedirect("../CartPage/CartPage.jsp");
				}
			}
			
			out.println(ShoppingCart);
		}
		}
		}
		%>
	</div>
</body>
</html>

<!-- //http://localhost:8080/New/FlightsDisplayPage/FlightsDisplayPage.jsp -->