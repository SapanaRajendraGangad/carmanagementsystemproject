<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="CSS/ViewData.css" rel="stylesheet"/>
<%@include file="MainDashBoard.jsp" %>
</head>
<script type="text/javascript">
function fetchData(){
    var str=document.getElementById("s").value;
    var xhttp= new XMLHttpRequest();
    xhttp.onreadystatechange=function(){
        if(this.readyState==4 && this.status==200){
            document.getElementById("d").innerHTML=this.responseText;
        }  
    };
    xhttp.open("GET","ViewSearchVehicle.jsp?p="+str,true);
    xhttp.send();
}
</script>
<%
VehicleService vs=new VehicleServiceImpl();
%>
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
<h1>View Vehicle</h1>
<b>Search Vehicle</b><input type='search' name='name' value='' style='width:800px;margin-left:10px;height:40px;margin-top:20px;' id="s" onkeyup="fetchData()"/><br><br>
<div id="d">
<table class="table table-bordered table1">
<thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col" class="th1">Vehicle Name</th>
        <th scope="col" class="th1">Model</th>
        <th scope="col">Number Plate</th>
        <th scope="col">Customer Name</th>
        <th scope="col">Customer email</th>
        <th scope="col">Customer contact</th>
        <th scope="col">Delete</th>
        <th scope="col">Update</th>
    </tr>
</thead>
<tbody class="bg-info">
<% 
List<Object[]> list=vs.getAllInfo();
int count=0;
if(list!=null && !list.isEmpty()){
    for(Object obj[]:list){
%>  
    <tr>
        <td><%=++count%></td>
        <td><%=obj[0]%></td>
        <td><%=obj[1]%></td>
        <td><%=obj[2]%></td>
        <td><%=obj[3]%></td>
        <td><%=obj[4]%></td>
        <td><%=obj[5]%></td>
        <td><a href='delV?vid=<%=obj[6]%>'><ion-icon name="trash-outline" class="icon1"></ion-icon></a></td>
        <td><a href='updateV?id=<%=obj[6]%>&vname=<%=obj[0].toString()%>&model=<%=obj[1].toString()%>&noplate=<%=obj[2].toString()%>'><ion-icon name="arrow-up-circle-outline" class="icon1"></ion-icon></a></td>
    </tr>
<% 
    }
} else {
%>
    <tr>
        <td colspan="9">No data available</td>
    </tr>
<%
}
%> 
</tbody>
</table>
</div>
</form>
</body>
</html>
