<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/3/2022
  Time: 2:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search User</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Search User</h1>
<p>
    <a href="/users">Back to All List User</a>
</p>
<form action="/users">
    <input type="hidden" name="action" value="find">
    <legend>Find:</legend>
    <input type="text" name="country" id="country">
    <input type="submit" value="Find User">
</form>
<h3>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</h3>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Email</td>
        <td>Country</td>
    </tr>
    <c:forEach items="${userFound}" var="user">
        <tr>
            <td><a href="/user?action=view&id=${user.getId()}">${user.getName()}</a></td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
        </tr>
    </c:forEach>
</table>
</body>
<script>
</script>
