<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="MainDashBoard.jsp" %>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<%!
PartService es=new PartServiceImpl();
EmployeeService ms=new EmployeeServiceImpl();
int count=0;
%>
<script>
function showServiceTable() {
    document.getElementById('serviceData').style.display = 'block';
}
function showSTable() {
    document.getElementById('data').style.display = 'block';
}
function fetchDateData() {
    var str = document.getElementById("da").value;
    fetchData(str);
}

function fetchChargeData() {
    var str = document.getElementById("c").value;
    fetchData(str);
}

function fetchDistanceData() {
    var str = document.getElementById("d").value;
    fetchData(str);
}
function fetchVehicleData() {
    var str = document.getElementById("v").value;
    fetchData(str);
}
function fetchData(searchParam) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("serviceData").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "ViewSearchService.jsp?p=" + searchParam, true);
    xhttp.send();
}
function openSelectedService() {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    var selectedIds = [];
    checkboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            selectedIds.push(checkbox.value);
        }
    });
    if (selectedIds.length > 0) {
        window.location.href = 'ServiceDetail.jsp?sid=' + selectedIds.join(',');
    } else {
        alert('Please select a service to open.');
    }
}
</script>
<style>
    *{
      margin:0;
      padding:0;
      box-sizing:border-box;
    }
   
   h3{
   text-align:center;
   margin-bottom:50px;
   font-size:30px;
   }
   table{
   width:100%;
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
  {
  border:2px solid black;
 
  }
  th{
 background-color:#1E90FF;
  }
  .submit{
  
  }
 .btn1{
 
 }
 tbody {
 width:100%;
 }
</style>
 <%
 ServiceService ss=new ServiceServiceImpl();
 List<PartModel> list = es.getAllParts();
 List<EmployeeModel> list1 = ms.getAllEmployee();   
%>
<body>
<form id="PartForm" class="Form" action="" method="Get">
 <h3>Service Details</h3>
        
        <lable for="date"style="margin-right:85px;" >Date</lable>
        <input type="date" name="date" value=""style="margin-right:20px;" placeholder="20-04-2024" id="c" onkeyup="fetchChargeData();showServiceTable()" />
        <label for="charges"style="margin-right:20px;margin-left:60px;">Charges</label>
        <input type="text" name="charges"style="margin-right:20px;" value="" placeholder="200" id="c" onkeyup="fetchChargeData();showServiceTable()"/>
        <label for="distance"style="margin-right:70px;">Distance</label>
        <input type="text" name="distance"style="margin-right:20px;" value="" placeholder="200km" id="d" onkeyup="fetchDistanceData();showServiceTable()"/>
        <br><br><label for="noplate"style="margin-right:20px;">Vehicle Name</label>
        <input type="text" name="noplate"style="margin-right:20px;" value="" placeholder="MH14 2020" id="v" onkeyup="fetchVehicleData();showServiceTable()"/>
<label for="parts" style="margin-right:20px;">Select Parts</label>
  <button class="btn btn-secondary dropdown-toggle" style="background-color:white; color:black;" type="button" id="partMultiSelectDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Select Part
  </button>
  <div class="dropdown-menu" aria-labelledby="partMultiSelectDropdown">
    <div class="multiselect">
        <% for(PartModel pmodel : list) { %>
          <label class="option"><input type="checkbox" style="margin-left:20px;"class="partCheckbox mr-3" value="<%=pmodel.getPname()%>"><%=pmodel.getPname()%></label><br>
        <% } %>
    </div>
    <button type="button" id="partSubmitBtn" class="btn btn-primary">Submit</button>
  </div>
<label for="employees" style="margin-right:20px;margin-left:65px;">Select Employee</label>
 <div class=button style="display:inline">
  <button class="btn btn-secondary dropdown-toggle " style="background-color:white; justify-content:center; color:black;" type="button" id="employeeMultiSelectDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Select Employee
  </button>
 
  <div class="dropdown-menu" aria-labelledby="employeeMultiSelectDropdown">
    <div class="multiselect">
        <% for(EmployeeModel emodel : list1) { %>
          <label class="option"><input type="checkbox" style="margin-left:20px;"class="employeeCheckbox mr-3" value="<%=emodel.getName()%>"><%=emodel.getName()%></label><br>
        <% } %>
    </div>
    <button type="button" id="employeeSubmitBtn" class="btn btn-primary">Submit</button>
    </div>
  </div>
        <br><br>
        <div class="btn1">
       <input type="button" value="View" class="submit" onclick="showSTable()"/>
        <a href="AddService.jsp"><input type="button" value="New" class="submit"/></a>
        <input type="button" value="Open" class="submit" onclick="openSelectedService()"/>
        </div>
  <br><br><div class="col-md-9">
 
  <table class="table">
  <thead>
    <tr>
      <th scope="col">Select</th>
      <th scope="col">Id</th>
      <th scope="col">Date Of Servicing</th>
      <th scope="col">Charges</th>
      <th scope="col">Vehicle noplate</th>
      <th>Generate Bill</th>
    </tr>
  </thead >
  
 <% 
int count = 0;
List<Object[]> list3 = ss.getAllInfoS();
System.out.println(list3);
for (Object obj[] : list3) {
%>

<tbody class="" id='data' >
  <tr>
    <td style=""><input type="checkbox" name="sid" value="<%=obj[4]%>"></td>
    <td><a href='updateS?id=<%=obj[4]%>&date=<%=obj[0].toString()%>&charges=<%=obj[3].toString()%>&distance=<%=obj[2].toString()%>'><%=obj[4]%></a></td>
    <td><%=obj[0]%></td>
    <td><%=obj[3]%></td>
    <td><%=obj[2]%></td>
    <td><a href='Bill.jsp?vid=<%=obj[5]%>'>generate bill</a></td>
  </tr>
</tbody>


<%
}
%>

  </table>
</main>
</div>
</div>
</div>
</div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
      