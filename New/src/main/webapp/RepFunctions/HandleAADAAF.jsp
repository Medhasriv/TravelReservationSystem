<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <link href="HandleAADAAF.css" rel="stylesheet">
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
            <p class='greet' style="color: white; width: 70%;">Welcome: <%= session.getAttribute("user") %></p>
            <%
            }
            %>
        </div>
        <a href="../RepLanding.jsp" class="title" style="text-decoration: none;">MASM Representative</a>
        <div class="title2">
            <%
            if (session.getAttribute("user") == null) {
            %>
            <a class='greet' href="../RepLoginPage/RepLogin.jsp" style="color: white; width: 100%; text-decoration: none;">Customer Representative login</a>
            <%
            } else {
            %>
            <a class='greet' href="../Logout.jsp" style="color: white; width: 70%; text-decoration: none;">Log out</a>
            <%
            }
            %>
        </div>
    </div>

    <div class="nav-2">
        <div class="op1"><a href="../RepLanding.jsp">Representative Home</a></div>
        <div class="op2">Add/Edit/Delete Information for Aircrafts, Airports and Flights</div>
        <div class="op7">
            <a>Profile</a>
        </div>
    </div>

    <div class="nav-3"></div>
	
	
	<%
        String action = request.getParameter("action");
        String category = request.getParameter("category");
        
        // Perform actions based on the selected options
        if ("Insert".equals(action)) { %>
        	<form action="AADFinal.jsp" method="post">
        		<br>
        		
        		<%
        		if (category.equals("Flight")) {
    			%>
        			<div style="color: white; font-size: 20px; font-family: freeroad;">
        				Enter the FlightNumber for the new flight/aircraft entry<input type="text" name="PrimaryKey">
        			</div>
        			
    			<%
        		} else {
    			%>
        			<div style="color: white; font-size: 20px; font-family: freeroad;">
        				Enter the AirportID for the new airport entry<input type="text" name="PrimaryKey">
        			</div>
    			<%
        		}
    			%>
        		<br>
        		<br>
        		<input type="hidden" name="action" value="<%= action %>" /> 
        		<input type="hidden" name="category" value="<%= category %>" /> 
        		<div><input type="submit" value="submit" style="width: 150px; height: 40px;"></div>
    		</form>
		<%} else if ("Update".equals(action)) {%>
			<form action="AADFinal.jsp" method="post">
        		<br>
        		<%
        		if (category.equals("Flight")) {
    			%>
        			<div style="color: white; font-size: 20px; font-family: freeroad;">
        				Enter the FlightNumber for the flight/aircraft entry you wish to update<input type="text" name="PrimaryKey">
        			</div>
        			<br>
        			<div style="color: white; font-size: 20px; font-family: freeroad;">
        				Enter the Attribute you would like to update<input type="text" name="attribute">
        			</div>
        			<br>
        			<div style="color: white; font-size: 20px; font-family: freeroad;">
        				Enter the value you would like to update the attribute with<input type="text" name="attributeValue">
        			</div>
    			<%
        		} else {
    			%>
        			<div style="color: white; font-size: 20px; font-family: freeroad;">
        				Enter the AirportID for the airport entry you wish to update<input type="text" name="PrimaryKey">
        			</div>
        			<br>
        			<div style="color: white; font-size: 20px; font-family: freeroad;">
        				Enter the Attribute you would like to update<input type="text" name="attribute">
        			</div>
        			<br>
        			<div style="color: white; font-size: 20px; font-family: freeroad;">
        				Enter the value you would like to update the attribute with<input type="text" name="attributeValue">
        			</div>
    			<%
        		}
    			%>
        		<br>
        		<br>
        		<input type="hidden" name="action" value="<%= action %>" /> 
        		<input type="hidden" name="category" value="<%= category %>" /> 
        		<div><input type="submit" value="submit" style="width: 150px; height: 40px;"></div>
    		</form>
		<%} else {%>
			<form action="AADFinal.jsp" method="post">
        		<br>
        		<%
        		if (category.equals("Flight")) {
    			%>
        			<div style="color: white; font-size: 20px; font-family: freeroad;">
        				Enter the FlightNumber for the flight to be deleted<input type="text" name="PrimaryKey">
        			</div>
        			<br>
        			
    			<%
        		} else {
    			%>
        			<div style="color: white; font-size: 20px; font-family: freeroad;">
        				Enter the AirportID for airport to be deleted<input type="text" name="PrimaryKey">
        			</div>
        			<br>
    			<%
        		}
    			%>
        		<br>
        		<br>
        		<input type="hidden" name="action" value="<%= action %>" /> 
        		<input type="hidden" name="category" value="<%= category %>" /> 
        		<div><input type="submit" value="submit" style="width: 150px; height: 40px;"></div>
    		</form>
		<%}%>
	<p style="font-family: Freeroad; font-size: 30px; color: white;">Action: <%= action %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Category: <%= category %></p>
	
    
</body>
</html>
