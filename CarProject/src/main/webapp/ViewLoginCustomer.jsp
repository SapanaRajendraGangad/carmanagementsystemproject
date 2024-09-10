<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%!
CustomerService es=new CustomerServiceImpl();
int count=0;
%>

<style>
.Form {
   width: 80%;
   height: 500px;
   margin-left:10px;
   padding:30px;
}

table{
margin-top:30px
border:2px solid black;
border-collapse:collapse;
width:100%;
padding-left:10px;
}
tr{
 margin-left:10px;
}

thead{
 background:black;
 height:20px;
 font-size:20px;
 color:white;
}
table td{
 border:1px solid black;
 font-size:20px;
 text-align:center;
 
}
.icon1{
font-size:30px;
padding-left:30px;
color:black;
}

</style>
<body>

<%
int cid=Integer.parseInt(session.getAttribute("CId").toString());
CustomerService cs=new CustomerServiceImpl();

%>
  
<form class="Form" action="logout" method="get">
<h1>View Customer</h1>
    <div class="col-md-9 login">
        <table class="table table-bordered table1">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col" class="th1">Name</th>
      <th scope="col" class="th1">Email</th>
      <th scope="col">Contact</th>
      <th scope="col">Address</th>
      <th scope="col">Vehicle Name</th>
      <th scope="col">Noplate</th>
    </tr>
    </thead>
    
   <tbody class="bg-info">
	  <tr>
	<% 
    List<Object[]> list = cs.getProfile(cid);
    int count = 0;
    if (list!=null ) {
        for (Object[] obj : list) {
    %>
        <td><%= ++count %></td>
        <td><%= obj[0] %></td>
        <td><%= obj[1] %></td>
        <td><%= obj[2] %></td>
        <td><%= obj[3] %></td>
        <td><%= obj[4] %></td>
        <td><%= obj[5] %></td>
    </tr>
    <% 
        }
    } else {
    %>
    <tr>
        <td colspan="7">No data available</td>
    </tr>
<%
    }
%> 
  </tbody>
         <input type="submit" value="Logout" /> 
    
</table>
</form>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
