<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <link href="AADinfoAAF.css" rel="stylesheet">
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
	
	
	
    <div class="nav-4">
        <div class="nav-5">
            <div class="nav-6">What would you like to change?</div>
                
                <form action="HandleAADAAF.jsp" method="post">
                	<div class="nav-7">
                		<div>
                		<label>Select Action: </label>
                		<select name="action">
                			<option value="Insert">Insert</option>
                			<option value="Update">Update</option>
                			<option value="Delete">Delete</option>
                		</select>
                		</div>
                	
                		<div style="padding-left: 30px;">
                		<label>Select Category: </label>
                		<select name="category">
                			<option value="Flight">Aircraft/Flight</option>
                			<option value="Airport">Airport</option>
                		</select>
                		</div>
                	</div>
                	<br>
                	<br>
                	<div style="text-align: center;"><input type="submit" value="submit" style="width: 150px; height: 40px; "></div>
                	
                </form>
                
            
        </div>
    </div>
</body>
</html>
