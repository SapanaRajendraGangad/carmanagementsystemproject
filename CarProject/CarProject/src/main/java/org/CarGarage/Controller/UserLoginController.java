package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.CarGarage.Model.AdminModel;
import org.CarGarage.Model.CustomerModel;
import org.CarGarage.Service.AdminService;
import org.CarGarage.Service.AdminServiceImpl;
import org.CarGarage.Service.*;

@WebServlet("/userlogin")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String contact=request.getParameter("contact");
		CustomerModel model=new CustomerModel();
		model.setEmail(email);
		model.setContact(contact);
		CustomerService cs=new CustomerServiceImpl();
		int result=cs.isUserLogin(email, contact);
		if(result!=0) {
			HttpSession session=request.getSession(true);
			session.setAttribute("CId", result);
			RequestDispatcher rd=request.getRequestDispatcher("ViewLoginCustomer.jsp");
		    rd.include(request, response);
			
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("UserLogin.jsp");
			rd.include(request, response);
		}
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
