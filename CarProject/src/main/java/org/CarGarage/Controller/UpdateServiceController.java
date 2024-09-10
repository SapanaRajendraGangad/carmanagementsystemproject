package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateS")
public class UpdateServiceController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int sid=Integer.parseInt(request.getParameter("id"));
		String sdate=request.getParameter("date");
		int charges=Integer.parseInt(request.getParameter("charges"));
		String distance=request.getParameter("distance");
		RequestDispatcher r=request.getRequestDispatcher("MainDashBoard.jsp");
		r.include(request, response);
		out.println("<link href='CSS/AddCustomer.css' rel='stylesheet'/>");
		out.println("<form class='Form' action='updateService' method=''>");
		out.println("<center><br><br><h2>Update Service here</h2><br><br></center>");
		 out.println("<input type='submit' name='s' value='Submit' class='submit' style='margin-right:10px;'/>");
		 out.println("<a href='Service.jsp'><input type='button'  value='back' class='submit'/></a><br><br><br>");
		    
		 out.println("<label for=''>Date</label>");
		out.println("<input type='hidden' name='sid' style='margin-right:40px;' value='"+sid+"'>");
		out.println("<input type='text' name='date' class='input' style='margin-right:40px;'  value="+sdate+">");
		out.println("<label for=''>Charges</label>");
		out.println("<input type='text' name='charges'class='input' style='margin-right:60px;' value="+charges+">");
		out.println("<label for='noplate'>distance</label>");
		out.println("<input type='text' name='distance'class='input' style='margin-right:40px;' value="+distance+">");
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
	}

}
