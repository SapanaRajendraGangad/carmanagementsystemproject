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
CustomerService es=new CustomerServiceImpl();
int count=0;
%>
<script>
function showCustomerTable() {
    document.getElementById('customerData').style.display = 'block';
}
function fetchNameData() {
    var str = document.getElementById("n").value;
    fetchTableData(str);
}

function fetchEmailData() {
    var str = document.getElementById("e").value;
    fetchTableData(str);
}

function fetchContactData() {
    var str = document.getElementById("c").value;
    fetchTableData(str);
}

function fetchAddressData() {
    var str = document.getElementById("a").value;
    fetchTableData(str);
}
function fetchStatusData() {
    var str = document.getElementById("s").value;
    fetchTableData(str);
}
function fetchTableData(searchParam) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("customerData").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "ViewSearchCustomer.jsp?p=" + searchParam, true);
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
        window.location.href = 'CustomerDetail.jsp?customerId=' + selectedIds.join(',');
    } else {
        alert('Please select a customer to open.');
    }
}
</script>
<style>
    *{
      margin:0;
      padding:0;
      box-sizing:border-box;
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
   tr{
  border:2px solid black;
   }
  th,td
  {border:2px solid black;
    width:15%;
    
  }
  th{
  border:2px solid black;
  background:#1E90FF;
  }
  select {
  padding:6px;
  background:#1E90FF;
  }
</style>
<body>
<% List<CustomerModel> list=es.getAllCustomer();%>

<form id="customerForm" class="Form" action="" method="Get">
 <h3>Customer Details</h3>
    <input type="submit" name="s" value="Save" class="submit"/><br><br>
    <label for="Name"style="margin-right:20px;">Customer Name</label>
    <input type="text" name="name" value=""style="margin-right:20px;" placeholder="ram" id="n" onkeyup="fetchNameData();showCustomerTable()" />
    <label for="Email"style="margin-right:20px;">Customer Email</label>
    <input type="text" name="email"style="margin-right:20px;" value="" placeholder="ram@gmail.com" id="e" onkeyup="fetchEmailData();showCustomerTable()"/>
    <label for="contact"style="margin-right:20px;">Customer Contact</label>
    <input type="text"style="margin-right:20px;" name="contact" value="" placeholder="9878989999" id="c" onkeyup="fetchContactData();showCustomerTable()"/><br><br>
    <label for="address"style="margin-right:8px;">Customer Address</label>
    <input type="text"style="margin-right:20px;" name="address" value="" placeholder="pune"  id="a" onkeyup="fetchAddressData();showCustomerTable()"/>
    <label for="status"style="margin-right:20px;">Status</label>
    <select placeholder="Active/Inactive" style="margin-right:20px;" name="status"  id="s" onchange="fetchStatusData();showCustomerTable()">
    <option>Active</option>
    <option>Inactive</option>
    </select><br><br>
        <a href="ViewSearchCustomer.jsp?p=" onclick="fetchData(); return false;"><input type="button" value="Search" class="submit"/></a><br><br>
        <input type="button" value="View" class="submit" onclick="showCustomerTable()" /><br><br>
        <a href="Registration.jsp"><input type="button" value="New" class="submit"/></a>
        <input type="button" value="Open" class="submit" onclick="openSelectedCustomer()"/>
<div class="col-md-9 login1">
       <table class="table-bordered" id="customerData" style="display:none">
            <thead>
                <tr>
                    <th>select</th>
                    <th scope="col">Id</th>
                    <th scope="col" class="th1">Name</th>
                    <th scope="col" class="th1">Email</th>
                    <th scope="col">Contact</th>
                    <th scope="col">Address</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <% 
                
                for(CustomerModel cmodel:list){
                %>  
                
                <tr>
                    <td><input type="checkbox" name="customerId" value="<%= cmodel.getId() %>"></td>
                    <td style="color:black; text-decoration:none"><a href='update?cid=<%=cmodel.getId()%>&cname=<%=cmodel.getName()%>&cemail=<%=cmodel.getEmail()%>&ccontact=<%=cmodel.getContact()%>&caddress=<%=cmodel.getAddress()%>&status=<%=cmodel.getStatus()%>'><%=cmodel.getId()%></a></td>
                    <td><%=cmodel.getName() %></td>
                    <td><%=cmodel.getEmail()%></td>
                    <td><%=cmodel.getContact()%></td>
                    <td><%=cmodel.getAddress()%></td>
                    <td><%=cmodel.getStatus() %>
                </tr>
                <%
                }
                %>
            </tbody>
            
</table>

</div>
 

   
</main>
</div>
</div>
</div>
</div>
</form>
</body>
</html>
