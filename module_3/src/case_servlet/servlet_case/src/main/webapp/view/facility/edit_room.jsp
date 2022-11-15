
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h2>Edit Room</h2>
    <form method="post">
        <table border="1px">
            <td>
                <pre>Name:</pre>
            </td>
            <td><input type="text" name="name" value="${facility.serviceName}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Area:</pre>
                </td>
                <td><input type="text" name="area" value="${facility.usingArea}"></td>
            </tr>
            </tr>
            <tr>
                <td>
                    <pre>Price:</pre>
                </td>
                <td><input type="text" name="price" value="${facility.price}"></td>
            </tr>
            </tr>
            <tr>
                <td>
                    <pre>Max people:</pre>
                </td>
                <td><input type="text" name="max_people" value="${facility.maximumPeople}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Rent Type:</pre>
                </td>
                <td>
                    <select name="rent_type_id">
                        <option value="1">year</option>
                        <option value="2">month</option>
                        <option value="3">day</option>
                        <option value="4">hour</option>
                    </select>
                </td>
            </tr>
            <tr>
            <tr>
                <td>
                    <pre>Facility Free:</pre>
                </td>
                <td>
                    <input type="text" name="facility_free" value="${facility.facilityFree}">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"/></td>
            </tr>
        </table>
        <input type="hidden" name="number_of_floors" value="0">
        <input type="hidden" name="standard_room" value=" ">
        <input type="hidden" name="description_other_convenience" value=" ">
        <input type="hidden" name="facility_type_id" value="3">
        <input type="hidden" name="pool_area" value="0">
    </form>
    <a href="facility">
        <button type="button">Back List Facility</button>
    </a>
</center>
</body>
</html>
