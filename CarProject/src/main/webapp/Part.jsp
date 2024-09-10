<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.CarGarage.Service.*,java.util.*,org.CarGarage.Model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="MainDashBoard.jsp" %>
<link href="CSS/ViewData.css" rel="stylesheet"/>

</head>
<%!
PartService es=new PartServiceImpl();
int count=0;
%>
<script>
function showPartTable() {
    document.getElementById('partData').style.display = 'block';
}
function fetchNameData() {
    var str = document.getElementById("n").value;
    fetchTableData(str);
}

function fetchPriceData() {
    var str = document.getElementById("p").value;
    fetchTableData(str);
}


function fetchTableData(searchParam) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("partData").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "ViewSearchParts.jsp?p=" + searchParam, true);
    xhttp.send();
}

function openSelectedCustomer() {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    var selectedIds = [];
    checkboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            selectedIds.push(checkbox.value);
        }
    });
    if (selectedIds.length > 0) {
        window.location.href = 'PartDetail.jsp?PId=' + selectedIds.join(',');
    } else {
        alert('Please select a Part to open.');
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
  
   }
   h3{
   text-align:center;
   margin-bottom:30px;
   font-size:30px;
   margin-top:60px;
   margin-left:160px;
   }
   input{
   height:30px;
  
   }
   .submit{
   width:80px;
   height:30px;
   background:#1E90FF;
   maring-top:100px;
   
   
   }
   tr{
  border:2px solid black;
   }
  th,td
  {border:2px solid black;
    width:15%;
    
  }
  th{
 background-color:#1E90FF;
  }
  
</style>
<body>
<form id="PartForm" class="Form" action="" method="Get">
 <h3>Vehicle Part Search</h3>
 <br><br>
        
    <label for="Name"style="margin-right:20px;">Part Name</label>
    <input type="text" name="name" value=""style="margin-right:20px;" placeholder="plug" id="n" onkeyup="fetchNameData();showPartTable()" />
    <label for="price"style="margin-right:20px;">Part Price</label>
    <input type="text" name="price"style="margin-right:20px;" value="" placeholder="200" id="p" onkeyup="fetchPriceData();showPartTable()"/>
    <br><br>
         <input type="button" value="View" class="submit" onclick="showPartTable()"/>
        <a href="AddParts.jsp"><input type="button" value="New" class="submit"/></a>
        <input type="button" value="Open" class="submit" onclick="openSelectedCustomer()"/>

<div class="col-md-9 login1">
       <table class="table-bordered" id="partData" style="display:none">
            <thead>
                <tr>
                    <th>select</th>
                    <th scope="col">Id</th>
                    <th scope="col" class="th1">PartName</th>
                    <th scope="col" class="th1">Price</th>
                  
                </tr>
            </thead>
            <tbody>
                <% 
                List<PartModel> list=es.getAllParts();
                for(PartModel pmodel:list){
                %>  
                <tr>
                    <td><input type="checkbox" name="customerId" value="<%= pmodel.getPid() %>"></td>
                    <td style="color:black; text-decoration:none"><a href='updateP?pid=<%=pmodel.getPid()%>&name=<%=pmodel.getPname()%>&price=<%=pmodel.getPrice()%>'><%=pmodel.getPid()%></a></td>
                     <td><%=pmodel.getPname() %></td>
                    <td><%=pmodel.getPrice()%></td>
              
                </tr>
                <%
                }
                %>
            </tbody>
</table>
</main>
</div>
</div>
</div>
</div>
</form>
</body>
</html>
