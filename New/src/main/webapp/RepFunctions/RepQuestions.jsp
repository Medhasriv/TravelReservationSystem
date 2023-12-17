<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <link href="RepQuestions.css" rel="stylesheet">
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
        <div class="op2">Reply to Customer Questions</div>
        <div class="op7">
            <a>Profile</a>
        </div>
    </div>
	
	<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection(db.getTravelDB());	
	Statement stmt = con.createStatement();
	
	String query = "SELECT * FROM Questions";

	ResultSet rs1;               
	rs1 = stmt.executeQuery(query);
	
	%>
	
    <div class="nav-3"></div>

    <div class="nav-4">
        <div class="nav-5">
            <div class="nav-6">Customer Questions</div>
            <div class="nav-7"></div>
                
                <form action="RepQuestionsHandler.jsp" method="post">
                	<div style="font-family: Freeroad; font-size: 30px; padding-left: 10px;">
                    	Enter the Question ID of the question you wish to answer<input type="text" name="QuestionID" placeholder="QuestionID">
                	</div>
                	<br>
                	<div style="font-family: Freeroad; font-size: 30px; padding-left: 10px;">
                    	Enter the Answer of the question you are answering<input type="text" name="Answer" placeholder="Answer">
                	</div>
                	<div style="text-align: center;"><input type="submit" value="submit" style="width: 150px; height: 40px;"></div>
                	<br>
                	<br>
                </form>
                
                <%
                //out.println("QuestionID&nbsp;&nbsp;Question&nbsp;&nbsp;Answer<br>");
                while(rs1.next()) {
                	int questionID = rs1.getInt("QuestionID");
                	String question = rs1.getString("Question");
                    String answer = "NULL";
                	if (rs1.getString("Answer") == null){
                    	
                    } else {
                    	answer = rs1.getString("Answer");
                    }
                	out.println("<div style=\"font-family: Freeroad; font-size: 20px; padding-left: 20px; color: white;\">QUESTIONID: "+questionID+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QUESTION: "+question+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ANSWER: "+answer+"</div><br>");
                }
                %>
                
            
            
        </div>
    </div>
</body>
</html>
