<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 05/10/2022
  Time: 9:09 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <style>
        header{
            width: 100%;
        }
        header .left-header img{
            width: 40px;
            height: 80px;
            margin: 5px 5px 5px 40px;
            float: left;
        }
        header .right-header h3{
            float: right;
        }
        .menu{
            clear: left;
            float: left;
            width: 100%;
        }
        .body-mid .body-mid-left{
            clear: left;
            float: left;
            width: 20%;
            min-height: 100%;
        }
        .body-mid .body-mid-right{
            float: left;
            width: 80%;
        }
        .body-mid .body-mid-right img{
            width: 100%;
        }
        footer{
            clear: left;
            text-align: center;
            background-color: cadetblue;
        }

    </style>
</head>
<body>
<header>
    <div class="left-header">
        <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png">
    </div>
    <div class="right-header">
        <h3>Nguyễn Văn Hùng</h3>
    </div>
</header>
<div class="menu">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="/home">Home</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/employees">Employees</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/customer">Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/facility">Service</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="booking.jsp">Booking</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="contract.jsp">Contract</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit" name="search">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<div class="body-mid">
    <div class="body-mid-left">
        <ul class="list-group">
            <li class="list-group-item">An item</li>
            <li class="list-group-item">A second item</li>
            <li class="list-group-item">A third item</li>
            <li class="list-group-item">A fourth item</li>
            <li class="list-group-item">And a fifth one</li>
        </ul>
    </div>
    <div class="body-mid-right">
        <img src="https://exclusivesmedia.webjet.com.au/uploads/2015/05/Furama6.jpg">
    </div>
</div>
<footer>
    <p>Nguyễn Văn Hùng</p>
</footer>
</body>
</html>
