<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String amount = (String) request.getAttribute("amount");
%>
<h3>Generate Bill Details</h3><br>
<label for="amount">Total Amount</label><br>
<input type="text" name="amount" value="<%= amount %>"/><br><br>
<label for="date">Date</label><br>
<input type="date" name="date" value="" placeholder="22-09-2024"/><br><br>
<label for="vid">Enter Vid</label><br>
<input type="text" name="vid" value="<%= request.getParameter("vid") %>" placeholder="1"/><br><br>
<input type="submit" name="s" value="Submit" class="submit"/><br><br>
</body>
</html>