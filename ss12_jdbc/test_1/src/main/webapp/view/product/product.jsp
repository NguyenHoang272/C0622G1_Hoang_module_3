<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/9/2022
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-5.2.2-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href="../../view/home/home.css"/>
</head>
<body>
<div>
    <table id="tableProduct" class="table table-striped table-bordered" style="width:100%">
        <thread>
        <tr>
            <th>N.O</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Color</th>
            <th>Description</th>
            <th>Category</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thread>

        <tbody>
        <c:forEach var="x" items="${productList}" varStatus="stt">
            <tr>
                <td>${stt.count}</td>
                <td>${x.getProductName()}</td>
                <td>${x.getPrice()}</td>
                <td>${x.getQuantity()}</td>
                <td>${x.getColor()}</td>
                <td>${x.getDescription()}</td>
                <c:forEach var="y" items="${categoryList}" varStatus="stt" >
                    <c:if test="${x.getCategory_id() == y.getId()}">
                        <td>${y.getCategoryName()}</td>
                    </c:if>
                </c:forEach>
                <td>
                    <button
                            type="button"
                            class="btn btn-primary"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteModal">
                        Edit
                    </button>
                </td>
                <td>
                    <button onclick="getInfo('${x.getId()}')"
                            type="button"
                            class="btn btn-danger"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteModal">
                        Delete
                    </button>
                </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
    <p>${mess}</p>
</div>

<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form action="/product?action=deleteProduct" method="post">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Delete Product</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" name="idDelete" id="idDelete" hidden>
                    <p>Are you sure want to delete the product that has id of <span id="nameDelete"></span> ?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script>    function getInfo(id) {
    document.getElementById("idDelete").value = id;
    document.getElementById("nameDelete").innerHTML = id;
}</script>
</body>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="../../bootstrap-5.2.2-dist/js/bootstrap.bundle.min.js"></script>

</html>
