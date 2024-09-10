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
   
    PartService es = new PartServiceImpl();
%>
<form class="Form" action="" method="GET">

    <%
    try{
    	String selectedIdsString = request.getParameter("PId");
        
        if (selectedIdsString != null && !selectedIdsString.isEmpty()) {
            String[] selectedIds = selectedIdsString.split(",");
            
            List<PartModel> parts = new ArrayList<>();
            
            List<Integer> PartIds = new ArrayList<>(); 
            
            for (String id : selectedIds) {
                
                id = id.trim();
               
                if (!id.isEmpty()) {
                    int partId = Integer.parseInt(id);
                    PartIds.add(partId); 
                }
            }
            
            List<Integer> partIds1 = new ArrayList<>();
            	for(int i=0;i<partIds1.size();i++){
            		PartIds.add(i);
            	}
            
            	List<PartModel> parts1 = es.getAllPartDetails(PartIds);
            
            
          parts.addAll(parts1);
      
        if (!parts.isEmpty()) {
%>
    <h2>Part Details</h2>
    <table class="table1">
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Part Name</th>
                <th scope="col">Price</th>
           
            </tr>
        </thead>
        <tbody>
            <% for (PartModel p : parts) { %>
            <tr class="bg-info">
                <td style="color:black; text-decoration:none"><a href='updateP?pid=<%=p.getPid()%>&name=<%=p.getPname() %>&price=<%=p.getPrice()%>'><%=p.getPid()%></a></td>
                <td><%= p.getPname() %></td>
                <td><%= p.getPrice()%></td>
              
            </tr>
            <% } %>
        </tbody>
    </table>
    <%
                } else {
    %>
    <p>No part data available!</p>
    <%
                }
            } else {
    %>
    <p>No part selected!</p>
    <%
            }
        } catch (Exception ex) {
    %>
    <p>Error accessing database: <%= ex.getMessage() %></p>
    <%
        }
    %>
    <br><a href='Vehicle.jsp'><input type='button' value='back' class='submit'/></a><br><br>
</form>
</body>
</html>
