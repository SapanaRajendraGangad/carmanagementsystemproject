package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateEmployee")
public class UpdateEmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int mid=Integer.parseInt(request.getParameter("mid"));
		String name=request.getParameter("name");
		String spec=request.getParameter("specialization");
		String exp=request.getParameter("exp");
		RequestDispatcher r=request.getRequestDispatcher("MainDashBoard.jsp");
		r.include(request, response);
		out.println("<link href='CSS/AddCustomer1.css' rel='stylesheet'/>");
		out.println("<form class='Form' action='FinalMechanicUpdate' method='POST'>");
	    out.println("<div class='col-md-9 login'>");
	    out.println("<h3>Update Employee Details</h3><br>");
	    out.println("<input type='submit' name='s' value='Submit' class='submit'/>");
	    out.println("<a href='Mechanic.jsp'><input type='button' value='back' class='submit'/></a><br><br>");
	    
	    out.println("<label for='Name'>Employee Name</label>");
	    out.println("<input type='hidden' name='mid' value='"+mid+"'/>");
	    out.println("<input type='text' name='name' value='"+name+"' placeholder='ram'/>");
	    out.println("<label for='Email'>Specialization</label>");
	    out.println("<input type='text' name='specialization' value='"+spec+"' placeholder='oil change'/>");
	    out.println("<label for='contact'>Experience</label>");
	    out.println("<input type='text' name='exp' value='"+exp+"' placeholder='3yrs'/>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
