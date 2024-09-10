<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*,java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <link href="CSS/ViewData.css" rel="stylesheet"/>
</head>

<script type="text/javascript">
function openSelectedPart() {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    var selectedIds = [];

   
    checkboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            
            selectedIds.push(checkbox.value);
        }
    });

    if (selectedIds.length > 0) {
        
        window.location.href = 'PartsDetail.jsp?pId=' + selectedIds.join(',');
    } else {
        
        alert('Please select a part to open.');
    }
}
</script>
<style>
  *
    {
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
    CustomerModel c;
%>
<%
    try {
        int count=0;
        String str = request.getParameter("p");
       
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cargarage", "root", "Root");
        c=new CustomerModel();
        stmt = conn.prepareStatement("SELECT * FROM part  WHERE (pname LIKE ? OR price LIKE ?)");
        stmt.setString(1,str + "%");
        stmt.setString(2, str + "%");
        rs=stmt.executeQuery();
        if (rs.next()) {
            
            out.println("<table table1>");
            out.println("<thead>");
            out.println("<th scope='col'>Select</th>");
            out.println("<th scope='col'>Id</th>");
            out.println("<th scope='col' class='th1'>Name</th>");
            out.println("<th scope='col' class='th1'>Price</th>");
           
            out.println("</thead>");
            out.println("<tbody>");
            do {
                out.println(" <tr class='bg-info'>");
                out.println("<td><input type='checkbox' name='customerId' value="+ rs.getInt(1)+"></td>");
                out.println("<td style='color:black; text-decoration:none'><a href='update?pid=" + rs.getInt(1) + "&name=" + rs.getString(2) + "&price=" + rs.getInt(3)+"'>" + rs.getInt(1)+ "</a></td>");
                out.println("<td>"+rs.getString(2)+"</td>");
                out.println("<td>"+rs.getString(3)+"</td>");
                out.println("<td>"+rs.getString(4)+"</td>");
                out.println("<td>"+rs.getString(5)+"</td>");
                out.println("<td>"+rs.getString(6)+"</td>");
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
