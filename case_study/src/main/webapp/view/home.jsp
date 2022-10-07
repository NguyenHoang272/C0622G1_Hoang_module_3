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
        body {
            font-family: Verdana, sans-serif;
            font-size: 10px;
            background: white;
        }

        * {
            box-sizing: border-box;
            margin: 0px;
            padding: 0px;
        }
        .menu{
            font-size: 20px;
        }
        header {
            padding: 20px;
            color: black;
            background-color: #007f3f;

        }

        footer{
            padding: 10px;
            color: white;
            background-color: black;

        }


        /*nav ul {*/
        /*    padding: 15px;*/
        /*    text-align: center;*/
        /*    background: yellowgreen;*/
        /*    margin-left: 80px;*/
        /*    margin-right: 80px;*/
        /*}*/

        /*nav ul li {*/
        /*    display: inline;*/
        /*    margin: 5px;*/
        /*    font-family: Verdana;*/
        /*    font-size: 15px;*/
        /*    padding: 15px;*/
        /*    background: yellowgreen;*/
        /*}*/

        /*li:hover {*/
        /*    background-color: #f05a00;*/
        /*}*/

        .col {
            /*margin-top: 15px;*/
            background: #d0dbd5;
            height: 1200px;

        }

        .col-left {
            background: #d0dbd5 ;
            width: 30%;
            float: left;
            font-size: 16px;
            margin-top: 15px;
        }

        .col-right {
            background: #d0dbd5;
            width: 70%;
            height: 1185px;
            float: left;
            font-size: 13px;
            margin-top: 20px;
        }

        footer {
            height: 100px;
        }

        .footer {
            margin-bottom: 20px;
        }

        .col-left-1 {
            margin-top: 5px;
            height: 1185px;
            margin-left: 15px;
        }
    </style>
</head>
<body>
<header>
    <a><img src="https://static.topcv.vn/company_logos/oruz4IPeY3cyRu9HaWwRFrSdfWfDnw60_1635916800____08c8e444e64ab28b2cef44fb69347361.png"
            style="height: 100px; width: 150px"></a>
    <h3 style="float: right; margin-top: 50px">Nguyễn Mậu Hoàng</h3>
</header>
<div class="menu">
    <nav class="navbar navbar-expand-lg navbar-light" style="background: #00592b">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Home</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/employees">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/customer">Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/facility">Service</a>
                    </li>
                    <!--                <li class="nav-item dropdown">-->
                    <!--                    <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">-->
                    <!--                        Facility-->
                    <!--                    </a>-->
                    <!--&lt;!&ndash;                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">&ndash;&gt;-->
                    <!--&lt;!&ndash;                        <li><a class="dropdown-item" href="#">Villa</a></li>&ndash;&gt;-->
                    <!--&lt;!&ndash;                        <li><a class="dropdown-item" href="#">House</a></li>&ndash;&gt;-->
                    <!--&lt;!&ndash;                        <li><hr class="dropdown-divider"></li>&ndash;&gt;-->
                    <!--&lt;!&ndash;                        <li><a class="dropdown-item" href="#">Room</a></li>&ndash;&gt;-->
                    <!--&lt;!&ndash;                    </ul>&ndash;&gt;-->
                    <!--                </li>-->
                    <li class="nav-item">
                        <a class="nav-link active" href="booking.jsp" >Booking</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="contract.jsp">Contract</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>

<div class="col">
    <div class="col-left">
        <div class="col-left-1">
            <h5 style="margin-left: 90px">Giới thiệu</h5>
            <div class="card" style="width: 18rem;">
                <img src="Review-Furama-Resort-Da-Nang-13.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
            </div>
            <br><br>
            <div class="card" style="width: 18rem;">
                <img src="Review-Furama-Resort-Da-Nang-13.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
            </div>
            <br><br>
            <div class="card" style="width: 18rem;">
                <img src="Review-Furama-Resort-Da-Nang-13.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="col-right">
        <center><h5>Trải Nghiệm Furama</h5></center>
        <iframe width="860" height="415" src="https://www.youtube.com/embed/mPM5VsVQ3hw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        <br><br><br>
        <center><h5>Đà Nẵng 2022 - Furama Villas Resort</h5></center>
        <iframe width="860" height="415" src="https://www.youtube.com/embed/IOOcj2DKd9M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
</div>


<footer>
    <p class="footer">
    <p class="footer-1"> Tel.: 84-236-3847 333/888 * Fax: 84-236-3847 666</p><br>
    <p class="footer-2"> 103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam</p>
    </div>
</footer>
</body>
</html>
