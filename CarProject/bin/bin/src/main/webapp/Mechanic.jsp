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
EmployeeService es=new EmployeeServiceImpl();
int count=0;
%>
<script>
function showMechanicTable() {
    document.getElementById('mechanic').style.display = 'block';
}
function fetchNameData() {
    var str = document.getElementById("n").value;
    fetchTableData(str);
}

function fetchSpecData() {
    var str = document.getElementById("e").value;
    fetchTableData(str);
}

function fetchExpData() {
    var str = document.getElementById("c").value;
    fetchTableData(str);
}
function fetchTableData(searchParam) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("mechanic").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "ViewSearchMechanic.jsp?p=" + searchParam, true);
    xhttp.send();
}

function openSelectedMechanic() {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    var selectedIds = [];
    checkboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            selectedIds.push(checkbox.value);
        }
    });
    if (selectedIds.length > 0) {
        window.location.href = 'MechanicDetail.jsp?MId=' + selectedIds.join(',');
    } else {
        alert('Please select a Mechainc to open.');
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
  border:2px solid black;
  background:#1E90FF;
  }
  select {
  padding:6px;
  background:#1E90FF;
  }
</style>
<body>
<form id="mechanicForm" class="Form" action="" method="Get">
 <h3>Employee Details</h3>
        <input type="submit" name="s" value="Save" class="submit"/><br><br>
    <label for="Name"style="margin-right:20px;">Mechanic Name</label>
    <input type="text" name="name" value=""style="margin-right:20px;" placeholder="ram" id="n" onkeyup="fetchNameData();showMechanicTable()" />
    <label for="specialization"style="margin-right:20px;">specialization</label>
    <input type="text" name="specialization"style="margin-right:20px;" value="" placeholder="oil" id="e" onkeyup="fetchSpecData();showMechanicTable()"/>
    <label for="exp"style="margin-right:20px;">Experience</label>
    <input type="text"style="margin-right:20px;" name="exp" value="" placeholder="2year" id="c" onkeyup="fetchExpData();showMechanicTable()"/><br><br>
   <br><br>
        <a href="ViewSearchMechanic.jsp?p=" onclick="fetchData(); return false;"><input type="button" value="Search" class="submit"/></a><br><br>
        <input type="button" value="View" class="submit" onclick="showMechanicTable()" /><br><br>
        <a href="AddNewEmployee.jsp"><input type="button" value="New" class="submit"/></a>
        <input type="button" value="Open" class="submit" onclick="openSelectedMechanic()"/>

<div class="col-md-9 login1">
       <table class="table-bordered" id="mechanic" style="display:none">
            <thead>
                <tr>
                    <th>select</th>
                    <th scope="col">Id</th>
                    <th scope="col" class="th1">Name</th>
                    <th scope="col" class="th1">Specialization</th>
                    <th scope="col">Experience</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<EmployeeModel> list=es.getAllEmployee();
                for(EmployeeModel model:list){
                %>  
                <tr>
                    <td><input type="checkbox" name="customerId" value="<%= model.getMid()%>"></td>
                    <td style="color:black; text-decoration:none"><a href='UpdateEmployee?mid=<%=model.getMid()%>&name=<%=model.getName()%>&specialization=<%=model.getSpecialization()%>&exp=<%=model.getExperience()%>'><%=model.getMid()%></a></td>
                    <td><%=model.getName() %></td>
                    <td><%=model.getSpecialization()%></td>
                    <td><%=model.getExperience()%></td>
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
