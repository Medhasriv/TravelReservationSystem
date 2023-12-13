<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link href="ProfilePage.css" rel="stylesheet">
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
			<p class='greet' style="color: white; width: 70%;">
				Welcome:
				<%=session.getAttribute("user")%></p>
			<%
			}
			%>
		</div>

		<a href="../LandingPage.jsp" class="title"
			style="text-decoration: none;">MASM</a>

		<div class="title2">
			<%
			if (session.getAttribute("user") == null) {
			%>
			<a class='greet' href="../LoginPage/LoginPage.jsp"
				style="color: white; width: 70%; text-decoration: none;">Please
				Login</a>
			<%
			} else {
			%>
			<a class='greet' href="../Logout.jsp"
				style="color: white; width: 70%; text-decoration: none;">Log out</a>
			<%
			}
			%>
		</div>

	</div>
	<div class="nav-2">

		<div class="op1">Hotels</div>
		<div class="op2">Flights</div>
		<div class="op3">Cars</div>
		<div class="op4">Activities</div>
		<div class="op5">Cruises</div>
		<div class="op6"></div>
		<div class="op7">
			<a href="../ProfilePage/ProfilePage.jsp">Profile</a>
		</div>
		<div class="op8">
			<a href="../TripsPage/TripsPage.jsp">Trips</a>
		</div>
		<div class="op9">Cart</div>
	</div>
	<div class="nav-3"></div>
	<div class="nav-4">
		<div class="nav-5">
			<div class="nav-6">
				<div class="left">
					<div class="b1">
						<div class="b1a">User</div>
						<div class="b1b"></div>
					</div>
					<div class="b2">Valued Traveler at MASM</div>
					<div class="b3"></div>
					<div class="b4"></div>
				</div>
				<div class="right">
					<div class="a1">
						<div class="a1a">Account Information</div>
					</div>
					<div class="a1b">
						<div class="boxy">

							<div class="l">Username</div>

							<div class="r">

								<div class="title2">
									<%
									if (session.getAttribute("user") == null) {
									%>
									<p class='greet' style="color: white; width: 70%;">Visitor</p>
									<%
									} else {
									%>
									<p class='greet' style="color: white; width: 70%;"><%=session.getAttribute("user")%></p>
									<%
									}
									%>
								</div>
							</div>
						</div>

						<div class="boxy">

							<div class="l">Password</div>

							<div class="r">
								<div class="title2">
									<%
									if (session.getAttribute("user") == null) {
									%>
									<p class='greet' style="color: white; width: 70%;">Visitor</p>
									<%
									} else {
									%>
									<p class='greet' style="color: white; width: 70%;"><%=session.getAttribute("pas")%></p>
									<%
									}
									%>
								</div>
							</div>
						</div>

						<div class="boxy">

							<div class="l">Phone</div>

							<div class="r">d</div>

						</div>


						<div class="boxy">

							<div class="l">DOB</div>

							<div class="r">d</div>

						</div>

						<div class="boxy">

							<div class="l">Name</div>

							<div class="r">d</div>

						</div>

						<div class="boxy">

							<div class="l">Email</div>

							<div class="r">d</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>