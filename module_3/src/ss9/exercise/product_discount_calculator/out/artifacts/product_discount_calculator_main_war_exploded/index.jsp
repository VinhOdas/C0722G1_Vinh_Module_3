
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<html>
<head>
    <title>Ứng dụng Product Discount Calculator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>

<center>
    <form  action="/display" method="post" >
        <fieldset >
            <legend>Calculator</legend>
            <div class="mb-3">
                <label class="form-label">Product Description</label>
                <input type="text"  name="product_description" class="form-control" placeholder="Product Description" style="width: 50%">
            </div>
            <div class="mb-3">
                <label class="form-label">List Price</label>
                <input type="text"  name="list_price" class="form-control" placeholder="List Price" style="width: 50%">
            </div>
            <div class="mb-3">
                <label class="form-label">Discount Percent</label>
                <input type="text"  name="discount_percent" class="form-control" placeholder="Discount Percent" style="width: 50%">
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </fieldset>
    </form>

</center>


</body>
</html>