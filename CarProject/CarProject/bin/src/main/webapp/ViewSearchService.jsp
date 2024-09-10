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
        stmt = conn.prepareStatement("select s.sid,s.sdate,s.charges,s.distance,v.vname from vehicle v inner join service s on v.vid=s.vid  WHERE (s.sdate LIKE ? OR s.charges LIKE ? OR s.distance LIKE ? OR v.vname like ?)");
        stmt.setString(1,str + "%");
        stmt.setString(2, str + "%");
        stmt.setString(3, str + "%");
        stmt.setString(4,str+"%");
        rs=stmt.executeQuery();
        if (rs.next()) {
            
            out.println("<table>");
            out.println("<thead>");
            out.println("<th scope='col'>Select</th>");
            out.println("<th scope='col'>Id</th>");
            out.println("<th scope='col' class='th1'>Date</th>");
            out.println("<th scope='col' class='th1'>Charges</th>");
            out.println("<th scope='col'>Distance</th>");
            out.println("<th scope='col'>Vehicle Name</th>");
            out.println("</thead>");
            out.println("<tbody>");
            do {
                out.println(" <tr class=''>");
                out.println("<td><input type='checkbox' name='sid' value="+ rs.getInt(1)+"></td>");
                out.println("<td style='color:black; text-decoration:none'><a href='updateS?sid=" + rs.getInt(1) + "&sdate=" + rs.getString(2) + "&charges=" + rs.getString(3) + "&distance=" + rs.getString(4) + "'>" + rs.getInt(1)+ "</a></td>");
                out.println("<td>"+rs.getString(2)+"</td>");
                out.println("<td>"+rs.getString(3)+"</td>");
                out.println("<td>"+rs.getString(4)+"</td>");
                out.println("<td>"+rs.getString(5)+"</td>");
                
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
