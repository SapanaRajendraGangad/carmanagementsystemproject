package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/update")
public class CustomerUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int cid=Integer.parseInt(request.getParameter("cid"));
		String cname=request.getParameter("cname");
		String email=request.getParameter("cemail");
		String contact=request.getParameter("ccontact");
		String address=request.getParameter("caddress");
		String status =request.getParameter("status");
		RequestDispatcher r=request.getRequestDispatcher("MainDashBoard.jsp");
		r.include(request, response);
		out.println("<link href='CSS/AddCustomer.css' rel='stylesheet'/>");
		out.println("<form class='Form' action='upDate' method='POST'>");
	    out.println("<div class='col-md-9 login'>");
	    out.println("<h3>Customer Details</h3>");
	    out.println("<input type='submit' name='s' value='Save' class='submit'/>");
	    out.println("<a href='ViewCustomer.jsp'><input type='button' value='back' class='submit'/></a><br><br>");
	    out.println("<label for='Name'>Customer Name</label>");
	    out.println("<input type='hidden' name='cid' value='"+cid+"'/>");
	    out.println("<input type='text' name='name'value="+cname+">");
	    out.println("<label for='Email'>Customer Email</label>");
	    out.println("<input type='text' name='email' value="+email+">");
	    out.println("<label for='contact'>Customer Contact</label>");
	    out.println("<input type='text' name='contact' value="+contact+"><br><br>");
	    out.println("<label for='address'>Customer Address</label>");
	    out.println("<input type='text' name='address' value="+address+">");
	    out.println("<label for='status'>Status</label>");
	    out.println("<select placeholder='Active/Inactive' style='background-color:white;' name='status'  id='s' onchange='fetchStatusData();showCustomerTable()'>");
	    out.println("<option>Active</option>");
	    out.println("<option>Inactive</option>");
	    out.println("</select>");
	  //  out.println("<input type='button' action=''value='Search' class='submit'/><br><br>");
	   // out.println("<a href='AddNewCustomer.jsp'><input type='button' value='New' class='submit'/></a>");
	    //out.println("<a href=''><input type='button' value='Open' class='submit'/></a>");
	    
	    out.println("</div></div></div>");
	   // response.sendRedirect("ViewCustomer.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
