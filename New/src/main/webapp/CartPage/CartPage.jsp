<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.cs336.pkg.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link href="CartPage.css" rel="stylesheet">

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
				<%=session.getAttribute("user")%>
			</p>
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
	<div class="nav-4">
		<div class="nav-5">
			<div class="b1">Cart</div>
			<ul>
				<%
				Trip selectedClass = (Trip) session.getAttribute("ShoppingCart");
				if(selectedClass==null){
					out.print("No flights selected");
					return;
				}
				%>
				<div id="flightIndex" class="allthestuff">
					<%
					//out.print(selectedClass);
					ArrayList<Flight> purchaseFlights = selectedClass.getFlights();
					HashSet<Flight> result = new HashSet<Flight>();
					result.addAll(purchaseFlights); // used to refresh the flights in the list

					purchaseFlights.clear();
					purchaseFlights.addAll(result);
					selectedClass.setFlights(purchaseFlights);
					for (Flight flight : purchaseFlights) {
						out.println("FlightNo:" + flight.getflightNo() + "\n");
					%>
					<br>
					<%
					out.println("Price: $" + flight.getPriceStr());


					//out.println(selectedClass.toString());
					%>
					<form action="" method="post">
						<input type="hidden" name="flightId"
							value="<%= flight.getflightNo() %>">
						<button class="PurchaseB" name="Delete_" id="Delete_" value="<%= flight.getflightNo() %>" onclick="">delete</button>
					</form>
				</div>
				
				<%-- 			THIS IS TEMPORARY, NEED A WAY TO FETCH FLIGHT OBJECTS THEN GET EACH OF THE ITEMS AND PRINT THEM HERE	
				<c:forEach var="item" items="${itemDAO.getAllItems()}">
					<li>${item.name}- $${item.price}</li>
				</c:forEach> --%>
			</ul>
			<%--ADD THE TOTAL HERE --%>
			<div class=bottomStuff>
				<div class=total>
					Total: $
					<%selectedClass.totalPrice();%>
					<form action="" method="post">
						<input type="hidden" name="flightId" value="<%= flight.getflightNo() %>">
						<button class="PurchaseB" name="purchaseStuf" id="purchaseStuf" onclick="">Purchase</button>
					</form>

				</div>

			</div>


		</div>
	</div>
	<%
if ("post".equalsIgnoreCase(request.getMethod())) {
	if (request.getParameter("purchaseStuf") != null) {
		session.setAttribute("TripCart", selectedClass);
		response.sendRedirect("../TripsPage/TripsPage.jsp");
	   }
	
	
	
    // Check if the button is clicked
    if (request.getParameter("Delete_") != null) {
        // Retrieve the flightId from the form
        String flightId = request.getParameter("flightId");
        Flight flightToRemove = null;
        for (Flight flighty : purchaseFlights) {
            if (flighty.getflightNo().equals(flightId)) {
                flightToRemove = flighty;
                break;
            }
        }
        if (flightToRemove != null) {
            	purchaseFlights.remove(flightToRemove);
            	selectedClass.setFlights(purchaseFlights);
         //    Trip selectedClass = new Trip(purchaseFlights);  
            session.setAttribute("ShoppingCart", selectedClass); // Update the session
        }

        // Redirect to the same page
        response.sendRedirect(request.getRequestURI());
        return;
    }

	

}
					}
%>

	<script>
		function purchase() {
			//should add the purchase
			
		}

		function deletef() {
			var el = document.getElementById("flightIndex");
			el.remove();
		}
	</script>

</body>
</html>
