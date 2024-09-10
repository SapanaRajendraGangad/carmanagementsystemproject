package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.CarGarage.Service.*;
import org.CarGarage.Service.*;

/*@WebServlet("/deletes")
public class deleteServiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("sid"));
		ServiceService cs=new ServiceServiceImpl();
		boolean b=cs.;
		if(b) {
			RequestDispatcher r=request.getRequestDispatcher("ViewService.jsp");
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

}*/
