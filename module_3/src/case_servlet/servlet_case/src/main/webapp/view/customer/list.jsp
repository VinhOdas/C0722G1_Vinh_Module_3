
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <title>Bài thi cuối module</title>
    <link rel="stylesheet" href="../file_css/reset.css">
    <link rel="stylesheet" href="../file_css/index.css">
</head>
<body class="d-flex flex-column">
<section class="header d-flex justify-content-center">
    <div class="wrapper d-flex justify-content-between align-items-center">
        <a href="/pages"><img class="header__logo" src="./images/frf.png" style="margin-left: -18px"/></a>
        <div class="header__contact d-flex">
            <div class="address flex-fill">
                <div class="d-flex">
                    <img src="./images/map.svg" alt="" class="me-5"/>
                    <div class="d-flex flex-column">
                        <p class="mb-3">103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam</p>
                        <p class="fs-4"><span class="fs-4">7,0 km from Danang Airport</span> </p>
                    </div>
                </div>
            </div>
            <div class="phone-email flex-fill">
                <div class="d-flex align-items-center mb-3">
                    <img src="./images/telephone.svg" class="me-4" alt="">
                    <span class="fs-4 text-dark">84-236-3847 333/888</span>
                </div>
                <div class="d-flex align-items-center">
                    <img src="./images/envelope.svg" class="me-4" alt="">
                    <span class="fs-4 text-dark">reservation@furamavietnam.com</span>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="navbar d-flex justify-content-center" id="navbar">
    <div class="wrapper h-100 d-flex" style="margin-left: 95px">
        <ul class="list d-flex text-bg-light">
            <li class="list__item d-flex justify-content-center align-items-center">
                <a href="/pages">Home</a>
            </li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/customers?action=list">List Customer</a>

            </li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/customers?action=add">Add Customer</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/employees?action=list">Employee</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/customers">Customer</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/service">Service</a>
            </li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/contract">Contract</a></li>
        </ul>
        <form action="/customers?action=search" method="post" style="display: flex">
            <input class="form-control w-auto mx-2" type="text" placeholder="Search by Name..." name="nameSearch">
            <input class="btn btn-outline-success mx-2" type="submit" style="color: white" value="Search"
                   style="margin-right: 0!important;">
        </form>
    </div>
    <table id="tableCustomer" class="table table-dark" style="text-align: center" border="1">
        <thead>
        <tr>
            <th>ID</th>
            <th>Customer Type</th>
            <th>Name</th>
            <th>Date of birth</th>
            <th>Gender</th>
            <th>ID Card</th>
            <th>Phone Number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <td>${customer.getId()}</td>
                <td>${customer.getType()}</td>
                <td>${customer.getName()}</td>
                <td>${customer.getBirthDay()}</td>
                <td>
                    <c:if test="${customer.isGender()}">
                        Nam
                    </c:if>
                    <c:if test="${!customer.isGender()}">
                        Nữ
                    </c:if>
                </td>
                <td>${customer.getIdCard()}</td>
                <td>${customer.getPhone()}</td>
                <td>${customer.getEmail()}</td>
                <td>${customer.getAddress()}</td>
                <td>
                        <%--                    <!-- Button trigger modal EDIT -->--%>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal1${customer.getId()}">
                        Chỉnh Sửa
                    </button>

                        <%--                    <!-- Modal -->--%>
                    <div class="modal fade" id="exampleModal1${customer.getId()}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel1" style="color: #000">Thay đổi thông
                                        tin</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body" style="color: #000 ; text-decoration-color: white " >
                                    Bạn có muốn thay đổi thông tin <strong class="text-danger">${customer.getName()}</strong>
                                    không ?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                    <a href="/customers?action=edit&id=${customer.getId()}" class="btn btn-secondary">Thay Đổi</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>

                <td>
                    <!-- Button trigger modal DELETE -->
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#sp${customer.getId()}">
                        Delete
                    </button>
                    <!-- Modal -->
                    <div class="modal fade " id="sp${customer.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content bg-white">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body" style="color: #000 ; text-decoration-color: white " >
                                    Bạn có muốn xóa <strong class="text-danger">${customer.getName()}</strong>
                                    không ?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <a href="/customers?action=delete&id=${customer.getId()}" class="btn btn-danger">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</section>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>


