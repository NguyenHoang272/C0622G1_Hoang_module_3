<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 9/26/2022
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Product Discount</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<h2>Product Discount</h2>
<form action="/convert" method="post">
  <h3>Product Description
    <input type="text" name="text">
  </h3>
  <label>List Price: </label><br/>
  <input type="text" name="list price" placeholder="Enter Product's Price" value=""/><br/>
  <label>Discount Percent: </label><br/>
  <input type="text" name="discount percent" placeholder="Enter Discount's Percent" value=""/><br/>
  <input type = "submit" id = "submit" />
</form>
</body>
</html>