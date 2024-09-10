<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="CSS/AddCustomer.css" rel="stylesheet"/>

</head>
<body>
<form class="Form" action="cadd" method="POST">
    <div class="col-md-9 login">
        <h3>Add Customer Details</h3><br>
        <label for="Name">Customer Name</label><br>
        <input type="text" name="name" value="" placeholder="ram" required/><br><br>
        <label for="Email">Customer Email</label><br>
        <input type="text" name="email" value="" placeholder="ram@gmail.com" required/><br><br>
        <label for="contact">Customer Contact</label><br>
        <input type="text" name="contact" value="" placeholder="9878989999" required/><br><br>
        <label for="address">Customer Address</label><br>
        <input type="text" name="address" value="" placeholder="pune" required/><br><br>
        <input type="submit" name="s" value="Submit" class="submit"/><br><br>
</form>
</main>
</div>
</div>
</div>
</body>
</html>
