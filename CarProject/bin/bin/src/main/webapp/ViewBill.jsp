<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="MainDashBoard.jsp" %>
<%!
BillService ss=new BillServiceImpl();
%>
<link href="CSS/ViewData.css" rel="stylesheet"/>
<style>

table{
margin-top:30px;
border:2px solid black;
border-collapse:collapse;
width:100%;


}
.Form{
margin-right:100px;
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
 width:500px;
}
</style>
<body>
<form class="Form" action="cadd" method="POST">
<h1>View Bill Details</h1><br>
<b>Search Bill</b><input type='search' name='name' value='' style='width:800px;margin-left:10px;height:40px;margin-top:20px;' id="s" onkeyup="fetchData()"/><br><br>
<div id="d">
<table class="table table-bordered table1">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col" class="th1">Bill Date</th>
      <th scope="col" class="th1">Service Date</th>
      <th scope="col" class="th1">Customer Name</th>
      <th scope="col" class="th1">Customer Contact</th>
      <th scope="col" class="th1">Customer Email</th>
       <th scope="col" class="th1">Vehicle noplate</th>
      <th scope="col" class="th1">Vehicle Name</th>
      
      
      <th scope="col" class="th1">Total Amount</th>
     
    </tr>
  </thead>
  <tbody class="bg-info">
  <% 
  List<Object[]> list=ss.getAllInfo();
  int count=0;
  for(Object obj[]:list){
  %>
    <tr>
	  <td><a href="ViewPerticularCustomerBill.jsp?bid=<%=obj[8]%>"><%=obj[8]%></a></td>
	  <td><%=obj[5]%></td>
      <td><%=obj[6]%></td>
      <td><%=obj[0]%></td>
      
      <td><%=obj[1]%></td>
       <td><%=obj[2]%></td>
       <td><%=obj[4]%></td>
      <td><%=obj[3]%></td>
       
        
          <td><%=obj[7]%></td>
      <%
  }
	  %>
	  
  </tbody>
</table>
</div>
</body>
</html>