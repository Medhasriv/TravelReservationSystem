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
<div class = "op8">Customer with most Total Revenue</div>

    </div>

        <div class = "nav-4">
         <div class = "box10">
         

<div class = "heading">BIGGEST SPENDER</div>    


<form action="FavoriteCustomer.jsp" method="POST">
           
            <br>
          
            <!-- <input class="columnhead" type="submit" value="Retrieve"> -->
            
            <br>
        </form>     
         
         
         
          <%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="AdminLogin.jsp">Please Login</a>
<%} else {
%>
 <%=session.getAttribute("user") %> 

         
         
        
        
        
        
        
         <div class = "table">
         
         
         
         
         
         
         <div class = "column1">
         <div class = "columnhead">Account Number</div>
        <% 
    ApplicationDB db = new ApplicationDB();
    Connection con = db.getConnection(db.getTravelDB());
    Statement stmt = con.createStatement();
    ResultSet rs1;

    String month = request.getParameter("month") + "";
    rs1 = stmt.executeQuery("SELECT EXTRACT(MONTH FROM PurchaseDate) AS month, username, SUM(TotalPrice) AS total_spent " +
            "FROM Ticket " +
            "GROUP BY month, username " +
            "ORDER BY month, total_spent DESC");

    while (rs1.next()) {
        String username = rs1.getString("username");
        double totalSpent = rs1.getDouble("total_spent");

        out.println("<br>");
        out.println(username);
        out.println("<br>");
    }
%>
            </div>

            
            
            
            
    
            
            
            
            
 
            
            
            
            
            
            
   
            
            
            
            
            
            
            
            
            <div class = "column2">
         <div class = "columnhead">Passenger Name</div>
        <% 
        
        
        
                   
        rs1 = stmt.executeQuery("SELECT EXTRACT(MONTH FROM PurchaseDate) AS month, PassengerName, SUM(TotalPrice) AS total_spent " +
                "FROM Ticket " +
                "GROUP BY month, PassengerName " +
                "ORDER BY month, total_spent DESC");



                 
              

        while (rs1.next()) {
        	 String passengerName = rs1.getString("PassengerName");
        	    double totalSpent = rs1.getDouble("total_spent");

        	    out.println("<br>");
        	 
        	    out.println(passengerName);
        	   
        	    out.println("<br>");
        	}

                    
                %>
            </div>
            
            
            
            
         
         
         
         
         
         
          <div class = "column1">
         <div class = "columnhead">Ticket Number</div>
        <% 
                   
        rs1 = stmt.executeQuery("SELECT EXTRACT(MONTH FROM PurchaseDate) AS month, PassengerName, TicketNumber, SUM(TotalPrice) AS total_spent " +
                "FROM Ticket " +
                "GROUP BY month, PassengerName, TicketNumber " +
                "ORDER BY month, total_spent DESC");

    while (rs1.next()) {
       
    	int ticketNumber = rs1.getInt("TicketNumber");

        out.println("<br>");
        out.println(ticketNumber);
        out.println("<br>");
    }
                    
                %>
            </div>
         
         
         
          <div class = "column2">
         <div class = "columnhead">Total Price</div>
        <% 
        
        
        
                   
        rs1 = stmt.executeQuery("SELECT EXTRACT(MONTH FROM PurchaseDate) AS month, TotalPrice, SUM(TotalPrice) AS total_spent " +
                "FROM Ticket " +
                "GROUP BY month, TotalPrice " +
                "ORDER BY month, total_spent DESC");



                 
              

        while (rs1.next()) {
        	 String passengerName = rs1.getString("TotalPrice");
        	    double totalSpent = rs1.getDouble("total_spent");

        	    out.println("<br>");
        	 
        	    out.println(passengerName);
        	   
        	    out.println("<br>");
        	}

                    
                %>
            </div>
         
         
         
         
            
            
            
            
            
            
            
            <div class = "column1">
         <div class = "columnhead">Revenue</div>
        <% 
        rs1 = stmt.executeQuery("SELECT PassengerName, SUM(TotalPrice) AS total_spent " +
                "FROM Ticket " +
                "GROUP BY PassengerName " +
                "ORDER BY total_spent DESC");

while (rs1.next()) {
String passengerName = rs1.getString("PassengerName");
double totalSpent = rs1.getDouble("total_spent");

out.println("<br>");
out.println(passengerName);
out.println("<br>");
out.println("Total Spent: $" + totalSpent);
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