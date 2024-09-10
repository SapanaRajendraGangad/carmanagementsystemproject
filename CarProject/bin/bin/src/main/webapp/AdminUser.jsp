<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="CSS/AdminForm.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
*{
padding:0;
margin:0;
box-sizing:border-box;
}
.container-fluid{
border: 5px solid black;
width:100%;
}

img{
left:0;
width:100px;
margin-left:10px;
}
h1{
margin-top:20px;
}
.logo{
width:120px;
float:left;
}
.heading{
width:70%;
float:right;
}
.nav{
width:20%;
}
.nav ul li a{
text-decoration:none;
}
.nav ul li{
padding-left:20px;
display:inline;
font-size:20px;
text-style:none;
}
.nav ul li a:hover{
    background-color:#0096C7;
    padding:10px;
     color:white;
     }
li a img{
width:100%;
}
.r2{
width:100%;
border: 2px solid black;
min-height: 100vh;
background-image: url(img/car1.jpg);
background-position: center;
background-size: cover;
padding: 10px 10%;
overflow: hidden;
position: relative;
color:white;
margin:1px;
padding-top:200px;
}
</style>
<body>
<div class="container-fluid">
<div class="row header">
<div class="col-md-4 logo">
<img alt="" src="<%="img/garageimg-removebg-preview.png"%>">
</div>
<div class="col-md-4 heading">
<h1>Garage</h1>
</div>
<div class="col-md-4 nav">
<nav class="navbar navbar-expand-lg">
<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav me-auto mb-2 mb-lg-0">
<li class="nav-item">
<a class="nav-link active" aria-current="page" href="Dashboard.jsp"><b>Home</b></a>
</li>

<li class="nav-item">
<a class="nav-link active" href="AboutUs.jsp"><b>About</b></a>
</li>
<li class="nav-item">
<a class="nav-link active" href="ContactUs.jsp"><b>Contact</b></a>
</li>
</ul>
</div>
</nav>
</div>
</div>
<div class="row r2">
<div class="col-md-6 content1">
<div class="admin">
<img alt="" src="<%="img/admin-removebg-preview.png"%>">
<ul><li><a href="AdminLogin.jsp">Admin Login</a></li></ul>
</div>
</div>
<div class="col-md-6 content2">
<div class="user">
<img alt="" src="<%="img/user-removebg-preview.png"%>">
<ul><li><a href="UserLogin.jsp">User Login</a></li></ul>
</div>
</div>
</div>
</div>
</body>
</html>