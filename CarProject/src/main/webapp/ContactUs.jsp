<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
width:100px;
}
.heading{
width:70%;
}
.nav{
width:20%;
}
.nav ul li a{
text-decoration:none;
}
.nav ul li{
display:inline;
font-size:20px;
text-style:none;
}
nav ul li:hover{
    background-color:#0096C7;
    
     color:white;
     }
li a img{
width:100%;
}
body{
    background: #eee;
}
span{
    font-size:15px;
}
a{
  text-decoration:none; 
  color: #0062cc;
  border-bottom:2px solid #0062cc;
}
.box{
    padding:60px 0px;
}

.box-part{
    background:#FFF;
    border-radius:0;
    padding:60px 10px;
    margin:30px 0px;
}
.text{
    margin:20px 0px;
}

.fa{
     color:#4183D7;
}
</style>
<body>
<div class="container-fluid">
<div class="row header">
<div class="col-md-4 logo">
<img alt="" src="<%="img/garageimg-removebg-preview.png"%>"><b style="font-size:40px;">Garage</b>
</div>
<div class="col-md-4 heading">

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
<a href="AdminUser.jsp"class="nav-link active"><b>Login</b></a>
 </li>
<li class="nav-item">
<a class="nav-link active" href="ContactUs.jsp"><b>Contact</b></a>
</li>
</ul>
</div>
</nav>
</div>
</div>

<div class="box">
    <div class="container">
     	<div class="row">
			 
			    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part text-center">
                        
                        <i class="fa fa-instagram fa-3x" aria-hidden="true"></i>
                        
						<div class="title">
							<h4>Instagram</h4>
						</div>
                        
						<div class="text">
							<span>Contacting Instagram is easy to do. The problem is that receiving a response back, let alone a resolution to your issue, is very difficult. It’s important to know all of your options for making progress with Instagram support. This article covers the best strategies for getting the help you need.</span>
						</div>
                        
						<a href="#">Learn More</a>
                        
					 </div>
				</div>	 
				
				 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part text-center">
					    
					    <i class="fa fa-twitter fa-3x" aria-hidden="true"></i>
                    
						<div class="title">
							<h4>Twitter</h4>
						</div>
                        
						<div class="text">
							<span>Twitter is a free social networking site where users broadcast short posts known as tweets. These tweets can contain text, videos, photos, audio or links. To access Twitter, users need is an internet connection or smart phone is to use to the app or website, Twitter.com. Twitter is used to share information quickly.</span>
						</div>
                        
						<a href="#">Learn More</a>
                        
					 </div>
				</div>	 
				
				 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part text-center">
                        
                        <i class="fa fa-facebook fa-3x" aria-hidden="true"></i>
                        
						<div class="title">
							<h4>Facebook</h4>
						</div>
                        
						<div class="text">
							<span>Facebook is a social networking site that makes it easy for you to connect and share with family and friends online. Originally designed for college students, Facebook was created in 2004 by Mark Zuckerberg while he was enrolled at Harvard University. By 2006, anyone over the age of 13 with a valid email address could join Facebook.</span>
						</div>
                        
						<a href="#">Learn More</a>
                        
					 </div>
				</div>	 
				
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part text-center">
                        
                        <i class="fa fa-pinterest-p fa-3x" aria-hidden="true"></i>
                        
						<div class="title">
							<h4>Pinterest</h4>
						</div>
                        
						<div class="text">
							<span>Pinterest is a visual discovery engine for finding ideas like recipes, home and style inspiration, and more.

With billions of Pins on Pinterest, you'll always find ideas to spark inspiration. When you discover Pins you love, save them to boards to keep your ideas organized and easy to find. You can also create Pins to share your ideas with other people on Pinterest.</span>
						</div>
                        
						<a href="#">Learn More</a>
                        
					 </div>
				</div>	 
				
				 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part text-center">
					    
					    <i class="fa fa-google-plus fa-3x" aria-hidden="true"></i>
                    
						<div class="title">
							<h4>Google</h4>
						</div>
                        
						<div class="text">
							<span>Google's full form is Global Organisation of Oriented Group Language of Earth.Google is a popular internet search engine. It scans the Web to find Web pages that are relevant to the words you have typed in the search box. [trademark] A search on Google for "free ring tones" yields more than a million sites. Collins COBUILD Advanced Learner's Dictionary.</span>
						</div>
                        
						<a href="#">Learn More</a>
                        
					 </div>
				</div>	 
				
				 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part text-center">
                        
                        <i class="fa fa-github fa-3x" aria-hidden="true"></i>
                        
						<div class="title">
							<h4>Github</h4>
						</div>
                        
						<div class="text">
							<span>GitHub allows multiple developers to work on a single project at the same time, reduces the risk of duplicative or conflicting work, and can help decrease production time. With GitHub, developers can build code, track changes, and innovate solutions to problems that might arise during the site development process simultaneously.</span>
						</div>
                        
						<a href="#">Learn More</a>
                        
					 </div>
				</div>
		
		</div>		
    </div>
</div>
</div>
</body>
</html>