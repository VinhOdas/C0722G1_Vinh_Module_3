
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<html>
<head>
    <title>Search product</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Search product</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Categories:</legend>
        <table>
            <tr>
                <td><input type="radio" name="option" value="id" onclick="openInput(this.value)">ID:
                </td>
                <td><input type="text" name="id" id="id" disabled="disabled">
                </td>
                <td>Search by name</td>
            </tr>
            <tr>
                <td><input type="radio" name="option" value="name" onclick="openInput(this.value)">Product name:
                </td>
                <td><input type="text" name="name" id="name" disabled="disabled"></br>
                </td>
                <td>Search by price</td>
            </tr>
            <tr>
                <td><input type="radio" name="option" value="Price" onclick="openInput(this.value)">Giá: From
                </td>
                <td><input type="number" name="minPrice" id="minPrice" disabled="disabled">To
                </td>
                <td><input type="number" name="maxPrice" id="maxPrice" disabled="disabled">
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="Search"></td>
            </tr>
        </table>

    </fieldset>
</form>
<h3>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</h3>
<table class="table table-dark table-striped">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Producer</td>
        <td>Description</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getProducer()}</td>
            <td>${product.getDescription()}</td>
            <td><a href="/products?action=edit&id=${product.getId()}">Edit</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
<script>
    let inputId = ["id", "name", "minPrice", "maxPrice", "producer"];
    function openInput(value) {
        for (let element of inputId) {
            document.getElementById(element).disabled = !element.includes(value);
        }
    }
</script>
</html>