package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.CarGarage.Model.CustomerModel;
import org.CarGarage.Service.*;



@WebServlet("/upDate")
public class FinalCustomerUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int cid=Integer.parseInt(request.getParameter("cid"));
		String cname=request.getParameter("name");
		String email=request.getParameter("email");
		String contact=request.getParameter("contact");
		String address=request.getParameter("address");
		String status =request.getParameter("status");
		CustomerService cs=new CustomerServiceImpl();
		CustomerModel cmodel=new CustomerModel();
		cmodel.setId(cid);
		cmodel.setName(cname);
		cmodel.setEmail(email);
		cmodel.setContact(contact);
		cmodel.setAddress(address);
		cmodel.setStatus(status);
		boolean b=cs.isUpdateCustomer(cmodel);
		if(b) {
			RequestDispatcher rd=request.getRequestDispatcher("ViewCustomer.jsp");
			rd.forward(request, response);
			
			out.println("<h1>Update Success</h1>");
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("CustomerUpdateController.java");
			rd.forward(request, response);
			out.println("<h1>Not Update</h1>");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
