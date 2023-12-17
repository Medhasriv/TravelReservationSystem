<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ page import="com.cs336.pkg.Flight"%>
<%@ page import="com.cs336.pkg.Trip"%>

<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<%@ page import="java.util.Collections"%>
<%@ page import="java.util.Comparator"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link href=FlightsDisplayPage.css rel="stylesheet">
<%
// Retrieving the array from the session
ArrayList<String[]> receivedArray = (ArrayList<String[]>) session.getAttribute("FlightList");

// Now you can use the receivedArray in b.jsp

ArrayList<Flight> Flights = new ArrayList<Flight>();
for (String[] row : receivedArray) {
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
	row[1] = row[1].substring(0, 19);
	row[2] = row[2].substring(0, 19);

	Flight flight = new Flight(row[0], LocalDateTime.parse(row[1], formatter), LocalDateTime.parse(row[2], formatter),
	row[3], row[4], Integer.parseInt(row[5]), 100, Float.parseFloat(row[6]), row[7]);

	Flights.add(flight);
	request.setAttribute("Flights", Flights);
}
%>
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
		<a href="../LandingPage.jsp" class="title"
			style="text-decoration: none;">MASM</a>
		<div class="title2">
			<%
			if (session.getAttribute("user") == null) {
			%>
			<a class='greet' href="../LoginPage/LoginPage.jsp"
				style="color: white; width: 70%; text-decoration: none;">Please
				Login</a>
			<%
			} else {
			%>
			<a class='greet' href="../Logout.jsp"
				style="color: white; width: 70%; text-decoration: none;">Log out</a>
			<%
			}
			%>
		</div>
	</div>

	<!-- THE NAVBAR -->

	<div class="nav-2">
		<div class="op1">Hotels</div>
		<div class="op2">Flights</div>
		<div class="op3">Cars</div>
		<div class="op4">Activities</div>
		<div class="op5">Cruises</div>
		<div class="op6"></div>
		<div class="op7">
			<a href="../ProfilePage/ProfilePage.jsp">Profile</a>
		</div>
		<div class="op8">
			<a href="../TripsPage/TripsPage.jsp">Trips</a>
		</div>
		<div class="op9">
			<a href="../CartPage/CartPage.jsp">Cart</a>
		</div>
	</div>

	<div class="nav-3"></div>

	<%
	String selectedSort = (String) session.getAttribute("selectedSort");
	String selectedFilter = (String) session.getAttribute("selectedFilter");

	if (selectedSort == null) {
		selectedSort = "Sort";
	}

	if (selectedFilter == null) {
		selectedFilter = "Filter";
	}
	%>

	<div class="nav-4">
		<div class="buttonLocate">
			<form action="" method="POST">
			<div class="dropdown">
				<select id="SortClassDrop" class="dropbtn" name="SortClassDrop">
					<option value="Departure">Take-Off Time
					<option value="Arrival">Landing Time
					<option value="FlightDuration">Flight Duration
				</select>
			</div>
		</div>
		<div class="buttonLocate2">
			<div class="dropdown">
				<select id="FilterClassDrop" class="dropbtn"
					name="FilterClassDrop">
					<option value="TotalPrice">Price
					<option value="NumberOfStops">Number Of Stops
					<option value="AirlineID">Airline Company
					<option value="Departure">Take-Off Time
					<option value="Arrival">Landing Time
				</select> <input type="text" id="Specifics" name="Specifics"
					placeholder="Filter">
			</div>
		</div>
			<input type="hidden" name="Filter/Sort"
				value="<% request.getParameter("Specifics"); %>">
			<button onClick="" id="Searchbtn" name="Searchbtn" class="button"
				type="Submit">Filter/Sort</button>
		</form>
	</div>
	<div class="nav-5">
		<div class=displayFlightComponents>
			<%@ include file="FlightComponent.jsp"%>
		</div>
	</div>
	<%
 	if (("POST").equalsIgnoreCase(request.getMethod())) {

		String Sort = request.getParameter("SortClassDrop");
		String Filter = request.getParameter("FilterClassDrop");
		String FilterVal = request.getParameter("Specifics");
		//out.print("FLITERVAL:" + FilterVal + "   ..");
		
		ArrayList<String[]> Filter_Sort = new ArrayList<String[]>();
		// This variable specifies which value in the columns of the receied Array to filter with
		if (FilterVal != null && Filter != null) {
			int FilterFocus = 0;

			if (Filter.equals("TotalPrice")) {
		FilterFocus = 6;
			} else if (Filter.equals("NumberOfStops")) {
		FilterFocus = 5;
			} else if (Filter.equals("AirlineID")) {
		FilterFocus = 8;
			} else if (Filter.equals("Departure")) {
		FilterFocus = 3;
			} else if (Filter.equals("Arrival")) {
		FilterFocus = 4;
			}
			

			if (FilterFocus != 0) {
		for (String[] row : receivedArray) {
//			if (FilterFocus == 6){
/* 				out.println("FOCUS: " + FilterVal);
				out.println("FOCUSFILTERVAL: " + Float.parseFloat(row[FilterFocus])); */
 			if (Float.parseFloat(row[FilterFocus]) == Float.parseFloat(FilterVal)) {
 				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
				row[1] = row[1].substring(0, 19);
				row[2] = row[2].substring(0, 19); 
				Filter_Sort.add(row); 
			}
			//out.print("SIZE:  " + Filter_Sort.size());
		}
			}
		}
		out.print("FILER siuze:    " + Filter_Sort.size());
		//sortinggggggggyasssss
		if (Sort != null) {
			int SortFocus = 0;

			if (Sort == "Departure") { SortFocus = 3; } 
			else if (Sort == "Arrival") { SortFocus = 4; } 
			else if (Sort == "FlightDuration") { SortFocus = 0; }
			
	        for (int i = 1; i < Filter_Sort.size(); i++) {
	            String[] current = Filter_Sort.get(i);
	            int j = i - 1;

	            // Compare the specified column values and swap if necessary
	            while (j >= 0 && current[SortFocus].compareTo(Filter_Sort.get(j)[SortFocus]) < 0) {
	            	Filter_Sort.set(j + 1, Filter_Sort.get(j));
	                j--;
	            }

	            Filter_Sort.set(j + 1, current);
	        }
			
	        //out.print("SIZEAFTERSORT" + Filter_Sort.size());
			
			//int i, j, min_idx
			
 			/* for (i = 0; i < Filter_Sort.size() - 1; i++) {
				min_idx = i;
			
				for (j = i + 1; j < Filter_Sort.size(); j++) {
				String[] currentIdx = Filter_Sort.get(j);
				String[] minIdx = Filter_Sort.get(min_idx);
				
				if (currentIdx[SortFocus].compareTo(minIdx[SortFocus]) < 0) {
					min_idx = j;
				}
			
			}
			String[] temp = Filter_Sort.get(min_idx);
			Filter_Sort.add(min_idx, Filter_Sort.get(i));
			Filter_Sort.add(i, temp);
			}  */
		}  
		
		
 		session.setAttribute("FlightList", Filter_Sort); 
		
		Flights.clear();
		for (String[] row : Filter_Sort) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
			row[1] = row[1].substring(0, 19);
			row[2] = row[2].substring(0, 19);

			Flight flight = new Flight(row[0], LocalDateTime.parse(row[1], formatter), LocalDateTime.parse(row[2], formatter),
			row[3], row[4], Integer.parseInt(row[5]), 100, Float.parseFloat(row[6]), row[7]);

			Flights.add(flight);
			request.setAttribute("Flights", Flights);
	} 
 		response.sendRedirect(request.getRequestURI());
        return;
	} 
	%>
</body>
</html>