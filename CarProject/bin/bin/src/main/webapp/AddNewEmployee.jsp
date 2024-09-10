<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="CSS/AddCustomer.css" rel="stylesheet"/>
</head>
<link href="CSS/AddCustomer1.css" rel="stylesheet"/>
<%@include file="MainDashBoard.jsp" %>
<style>

</style>
<body>
<form class="Form" action="MechanicController" method="POST">
    <div class="col-md-9 login">
        <h3>Add Employee Details</h3><br>
       
    <input type="submit" name="s" value="Save" class="submit"/><br><br>
     <label for="name"style="margin-right:20px;">Name</label>
    <input type="text" name="name" value=""style="margin-right:20px;" placeholder="ram" id="n" onkeyup="fetchNameData();showMechanicTable()" />
    <label for="specialization"style="margin-right:20px;">specialization</label>
    <input type="text" name="specialization"style="margin-right:20px;" value="" placeholder="oil" id="e" onkeyup="fetchSpecData();showMechanicTable()"/>
    <label for="exp"style="margin-right:20px;">Experience</label>
    <input type="text"style="margin-right:20px;" name="exp" value="" placeholder="2year" id="c" onkeyup="fetchExpData();showMechanicTable()"/><br><br>
   <br><br>
</form>
</body>
</html>
