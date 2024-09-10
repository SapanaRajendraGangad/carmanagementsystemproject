package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateP")
public class UpdatePartController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int pid=Integer.parseInt(request.getParameter("pid"));
		String name=request.getParameter("name");
		int price=Integer.parseInt(request.getParameter("price"));
		RequestDispatcher r=request.getRequestDispatcher("MainDashBoard.jsp");
		r.include(request, response);
		out.println("<link href='CSS/AddCustomer1.css' rel='stylesheet'/>");
		out.println("<form class='Form' action='finalPartU' method='post'>");
	    out.println("<div class='col-md-9'>");
	    out.println("<h3>Update Parts Of Vehicle</h3><br>");
    	out.println("<input type='submit' name='s' value='Save' class='submit'/>");
    	out.println("<a href='Part.jsp'><input type='button'  value='back' class='submit'/></a><br><br>");
	    
	    out.println("<label for='Name' style='margin-right:20px;'>Part Name</label>");
	    out.println("<input type='hidden' name='pid' value='"+pid+"'/>");
	    out.println("<input type='text' name='name' value="+name+" style='margin-right:20px;'/>");
	    out.println("<label for='Price' style='margin-right:20px;'>Price</label>");
	    out.println("<input type='text' name='price' value="+price+" style='margin-right:20px;'/>");
	    
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
