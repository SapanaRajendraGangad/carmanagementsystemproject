<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page
	import="org.CarGarage.Service.*,org.CarGarage.Model.*,java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="CSS/updatePart.css" rel="stylesheet"/>
</head>
<%@include file="MainDashBoard.jsp" %>
<style>
.Form {
    width: 100%;
    height: 500px;
    margin-left:10px;
   padding:30px;
   background:none;
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
<form class="Form" action="PartController" method="POST">
<h1>View Parts Details</h1>
<table class="table table-bordered table1">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col" class="th1">Part Name</th>
      <th scope="col" class="th1">Price</th>
      <th scope="col">Delete</th>
      <th scope="col">Update</th>
    </tr>
  </thead>
  <%
				  PartService partService=new PartServiceImpl();
				  List<PartModel> list=partService.getAllParts();
				  int count=0;
				  for(PartModel pModel:list){
				%>
  <tbody class="bg-info">
    
				  <tr>
				      <td><%=++count%></td>
				      <td><%=pModel.getPname()%></td>
				      <td><%=pModel.getPrice()%></td>
				      <td><a href=''><ion-icon name="trash-outline" class="icon1"></ion-icon></a></td>
				      <td><a href=''><ion-icon name="arrow-up-circle-outline" class="icon1"></ion-icon></a></td>
				  </tr>
				<%
				  }
				%>
  </tbody>
</table>
</form>
</body>
</html>