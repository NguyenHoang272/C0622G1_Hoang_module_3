<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 07/10/2022
  Time: 11:23 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h2>Add New Customer</h2>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

    <form method="post">
        <table class="table table-dark table-striped" style="width: 800px" border="1px">
            <tr>
                <td>
                    <pre>Customer Type:</pre>
                </td>
                <td>
                    <select name="customer-type">
                        <option value="1">Diamond</option>
                        <option value="2">Platinium</option>
                        <option value="3">Gold</option>
                        <option value="4">Silver</option>
                        <option value="5">Member</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <pre>Name:</pre>
                </td>
                <td><input type="text" name="name" required pattern="^.+$" title="Vui lòng không để trống địa chỉ."></td>
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
                <td><input type="text" name="id-card"></td>
            </tr>
            </tr>
            <tr>
                <td>
                    <pre>Gender:</pre>
                </td>
                <td><input type="radio" name="gender" value="true">Male <input type="radio" value="false" name="gender"> Female</td>
            </tr>
            <tr>
                <td>
                    <pre>Phone Number:</pre>
                </td>
                <td><input type="text" name="phonenumber"></td>
            </tr>
            <tr>
                <td>
                    <pre>Email:</pre>
                </td>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td>
                    <pre>Address:</pre>
                </td>
                <td><input type="text" name="address"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"/></td>
            </tr>
        </table>
    </form>
    <a href="/customer">
        <button type="button">Back List Customer</button>
    </a>
</center>
</body>
</html>
