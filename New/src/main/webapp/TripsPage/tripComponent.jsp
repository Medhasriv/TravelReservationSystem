<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html> 
<head>
    <title>Pet Information</title>
    <style>
        /* Style for the pet box */
        .trip-box {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            width: 300px;
        }
    </style>
</head>
<body>

    <c:if test="${not empty Trip}">
        <div class="pet-box">
            <h2>${Trip.numStops}</h2>
<%--             <p>Birthday: ${pet.birthday.format(DateTimeFormatter.ofPattern('yyyy-MM-dd'))}</p>
            <p>Age: ${pet.age}</p> --%>
        </div>
    </c:if>

</body>
</html>