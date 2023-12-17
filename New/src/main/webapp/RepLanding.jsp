<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <link href="RepLanding.css" rel="stylesheet">
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
        <a href="RepLanding.jsp" class="title" style="text-decoration: none;">MASM Representative</a>
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
        </div>
    </div>

    <div class="nav-2">
        <div class="op1"><a href="RepFunctions/ReserveFlight.jsp">Reserve Customer's Flight</a></div>
        <div class="op2"><a href="RepFunctions/EditReservation.jsp">Edit Customer's Flight Reservation</a></div>
        <div class="op3"><a href="RepFunctions/AADinfoAAF.jsp">Add/Edit/Delete Information for Aircrafts, Airports and Flights</a></div>
        <div class="op4"><a href="RepFunctions/RetrieveWaitList.jsp">Retrieve a Flight's Passenger Wait List</a></div>
        <div class="op5"><a href="RepFunctions/ArriveDepart.jsp">Airport Arrivals and Departures</a></div>
        <div class="op6"><a href="RepFunctions/RepQuestions.jsp">Reply To Customer Questions</a></div>
        <div class="op7">
            <a>Profile</a>
        </div>
    </div>

    <div class="nav-3"></div>

    <div class="nav-4">
        <div class="nav-5">
            <div class="nav-6">Welcome to MASM!</div>
            
        </div>
    </div>
</body>
</html>
