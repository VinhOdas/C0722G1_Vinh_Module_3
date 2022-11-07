
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>
<h1>Chỉnh sửa sản phẩm</h1>
<p>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/employees">Quay lại Danh sách sản phẩm</a>
</p>
<form action="/employees?action=edit" method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Id:</td>
                <td><input type="text" name="id" id="id" value="${employeeEdit.getId()}"></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" id="name" value="${employeeEdit.getName()}"></td>
            </tr>
            <tr>
                <td>Birth Day:</td>
                <td><input type="text" name="birthDay" id="birthDay" value="${employeeEdit.getBirthDay()}"></td>
            </tr>
            <tr>
                <td>Id Card</td>
                <td><input type="text" name="idCard" id="idCard" value="${employeeEdit.getIdCard()}"></td>
            </tr>
            <tr>
                <td>Salary</td>
                <td><input type="text" name="salary" id="salary" value="${employeeEdit.getSalary()}"></td>
            </tr>
            <tr>
                <td>phone</td>
                <td><input type="text" name="phone" id="phone" value="${employeeEdit.getPhone()}"></td>
            </tr>
            <tr>
                <td>email</td>
                <td><input type="text" name="email" id="email" value="${employeeEdit.getEmail()}"></td>
            </tr>
            <tr>
                <td>address</td>
                <td><input type="text" name="address" id="address" value="${employeeEdit.getAddress()}"></td>
            </tr>
            <td>
                <pre>Position:</pre>
            </td>
            <tr>
                <td>
                    <select name="idPosition">
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
                <td><select name="idEducationDegree">
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
                <td><select name="idDivision">
                    <option value="1">Sale-Marketing</option>
                    <option value="2">Hành chính</option>
                    <option value="3">Phục vụ</option>
                    <option value="4">Quản lý</option>
                </select></td>
            </tr>

            <tr>
                <td>userName</td>
                <td><input type="text" name="userName" id="userName" value="${employeeEdit.getUserName()}"></td>
            </tr>
            <tr>

                <td></td>                <td><input type="submit" value="Update product"></td>

            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
