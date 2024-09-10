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
    CustomerService es = new CustomerServiceImpl();
%>
<form class="Form" action="" method="GET">
    <%
    try {
        String selectedIdsString = request.getParameter("customerId");

        if (selectedIdsString != null && !selectedIdsString.isEmpty()) {
            String[] selectedIds = selectedIdsString.split(",");
            
            List<Integer> customerIds = new ArrayList<>();
            for (String id : selectedIds) {
                id = id.trim();
                if (!id.isEmpty()) {
                    int customerId = Integer.parseInt(id);
                    customerIds.add(customerId); 
                }
            }

            List<Object[]> customers = es.getAllCustomerDetails(customerIds);

            if (!customers.isEmpty()) {
    %>
    <h2>Customer Details</h2>
    <table class="table1">
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Contact</th>
                <th scope="col">Address</th>
                <th scope="col">Vehicle Name</th>
                <th scope="col">Number Plate</th>
                <th scope="col">Status</th>
            </tr>
        </thead>
        <tbody>
            <% for (Object obj[] : customers) { %>
            <tr class="bg-info">
                 <td style="color:black; text-decoration:none"><a href='update?cid=<%=obj[0]%>&cname=<%=obj[1]%>&cemail=<%=obj[2]%>&ccontact=<%=obj[3]%>&caddress=<%=obj[4]%>&status=<%=obj[5]%>'><%=obj[0]%></a></td>
                <td><%= obj[1] %></td>
                <td><%= obj[2] %></td>
                <td><%= obj[3] %></td>
                <td><%= obj[4] %></td>
                <td><%= obj[5] %></td>
                <td><%= obj[6] %></td>
                <td><%= obj[7] %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <a href='ViewCustomer.jsp'><input type='button' value='back' class='submit'/></a><br><br>
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
</form>
</body>
</html>
