<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 9/29/2022
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Danh sách</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <style>
        img{
            height: 100px;
            width: 150px;
        }
    </style>

</head>
<body>
<h1 style="text-align: center">Danh sách</h1>
<table class="table table-success table-striped">
    <tr>
        <th>Id</th>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa Chỉ</th>
        <th>Hình Ảnh</th>
    </tr>
    <c:forEach items="${customerList}" var="customer">
    <tr>

           <td>${customer.getId()}</td>
           <td>${customer.getName()}</td>
           <td>${customer.getDateOfBirth()}</td>
           <td>${customer.getAddress()}</td>
           <td><img src=" ${customer.getImage()}"></td>

    </tr>
    </c:forEach>
</table>
</body>
</html>
