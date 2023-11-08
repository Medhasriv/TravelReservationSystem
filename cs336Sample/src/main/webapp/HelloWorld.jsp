<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>MASM Travel</title>
		   <link href="LoginPage.css" rel="stylesheet">
		   
		
	</head>
	
	<body>
	
	
    <div class = "Input-Box">
      <div class = "Header">
      <div class = "Logo">MASM</div>  
      </div>

      <div class = "Input">
        <form action="/">
    <br>
        
<input type="text" id="username" name="username" placeholder="User ID">
    <br>

    <br>
    <input type="text" id="password" name="password" placeholder="Password">
    <br>

    <br>
    <input type="submit" class = "login" value="Log In">
</form> 
      </div>

      <div class = "linebox"><div class = "line"></div></div>

    </div>


    <div class = "Create-Box">
        
      <a href="AccountCreationPage.html" class = "create">Create Online Account</a>
    </div>
	

	<!--Hello World1
<br>
<form method="post" action="show.jsp">
    <input type="radio" name="command" value="beers"/>Let's have a beer! Click here to see the beers.
    <br>
    <input type="radio" name="command" value="bars"/>Let's go to a bar! Click here to see the bars.
    <br>
    <input type="submit" value="submit" />
</form>
<br>
An existing bar wants to sell an existing beer! Type the bar, the beer, and the price of the beer:
<br>
<form method="get" action="sellsNewBeer.jsp">
    <table>
        <tr>    
            <td>Bar</td><td><input type="text" name="barvalia"></td>
        </tr>
        <tr>
            <td>Beer</td><td><input type="text" name="beer"></td>
        </tr>
        <tr>
            <td>Price</td><td><input type="text" name="price"></td>
        </tr>
    </table>
    <input type="submit" value="Add the selling beer!">
</form>
Alternatively, let's type in a new bar, a new beer, and a price that this bar will sell the beer for.
<br>
<form method="post" action="newBarBeerPrice.jsp">
    <table>
        <tr>    
            <td>Bar</td><td><input type="text" name="bar"></td>
        </tr>
        <tr>
            <td>Beer</td><td><input type="text" name="beer"></td>
        </tr>
        <tr>
            <td>Price</td><td><input type="text" name="price"></td>
        </tr>
    </table>
    <input type="submit" value="Add me!">
</form>
Or we can query the beers with price:
<br>
<form method="get" action="query.jsp">
    <select name="price" size=1>
        <option value="3.0">$3.0 and under</option>
        <option value="5.0">$5.0 and under</option>
        <option value="8.0">$8.0 and under</option>
    </select>&nbsp;<input type="submit" value="submit">
</form>
-->

</body>
</html>