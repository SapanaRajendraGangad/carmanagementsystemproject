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
<form class="Form" action="cadd" method="POST">
    <div class="col-md-9 login">
        <h3>Add Customer Details</h3>
        <input type="submit" name="s" value="Save" class="submit"/>
        <a href='ViewCustomer.jsp'> <input type='button' value='back' class='submit'/></a><br><br>
        <label for="Name"style="margin-right:20px;">Customer Name</label>
        <input type="text" name="name" value="" placeholder="ram" style="margin-right:10px;"/>
        <label for="Email"style="margin-right:20px;">Customer Email</label>
        <input type="text" name="email" value="" placeholder="ram@gmail.com" style="margin-right:20px;" />
        <label for="contact" style="margin-right:20px;">Customer Contact</label>
        <input type="text" name="contact" value="" placeholder="9878989999" style="margin-right:20px;"/><br><br>
        <label for="address" style="margin-right:8px;">Customer Address</label>
        <input type="text" name="address" value="" placeholder="pune" style="margin-right:20px;"/>
        <label for="status" style="margin-right:8px;">Status</label>
        <select  name="status" id="s" style="background-color:white">
    <option>Active</option>
    <option>Inactive</option>
   
    </select><br>
       
        
    </div>
</form>
</body>
</html>
