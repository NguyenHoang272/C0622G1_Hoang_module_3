<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 05/10/2022
  Time: 4:12 CH
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
<center>
    <h2>Edit Employee</h2>
    <form method="post">
        <table class="table table-dark table-striped" style="width: 800px" border="1px">
            <input type="hidden" name="id" value="${employee.getEmployeeId()}">
            <tr>
                <td>
                    <pre>Name:</pre>
                </td>
                <td><input type="text" name="name" value="${employee.getName()}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Birthday:</pre>
                </td>
                <td><input type="date" name="birthday" value="${employee.getDateOfBirth()}"></td>
            </tr>
            </tr>
            <tr>
                <td>
                    <pre>ID Card:  </pre>
                </td>
                <td><input type="text" name="id-card" value="${employee.getIdCard()}"></td>
            </tr>
            </tr>
            <tr>
                <td>
                    <pre>Salary:  </pre>
                </td>
                <td><input type="text" name="salary" value="${employee.getWage()}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Phone Number:</pre>
                </td>
                <td><input type="text" name="phonenumber" value="${employee.getPhone()}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Email:</pre>
                </td>
                <td><input type="text" name="email" value="${employee.getEmail()}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Address:</pre>
                </td>
                <td><input type="text" name="address" value="${employee.getAddress()}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Position:</pre>
                </td>
                <td>
                    <select name="positionId">
                        <option value="1">Lễ Tân</option>
                        <option value="2">Phục Vụ</option>
                        <option value="3">Chuyên Viên</option>
                        <option value="4">Giám sát</option>
                        <option value="5">Quản lí</option>
                        <option value="6">Giám Đốc</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <pre>Education:</pre>
                </td>
                <td><select name="educationId">
                    <option value="1">Trung Cấp</option>
                    <option value="2">Cao Đẳng</option>
                    <option value="3">Đại Học</option>
                    <option value="4">Sau Đại Học</option>
                </select></td>
            </tr>

            <tr>
                <td>
                    <pre>Division:</pre>
                </td>
                <td><select name="divisionId">
                    <option value="1">Sale-Marketing</option>
                    <option value="2">Hành chính</option>
                    <option value="3">Phục vụ</option>
                    <option value="4">Quản lý</option>
                </select></td>
            </tr>
            <tr>
                <td>
                    <pre>Username:</pre>
                </td>
                <td><input type="text" name="username" value="${employee.getUsername()}"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"/></td>
            </tr>
        </table>
    </form>
    <a href="/employees">
        <button type="button">Back List Employees</button>
    </a>
</center>
</body>
</html>
