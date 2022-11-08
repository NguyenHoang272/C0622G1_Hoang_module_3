<%--
  Created by IntelliJ IDEA.
  User: Xuan Vinh
  Date: 09/10/2022
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-5.2.2-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href="../../view/home/home.css"/>
</head>
<body>

<div class="header">
    <h1>PRODUCT INFORMATION MANAGEMENT</h1>
</div>

<div class="topnav">
    <a href="#">Link</a>

    <a href="/product">Product</a>

    <button style="margin-top: 8px" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addNewModal">
        Add new product
    </button>

    <div style="float: right; margin-top:6px; margin-right: 10px">
        <form style="flex: 1;" action="/product?action=search" method="post"
              class="d-flex justify-content-end m-0 p-0 align-items-center">
            <input class="form-control w-auto mx-2" type="text" placeholder="Search by Product's Name..."
                   name="productNameSearch">
            <input class="form-control w-auto mx-2" type="text" placeholder="Search by Price..."
                   name="priceSearch">
            <input class="btn btn-outline-success mx-2" type="submit" style="color: white" value="Search"
                   style="margin-right: 0!important;">
        </form>
    </div>
</div>

<div class="row">
    <div class="leftcolumn" style="margin-top: 10px">
        <table id="tableProduct" class="table table-striped table-bordered" style="width:100%">
            <thead>
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
            </thead>
            <tbody>
            <c:forEach var="x" items="${productList}" varStatus="stt">
                <tr>
                    <td>${stt.count}</td>
                    <td>${x.getProductName()}</td>
                    <td>${x.getPrice()}</td>
                    <td>${x.getQuantity()}</td>
                    <td>${x.getColor()}</td>
                    <td>${x.getDescription()}</td>
                    <c:forEach var="y" items="${categoryList}">
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
    <div class="rightcolumn">
        <div class="card">
            <h2>About Me</h2>
            <div class="fakeimg" style="height:100px;">Image</div>
            <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
        </div>
        <div class="card">
            <h3>Popular Post</h3>
            <div class="fakeimg"><p>Image</p></div>
            <div class="fakeimg"><p>Image</p></div>
            <div class="fakeimg"><p>Image</p></div>
        </div>
        <div class="card">
            <h3>Follow Me</h3>
            <p>Some text..</p>
        </div>
    </div>
</div>

<div class="footer">
    <h2>Footer</h2>
</div>


<div class="modal fade" id="addNewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form action="/product?action=add" method="post">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">Add new product</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="input-group mb-3">
                        <span class="input-group-text">Name</span>
                        <input type="text" class="form-control" name="name" aria-label="Name"
                               aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Price</span>
                        <input type="text" class="form-control" name="price" aria-label="price"
                               aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Quantity</span>
                        <input type="text" class="form-control" name="quantity" aria-label="quantity"
                               aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Color</span>
                        <select name="color">
                            <option value="Red">Red</option>
                            <option value="Blue">Blue</option>
                            <option value="Black">Black</option>
                            <option value="White">White</option>
                            <option value="Yellow">Yellow</option>
                        </select>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Description</span>
                        <input type="text" class="form-control" name="description" aria-label="description"
                               aria-describedby="basic-addon1">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Category</span>
                        <select name="category_id">
                            <option value="1">Phone</option>
                            <option value="2">Tivi</option>
                            <option value="3">Fridge</option>
                            <option value="4">Washing machine</option>
                            <option value="5">Car</option>
                            <option value="5">Bike</option>
                        </select>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Create</button>
                </div>
            </div>
        </div>
    </form>
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


</body>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="../../bootstrap-5.2.2-dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    function getInfo(id) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerHTML = id;
    }

</script>
</html>
