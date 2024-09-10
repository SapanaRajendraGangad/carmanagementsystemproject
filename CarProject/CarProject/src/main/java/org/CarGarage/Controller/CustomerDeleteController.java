package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.CarGarage.Model.CustomerModel;
import org.CarGarage.Service.*;


//@WebServlet("/del")
/*public class CustomerDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("cid"));
		CustomerService cs=new CustomerServiceImpl();
		List<CustomerModel> b=cs.getAllCustomerDetail(id);
		if(b != null) {
			RequestDispatcher r=request.getRequestDispatcher("ViewCustomer.jsp");
			r.forward(request, response);
		}
		else {
			out.println("<h1>Not Deleted</h1>");
		}
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
/
}*/
