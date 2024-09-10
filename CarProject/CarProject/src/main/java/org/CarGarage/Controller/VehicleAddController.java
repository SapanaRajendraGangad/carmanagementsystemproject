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
import org.CarGarage.Model.VehicleModel;
import org.CarGarage.Service.*;

@WebServlet("/Vehicle")
public class VehicleAddController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		VehicleServiceImpl vs=new VehicleServiceImpl();
		
		String name=request.getParameter("name");
		String model=request.getParameter("model");
		String noplate=request.getParameter("noplate");
		String contact=request.getParameter("contact");
		
		VehicleModel vmodel=new VehicleModel();
		if (name != null && !name.isEmpty() &&
	            model != null && !model.isEmpty() &&
	            noplate != null && !noplate.isEmpty()&& contact!=null && !contact.isEmpty()) {
		vmodel.setVname(name);
		vmodel.setModel(model);
		vmodel.setNoplate(noplate);
		int cid=vs.isCustomeConatct(contact);
        if(cid==-1)
        {RequestDispatcher rd=request.getRequestDispatcher("AddVehicle.jsp");
		rd.include(request, response);
        	out.println("<br>Plz Valid Customer email id");
        }
        else
        {
        boolean b=vs.isAddVehicle(vmodel, contact);
		if(b) {
			RequestDispatcher rd=request.getRequestDispatcher("Vehicle.jsp");
			rd.include(request, response);
		}
        
		else {
			RequestDispatcher rd=request.getRequestDispatcher("AddVehicle.jsp");
			rd.include(request, response);
			out.println("<br><h1>Vehicle not added.......</h1>");
		}
        }
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("AddVehicle.jsp");
			rd.include(request, response);
			out.println("<br><h4 style='color:white;'>All Fields Required</h4>");
		}
		
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
