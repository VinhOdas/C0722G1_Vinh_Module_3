
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xóa sản phẩm</title>
</head>
<body>
<h1>Xóa sản phẩm</h1>
<p>
    <a href="/products">Quay lại Danh sách sản phẩm</a>
</p>
<form method="post">
    <h3>Bạn chắc chắn xóa sản phẩm này chứ?</h3>
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên: </td>
                <td>${product.getName()}</td>
            </tr>
            <tr>
                <td>Giá: </td>
                <td>${product.getPrice()}</td>
            </tr>
            <tr>
                <td>Mô tả: </td>
                <td>${product.getDescription()}</td>
            </tr>
            <tr>
                <td>Nhà sản xuất: </td>
                <td>${product.getProducer()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete product"></td>
                <td><a href="/products">Quay lại Danh sách sản phẩm</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
