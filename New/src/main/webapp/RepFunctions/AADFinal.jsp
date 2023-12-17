<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String action = request.getParameter("action");
String category = request.getParameter("category");

//Create database connection
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection(db.getTravelDB());	
Statement stmt = con.createStatement();
String query; 
%>

<% if (action.equals("Insert")) {
	String primaryKeyValue = request.getParameter("PrimaryKey");	
	String primaryKeyName;
	if (category.equals("Flight")) {
		//out.print("HI");
		primaryKeyName = "FlightNumber";
		query = "INSERT INTO " + category + " (" + primaryKeyName + ") VALUES (" + primaryKeyValue + ")";
		stmt.executeUpdate(query);

	} else {
		//out.print("BYE");
		primaryKeyName = "AirportID";
		query = "INSERT INTO " + category + " (" + primaryKeyName + ") VALUES ('" + primaryKeyValue + "')";
		stmt.executeUpdate(query);

	}
	
}%>

<% if (action.equals("Update")) {
	String primaryKeyValue = request.getParameter("PrimaryKey");
	String attribute = request.getParameter("attribute");
	String attributeValue = request.getParameter("attributeValue");
	String primaryKeyName;
	
	if (category.equals("Flight")) {
		primaryKeyName = "FlightNumber";
		if (attribute.equals("Domestic/International")){
			query = "UPDATE "+category+" SET "+ attribute +" = '"+ attributeValue +"' WHERE "+primaryKeyName+"="+primaryKeyValue;
			stmt.executeUpdate(query);
		} else {
			query = "UPDATE "+category+" SET "+ attribute +" = "+ attributeValue +" WHERE "+primaryKeyName+"="+primaryKeyValue;
			stmt.executeUpdate(query);
		}
	} else {
		primaryKeyName = "AirportID";
		query = "UPDATE "+category+" SET "+ attribute +"='"+ attributeValue +"' WHERE "+primaryKeyName+"='"+primaryKeyValue+"'";
		stmt.executeUpdate(query);
	}
	
}%>

<% if (action.equals("Delete")) { 
	String primaryKeyValue = request.getParameter("PrimaryKey");
	String primaryKeyName;
	if (category.equals("Flight")) {
		primaryKeyName = "FlightNumber";
		query = "DELETE FROM " + category + " WHERE " + primaryKeyName + " = " + primaryKeyValue;
		stmt.executeUpdate(query);
	} else {
		primaryKeyName = "AirportID";
		query = "DELETE FROM " + category + " WHERE " + primaryKeyName + " = '" + primaryKeyValue + "'";
		stmt.executeUpdate(query);
	}
	
}%>

Success!
<a href="../RepLanding.jsp">Back to Landing Page</a>

</body>
</html>