<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 05/10/2022
  Time: 4:10 CH
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
    <h2>Add New Employee</h2>


    <form method="post">
        <table class="table table-dark table-striped" style="width: 800px" border="1px">
            <tr>
            <td>
                <pre>Name:</pre>
            </td>
            <td><input type="text" name="name"
                       required pattern="^[A-Z][a-z]+( [A-Z][a-z]*)+$"
                       title="Tên nhân viên không được chứa số và các kí tự đầu tiên của mỗi từ phải viết hoa.">
            </td>
            </tr>
            <tr>
                <td>
                    <pre>Birthday:</pre>
                </td>
                <td><input type="date" name="birthday"></td>
            </tr>
            </tr>
            <tr>
                <td>
                    <pre>ID Card:  </pre>
                </td>
                <td><input type="text" name="id-card" required pattern="^\d{9}|\d{12}$"
                           title="Số CMND phải đúng định dạng XXXXXXXXX hoặc XXXXXXXXXXXX (X là số 0-9)."></td>
            </tr>
            </tr>
            <tr>
                <td>
                    <pre>Salary:  </pre>
                </td>
                <td><input type="text" name="salary" required pattern="^[1-9]\d*[.]?\d+$"
                           title="Lương, Giá, Tiền đặt cọc phải là số dương."></td>
            </tr>
            <tr>
                <td>
                    <pre>Phone Number:</pre>
                </td>
                <td><input type="text" name="phonenumber" required pattern="^09[01]\d{7}|[(]84[)][+]9[01]\d{7}$"
                           title="Số điện thoại phải đúng định dạng 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx."></td>
            </tr>
            <tr>
                <td>
                    <pre>Email:</pre>
                </td>
                <td><input type="text" name="email" pattern="^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]{2,}(\.[A-Za-z0-9]{2,}){1,2}$"
                           title="Địa chỉ email phải đúng định dạng.">></td>
            </tr>
            <tr>
                <td>
                    <pre>Address:</pre>
                </td>
                <td><input type="text" name="address" required pattern="^.+$" title="Vui lòng không để trống địa chỉ."></td>
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
                <td><input type="text" name="username"></td>
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
