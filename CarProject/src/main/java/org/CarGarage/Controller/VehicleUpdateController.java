package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateV")
public class VehicleUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int vid1=Integer.parseInt(request.getParameter("vid"));
		String vname=request.getParameter("name");
		String model=request.getParameter("model");
		String noplate=request.getParameter("noplate");
		RequestDispatcher r=request.getRequestDispatcher("MainDashBoard.jsp");
		r.include(request, response);
		out.println("<link href='CSS/ViewData.css' rel='stylesheet'/>");
		out.println("<form name='frm' class='Form' action='updateFinal' method='POST'>");
		
	    out.println("<div class='col-md-9 login'>");
	    out.println("<h3>Update Vehicle Details</h3>");
	    out.println("<input type='submit' name='s' style='margin-right:20px';value='Save' class='submit'/>");
	   
	    out.println("<a href='Vehicle.jsp'><input type='button' value='back' class='submit'/></a><br><br>");
	    
	    out.println("<label for='vname'style='margin-right:20px'>Vehicle Name</label>");
	    out.println("<input type='hidden' name='vid'style='margin-right:20px' value='"+vid1+"'>");
	    out.println("<input type='text' name='vname'style='margin-right:20px' value="+vname+">");
	    out.println("<label for='model'style='margin-right:20px'>Model</label>");
	    out.println("<input type='text' name='model' style='margin-right:20px' value="+model+">");
	    out.println("<label for='noplate' style='margin-right:20px'>noplate</label>");
	    out.println("<input type='text' name='noplate' style='margin-right:20px' value="+noplate+"><br><br>");
	    
	    out.println("</form></div></div></div>");
	   
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
