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
</head>
<body>
<header style="text-align: center;margin: 5px">
    <h1>List Employees</h1>
    <div><a href="/home"><button type="button" class="btn btn-info">Home</button></a></div>
    <a href="/employees?action=add" ><button  style="margin: 10px" type="button" class="btn btn-info">Add New Employee</button></a>
    <form action="/employees">
        <input type="hidden" name="action" value="find">
        <input type="text" name="search">
        <input type="submit" value="Search" class="btn btn-info">
    </form>
</header>
<table id="tableProduct" class="table table-dark" style="text-align: center" border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Date of birth</th>
        <th>ID Card</th>
        <th>Salary</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th>Address</th>
        <th>Position</th>
        <th>Education</th>
        <th>Division</th>
        <th>UserName</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="employee" items="${listEmployees}">
    <tr>
        <td>${employee.getEmployeeId()}</td>
        <td>${employee.getName()}</td>
        <td>${employee.getDateOfBirth()}</td>
        <td>${employee.getIdCard()}</td>
        <td>${employee.getWage()}</td>
        <td>${employee.getPhone()}</td>
        <td>${employee.getEmail()}</td>
        <td>${employee.getAddress()}</td>
        <td>${employee.getPositionId()}</td>
        <td>${employee.getEducationDegreeId()}</td>
        <td>${employee.getDivisionId()}</td>
        <td>${employee.getUsername()}</td>
        <td> <!-- Button trigger modal -->
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#minhChau${employee.getEmployeeId()}">
                Edit
            </button>
            <!-- Modal -->
            <div class="modal fade " id="minhChau${employee.getEmployeeId()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog ">
                    <div class="modal-content bg-dark">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1">Edit</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Bạn có muốn edit <strong class="text-danger">${employee.name}?</strong>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <a href="/employees?action=edit&id=${employee.getEmployeeId()}" class="btn btn-danger">Edit</a>
                        </div>
                    </div>
                </div>
            </div>
        </td>
        <td>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete${employee.getEmployeeId()}">
                Delete
            </button>
            <!-- Modal -->
            <div class="modal fade " id="delete${employee.getEmployeeId()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog ">
                    <div class="modal-content bg-dark">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Bạn có muốn xóa <strong class="text-danger">${employee.name}?</strong>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <a href="/employees?action=delete&id=${employee.getEmployeeId()}" class="btn btn-danger">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableProduct').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
