<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="MainDashBoard.jsp" %>
<style>
    *
    {
      margin:0;
      padding:0;
      box-sizing:border-box;
    }
   body{
  
   }
   h3{
   text-align:center;
   margin-bottom:50px;
   font-size:30px;
   }
   
   .submit{
 width:80px;
 height:30px;
 background:#1E90FF;
   }
   input{
   height:30px;
   }
   select{
   padding:8px;
   background:#1E90FF;
   }
   
</style>
</head>
<body>
<form class="Form" action="Vehicle" method="POST">
    <div class="col-md-9 login">
        <h3>Add Vehicle Details</h3>
        <input type="submit" name="s" value="Save" class="submit"/><br><br>
        <label for="Name"style="margin-right:37px;">Vehicle Name</label>
        <input type="text" name="name" value="" placeholder="thar" style="margin-right:10px;"/>
        <label for="model"style="margin-right:20px;">Vehicle Model</label>
        <input type="text" name="model" value="" placeholder="2024" style="margin-right:20px;" />
        <label for="noplate" style="margin-right:20px;">Vehicle NumberPlate</label>
        <input type="text" name="noplate" value="" placeholder="MH-2020" style="margin-right:20px;"/><br><br>
        <label for="conatct" style="margin-right:8px;">Customer Contact</label>
        <input type="text" name="contact" value="" placeholder="8909888888" style="margin-right:20px;"/>
        
       
        
    </div>
</form>
</body>
</html>
