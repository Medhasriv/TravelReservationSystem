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
String questionID = request.getParameter("QuestionID");
String answer = request.getParameter("Answer");

ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection(db.getTravelDB());	
Statement stmt = con.createStatement();

String query = "UPDATE Questions SET Answer = '" + answer + "' WHERE QuestionID = " + questionID + ";";
//stmt.executeUpdate(query);
try {
    //stmt = conn.createStatement();
    //String query = "YOUR SQL QUERY HERE"; // Replace with your actual query
    int rowsAffected = stmt.executeUpdate(query);
    if (rowsAffected == 0){
    	out.println("<br>Error: Potentially inputed a non-existing Question ID");
    }
    else{
    	out.println("<br>Success!!");
    }
    // Other operations
} catch (SQLException e) {
    out.println("An error occurred: A wrong value was potentially passed as the Question ID");
    // Log the exception if needed for debugging
}



%>

<br>
<a href="RepQuestions.jsp">Back to Questions Page</a>
</body>
</html>