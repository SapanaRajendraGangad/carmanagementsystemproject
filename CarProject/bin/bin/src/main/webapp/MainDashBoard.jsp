<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sidebar Menu for Admin Dashboard | CodingNepal</title>
    <link rel="stylesheet" href="style.css"/>
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
  </head>
  
  <style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
.sidebar {
  position: fixed;
  height: 100%;
  width: 260px;
  background: #11101d;
  padding: 15px;
  z-index: 99;
}
.logo {
  font-size: 25px;
  padding: 0 15px;
}
.sidebar a {
  color: #fff;
  text-decoration: none;
}
.menu-content {
  position: relative;
  height: 100%;
  width: 100%;
  margin-top: 40px;
  overflow-y: scroll;
}
.menu-content::-webkit-scrollbar {
  display: none;
}
.menu-items {
  height: 100%;
  width: 100%;
  list-style: none;
  transition: all 0.4s ease;
}
.submenu-active .menu-items {
  transform: translateX(-56%);
}
.menu-title {
  color: #fff;
  font-size: 14px;
  padding: 15px 20px;
}
.item a,
.submenu-item {
  padding: 16px;
  display: inline-block;
  width: 100%;
  border-radius: 12px;
}
.item i {
  font-size: 12px;
}
.item a:hover,
.submenu-item:hover,
.submenu .menu-title:hover {
  background-color:#1E90FF;
}
.submenu-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: #fff;
  cursor: pointer;
}
.submenu {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0;
  right: calc(-100% - 26px);
  height: calc(100% + 100vh);
  background: #11101d;
  display: none;
}
.show-submenu ~ .submenu {
  display: block;
}
.submenu .menu-title {
  border-radius: 12px;
  cursor: pointer;
}
.submenu .menu-title i {
  margin-right: 10px;
}
.navbar,
.main {
  left: 260px;
  width: calc(100% - 260px);
  transition: all 0.5s ease;
  z-index: 1000;
}
.sidebar.close ~ .navbar,
.sidebar.close ~ .main {
  left: 0;
  width: 100%;
}
.navbar {
  position: fixed;
  color: #fff;
  padding: 15px 20px;
  font-size: 25px;
  background: #4070f4;
  cursor: pointer;
}
.navbar #sidebar-close {
  cursor: pointer;
}
.main {
  position: relative;
  display: flex;
  height: 100vh;
  z-index: 100;
  padding-top:70px;
  background: #e7f2fd;
  padding-left:100px;
}


  </style>
  
  <body>
  
  
    <nav class="sidebar">
      <a href="#" class="logo">Garage</a>

      <div class="menu-content">
        <ul class="menu-items">
          <div class="menu-title">DashBoard</div>

          <li class="item">
            <a href="Dashboard.jsp">Home</a>
          </li>
          <li class="item">
            <a href="AdminUser.jsp">Login Panel</a>
          </li>

          <li class="item">
          
              <a href="ViewCustomer.jsp"> Customer</a>
          
          </li>
          <li class="item">

              <a href="Vehicle.jsp">Vehicle</a>
           
          </li>
          <li class="item">

              <a href="Part.jsp">Parts</a>
           
          </li>
          <li class="item">

              <a href="Mechanic.jsp">Mechanic</a>
           
          </li>
          <li class="item">

              <a href="Service.jsp">Service</a>
           
          </li>
          <li class="item">

              <a href="ViewBill.jsp">Bill</a>
           
          </li>
            </div>

            <ul class="menu-items submenu">
              <div class="menu-title">
                <i class="fa-solid fa-chevron-left"></i>
                Vehicle SubMenu
              </div>
              <li class="item">
                <a href="AddVehicle.jsp">Add Vehicle</a>
              </li>
              <li class="item">
                <a href="ViewVehicle.jsp">View Vehicle</a>
              </li>
            </ul>
            
          </li>
          <li class="item">
            <div class="submenu-item">
              <span>Parts</span>
              <i class="fa-solid fa-chevron-right"></i>
            </div>

            <ul class="menu-items submenu">
              <div class="menu-title">
                <i class="fa-solid fa-chevron-left"></i>
                Parts SubMenu
              </div>
              <li class="item">
                <a href="AddParts.jsp">Add Parts</a>
              </li>
              <li class="item">
                <a href="ViewPart.jsp">View Parts</a>
              </li>
            </ul>
            
          </li>
          <li class="item">
            <div class="submenu-item">
              <span>Mechanic</span>
              <i class="fa-solid fa-chevron-right"></i>
            </div>

            <ul class="menu-items submenu">
              <div class="menu-title">
                <i class="fa-solid fa-chevron-left"></i>
                Mechanic SubMenu
              </div>
              <li class="item">
                <a href="AddNewEmployee.jsp">Add Mechanic</a>
              </li>
              <li class="item">
                <a href="ViewEmployee.jsp">View Mechanic</a>
              </li>
            </ul>
          </li>
          <li class="item">
            <div class="submenu-item">
              <span>Service</span>
              <i class="fa-solid fa-chevron-right"></i>
            </div>

            <ul class="menu-items submenu">
              <div class="menu-title">
                <i class="fa-solid fa-chevron-left"></i>
                Service SubMenu
              </div>
              <li class="item">
                <a href="AddService.jsp">Add Service</a>
              </li>
              <li class="item">
                <a href="ViewService.jsp">View Service</a>
              </li>
            </ul>
            
          </li>
          <li class="item">
            <div class="submenu-item">
              <span>Generate Bill</span>
              <i class="fa-solid fa-chevron-right"></i>
            </div>

            <ul class="menu-items submenu">
              <div class="menu-title">
                <i class="fa-solid fa-chevron-left"></i>
                Bill SubMenu
              </div>
              <li class="item">
                <a href="Bill.jsp">Generate Bill</a>
              </li>
              <li class="item">
                <a href="ViewBill.jsp">View Bill</a>
              </li>
            </ul>
            
          </li>
          
         
        </ul>
      </div>
    </nav>
<nav class="navbar">
      <i class="fa-solid fa-bars" id="sidebar-close"></i>
    </nav>
    
    <main class="main">
      
  <script type="text/javascript" src="menu.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    
  </body>
</html>