<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Final</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <style>
        #logo {
            margin: 30px 0 20px 300px;
            float: left;
        }

        #login-name {
            margin-top: 30px;
            margin-right: 300px;
            float: right;
        }

        .navbar {
            background-color: #126c66;
            padding-left: 320px;
        }

        footer, li .nav-item .footer, a.footer {
            background-color: #046056;
            text-decoration: none;
            font-size: medium;
            color: #bee3d9;
            padding-right: 20px;
            margin-left: 10px;
        }

        footer {
            margin: 30px 0 0 0;
            padding: 50px 0 0 50px;
        }

        p.footer {
            background-color: #046056;
            font-size: medium;
            padding: 0;
            color: #bee3d9;
            margin-left: 50px;
        }

        .main {
            padding-left: 30px;
            padding-right: 30px;
        }

        h1 {
            text-align: center;
        }

        form {
            background-color: #bee3d9;
        }

        /*    button {
                background-color: #046056 !important;
            }*/
        button:hover {
            background-color: #046056 !important;
            color: white !important;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container-fluid px-0">
    <div class="row">
        <div class="col-12">
            <a href="/employees"><img id="logo" src="../images/logo.png" height="150px"
                                      width="100px"/>Back List Employees</a>
        </div>
    </div>
    <div class="row">
        <h1>
            Form Edit Employee
        </h1>
    </div>
    <div class="row">
        <div class="main">
            <div class="d-flex justify-content-center">
                <form class="w-50 border border-2 border-success p-3  rounded" method="post">

                    <input type="hidden" name="id" value="${editEmployee.id}">
                    <div class="form-group">
                        <label>Name:</label>
                        <div class="input-group">
                            <input type="text" name="name" value="${editEmployee.name}">
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Date of Birth:</label>
                        <input type="date" name="date_of_birth" value="${editEmployee.date_of_birth}">
                    </div>

                    <div class="mt-3 form-group">
                        <label>Id card:</label>
                        <div class="input-group">
                            <input type="text" name="id_card" value="${editEmployee.id_card}">
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Salary:</label>
                        <div class="input-group">
                            <input type="text" name="salary" value="${editEmployee.salary}">
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Phone number:</label>
                        <div class="input-group">
                            <input type="text" name="phone_number" value="${editEmployee.phone_number}">
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Email:</label>
                        <div class="input-group">
                            <input type="text" name="email" value="${editEmployee.email}">
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Address:</label>
                        <div class="input-group">
                            <input type="text" name="address" value="${editEmployee.address}">
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Education degree:</label>
                        <div class="input-group">
                            <select name="education_degree_id">
                                <option value="1" ${employee.educationDegreeId == 1? "selected":""}>Trung Cấp</option>
                                <option value="2" ${employee.educationDegreeId == 2? "selected":""}>Cao Đẳng</option>
                                <option value="3" ${employee.educationDegreeId == 3? "selected":""}>Đại Học</option>
                                <option value="4" ${employee.educationDegreeId == 4? "selected":""}>Sau Đại Học</option>
                            </select>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Position:</label>
                        <div class="input-group">
                            <select name="position_id">
                                <option value="1" ${employee.positionId == 1? "selected":""}>Lễ Tân</option>
                                <option value="2" ${employee.positionId == 2? "selected":""}>Phục Vụ</option>
                                <option value="3" ${employee.positionId == 3? "selected":""}>Chuyên Viên</option>
                                <option value="4" ${employee.positionId == 4? "selected":""}>Giám sát</option>
                                <option value="5" ${employee.positionId == 5? "selected":""}>Quản lí</option>
                                <option value="6" ${employee.positionId == 6? "selected":""}>Giám Đốc</option>
                            </select>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Division:</label>
                        <div class="input-group">
                            <select name="division_id">
                                <option value="1" ${employee.divisionId == 1? "selected":""}>Sale-Marketing</option>
                                <option value="2" ${employee.divisionId == 2? "selected":""}>Hành chính</option>
                                <option value="3" ${employee.divisionId == 3? "selected":""}>Phục vụ</option>
                                <option value="4" ${employee.divisionId == 4? "selected":""}>Quản lý</option>
                            </select>
                        </div>
                    </div>

                    <%--            <tr>--%>
                    <%--                <td>--%>
                    <%--                    <pre>Username:</pre>--%>
                    <%--                </td>--%>
                    <%--                <td><input type="text" name="username" value="${editEmployee.username}"></td>--%>
                    <%--            </tr>--%>
                    <div class="mt-3 text-center">
                        <button type="submit" class="btn btn-sm border border-light  text-dark">
                            -- Save --
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
