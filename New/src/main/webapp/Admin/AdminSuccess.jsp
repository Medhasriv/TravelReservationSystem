<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link href="AdminSuccess.css" rel="stylesheet">
</head>
<body>







<div class="nav-1">

        <div class="title2">
                    </div>

        <a href="../LandingPage.jsp" class="title" style = "text-decoration: none;">MASM</a>


        <div class="title2">

        </div>

    </div>











        <div class = "nav-2">

            <div class = "op6"></div>
            <div class="op7">
        <a text-decoration:;href="ProfilePage/ProfilePage.jsp">Admin</a>
    </div>

            <div class = "op8"></div>
            <div class = "op9"></div>


 
        </div>
        <div class = "nav-3">
<div class = "op8"><a href="CustomerInformation.jsp">Customer's Information</a></div>
<div class = "op8"><a href="SalesReport.jsp">Sales Report</a></div>
<div class = "op8"><a href="ReservationList.jsp">Reservation List</a></div>
<div class = "op8"><a href="Summaries.jsp">Summaries</div>
<div class = "op8"><a href="FavoriteCustomer.jsp">#1 Customer</a></div>
<div class = "op8"><a href="MostActiveFlights.jsp">Most Active Flights</a></div>

    </div>

        <div class = "nav-4">

         <div class = "box10">
        

        <div class = "heading">ADMIN PORTAL</div>




      </div> 

          </div>

        </div>




<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="AdminLogin.jsp">Please Login</a>
<%} else {
%>
  <%=session.getAttribute("user") %> 
 <br><br>
<p style="float: right;"><a href="AdminLogout.jsp">Log out</a></p>
<br>


<%
    }
%>
</body>
</html>