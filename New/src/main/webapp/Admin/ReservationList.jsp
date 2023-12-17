<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link href="SalesReport.css" rel="stylesheet">
</head>
<body>

<br>
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
        <a href="AdminSuccess.jsp">Admin</a>
    </div>

            <div class = "op8"></div>
            <div class = "op9"></div>



        </div>
        <div class = "nav-3">
<div class = "op8">List of Reservations by Flight Number or by Customer Name </div>

    </div>

        <div class = "nav-4">

 <div class="box10">
    <div class="heading">Reservations</div>

    <form action="ReservationList.jsp" method="POST">
            <br>Enter name exact:"John Smith" (Ticket table)
            <br><input type="text" class = "columnhead"name="pname" placeholder="Enter Passenger Name"> 
            <input type="submit"class = "columnhead"  value="Retrieve">
            <br>
            <br>
        </form>     
        
        
        
        

    <% if (session.getAttribute("user") == null) { %>
        You are not logged in<br/>
        <a href="AdminLogin.jsp">Please Login</a>
    <% } else { %>
        <%= session.getAttribute("user") %>





        <div class="table">

            <div class = "column1">
         <div class = "columnhead">Reservation by Customer Name</div>
       
       
       <% 
       ApplicationDB db = new ApplicationDB();
       Connection con = db.getConnection(db.getTravelDB());
       Statement stmt = con.createStatement();
       ResultSet rs1;

       // Retrieve PassengerName, AccountNumber, TicketNumber, FlightDuration, PurchaseDate, DepartureLocation, Destination, TotalPrice, Class
       String pname = request.getParameter("pname") + "";
       rs1 = stmt.executeQuery("SELECT PassengerName AS passenger_name, username, TicketNumber, FlightDuration, PurchaseDate, DepartureLocation, Destination, TotalPrice, Class FROM Ticket WHERE PassengerName = '" + pname + "'");

       while (rs1.next()) {
           out.println("<br>");
           out.println("Passenger Name: " + rs1.getString("passenger_name"));
           out.println("<br>");
           out.println("Account Number: " + rs1.getString("username"));
           out.println("<br>");
           out.println("Ticket Number: " + rs1.getString("TicketNumber"));
           out.println("<br>");
           out.println("Flight Duration: " + rs1.getString("FlightDuration"));
           out.println("<br>");
           out.println("Purchase Date: " + rs1.getString("PurchaseDate"));
           out.println("<br>");
           out.println("Departure Location: " + rs1.getString("DepartureLocation"));
           out.println("<br>");
           out.println("Destination: " + rs1.getString("Destination"));
           out.println("<br>");
           out.println("Total Price: " + rs1.getString("TotalPrice"));
           out.println("<br>");
           out.println("Class: " + rs1.getString("Class"));
           out.println("<br>");
       }


    
%>
            </div>




      
            
            
            
            
            
            
            
            
        </div>

       
    <% } %>
</div>
      
      
      
      </div> 
      
      
          </div>


        </div>







</body>
</html>