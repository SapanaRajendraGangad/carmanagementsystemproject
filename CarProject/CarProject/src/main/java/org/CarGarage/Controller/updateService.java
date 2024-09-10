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
import org.CarGarage.Model.ServiceModel;
import org.CarGarage.Service.*;
import org.CarGarage.Service.*;

/**
 * Servlet implementation class updateService
 */
@WebServlet("/updateService")
public class updateService extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int sid=Integer.parseInt(request.getParameter("sid"));
		String date=request.getParameter("date");
		int charges=Integer.parseInt(request.getParameter("charges"));
		String distance=request.getParameter("distance");
		ServiceService cs=new ServiceServiceImpl();
		ServiceModel smodel=new ServiceModel();
		smodel.setId(sid);
		smodel.setDate(date);
		smodel.setCharges(charges);
		smodel.setDistance(distance);
		boolean b=cs.isUpdateService(smodel);
		
		
		if(b) {
		RequestDispatcher rd=request.getRequestDispatcher("Service.jsp");
			rd.forward(request, response);
			out.println("Update Success");
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("UpdateServiceController.java");
			rd.forward(request, response);
			out.println("<h1>Not Update</h1>");
		}
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
