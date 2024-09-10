package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import org.CarGarage.Service.*;
import org.CarGarage.Model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cadd")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String contact=request.getParameter("contact");
		String Address=request.getParameter("address");
		String status=request.getParameter("status");
		CustomerService cr=new CustomerServiceImpl();
		CustomerModel cmodel=new CustomerModel();
		if (name != null && !name.isEmpty() &&
	            email != null && !email.isEmpty() &&
	            contact != null && !contact.isEmpty() &&
	            Address != null && !Address.isEmpty()) {
		cmodel.setName(name);
		cmodel.setEmail(email);
		cmodel.setContact(contact);
		cmodel.setAddress(Address);
		cmodel.setStatus(status);
		boolean b=cr.isAddNewCustomer(cmodel);
		if(b && cmodel!=null ) {
			
			RequestDispatcher rd=request.getRequestDispatcher("ViewCustomer.jsp");
			rd.include(request, response);
			
		}
		
		
		else {
			RequestDispatcher rd=request.getRequestDispatcher("ViewCustomer.jsp");
			rd.include(request, response);
			
		}
		}
		else {
			
			RequestDispatcher rd=request.getRequestDispatcher("ViewCustomer.jsp");
		
			rd.include(request, response);
			
		
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
