<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<%@include file="MainDashBoard.jsp" %>
<link href="CSS/AddCustomer1.css" rel="stylesheet"/>
</head>
<style>

</style>
<body>
<form class="Form" action='PartController' method="post">
    <div class="col-md-9">
        <h3>Add Parts Of Vehicle</h3><br>
         <input type="submit" name="s" value="Save" class="submit"/><br><br>
    <label for="Name"style="margin-right:20px;">Part Name</label>
    <input type="text" name="name" value=""style="margin-right:20px;" placeholder="plug" id="n" onkeyup="fetchNameData();showPartTable()" />
    <label for="price"style="margin-right:20px;">Part Price</label>
    <input type="text" name="price"style="margin-right:20px;" value="" placeholder="200" id="p" onkeyup="fetchPriceData();showPartTable()"/>
    <br><br>
   </div>
</form>
</body>
</html>