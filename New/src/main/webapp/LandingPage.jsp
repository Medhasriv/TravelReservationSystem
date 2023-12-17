<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.time.LocalDateTime"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link href="LandingPageStyles.css" rel="stylesheet">
</head>
<body>
	<div class="nav-1">
		<div class="title2">
			<%
			if (session.getAttribute("user") == null) {
			%>
			<p class='greet' style="color: white; width: 70%;">Visitor</p>
			<%
			} else {
			%>
			<p class='greet' style="color: white; width: 70%;">
				Welcome:
				<%=session.getAttribute("user")%></p>
			<%
			}
			%>
		</div>

		<a href="LandingPage.jsp" class="title" style="text-decoration: none;">MASM</a>
		<div class="title2">
       <%
       if (session.getAttribute("user") == null) {
       %>
           <a class='greet' href="RepLoginPage/RepLogin.jsp" style="color: white; width: 100%; text-decoration: none;">Customer Representative login</a>
       <%
       } else {
       %>
           <a class='greet' href="Logout.jsp" style="color: white; width: 70%; text-decoration: none;">Log out</a>
       <%
       }
       %>
   </div><div class="title2">
		
			<%
			if (session.getAttribute("user") == null) {
			%>
			<a class='greet' href="LoginPage/LoginPage.jsp"
				style="color: white; width: 70%; text-decoration: none;">Please
				Login</a>
			<%
			} else {
			%>
			<a class='greet' href="Logout.jsp"
				style="color: white; width: 70%; text-decoration: none;">Log out</a>
			<%
			}
			%>
		</div>
	</div>
	<div class="nav-2">

		<div class="op1">Hotels</div>
		<div class="op2">Flights</div>
		<div class="op3">Cars</div>
		<div class="op4">Activities</div>
		<div class="op5">Cruises</div>
		<div class="op6">
			<a href="UserQuestions.jsp">FAQs</a>
		</div>
		<div class="op7">
			<a href="TripsPage/TripsPage.jsp">Trips</a>
		</div>
		<div class="op8"></div>
		<div class="op9">
			<a href="CartPage/CartPage.jsp">Cart</a>
		</div>
	</div>

	<div class="nav-3"></div>
	<div class="nav-4">
		<div class="nav-5">
			<div class="nav-6">Flights</div>

			<%
			String selectedTripType = (String) session.getAttribute("selectedTripType");
			String selectedClass = (String) session.getAttribute("selectedClass");

			if (selectedTripType == null) {
				selectedTripType = "Trip Type";
			}

			if (selectedClass == null) {
				selectedClass = "Class";
			}
			%>
			<div class="nav-7">
				<div class="dropdown">
					<select id="tripTypeDropdown" class="dropbtn"
						name="tripTypeDropdown">
						<option value="One Way">One Way
						<option value="Round Trip">Round Trip
					</select>
				</div>
				<div class="dropdown">
					<select id="classDropdown" class="dropbtn" name="classDropdown">
						<option value="Economy">Economy
						<option value="Business">Business
						<option value="First">First
					</select>
				</div>
			</div>
			<form action="" method="POST">
				<div class="nav-8">
					<div class="dep">
						<input type="text" id="departureCity" name="departureCity"
							placeholder="Departure City">
					</div>
					<div class="des">
						<input type="text" id="destinationCity" name="destinationCity"
							placeholder="Destination City">
					</div>
					<div class="depdes">
						<div class="ddate">
							<input type="text" id="departureDate" name="departureDate"
								placeholder="Depart MM/DD/YY">
						</div>
						<div class="rdate">
							<input type="text" id="returnDate" name="returnDate"
								placeholder="Return MM/DD/YY">
						</div>
					</div>
				</div>
				<div class="nav-9">
					<button onClick="" class="search" value="search">
						<a href="FlightsDisplayPage/FlightsDisplayPage.jsp"
							style="text-decoration: none; color: white;">Search</a>
					</button>
					<%
					String Departure = request.getParameter("departureCity");
					String Destination = request.getParameter("destinationCity");
					String tripType = request.getParameter("tripTypeDropdown");
					String travelClass = request.getParameter("classDropdown");

					String DepartDate = request.getParameter("departureDate");
					String ArrivalDate = request.getParameter("returnDate");
					String Trip = request.getParameter(tripType);
					String TravelClass = request.getParameter(travelClass);

					boolean emptyCheck = Departure == null && Destination == null && Trip == null && TravelClass == null;

					boolean PriorityCheck = DepartDate != null && ArrivalDate != null;

					ApplicationDB db = new ApplicationDB();
					Connection con = db.getConnection(db.getTravelDB());
					Statement stmt = con.createStatement();

					if (emptyCheck == false && PriorityCheck == true) {

						ResultSet rs;
						rs = stmt.executeQuery(
						"SELECT DISTINCT a.AirlineID, t.FlightNumber, t.DepartureLocation, t.Destination, s.AirportID, t.TotalPrice, f.NumberOfSeats, t.Class FROM Flight f, Sells s, AssociatedWith a, Ticket t WHERE t.DepartureLocation='"
								+ Departure + "' AND t.Destination='" + Destination
								+ "' AND t.FlightNumber = s.FlightNumber AND t.FlightNumber = a.FlightNumber AND f.NumberOfSeats > 0");
						ArrayList<String[]> allRows = new ArrayList<String[]>();

						while (rs.next()) {
							String[] row = new String[10];
							row[0] = rs.getString("t.FlightNumber");
							row[1] = String.valueOf(LocalDateTime.now());
							row[2] = String.valueOf(LocalDateTime.now());
							row[3] = rs.getString("t.DepartureLocation");

							row[4] = rs.getString("t.Destination");
							row[5] = rs.getString("f.NumberOfSeats");
							row[6] = rs.getString("t.TotalPrice");
							row[7] = rs.getString("t.Class");
							row[8] = rs.getString("a.AirlineID");
							row[9] = rs.getString("s.AirportID");

							allRows.add(row);
						}
						session.setAttribute("FlightList", allRows);
						response.sendRedirect("FlightsDisplayPage/FlightsDisplayPage.jsp");

						// else{

						/* out.println(allRows.size());
						for (String[] row : allRows) {
							for (String el : row) {
						out.println("<p>" + el + "</p><br>");
							} 
						}
							*/
					}
					%>
				</div>
			</form>
		</div>
	</div>
</body>
</html>