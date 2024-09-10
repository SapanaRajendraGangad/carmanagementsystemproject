<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="MainDashBoard.jsp" %>
<link href="CSS/AddCustomer1.css" rel="stylesheet"/>
</head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>

</style>
<body>
<%!
PartService es=new PartServiceImpl();
EmployeeService ms=new EmployeeServiceImpl();
int count=0;
%>
 <%
    
    List<PartModel> list = es.getAllParts();
    List<EmployeeModel> list1 = ms.getAllEmployee();
       
%>
<form class="Form" action="AllocateServiceController" method="post">
<h3 style="text-aline:center">Add Service here</h3>
 <input type="submit" name="s" value="Save" class="submit"/>
   <a href='ViewCustomer.jsp'><input type='button' value='back' class='submit'/></a><br><br><br><br>
        <lable for="date" style="margin-right:85px;">Date</lable>
        <input type="date" name="date" value=""style="margin-right:20px;" placeholder="20-04-2024" id="n" onkeyup="fetchNameData();showServiceTable()" />
        <label for="charges"style="margin-right:20px;margin-left:80px;">Charges</label>
        <input type="text" name="charges"style="margin-right:20px;" value="" placeholder="200" id="p" onkeyup="fetchPriceData();showPartTable()"/>
        <label for="distance"style="margin-right:70px;">Distance</label>
        <input type="text" name="distance"style="margin-right:20px;"value="" placeholder="200km" id="p" onkeyup="fetchPriceData();showPartTable()"/>
        <br><br><label for="noplate"style="margin-right:20px;">Vehicle Name</label>
        <input type="text" name="noplate"style="margin-right:20px;"value="" placeholder="MH14 2020" id="p" onkeyup="fetchPriceData();showPartTable()"/>
 

<label for="parts" style="margin-left:20px;">Select Parts</label>
  <button class="btn btn-secondary dropdown-toggle" style="background-color:white; color:black;" type="button" id="partMultiSelectDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Select Part
  </button>
  <div class="dropdown-menu" aria-labelledby="partMultiSelectDropdown">
    <div class="multiselect">
        <% for(PartModel pmodel : list) { %>
          <label class="option"><input type="checkbox" style="margin-left:20px;" name="partNames" class="partCheckbox mr-3" value="<%=pmodel.getPname()%>"><%=pmodel.getPname()%></label><br>
        <% } %>
    </div>
    <button type="button" id="partSubmitBtn" class="btn btn-primary">Submit</button>
  </div>


<label for="employees" style="margin-right:20px;margin-left:90px;">Select Employee</label>
 <div class=button style="display:inline">
  <button class="btn btn-secondary dropdown-toggle" style="background-color:white; color:black;" type="button" id="employeeMultiSelectDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Select Employee
  </button>
 
  <div class="dropdown-menu" aria-labelledby="employeeMultiSelectDropdown">
    <div class="multiselect">
        <% for(EmployeeModel emodel : list1) { %>
          <label class="option"><input type="checkbox" style="margin-left:20px;" name="mechanicNames" class="employeeCheckbox mr-3" value="<%=emodel.getName()%>"><%=emodel.getName()%></label><br>
        <% } %>
     
    </div>
    <button type="button" id="employeeSubmitBtn" class="btn btn-primary">Submit</button>
    </div>
  </div>


        <br><br>
        
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>