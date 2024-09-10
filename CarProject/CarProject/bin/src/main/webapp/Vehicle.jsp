<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="MainDashBoard.jsp" %>
<link href="CSS/ViewData.css" rel="stylesheet"/>

</head>
<%!
VehicleService vs=new VehicleServiceImpl();
int count=0;
%>
<script>
function showVehicleTable() {
    document.getElementById('vehicleData').style.display = 'block';
}
function fetchNameData() {
    var str = document.getElementById("n").value;
    fetchTableData(str);
}

function fetchModelData() {
    var str = document.getElementById("m").value;
    fetchTableData(str);
}

function fetchNoplateData() {
    var str = document.getElementById("no").value;
    fetchTableData(str);
}

function fetchContactData() {
    var str = document.getElementById("c").value;
    fetchTableData(str);
}
function fetchTableData(searchParam) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("vehicleData").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "ViewSearchVehicle.jsp?p=" + searchParam, true);
    xhttp.send();
}

function openSelectedVehicle() {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    var selectedIds = [];
    checkboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            selectedIds.push(checkbox.value);
        }
    });
    if (selectedIds.length > 0) {
        window.location.href = 'VehicleDetails.jsp?vid=' + selectedIds.join(',');
    } else {
        alert('Please select a Vehicle to open.');
    }
}
</script>
<style>
    *{
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
   input{
   height:30px;
   }
   .submit{
   width:80px;
   height:30px;
   background:#1E90FF;
   }
   tr{
  border:2px solid black;
   }
  th,td
  {border:2px solid black;
    width:15%;
    
  }
  th{
 background-color:#1E90FF;
  }
  
</style>
<body>
<form id="customerForm" class="Form" action="" method="Get">
 <h3>Vehicle Details</h3>
    <input type="submit" name="s" value="Save" class="submit"/><br><br>
    <label for="Name"style="margin-right:37px;">Vehicle Name</label>
    <input type="text" name="name" value="" style="margin-right:20px;" placeholder="thar" id="c" onkeyup="fetchContactData();showVehicleTable()" />
    <label for="Model"style="margin-right:20px;">Vehicle Model</label>
    <input type="text" name="model"style="margin-right:20px;" value="" placeholder="2020" id="m" onkeyup="fetchModelData();showVehicleTable()"/>
    <label for="noplate"style="margin-right:20px;">Vehicle NumberPlate</label>
    <input type="text"style="margin-right:20px;" name="noplate" value="" placeholder="MH-2020" id="no" onkeyup="fetchNoplateData();showVehicleTable()"/><br><br>
    
  
    <br><br>
        <a href="ViewSearchVehicle.jsp?p=" onclick="fetchData(); return false;"><input type="button" value="Search" class="submit"/></a><br><br>
        <input type="button" value="View" class="submit" onclick="showVehicleTable()" /><br><br>
        <a href="AddVehicle.jsp"><input type="button" value="New" class="submit"/></a>
        <input type="button" value="Open" class="submit" onclick="openSelectedVehicle()"/>

<div class="col-md-9 login1">
       <table class="table-bordered" id="vehicleData" style="display:none">
            <thead>
                <tr>
                     <th scope="col">select</th>
                    <th scope="col">Id</th>
                    <th scope="col" class="th1">Name</th>
                    <th scope="col" class="th1">Model</th>
                    <th scope="col">Number plate</th>
                
                   
                </tr>
            </thead>
            <tbody>
                <% 
                List<Object[]> list=vs.getAllInfo();
                int count=0;
                if(list!=null && !list.isEmpty()){
                    for(Object obj[]:list){
                %>  
                <tr>
                    <td><input type="checkbox" name="vid" value="<%= obj[6]%>"></td>
                    <td ><a href='updateV?vid=<%=obj[6]%>&name=<%=obj[0]%>&model=<%=obj[1]%>&noplate=<%=obj[2]%>&contact=<%=obj[3]%>'><%=obj[6]%></a></td>
                    <td><%=obj[0]%></td>
                    <td><%=obj[1]%></td>
                    <td><%=obj[2]%></td>
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
</main>
</div>
</div>
</div>
</div>
</form>
</body>
</html>
