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
<div class = "op8">Add, Edit information and Delete a customer   </div>

    </div>

        <div class = "nav-4">

 <div class="box10">
    <div class="heading">Customer Edits</div>

        
        
        
        
        

    <% if (session.getAttribute("user") == null) { %>
        You are not logged in<br/>
        <a href="AdminLogin.jsp">Please Login</a>
    <% } else { %>
        <%= session.getAttribute("user") %>





        <div class="table">
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

            <div class = "column1">
         <div class = "columnhead">Add Customer </div>
       
      
      
      <div class="Input-Box">
        <div class="Header">
            <div class="Logo"></div>
        </div>

        <div class="Input">
            <form action="CustomerInformationDupe.jsp" method="POST">
 
 <div class="tag3">
<div class = "name">Username</div>
<input type="text" id="Username" name="Username" placeholder="Username">
</div>        
 
 
<div class="tag3">
<div class = "name">Password</div>
<input type="password" id="Password" name="Password" placeholder="Password">
</div>

 <div class="tag6">
<div class = "name">Mobile Number</div>
<input type="text" id="Phone" name="Phone" placeholder="862-201-9060">
</div>



<div class="tag5">
<div class = "name">Date of Birth</div>
<input type="text" id="DOB" name="DOB" placeholder="YYYY-MM-DD">
</div>

<div class="tag1">
<div class = "name">Full Name</div>
<input type="text" id="Name" name="Name" placeholder="John Smith">
</div>



 <div class="tag4">
<div class = "name">Email</div>
<input type="text" id="Email" name="Email" placeholder="helloworld@mail.com">
<input type="submit" class="login" value="Create Customer">
</div>

            </form>
        </div>

    </div>

<%-- 

   <div class="Create-Box">
        <a href="CustomerInformationtDupe.jsp" class="create">Back to Login</a>
    </div>

--%>      
            </div>



      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     
     
     
     
     
     
     
      
      
      
      
      
      
      
      
      
      
      
      
      
      <div class = "column1">
         <div class = "columnhead">Delete Customer </div>
       
      
      
       <div class="Input-Box">
        <div class="Header">
            <div class="Logo">Enter Customer to Delete</div>
        </div>

        <div class="Input">
            <form action="CustomerInformation.jsp" method="POST">

                <div class="tag3">
                    <div class="name"></div>
                    <input type="text" id="Username" name="Username" placeholder="Username">
                </div>

                <input type="submit" class="login" value="Delete Customer">
            </form>
        </div>
    </div>

    <div class="Create-Box">
        <%
            String userid = request.getParameter("Username");

            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection(db.getTravelDB());
            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE username='" + userid + "'");
            if (rs.next()) {
                int deleteResult = stmt.executeUpdate("DELETE FROM users WHERE username='" + userid + "'");
        %>
                <div style="color: white;">
                    User data deleted successfully!
                    <p></p>
                    Back to <a href='CustomerInformation.jsp' style="color: white; text-decoration: none;">Customer Information</a>
                </div>
        <%
            } else {
        %>
                <div style="color: white;">
                    User not found.
                    <p></p>
                    Back to <a href='CustomerInformation.jsp' style="color: white; text-decoration: none;">Customer Information</a>
                </div>
        <%
            }
        %>
    </div>
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
         
      
            <div class = "column1">
         <div class = "columnhead">Edit Customer </div>
       
      
      
      <div class="Input-Box">
        <div class="Header">
            <div class="Logo"></div>
        </div>

        <div class="Input">
            
            
        
        
            
            
            
            
            
            
            
<form action="CustomerInformationEdit.jsp" method="POST">
   
   
   
    <div class="tag3">
        <div class="name">Enter Username You want to Change</div>
        <input type="text" id="Username" name="Username" placeholder="Username">
    </div>




    <div class="tag3">
        <div class="name">Password</div>
        <input type="password" id="Password" name="Password" placeholder="Password">
    </div>
    
    
    
    
    <div class="tag3">
    <div class="name">Phone</div>
    <input type="text" id="Phone" name="Phone" placeholder="862-201-9060">
</div>
    
    <div class="tag3">
    <div class="name"> Date of Birth</div>
    <input type="text" id="DOB" name="DOB" placeholder="YYYY-MM-DD">
</div>
    
    
<div class="tag3">
    <div class="name"> Full Name</div>
    <input type="text" id="Name" name="Name" placeholder="Bruce Wayne">
</div>


<div class="tag3">
    <div class="name">Email</div>
    <input type="text" id="Email" name="Email" placeholder="helloworld@mail.com">
</div>




    
    

    <input type="submit" class="login" value="Edit">
</form>
            
            
            
            
            
            
          
          
            
            
        </div>

    </div>

  
            </div>
      
      
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

    </div>    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
            </div>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
            </div>
            
            
            
            
            
         
            
            
        </div>
        
        
        

       
    <% } %>
</div>
      
      
      
      </div> 
      
      
          </div>


        </div>







</body>
</html>




