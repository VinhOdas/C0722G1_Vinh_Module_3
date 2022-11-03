<%--
  Created by IntelliJ IDEA.
  User: Vinho
  Date: 11/3/2022
  Time: 2:50 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Hiển thị danh sách khách hàng </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

    <title>Title</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table class="table table-warning table-striped">

    <tbody>
    <tr>
        <td> STT </td>
        <td> Tên </td>
        <td> Ngày sinh </td>
        <td> Địa chỉ </td>
        <td> Ảnh </td>
    </tr>

    <c:forEach var="data" items="${customerList}" varStatus="status" >
        <tr>
            <td style="background: aqua">${status.count}</td>
            <td style="background: antiquewhite">${data.getName()}</td>
            <td style="background: orange">${data.getBirthDay()}</td>
            <td style="background: beige">${data.getAddress()}</td>
            <td>
                <c:choose>
                    <c:when test="${status.count == 1}">
                        <img style="width: 50px"; height="50px" src="image/98644.jpg">
                    </c:when>
                    <c:when test="${status.count == 2}">
                        <img style="width: 50px"; height="50px" src="image/sieu_nhan_do.webp">
                    </c:when>
                    <c:when test="${status.count == 3}">
                        <img style="width: 50px"; height="50px" src="image/sieu_nhan_vang.jpg">
                    </c:when>
                    <c:when test="${status.count == 4}">
                        <img style="width: 50px"; height="50px" src="image/sieu_nhan_xanh.jpg">
                    </c:when>
                    <c:when test="${status.count == 5}">
                        <img style="width: 50px"; height="50px" src="image/cat_uyen.png">
                    </c:when>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>
</body>
</html>
