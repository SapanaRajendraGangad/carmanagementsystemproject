<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*,java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
   
</head>

<script type="text/javascript">
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
        
        alert('Please select a Service to open.');
    }
}
</script>
<style>
  *{
      margin:0;
      padding:0;
      box-sizing:border-box;
    }
   body{
   display:constant;
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
  th
  {
    width:15%;
    padding-right:20px;
    background-color:#1E90FF;
  }
</style>
<body>
<form class="Form" action="" method="GET"> <!-- Changed method to GET -->
<%! 
    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;
    ServiceModel c;
%>
<%
    try {
        int count=0;
        String str = request.getParameter("p");
       System.out.println(str);
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cargarage", "root", "Root");
        c=new ServiceModel();
        stmt = conn.prepareStatement("SELECT * FROM service  WHERE (sdate LIKE ? OR charges LIKE ? OR distance LIKE ?)");
        stmt.setString(1,str + "%");
        stmt.setString(2, str + "%");
        stmt.setString(3, str + "%");
        rs=stmt.executeQuery();
        if (rs.next()) {
            
            out.println("<table table1>");
            out.println("<thead>");
            out.println("<th scope='col'>Select</th>");
            out.println("<th scope='col'>Id</th>");
            out.println("<th scope='col' class='th1'>Date</th>");
            out.println("<th scope='col' class='th1'>Charges</th>");
            out.println("<th scope='col'>Vehicle Noplate</th>");
            out.println("<th scope='col'>Generate Bill</th>");
            out.println("</thead>");
            out.println("<tbody>");
            do {
                out.println(" <tr class=''>");
                out.println("<td><input type='checkbox' name='sid' value="+ rs.getInt(1)+"></td>");
                out.println("<td style='color:black; text-decoration:none'><a href='updateS?sid=" + rs.getInt(1) + "&sdate=" + rs.getString(2) + "&charges=" + rs.getString(3) + "&distance=" + rs.getString(4) + "'>" + rs.getInt(1)+ "</a></td>");
                out.println("<td>"+rs.getString(2)+"</td>");
                out.println("<td>"+rs.getString(3)+"</td>");
                out.println("<td>"+rs.getString(4)+"</td>");
                out.println("<td><a href='Bill.jsp?vid="+rs.getInt(5)+"'>generate bill</a></td>");
                
                
                out.println("</tr>");
            } while (rs.next());
            out.println("</tbody>");
            out.println("</table>");
        } else {
            out.println("<p>No data available!</p>"); 
        }
    } catch(SQLException ex) {
        out.println("<p>Error accessing database: " + ex.getMessage() + "</p>"); 
       
    } 
%>
</form>
</body>
</html>
