<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Details</title>
    <%@include file="MainDashBoard.jsp" %>
    <link href="CSS/ViewData.css" rel="stylesheet"/>
    
    <style>
       *{
      margin:0;
      padding:0;
      box-sizing:border-box;
    }
   .Form{
    width: 100%;
    height: 390px;
    padding-top:30px;   
   }
   h2{
   margin-left:400px;
   }
   input{
   height:30px;
   }
   .submit{
   width:80px;
   height:30px;
   background:#1E90FF;
   }
   table{
   width:95%;
    border:2px solid black;
   }
   tr{
   border:2px solid black;
   }
   th{
    background-color:#1E90FF;
   }
  th,td
  {
    width:15%;
     border:2px solid black;
   
  }
  select {
  padding:6px;
  background:#1E90FF;
  }
    </style>
</head>
<body>
<%
   
    EmployeeService es = new EmployeeServiceImpl();
%>
<form class="Form" action="" method="GET">

    <%
    try{
    	String selectedIdsString = request.getParameter("MId");
        
        if (selectedIdsString != null && !selectedIdsString.isEmpty()) {
            String[] selectedIds = selectedIdsString.split(",");
            
            List<EmployeeModel> emps = new ArrayList<>();
            
            List<Integer> EmpIds = new ArrayList<>(); 
            
            for (String id : selectedIds) {
                
                id = id.trim();
               
                if (!id.isEmpty()) {
                    int empId = Integer.parseInt(id);
                    EmpIds.add(empId); 
                }
            }
            
            List<Integer> empIds1 = new ArrayList<>();
            	for(int i=0;i<empIds1.size();i++){
            		EmpIds.add(i);
            	}
            
            	List<EmployeeModel> emps1 = es.getAllEmployeeDetails(EmpIds);
            
            
          emps.addAll(emps1);
      
        if (!emps.isEmpty()) {
%>
    <h2>Employee Details</h2>
    <table class="table1">
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Employee Name</th>
                <th scope="col">Specialization</th>
                <th scope="col">Experience</th>
           
            </tr>
        </thead>
        <tbody>
            <% for (EmployeeModel e : emps) { %>
            <tr class="bg-info">
                <td style="color:black; text-decoration:none"><a href='UpdateEmployee?mid=<%=e.getMid()%>&name=<%=e.getName()%>&specialization=<%=e.getSpecialization()%>&experience=<%=e.getExperience() %>'><%=e.getMid()%></a></td>
                <td><%= e.getName()%></td>
                <td><%= e.getSpecialization()%></td>
                <td><%= e.getExperience()%></td>  
            </tr>
            <% } %>
        </tbody>
    </table>
    <%
                } else {
    %>
    <p>No employee data available!</p>
    <%
                }
            } else {
    %>
    <p>No employee selected!</p>
    <%
            }
        } catch (Exception ex) {
    %>
    <p>Error accessing database: <%= ex.getMessage() %></p>
    <%
        }
    %>
    <br><a href='Mechanic.jsp'><input type='button' value='back' class='submit'/></a><br><br>
</form>
</body>
</html>
