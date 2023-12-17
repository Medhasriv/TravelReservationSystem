<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create An Account</title>
<link href="CreateAccount.css" rel="stylesheet">
<%@ page import="java.sql.*" %>

<body>

    <div class="Input-Box">
        <div class="Header">
            <div class="Logo">Delete Customer</div>
        </div>

        <div class="Input">
            <form action="CustomerInformationDelete.jsp" method="POST">

                <div class="tag3">
                    <div class="name">Username</div>
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

            // Check if the user already exists
            ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE username='" + userid + "'");
            if (rs.next()) {
                // User exists, delete existing data
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

</body>
</html>