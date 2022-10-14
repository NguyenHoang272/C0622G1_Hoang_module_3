<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 07/10/2022
  Time: 11:23 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h2>Edit Customer</h2>


    <form method="post">
        <table border="1px">
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
                <td><input type="text" name="name" value="${customer.name}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Birthday:</pre>
                </td>
                <td><input type="date" name="birthday" value="${customer.dateOfBirth}" ></td>
            </tr>
            </tr>
            <tr>
                <td>
                    <pre>ID Card:  </pre>
                </td>
                <td><input type="text" name="id-card" value="${customer.idCard}"></td>
            </tr>
            </tr>
            <tr>
                <td>
                    <pre>Gender:</pre>
                </td>
                <td><input type="radio" name="gender" value="true">Nam <input type="radio" value="false" name="gender"> Nữ</td>
            </tr>
            <tr>
                <td>
                    <pre>Phone Number:</pre>
                </td>
                <td><input type="text" name="phonenumber" value="${customer.phone}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Email:</pre>
                </td>
                <td><input type="text" name="email" value="${customer.email}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Address:</pre>
                </td>
                <td><input type="text" name="address" value="${customer.address}"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"/></td>
            </tr>
        </table>
    </form>
    <a href="customer">
        <button type="button">Back List Customer</button>
    </a>
</center>
</body>
</html>
