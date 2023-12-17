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
<div class = "op8">Sales Report for a Particular Month</div>

    </div>

        <div class = "nav-4">

         <div class = "box10">
<div class = "heading">SALES REPORT</div>    


<form action="SalesReport.jsp" method="POST">
            <br>MM: 01=January ... 12=December
            <br><input type="text" class = "columnhead"  name="month" placeholder="Enter Month(MM)"> 
            <input type="submit" class = "columnhead" value="Retrieve">
            <br>Table = Ticket From Inputs in SQL
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
         <div class = "columnhead">Username</div>
        <% 
                    ApplicationDB db = new ApplicationDB();
                    Connection con = db.getConnection(db.getTravelDB());
                    Statement stmt = con.createStatement();
                    ResultSet rs1;

                    String month = request.getParameter("month") + "";
                    rs1 = stmt.executeQuery("select username as total_revenue from Ticket where extract(month from PurchaseDate) = '" + month + "' ");

              
             

                    while (rs1.next()) {
                        %>
                                <br>
                                <%= rs1.getString("total_revenue") %>
                                 <br>
                                
                        <%
                            }
                                
                            %>

                    
              
            </div>

            
            
            
            
            
            <div class="column2">
            <div class = "columnhead">Ticket Number</div>
                <% 
                rs1 = stmt.executeQuery("select TicketNumber as total_revenue from Ticket where extract(month from PurchaseDate) = '" + month + "' ");



                while (rs1.next()) {
                	out.println("<br>");
                    out.println(rs1.getString("total_revenue"));
                    out.println("<br>");
                }
        %>  
            </div>
            
            
            
            
            
            
            
            
            
             
         <div class = "column1">
         <div class = "columnhead">Flight Duration</div>
        <% 
                   
                    rs1 = stmt.executeQuery("select FlightDuration as total_revenue from Ticket where extract(month from PurchaseDate) = '" + month + "' ");

                   
                    

                    while (rs1.next()) {
                    	out.println("<br>");
                        out.println(rs1.getString("total_revenue"));
                        out.println("<br>");
                    }

                    
                %>
            </div>
            
            
            
            
            
            
            
            <div class="column2">
            <div class = "columnhead">Purchase Date</div>
                <% 
                rs1 = stmt.executeQuery("select PurchaseDate as total_revenue from Ticket where extract(month from PurchaseDate) = '" + month + "' ");

  
     

                while (rs1.next()) {
                	out.println("<br>");
                	out.println(rs1.getString("total_revenue"));
                    out.println("<br>");
                  
                }
        %>  
     
            </div>
            
            
            
            
            
            
            
            <div class = "column1">
         <div class = "columnhead">Departure</div>
       
        <% 
                   
                    rs1 = stmt.executeQuery("select DepartureLocation as total_revenue from Ticket where extract(month from PurchaseDate) = '" + month + "' ");

                 
               

        while (rs1.next()) {
            %>
                    <br>
                    <%= rs1.getString("total_revenue") %>
                     <br>
                    
            <%
                }
                    
                %>
                
            </div>
            
            
            
            
            
            
            
            
            
            <div class = "column2">
         <div class = "columnhead">Passenger Name</div>
        <% 
                   
                    rs1 = stmt.executeQuery("select PassengerName as total_revenue from Ticket where extract(month from PurchaseDate) = '" + month + "' ");

                 
              

                    while (rs1.next()) {
                    	out.println("<br>");
                        out.println(rs1.getString("total_revenue"));
                        out.println("<br>");
                    }

                    
                %>
            </div>
            
            
            
            
            <div class = "column1">
         <div class = "columnhead">Destination</div>
        <% 
                   
                    rs1 = stmt.executeQuery("select Destination as total_revenue from Ticket where extract(month from PurchaseDate) = '" + month + "' ");

            
            
                    while (rs1.next()) {
                    	out.println("<br>");
                        out.println(rs1.getString("total_revenue"));
                        out.println("<br>");
                    }

                    
                %>
            </div>
            
            
            
            
            
            
            
            <div class = "column2">
         <div class = "columnhead">Total Price</div>
        <% 
                   
                    rs1 = stmt.executeQuery("select TotalPrice as total_revenue from Ticket where extract(month from PurchaseDate) = '" + month + "' ");

                   


                    while (rs1.next()) {
                    	out.println("<br>");
                    	out.println("$" + rs1.getString("total_revenue"));
                        out.println("<br>");
                    }

                    
                %>
            </div>
            
            

            
            
            
            
            
            
            
            <div class = "column1">
         <div class = "columnhead">Class</div>
        <% 
                   
                    rs1 = stmt.executeQuery("select Class as total_revenue from Ticket where extract(month from PurchaseDate) = '" + month + "' ");

           
                  

                    while (rs1.next()) {
                    	out.println("<br>");
                        out.println(rs1.getString("total_revenue"));
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