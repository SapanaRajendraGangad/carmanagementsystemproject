<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="CSS/AddCustomer.css" rel="stylesheet"/>
<%@include file="MainDashBoard.jsp" %>
<style>
.Form{
height:40vh;
}
</style>
<body>
<form class="Form" style="padding-left:90px; width:90%;"action="addbill" method="POST">
    <div class="col-md-9 login">
    <% int vid = Integer.parseInt(request.getParameter("vid")); %>
        <br><br><h3>Generate Bill Details</h3>
          
         <input type="submit" name="s" style="margin-left:250px;" value="Submit" class="submit" />
         <a href='Service.jsp'> <input type='button' value='back' class='submit'/></a><br><br><br><br>
        <label for="date" style=margin-left:250px;>Date</label>
        <input type="Date" name="date" value="" placeholder="22-09-2024"style="margin-right:40px;" required/>
        <label for="vid">Enter Vid</label>
        <input type="text" name="vid" value=<%=vid %> placeholder="1"style="margin-right:20px;" required/>
       
</form>
</main>
</div>
</div>
</div>
</body>
</html>