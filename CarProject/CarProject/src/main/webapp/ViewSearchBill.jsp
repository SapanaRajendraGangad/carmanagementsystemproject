<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="CSS/ViewData.css" rel="stylesheet"/>
<style>
   
    table{
        margin-top:30px;
        
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
        width:20px;
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
<form class="Form" action="" method="GET">
       
        <%
            try {
                String str = request.getParameter("p");
                if (str != null && !str.isEmpty()) {
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cargarage", "root", "Root");
                    PreparedStatement stmt = conn.prepareStatement("SELECT c.cname, c.contact, c.email, v.vname, v.noplate, b.bdate, s.sdate, b.amount, b.bid FROM vehicle v INNER JOIN service s ON v.vid=s.vid INNER JOIN bill b ON s.sid=b.sid INNER JOIN customer c ON v.cid=c.cid WHERE b.bdate LIKE '%"+str+"%' or year(b.bdate) LIKE '%"+str+"%' or month(b.bdate) LIKE '%"+str+"%' or c.cname LIKE '%"+str+"%' or c.email LIKE '%"+str+"%' or c.contact LIKE '%"+str+"%' or v.noplate LIKE '%"+str+"%' or v.vname LIKE '%"+str+"%' or b.amount LIKE '%"+str+"%'");
                   // stmt.setString(1, str + "%");
                    ResultSet rs = stmt.executeQuery();
        %>
        <table class="table1">
            <thead>
                <tr>
                   <th scope="col">Id</th>
      <th scope="col" class="th1">Bill Date</th>
      <th scope="col" class="th1">Service Date</th>
      <th scope="col" class="th1">Customer Name</th>
      <th scope="col" class="th1">Customer Contact</th>
      <th scope="col" class="th1">Customer Email</th>
       <th scope="col" class="th1">Vehicle noplate</th>
      <th scope="col" class="th1">Vehicle Name</th>
      
      <th scope="col" class="th1">Total Amount</th>
     
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr class='bg-info'>
                    
                    <td><a href="ViewPerticularCustomerBill.jsp?bid=<%= rs.getString("b.bid") %>"><%= rs.getString("b.bid") %></a></td>
                    <td><%= rs.getString("b.bdate") %></td>
                    <td><%= rs.getString("s.sdate") %></td>
                    <td><%= rs.getString("c.cname") %></td>
                    <td><%= rs.getString("c.contact") %></td>
                    <td><%= rs.getString("c.email") %></td>
                    <td><%= rs.getString("v.noplate") %></td>
                    <td><%= rs.getString("v.vname") %></td>
                    <td><%= rs.getInt("b.amount") %></td>
                    
                </tr>
                <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } else {
        %>
        <tr>
            <td colspan='9'>No data available</td>
        </tr>
        <%
                }
            } catch(Exception ex) {
                out.println("Error in JSP: " + ex);
            }
        %>
            </tbody>
        </table>
    </form>
</body>
</html>