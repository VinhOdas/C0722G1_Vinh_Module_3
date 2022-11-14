
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h2>Edit Customer</h2>


    <form method="post">
        <table border="1px">
            <th>Customer type:</th>
            <td>
                <select name="customer_type_id">
<%--                    <c:forEach var="cusType" items="${customerTypeList}">--%>
<%--                        <option value="${cusType.getCustomerType()}"--%>
<%--&lt;%&ndash;                                <c:if test="${cusType.getCustomerType() == customer.getType()}">seleced</c:if>>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                ${cusType.getName()}&ndash;%&gt;--%>
<%--                        --%>
<%--                        </option>--%>
<%--                    </c:forEach>--%>
                 <c:forEach var="data" items="${customerTypeList}" >
                    <option value="${data.getCustomerType()}">
                            ${data.getName()}</option>
                </c:forEach>
                </select>
            </td>
            <tr>
                <td>
                    <pre>Name:</pre>
                </td>
                <td><input type="text" name="name"value="${customer.getName()}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Birthday:</pre>
                </td>
                <td><input type="date" name="birthday" value="${customer.getBirthDay()}"></td>
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
                <td>Gender:</td>
                <td>
                    <input type="radio" name="gender" size="45" <c:if test="${customer.isGender()}"> checked</c:if>>Nam
                    <input type="radio" name="gender" size="45" <c:if test="${!customer.isGender()}"> checked</c:if> >Nữ
                </td>
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
                <td><input type="text" name="address" value = "${customer.address}"></td>
            </tr>
            <tr>

                <td></td>
                <td><input type="submit" value="Update "></td>

            </tr>
        </table>
    </form>
    <a href="/customers">
        <button type="button">Back List Customer</button>
    </a>
</center>
</body>
</html>
