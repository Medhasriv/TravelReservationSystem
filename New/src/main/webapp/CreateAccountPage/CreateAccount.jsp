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
<body>
	<div class="Input-Box">
		<div class="Header">
			<div class="Logo">Create Your Account</div>
		</div>

		<div class="Input">
			<form action="CreateAccountDupe.jsp" method="POST">

				<div class="tag3">
					<div class="name">Username</div>
					<input type="text" id="Username" name="Username"
						placeholder="Username">
				</div>


				<div class="tag3">
					<div class="name">Password</div>
					<input type="password" id="Password" name="Password"
						placeholder="Password">
				</div>

				<div class="tag6">
					<div class="name">Mobile Number</div>
					<input type="text" id="Phone" name="Phone" placeholder="">
				</div>



				<div class="tag5">
					<div class="name">Date of Birth</div>
					<input type="text" id="DOB" name="DOB" placeholder="YYYY-MM-DD">
				</div>

				<div class="tag1">
					<div class="name">Full Name</div>
					<input type="text" id="Name" name="Name" placeholder="John Smith">
				</div>



				<div class="tag4">
					<div class="name">Email</div>
					<input type="text" id="Email" name="Email"
						placeholder="Enter email address"> <input type="submit"
						class="login" value="Create Account">
				</div>

			</form>
		</div>

	</div>

	<div class="Create-Box">
		<a href="../LoginPage/LoginPage.jsp" class="create">Back to Login</a>
	</div>


</body>
</html>