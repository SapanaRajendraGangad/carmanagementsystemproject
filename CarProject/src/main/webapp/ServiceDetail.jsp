<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.CarGarage.Service.*, java.util.*, org.CarGarage.Model.*" %>
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
    ServiceService es = new ServiceServiceImpl();
%>
<form class="Form" action="" method="GET">
    <%
    try {
        String selectedIdsString = request.getParameter("sid");
        
        if (selectedIdsString != null && !selectedIdsString.isEmpty()) {
            String[] selectedIds = selectedIdsString.split(",");
            
            List<Integer> serviceIds = new ArrayList<>();
            for (String id : selectedIds) {
                id = id.trim();
                System.out.println(id);
                if (!id.isEmpty()) {
                    int serviceId = Integer.parseInt(id);
                    serviceIds.add(serviceId); 
                }
            }

            List<Object[]> services = es.getAllServiceDetails(serviceIds);
            System.out.println("service"+services);
            if (!services.isEmpty()) {
    %>
    <h2>Service Details</h2>
    
    <table class="table1">
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Date</th>
                <th scope="col">Charges</th>
               <th scope="col">Vehicle Noplate</th>
                <th scope="col">Vehicle Name</th>
                <th scope="col">Part</th>
                <th scope="col">Mechanic</th>
                <th scope="col">Generate Bill</th>
               
            </tr>
        </thead>
        <tbody>
            <% for (Object obj[] : services) {
            	%>
            
            <tr class="bg-info">
             <td style="color:black; text-decoration:none"><a href='updateS?id=<%=obj[0]%>&date=<%=obj[1].toString()%>&charges=<%=obj[2].toString()%>&distance=<%=obj[3].toString()%>'><%=obj[0]%></a></td>
                <td><%= obj[1] %></td>
                <td><%= obj[2] %></td>
                <td><%= obj[3] %></td>
                <td><%= obj[4] %></td>
                <td><%= obj[6] %></td>
                <td><%= obj[7] %></td>
                <td><a href='Bill.jsp?vid=<%=obj[8]%>'>generate bill</a></td>
            </tr>
            <%
            } %>
        </tbody>
    </table>
    <%
            } else {
    %>
    <p>No customer data available!</p>
    <%
            }
        } else {
    %>
    <p>No customer selected!</p>
    <%
        }
    } catch (Exception ex) {
    %>
    <p>Error accessing database: <%= ex.getMessage() %></p>
    <%
    }
    %>
    <br><a href='Service.jsp'><input type='button' value='back' class='submit'/></a><br><br>
</form>
</body>
</html>
