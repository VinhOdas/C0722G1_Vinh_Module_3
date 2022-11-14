
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm mới</title>
    <link rel="stylesheet" href="../bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>

<center>
    <h1>User Management</h1>
    <h2>
        <a href="/customers?action=list">List All Customer</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table style="border-style:hidden;" width="200px" bgcolor="#c4e4cd">
            <caption>
                <h2>Add New Customer</h2>
                <c:if test="${mess!=null}">
                    <div aria-live="polite" aria-atomic="true" class="position-relative">
                        <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true">
                            <div class="toast-header">
                                <svg class="bd-placeholder-img rounded me-2" width="20" height="20"
                                     xmlns="http://www.w3.org/2000/svg"
                                     aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                                    <rect width="100%" height="100%" fill="#007aff"></rect>
                                </svg>
                                <strong class="me-auto"><span style="vertical-align: inherit;"><span
                                        style="vertical-align: inherit;">Create Customer</span></span></strong>
                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Đóng"></button>
                            </div>
                            <div class="toast-body"><span style="vertical-align: inherit;"><span
                                    style="vertical-align: inherit;">
               <strong> ${mess}</strong> </span></span></div>
                        </div>
                    </div>
                </c:if>

            </caption>
            <tr>
                <td>Customer Type</td>

                <td><select name="customer_type" required >
<%--                    <option value="${customer.customerType}">${customer.get(customer.customerType)}</option>--%>
<%--                    <option value="1">Diamond</option>--%>
<%--                    <option value="2">Platinium</option>--%>
<%--                    <option value="3">Gold</option>--%>
<%--                    <option value="4">Silver</option>--%>
<%--                    <option value="5">Member</option>--%>
                    <c:forEach var="data" items="${customerTypeList}" >
                        <option value="${data.getCustomerType()}" >
                                ${data.getName()} </option>
                    </c:forEach>
                </select>
                </td>
            </tr>
            <tr>
                <th>Customer name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45" required pattern="^[a-zA-Z_ÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]{5,50}$"/>
                </td>
            </tr>
            <tr>
                <th>Customer birthday:</th>
                <td>
                    <input type="date" name="birthday"  required  pattern="^(?:0[1-9]|[12]\d|3[01])([\/.-])(?:0[1-9]|1[012])\1(?:19|20)\d\d$
" id="birthday" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Customer id_card:</th>
                <td>
                    <input type="text" name="id_card" id="id_card" size="45"required/>
                </td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><select name="gender" required>
                    <option value="true">Nam</option>
                    <option value="false">Nữ</option>

                </select>
                </td>
            </tr>
<%--            <tr>--%>
<%--                <th>Customer gender:</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="gender" id="gender" size="45"/>--%>
<%--                </td>--%>
<%--            </tr>--%>
            <tr>
                <th>Customer phone_number:</th>
                <td>
                    <input type="text" name="phone_number" id="phone_number" size="45" required/>
                </td>
            </tr>
            <tr>
                <th>Customer email:</th>
                <td>
                    <input type="text" name="email" id="email" size="45" required/>
                </td>
            </tr>
            <tr>
                <th>Customer address:</th>
                <td>
                    <input type="text" name="address" id="addres" size="45" required/>
                </td>
            </tr>


            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>
