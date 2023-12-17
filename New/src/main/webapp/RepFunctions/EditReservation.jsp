<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <link href="EditReservation.css" rel="stylesheet">
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
        <div class="op2">Edit a Customer's Flight Plan</div>
        <div class="op7">
            <a>Profile</a>
        </div>
    </div>

    <div class="nav-3"></div>

    <div class="nav-4">
        <div class="nav-5">
            <div class="nav-6">Enter the required information to edit a Customer's Reservation.</div>
            <div class="nav-7"></div>
            
            	<form action="EditReservationHandler.jsp" method="post">
                	<div style="font-family:freeroad; padding-left: 40px">
                    	Enter the Customer's Username<input type="text" name="username">
                	</div>
                	<br>
                	<div style="font-family:freeroad; padding-left: 40px">
                		Enter the Customer's Name<input type="text" name="name">
                	</div>
                	<br>
                	<div style="font-family:freeroad; padding-left: 40px">
                    	Enter the Ticket Number<input type="text" name="ticketNumber">
                	</div>
                	<br>
                	<div style="font-family:freeroad; padding-left: 40px">
                		Enter the Flight Number of the relevant flight<input type="text" name="flightNumber">
                	</div>
                	<br>
                	<div style="font-family:freeroad; padding-left: 40px">
                		Enter the Flight Attribute you Wish to Change<input type="text" name="attribute">
                	</div>
                	<br>
                	<div style="font-family:freeroad; padding-left: 40px; padding-bottom: 20px">
                		Enter the Value the Attribute Will be Changed to<input type="text" name="attributeValue">
                	</div>
                	
                	<br>
                	<div style="text-align: center;"><input type="submit" value="submit" style="width: 150px; height: 40px;"></div>
                	<br>
                	<br>
            	</form>
            
            
        </div>
    </div>
</body>
</html>
