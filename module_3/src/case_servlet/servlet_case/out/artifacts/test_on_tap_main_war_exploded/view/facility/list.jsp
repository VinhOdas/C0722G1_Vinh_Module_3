
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
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/facility?action=list">List Employee</a>

            </li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/facility?action=addHouse">Add House</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/facility?action=addVilla">Add Villa</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/facility?action=addRoom">Add Room</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/employees?action=list">Employee</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/customers">Customer</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/service">Service</a>
            </li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/contract
">Contract</a></li>
        </ul>
        <form style="margin-top: 23px" action="/facility?action=search" method="post">
            <input type="text" name="nameSearch" value="${searchName}">
            <input type="text" name="searchAddress" value="${addressSearch}">

            <input type="submit" value="Search" class="btn btn-info">
        </form>
    </div>

    <div class="container-fluid">
        <div class="container"></div>
    </div>
    <div>
        <center>
            <table class="table table-dark table-striped" border="2" id="tableFacility" style="margin-right: 25px ; margin-left: -50px" >
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Area</th>
                    <th>Price</th>
                    <th>Max People</th>
                    <th>Standard Room</th>
                    <th>Description Other Convenience</th>
                    <th>Pool Area</th>
                    <th>Floors</th>
                    <th>Facility Free</th>
                    <th>Rent Type</th>
                    <th>Facility Type</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="data" items="${facilityList}" varStatus="stt">
                <tr>
                    <td>${stt.count}</td>
                    <td><c:out value="${data.getName()}"/></td>
                    <td><c:out value="${data.getArea()}"/></td>
                    <td><c:out value="${data.getCost()}"/></td>
                    <td><c:out value="${data.getMaxPeople()}"/></td>
                    <td><c:out value="${data.getStandardRoom()}"/></td>
                    <td><c:out value="${data.getDescriptionOtherConvenience()}"/></td>
                    <td><c:out value="${data.getPoolArea()}"/></td>
                    <td><c:out value="${data.getNumberOfFloors()}"/></td>
                    <td><c:out value="${data.getFacilityFree()}"/></td>
                    <td><c:out value="${data.getRentTypeId()}"/></td>
                    <td><c:out value="${data.getFalicityTypeId()}"/></td>
                    <td>
                            <%--                    <!-- Button trigger modal EDIT -->--%>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal1${data.getId()}">
                            Chỉnh Sửa
                        </button>

                            <%--                    <!-- Modal -->--%>
                        <div class="modal fade" id="exampleModal1${data.getId()}" tabindex="-1"
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
                                        Bạn có muốn thay đổi thông tin <strong class="text-danger">${data.getName()}</strong>
                                        không ?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                        </button>
                                        <a href="/facility?action=edit&id=${data.getId()}" class="btn btn-secondary">Thay Đổi</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>

                    <td>
                        <!-- Button trigger modal DELETE -->
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#sp${data.getId()}">
                            Delete
                        </button>
                        <!-- Modal -->
                        <div class="modal fade " id="sp${data.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog ">
                                <div class="modal-content bg-white">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body" style="color: #000 ; text-decoration-color: white " >
                                        Bạn có muốn xóa <strong class="text-danger">${data.getName()}</strong>
                                        không ?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <a href="/facility?action=delete&id=${data.getId()}" class="btn btn-danger">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    </c:forEach>
                </tbody>

            </table>
        </center>
    </div>
</section>
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

<script>
    $(document).ready(function () {
        $('#tableFacility').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5,
        });
    });
</script>
