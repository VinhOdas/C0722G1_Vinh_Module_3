
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
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/employees?action=list">List Employee</a>

            </li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/employees?action=add">Add Employee</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/employees?action=list">Employee</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/customers">Customer</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/service">Service</a>
            </li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/contract">Contract</a></li>
        </ul>
    </div>
</section>

<section class="footer d-flex justify-content-center mt-5">
    <div class="wrapper container">
        <div class="row h-100">
            <div class="col-6 mt-auto mb-5">
                <p class="fs-5 text-uppercase text-dark fw-bold">Our Brands</p>
                <div class="d-flex mt-4">
                    <img class="footer__brand-logo" src="./images/xclusive.png" alt="">
                    <img class="footer__brand-logo" src="./images/fx.png" alt="">
                </div>
            </div>
            <div class="col-6">
                <h3 class="fs-2 text-uppercase text-dark fw-bold mb-4"> VINH ODAS</h3>
                <div class="row">
                    <div class="col-3">
                        <div class="d-flex flex-column gap-2">
                            <a href="#" class="text-dark fs-5">Our hotel</a>
                            <a href="#" class="text-dark fs-5">Promotions</a>
                            <a href="#" class="text-dark fs-5">Meetings</a>
                            <a href="#" class="text-dark fs-5">Brand story</a>
                            <a href="#" class="text-dark fs-5">Media center</a>
                            <a href="#" class="text-dark fs-5">Corporate info</a>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="d-flex flex-column gap-2">
                            <a href="#" class="text-dark fs-5">Lifestyle blog</a>
                            <a href="#" class="text-dark fs-5">Careers</a>
                            <a href="#" class="text-dark fs-5">Contact us</a>
                            <a href="#" class="text-dark fs-5">Notices</a>
                            <a href="#" class="text-dark fs-5">EGifts</a>
                            <a href="#" class="text-dark fs-5">Expore south-east asia </a>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="d-flex flex-column gap-2">
                            <a href="#" class="text-dark fs-5">Travel agents</a>
                            <a href="#" class="text-dark fs-5">Sitemap</a>
                            <a href="#" class="text-dark fs-5">Terms & Conditions</a>
                            <a href="#" class="text-dark fs-5">Privacy policy</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
