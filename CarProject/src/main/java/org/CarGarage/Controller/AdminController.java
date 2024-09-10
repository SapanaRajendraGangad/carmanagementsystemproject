package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.CarGarage.Model.AdminModel;
import org.CarGarage.Service.*;

@WebServlet("/login")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		AdminModel model=new AdminModel();
		model.setUserName(user);
		model.setContact(pass);
		AdminService as=new AdminServiceImpl();
		boolean b=as.isUserPass(model);
		if(b) {
			RequestDispatcher rd=request.getRequestDispatcher("MainDashBoard.jsp");
		    rd.forward(request, response);
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("AdminLogin.jsp");
			rd.include(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
