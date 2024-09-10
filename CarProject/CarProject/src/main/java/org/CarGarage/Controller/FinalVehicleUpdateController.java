package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.CarGarage.Model.VehicleModel;
import org.CarGarage.Service.*;
@WebServlet("/updateFinal")
public class FinalVehicleUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String vidParam = request.getParameter("vid");
        if (vidParam == null || vidParam.isEmpty()) {
	        out.println("<h1>Error: Vehicle ID is missing or empty!</h1>");
	        return; 
	    }
 
	    int vid1 = Integer.parseInt(vidParam);
		String vname=request.getParameter("vname");
		String model=request.getParameter("model");
		String noplate=request.getParameter("noplate");
		VehicleService vs=new VehicleServiceImpl();
		VehicleModel vmodel=new VehicleModel();
		vmodel.setVid(vid1);
		vmodel.setVname(vname);
		vmodel.setModel(model);
		vmodel.setNoplate(noplate);
		out.println(vid1+"\t"+vname+"\t"+model+"\t"+noplate);
		boolean b=vs.isUpdateVehicle(vmodel);
		if(b) {
			RequestDispatcher rd=request.getRequestDispatcher("Vehicle.jsp");
			rd.forward(request, response);
			out.println("<h1>Update Success</h1>");
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("VehicleUpdateController.java");
			rd.forward(request, response);
			out.println("<h1>Not Update</h1>");
		}
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
