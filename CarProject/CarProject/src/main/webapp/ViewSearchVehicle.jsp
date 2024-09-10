<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*,java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

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
<form class="Form" action="" method="POST">
<%! private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;
    List<Object[]> list;

%>
<%
    try {
        int count=0;
        String str = request.getParameter("p");
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cargarage", "root", "Root");
        list=new ArrayList<Object[]>();
        stmt = conn.prepareStatement("SELECT * FROM vehicle  WHERE (vname LIKE ? OR model LIKE ? OR noplate LIKE ?)");
        stmt.setString(1,str + "%");
        stmt.setString(2, str + "%");
        stmt.setString(3, str + "%");
        
        rs=stmt.executeQuery();
        out.println("<table table1>");
        out.println("<thead>");
        out.println("<th scope='col'>select</th>");
        out.println("<th scope='col'>Id</th>");
        out.println("<th scope='col' class='th1'>Vehicle Name</th>");
        out.println("<th scope='col' class='th1'>Model</th>");
        out.println("<th scope='col'>Number Plate</th>");
        out.println("</thead>");
        out.println("<tbody>");
        if (rs != null && rs.next()) {
            do {
                out.println(" <tr class='bg-info'>");
                out.println("<td><a href='del?cid=" + rs.getInt(1) +"'><input type='checkbox' name='customerId' value="+ rs.getInt(1)+"></a></td>");
                out.println("<td><a href='updateV?vid=" + rs.getInt(1) + "&name=" + rs.getString(2) + "&model=" + rs.getString(3) + "&noplate=" + rs.getString(4) +"'>" + rs.getInt(1)+ "</a></td>");
                out.println("<td>"+rs.getString(2)+"</td>");
                out.println("<td>"+rs.getString(3)+"</td>");
                out.println("<td>"+rs.getString(4)+"</td>");
               
                out.println("</tr>");
            } while (rs.next());
        } else {
            out.println("<tr>");
            out.println("<td colspan='7'>No data available</td>");
            out.println("</tr>");
        }
        out.println("</tbody>");
        out.println("</table>");
    } catch(Exception ex) {
        System.out.println("Error in jsp: " + ex);
    }
%>
</form>
</body>
</html>
