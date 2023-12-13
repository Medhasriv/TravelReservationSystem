<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<link href="LandingPageStyles.css" rel="stylesheet">
	</head>
	<body>
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
		            <p class='greet' style="color: white; width: 70%;">Welcome: <%= session.getAttribute("user") %></p>
		        <%
		        }
		        %>
		    </div>
		    
	    	<a href="LandingPage.jsp" class="title" style = "text-decoration: none;">MASM</a>
	
	
		    <div class="title2">
		        <%
		        if (session.getAttribute("user") == null) {
		        %>
		            <a class='greet' href="LoginPage/LoginPage.jsp" style="color: white; width: 70%; text-decoration: none;">Please Login</a>
		        <%
		        } else {
		        %>
		            <a class='greet' href="Logout.jsp" style="color: white; width: 70%; text-decoration: none;">Log out</a>
		        <%
		        }
		        %>
		    </div>
	</div>
	
	
	
	
	
	    <div class = "nav-2">
	
	        <div class = "op1">Hotels</div>
	        <div class = "op2">Flights</div>
	        <div class = "op3">Cars</div>
	        <div class = "op4">Activities</div>
	        <div class = "op5">Cruises</div>
	        <div class = "op6"></div>
	        <div class = "op7"><a href="ProfilePage/ProfilePage.jsp">Profile</a></div>
	        <div class = "op8"><a href="TripsPage/TripsPage.jsp">Trips</a></div>
	        <div class = "op9">Cart</div>
	    </div>
	    
	    <div class = "nav-3"></div>
	    <div class = "nav-4">
	      <div class = "nav-5">
	        <div class = "nav-6">Flights</div>
	        
			<%
				String selectedTripType = (String) session.getAttribute("selectedTripType");
				String selectedClass = (String) session.getAttribute("selectedClass");
			
				if(selectedTripType==null){
					selectedTripType = "Trip Type";
				}
				
				if(selectedClass==null){
					selectedClass = "Class";
				}
			
			%>
	        <div class = "nav-7">
		         <div class="dropdown">
					  <button class="dropbtn" onclick="toggleDropdown('tripTypeDropdown')"><%= selectedTripType %></button>
					  <div id="tripTypeDropdown" class="dropdown-content">
					    <a href="#" onclick="selectOption('One Way', 'tripTypeDropdown')">One-Way</a>
					    <a href="#" onclick="selectOption('Round Trip', 'tripTypeDropdown')">Round Trip</a>
					  </div>
					</div> 
				<div class="dropdown">
					<button class="dropbtn" onclick="toggleDropdown('classDropdown')"><%= selectedClass %></button>
					<div id="classDropdown" class="dropdown-content">
					    <a href="#" onclick="selectOption('Economy', 'classDropdown')">Economy</a>
			            <a href="#" onclick="selectOption('Business', 'classDropdown')">Business</a>
			            <a href="#" onclick="selectOption('First Class', 'classDropdown')">First Class</a>
			        </div>
				</div>
	<!--           <button type="b">1 Traveler</button> //IMPLEMENT LATER, # OF TRAVELERS, NOT NEEDED FOR NOW -->
	        </div>
	
	
	       <div class = "nav-8">
	          <div class = "dep">
	         	<input type="text" id="Password" name="Password" placeholder="Departure City">
	          </div>
	          <div class = "des">
	          	<input type="text" id="Password" name="Password" placeholder="Destination City">
	          </div>
	          <div class = "depdes">
	            <div class ="ddate">
	              <input type="text" id="Password" name="Password" placeholder="Depart MM/DD/YY">
	            </div>
	           <div class ="rdate">
	              <input type="text" id="Password" name="Password" placeholder="Return MM/DD/YY">
	            </div>
	          </div>
	        </div>
	
	
			<div class="nav-9">
				<button class = "search" onclick="search()">Search</button>
	        </div> 
	
	
	      </div>
	    </div>
	
		<script>
		    function toggleDropdown(dropdownId) {
		        document.getElementById(dropdownId).classList.toggle('show');
		    }
		
		    function selectOption(option, dropdownId) {
		        document.getElementById(dropdownId).style.display = 'none';
		        document.getElementById(dropdownId).previousElementSibling.innerText = option;
		        // Save the selected option to the session
		        saveToSession(dropdownId, option);
		    }
		
		    function saveToSession(key, value) {
		        // Use AJAX to send the selected option to the server and update the session
		        var xhr = new XMLHttpRequest();
		        xhr.open('POST', 'SaveOptionServlet'); // Replace with your servlet URL
		        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		        xhr.onload = function () {
		            if (xhr.status === 200) {
		                console.log('Option saved to session successfully.');
		            } else {
		                console.error('Failed to save option to session.');
		            }
		        };
		        xhr.send(key + '=' + encodeURIComponent(value));
		    }
		
		    function search() {
		    	// Get values from input fields and dropdowns
		        var departureCity = document.getElementById('departureCity').value;
		        var destinationCity = document.getElementById('destinationCity').value;
		        var departureDate = document.getElementById('departureDate').value;
		        var returnDate = document.getElementById('returnDate').value;
		        var tripType = document.getElementById('tripTypeDropdown').innerText;
		        var travelClass = document.getElementById('classDropdown').innerText;

		        // Validate the input if needed

		        // Redirect to the search servlet or page with query parameters
		        window.location.href = 'SearchServlet?departureCity=' + encodeURIComponent(departureCity)
		                            + '&destinationCity=' + encodeURIComponent(destinationCity)
		                            + '&departureDate=' + encodeURIComponent(departureDate)
		                            + '&returnDate=' + encodeURIComponent(returnDate)
		                            + '&tripType=' + encodeURIComponent(tripType)
		                            + '&travelClass=' + encodeURIComponent(travelClass);
		    }
		</script>
	
	</body>
</html>