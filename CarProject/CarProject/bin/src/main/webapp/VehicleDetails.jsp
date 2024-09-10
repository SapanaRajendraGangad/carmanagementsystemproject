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
   
    VehicleService vs = new VehicleServiceImpl();
%>
<form class="Form" action="" method="GET">

    <%
    try{
    	String selectedIdsString = request.getParameter("vid");
        
        if (selectedIdsString != null && !selectedIdsString.isEmpty()) {
            String[] selectedIds = selectedIdsString.split(",");
            
            List<VehicleModel> vehicles = new ArrayList<>();
            
            List<Integer> vehicleIds = new ArrayList<>(); 
            
            for (String id : selectedIds) {
                
                id = id.trim();
               
                if (!id.isEmpty()) {
                    int vehicleId = Integer.parseInt(id);
                    vehicleIds.add(vehicleId); 
                }
            }
            
            List<Integer> vehicleIds1 = new ArrayList<>();
            	for(int i=0;i<vehicleIds1.size();i++){
            		vehicleIds.add(i);
            	}
            
            	List<VehicleModel> vehicles1 = vs.getAllVehicleDetails(vehicleIds);
            
            
            vehicles.addAll(vehicles1);
      
        if (!vehicles.isEmpty()) {
%>
    <h2>Vehicle Details</h2>
    <table class="table1">
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Vehicle Name</th>
                <th scope="col">Vehicle Model</th>
                <th scope="col">Number Plate</th>
                
            </tr>
        </thead>
        <tbody>
            <% for (VehicleModel v : vehicles) { %>
            <tr class="bg-info">
                <td style="color:black; text-decoration:none"><a href='updateV?vid=<%=v.getVid()%>&name=<%=v.getVname()%>&model=<%=v.getModel()%>&noplate=<%= v.getNoplate() %>'><%=v.getVid()%></a></td>
                <td><%= v.getVname() %></td>
                <td><%= v.getModel() %></td>
                <td><%= v.getNoplate() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <%
                } else {
    %>
    <p>No Vehicle data available!</p>
    <%
                }
            } else {
    %>
    <p>No Vehicle selected!</p>
    <%
            }
        } catch (Exception ex) {
    %>
    <p>Error accessing database: <%= ex.getMessage() %></p>
    <%
        }
    %>
    <a href='Vehicle.jsp'><input type='button' value='back' class='submit'/></a><br><br>
</form>
</body>
</html>
