
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<html>
<head>
    <title></title>
</head>
<body>
<center>
    <form  >
        <fieldset >
            <legend style="font-size: 60px; color: orange"  >Kết Quả</legend>
            <div class="mb-3">
                <label class="form-label" style="font-size: 45px">Mô tả sản phẩm:</label>
                <h1 style="background: orange"> ${product_description}</h1>
            </div>
            <div class="mb-3">
                <label class="form-label" style="font-size: 45px">Giá niêm yết của sản phẩm:</label>
                <h1 style="background: orange"> ${list_price}</h1>
            </div>
            <div class="mb-3">
                <label class="form-label" style="font-size: 45px">giá sau khi chiết khấu:</label>
                <h1 style="background: orange"> ${discountPrice}</h1>
            </div>
        </fieldset>
    </form>
</center>

</body>
</html>

