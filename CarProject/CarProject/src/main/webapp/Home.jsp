<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
    
    .heading{
        background-image:url(img/hero-bg.jpg);
        width:100%;
        height: 100vh;
    }
    .menu{
        background-color: white;
        margin-left: 150px;
        margin-top: 50px;
        min-height: 9vh;
        width:80%;
       
    }
    .menu img{
        width:90px;
        float: left;
        font-size: 30px;
      
        
    }
    .menu ul{
        float: right;
        margin-right: 100px;
        margin-top: 15px;
        width:80%;
       
        
    }
    .menu ul li{
        display: inline;
        
    }
    .menu ul li a{
        text-decoration: none;
        color: black;
        font-size: 25px;
        margin-left: 30px;
    }
    .menu a:hover{
        background-color: red;
        color: white;
        padding: 3px;
    }
    .headerimg img{
       width:810px;
       margin-top: 100px;
       float: right;
       margin-left: 200px;
       
    }
    .content{
        margin-left: 115px;
        float: left;
        margin-top: 200px;
       
    }
    .services1{
        width: 100%;
        height: 90vh;
        background: white;
        justify-content: center;
        margin-bottom: 200px;
    }
    .services1 h6{
        color: red;

    }
    .imgdiv{
        display: block;
        margin-left: auto;
        margin-right: auto;
        width: 45%;
    }
    .main-content{
       text-align: center;
       margin-top: 50px;
    }
    .services {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}

.service {
    width: 200px;
    margin: 10px;
    text-align: center;
}

.service img {
    width: 50px;
    height: 50px;
}

.service h2 {
    font-size: 18px;
    margin: 10px 0;
}

.service p {
    font-size: 14px;
    color: #777;
}

.service a {
    display: block;
    margin-top: 10px;
    color: #e63946;
    text-decoration: none;
    font-weight: bold;
}

.car-image {
    margin: 30px 0;
    text-align: center;
}

.car-image img {
    width: 500px;
}

.view-all-services {
    background-color: #e63946;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    text-transform: uppercase;
    margin-left: 630px;
}
.aboutimg{
    background-image: url(img/about-abs-banner.png);
    width: 100%;
    min-height: 100vh;
    background-repeat: no-repeat;
}
.aboutimg img{
  float: left;
  margin-left: 640px;
  width: 20%;
  margin-top: 100px;
}
.about{
    background-color: darkblue;
}
.content1 h4{
    color: aqua;
    margin-left:1100px;
    margin-top: 100px;
    margin-bottom: 30px;
}
.content1 h1{
    margin-left:970px;
    color: white;
   
}
.content1 p{
   width:35%;
   margin-top: 20px;
   color: white;
   margin-left:950px;
}
.cards{
    width:100%;
    min-height: 100vh;
    
}
.work{
    background-color: #ebe6e6;
    height: 120vh;
}
.work1{
background-image: url(img/work-1.jpg);
height: 50vh;
background-repeat: no-repeat;
margin-left: 150px;
background-color: red;
width: 350px;

}
.work2{
background-image: url(img/work-2.jpg);
height: 50vh;
background-repeat: no-repeat;
margin-left: 70px;
width: 350px;
}
.work3{
background-image: url(img/work-3.jpg);
height: 50vh;
background-repeat: no-repeat;
margin-left: 70px;
width: 350px;
}
.tyre{
    background-color: white;
    min-height: 20vh;
    margin-top: 350px;
    text-align: center;
    padding-top: 30px;
    
}
.tyre input{
    width:60px;
    height: 60px;
    border-radius: 600px;
    background-color: #e63946;
    color: white;
    font-size: 25px;

}
.engine{
    background-color: white;
    min-height: 20vh;
    margin-top: 350px;
    text-align: center;
    padding-top: 30px;
}
.engine input{
    width:60px;
    height: 60px;
    border-radius: 600px;
    background-color: #e63946;
    color: white;
    font-size: 25px;

}
.battery{
    background-color: white;
    min-height: 20vh;
    margin-top: 350px;
    text-align: center;
    padding-top: 30px;
    
}
.battery input{
    width:60px;
    height: 60px;
    border-radius: 600px;
    background-color: #e63946;
    color: white;
    font-size: 25px;
}
.content3{
    text-align: center;
    margin-top: 100px;
    height: 10px;
}
.content3 h6{
    color: red;
   
}
.main-section{
    background-color: darkblue;
    color: white;
}
.main-footer1{
    background-color: darkblue;
    color: white;
}
.icon1{
    background-color: darkblue;
    color: white;
}
</style>
<body>
  <div class="main-conatiner">
    <div class="container-fluid heading">
       
        <div class="row">
            <div class="col-md-12 menu">
            <img src="img/logo-removebg-preview.png" alt="">
            <b><ul>
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="AdminUser.jsp">Login Panel</a></li>
               <li><a href="#services">Services</a></li>
               <li><a href="#works1">Work</a></li>
               <li><a href="#footer5">Conatct Us</a></li>
                <li><a href="#about-us">About Us</a></li>
            </ul></b>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5 content">
                <h1><b style="color: rgb(0, 252, 252); font-size: 90px;">Wel-Come</b></h1>
                <h1><b style="color: white;"> To Our Garage</b></h1>
                <p style="color: white; font-size: 30px;">To Provide Great Services To Your Vehicle</p>
            <b><a href="AdminUser.jsp"><input type="button" value="Get Start" style="width: 200px; height: 60px; border-radius: 30px; background:red;font-size: 20px;color: white;"></a></b>
        </div>
            <div class="col-md-6 headerimg">
                <img src="img/hero-banner.png" alt="">
            </div>
        </div>
    </div>
    <div class="container-fluid services1">
    <div class="row">
        <div class="col-md-12">
         <div class="main-content">
         <h6>OUR SERVICES</h6>
         <h1>WE PROVIDE GREAT SERVICES</h1>
         <h1>FOR YOUR VEHICLE</h1>
        
        </div>
         <div class="services " id="services">
             <div class="service">
                <div class="div1" style="transform: translate(250px,345px) rotate(-0deg);">
                 <img src="img/services-1.png" alt="Engine Repair">
                 <h2>Engine Repair</h2>
                 <p>Autem vel eum iure reare aenderit rui in ea rolputate esse ruam moles</p>
                 <a href="#">READ MORE</a>
                 </div>
             </div>
             <div class="service">
                <div class="div2" style="transform: translate(20px,105px) rotate(-0deg);">
                 <img src="img/services-2.png" alt="Brake Repair">
                 <h2>Brake Repair</h2>
                 <p>Autem vel eum iure reare aenderit rui in ea rolputate esse ruam moles</p>
                 <a href="#">READ MORE</a>
             </div>
             </div>
             <div class="service">
                <div class="div3" style="transform: translate(2px)">
                 <img src="img/services-3.png" alt="Tire Repair">
                 <h2>Tire Repair</h2>
                 <p>Autem vel eum iure reare aenderit rui in ea rolputate esse ruam moles</p>
                 <a href="#">READ MORE  </a></div>
                    </div>
                     <div class="service">
                        <div class="div5" style="transform: translate(-20px,105px) rotate(-0deg);" >
                         <img src="img/services-4.png" alt="Battery Repair">
                         <h2>Battery Repair</h2>
                         <p>Autem vel eum iure reare aenderit rui in ea rolputate esse ruam moles</p>
                         <a href="#">READ MORE</a>
                     </div>
                     </div>
                     <div class="service">
                        <div class="div6" style="transform: translate(-250px,345px) rotate(-0deg);">
                         <img src="img/services-4.png" alt="Steering Repair">
                         <h2>Steering Repair</h2>
                         <p>Autem vel eum iure reare aenderit rui in ea rolputate esse ruam moles</p>
                         <a href="#">READ MORE</a>
                         </div>
                     </div>
                 </div>
                 <div class="car-image">
                     <img src="img/services-5.png" alt="Car Image">
                 </div>
                 <button class="view-all-services">VIEW ALL SERVICES</button>
        </div>
    </div>
    </div>
    <div class="container-fluid"id="about-us">
        <div class="row about">
            <div class="col-md-12 aboutimg">
            <img src="img/about-banner.png" alt="">
            <div class="content1">
            <h4>ABOUT US</h4>
            <h1>WE'RE COMMITED TO</h1>
            <h1>MEET THE QUALITY</h1>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis, officia dolor autem, sed quam nesciunt ratione dolorum hic perferendis voluptatem velit ipsum est temporibus totam fugiat, facere iure iusto ab.
            Laborum harum quidem, voluptatibus fugiat maiores perferendis, aspernatur error eligendi voluptatum quia debitis officia cupiditate in autem at iusto nemo asperiores  quos officia deserunt, nulla cum explicabo.</p>
            <b><input type="button" value="MORE INFO" style="border:none; width: 200px; height: 60px; border-radius: 30px; background:red;font-size: 20px;color: white; margin-left: 1060px; margin-top: 40px;"></b>
        </div>
        </div>
        </div>
    </div>
    <div class="container-fluid cards" id="works1">
        <div class="row work">
            <div class="content3">
            <h6>OUR WORK</h6>
            <h1>LATEST PROJECTS WE</h1>
            <h1>HAVE DONE</h1>
        </div>
            <div class="col-md-4 work1">
             <div class="engine">
                <b><h4>CAR TYRE CHANGE</h4></b>
                <input type="button" value="->">
             </div>
            </div>
            <div class="col-md-4 work2">
            <div class="tyre">
            <b><h4>CAR TYRE CHANGE</h4></b>
            <input type="button" value="->">
            </div>
            </div>
            <div class="col-md-4 work3">
            <div class="battery">
                <b><h4>CAR TYRE CHANGE</h4></b>
                <input type="button" value="->">
            </div>
            </div>
        </div>
    </div>
   <footer class="text-center text-lg-start bg-body-tertiary text-muted scroll-down" id="footer5">
    <div class="icon1">
     <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
      <div class="me-5 d-none d-lg-block m-3">
        <span>Get connected with us on social networks:</span>
      </div>
       <div>
        
        <a href="" class="me-4 text-reset fs-2 ">
          <i class="fab fa-facebook-f"><ion-icon name="logo-facebook"></ion-icon></i>
        </a>
        <a href="" class="me-4 text-reset fs-2">
          <i class="fab fa-twitter"><ion-icon name="logo-twitter"></ion-icon></i>
        </a>
        <a href="" class="me-4 text-reset fs-2">
          <i class="fab fa-google"><ion-icon name="logo-google"></ion-icon></i>
        </a>
        <a href="" class="me-4 text-reset fs-2">
          <i class="fab fa-instagram"><ion-icon name="logo-instagram"></ion-icon></i>
        </a>
        <a href="" class="me-4 text-reset fs-2">
          <i class="fab fa-linkedin"><ion-icon name="logo-linkedin"></ion-icon></i>
        </a>
        <a href="" class="me-4 text-reset fs-2">
          <i class="fab fa-github"><ion-icon name="logo-github"></ion-icon></i>
        </a>
      </div>
      
      
    </section>
     <section class="main-section">
      <div class="container mt-3 bg-light text-dark">
        
        <div class="row">
          
          <div class="col-md-3">
            
           <img src="img/footer-shape-1.png" alt="" style="width:400px">
          </div>
          
          <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
            
            <h6 class="text-uppercase fw-bold mb-4 mt-4">
              Products
            </h6>
            <p>
              <a href="#!" class="text-reset">Angular</a>
            </p>
            <p>
              <a href="#!" class="text-reset">React</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Vue</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Laravel</a>
            </p>
          </div>
          
          <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4 mt-4">
            
            <h6 class="text-uppercase fw-bold mb-4">
              Useful links
            </h6>
            <p>
              <a href="#!" class="text-reset">Pricing</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Settings</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Orders</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Help</a>
            </p>
          </div>
          
          <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4 mt-4">
           
            <h6 class="text-uppercase fw-bold mb-4 me-3">Contact</h6>
            <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
            <p>
              <i class="fas fa-envelope me-3"></i>
              info@example.com
            </p>
            <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
            <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
          </div>
          
        </div>
        </div>
    </section>
   <div class="main-footer1">
    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
      © 2021 Copyright:
      <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
    </div>
   
  </div>
</div>
</footer>
  
</div>
</body>
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>