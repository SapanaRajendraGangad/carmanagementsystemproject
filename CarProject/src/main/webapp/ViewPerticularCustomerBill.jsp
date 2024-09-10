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
.Form {
    width: 100%;
    height: 500px;
    margin-left:10px;
   padding:30px;
}
table{
margin-top:30px;
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
<form class="Form" action="cadd" method="POST">
<h1>View Bill Details</h1>
  <% 
  int bid = Integer.parseInt(request.getParameter("bid")); 
  
  int count=0;
  %>
   <div class=table2>
<br><br><table class="table table-bordered table1">
  <thead>
    <tr>
      
      <th scope="col" class="th1">Customer Name</th>
      <th scope="col" class="th1">Customer contact</th>
      <th scope="col" class="th1">Customer email</th>
       <th scope="col" class="th1">Vehicle Name</th>
      <th scope="col" class="th1">Vehicle Noplate</th>
      <th scope="col" class="th1">Total Amount</th>
     
    </tr>
  </thead>
  <tbody class="bg-info">
  <% 
  List<Object[]> list1=ss.getAllInfoC(bid);
  for(Object obj[]:list1){
  %>
    <tr>
    <td><%=obj[0]%></td>
	<td><%=obj[1]%></td>
	<td><%=obj[2]%></td>
	<td><%=obj[3]%></td>
	<td><%=obj[4]%></td>
    <td><%=obj[5] %></td>
      <%
  }
	  %>
	  </tr>
	   </tbody>
	  
</table>
</div>
<div class=table2>
<br><br><table class="table table-bordered table1">
  <thead>
    <tr>
       <th scope="col" class="th1">Part</th>
      <th scope="col" class="th1">Part Price</th>
      <th scope="col" class="th1">Service Charges</th>
    </tr>
  </thead>
  <tbody class="bg-info">
	  <% 
  List<Object[]> list2=ss.getAllInfoPart(bid);
  for(Object obj[]:list2){
  %>
    <tr>
	<td><%=obj[3]%></td>
	<td><%=obj[4]%></td>
	<td><%=obj[5]%></td>
      <%
  }
	  %>
	  </tr>
	  <% 
  List<Object[]> list3=ss.getAllInfoC(bid);
  for(Object obj[]:list3){
  %>
 
    
    <td>Total Amount</td>
    <td colspan="2"><%=obj[5] %></td>
      <%
  }
	  %>
	  </tr>
	   </tbody>
	  
</table>
 <br><br> <a href='ViewBill.jsp'><input type='button' value='back' class='submit'/></a><br><br>
</body>
</html>