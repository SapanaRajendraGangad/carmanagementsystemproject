<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }
    .container{
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
    }
    nav{
        padding: 10px 0;
        display: flex;
        text-align: center;
        justify-content: space-between;
    }
    nav ul li{
        display: inline-block;
        list-style: none;
        font-size:25px;
        margin: 10px 15px;
        transition: 0.75s;
     }
     nav ul li:hover{
    background-color:#0096C7;
    padding:10px;
     color:white;
     }
    nav ul li a{
        text-decoration: none;
        color:white;
        font-weight: 400px;
     }
    nav ul li a:hover{
        transform: translate(100px);
    }
    .logo{
        width: 150px;
    }
    .login-btn{
        text-decoration: none;
        color: #333;
        margin-right: 15;
        font-size:400;
    }
    .btn{
        display: inline-block;
        text-decoration: none;
        padding: 14px 40px;
        color: #fff;
        background-color:#0096C7;
        font-size: 14px;
        border-radius: 30px;
        border-top-right-radius: 0;
        transition: 0.75s;
            }
    .content{
        margin-top: 10%;
        max-width: 600px;
        position: absolute;
        rigth:0;
        color:white;
    }
    .content h1{
        font-size: 70px;
       color:white;
       font-family: "Inria Sans Bold", cursive;
     }
    .content p{
        margin: 10px 0 30px;
        color: #333;
        animation-delay: 1.5s;
        color:white;
        font-size:20px;
        font-family: "Inria Sans Bold", sans-serif;
    }
    .content .btn{
        padding: 15px 80px;
        font-size: 16px;
        animation-delay: 1s;
    }
    .btn:hover{
        border-top-right-radius:30px;
    }
    .feature-img{
        width: 1030px;
        position: absolute;
        bottom: 0;
        left: 0;
        margin-left:700px;
        
    }
    .feature-img.anim{
        animation-delay: 1.9s;
      
    }
    .anim{
        opacity: 0;
        transform: translate(30px);
        animation: moveup 0.9s linear forwards;
        color:white;
    }
    @keyframes moveup{
        100%{
            opacity: 1;
            transform: translate(0);
        }
    }
    @media (min-width: 367px) and (max-width: 1067px) {
    .container {
        padding: 10px;
        height:0;
    }

    nav ul li {
        font-size: 20px;
        margin: 10px 10px;
        
    }

    .logo {
        width: 100px;
    }

    .content {
        max-width: 100%;
        margin-top: 20%;
    }

    .content h1 {
        font-size: 50px;
    }

    .content p {
        font-size: 16px;
    }

    .content .btn {
        padding: 12px 30px;
        font-size: 14px;
    }
    
}
    
</style>
<body>
    <div class="container">
    <nav>
        <img src="<%="img/garage.jpeg"%>"class="logo">
        <ul>
            <li><a href="AdminUser.jsp">Admin & User</a></li>
            <li><a href="AboutUs.jsp">About us</a></li>
             <li><a href="ContactUs.jsp">Contact us</a></li>
        </ul>
     <!--  <div class="menu">
        <a href="" class="login-btn">Contact Us</a>
        <a href="" class="btn">About Us</a>
      </div> -->
    </nav>
    <img src="<%="img/Mechanic-removebg-preview.png"%>" class="feature-img anim">
    <div class="content">
    
        <h1 class="anim">WelCome<br>To Our Garage</h1>
        <p class="anim">We provide great services to your vhicle</p>
        <a href="AdminUser.jsp" class="btn anim">Get Start</a>
    </div>
    </div>
    
</body>
</html>