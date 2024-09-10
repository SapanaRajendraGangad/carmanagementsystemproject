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
import org.CarGarage.Model.*;
import org.CarGarage.Service.CustomerService;
import org.CarGarage.Service.CustomerServiceImpl;
import org.CarGarage.Service.*;



@WebServlet("/FinalMechanicUpdate")
public class FinalMechanicUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String midParam = request.getParameter("mid");

	  
	    if (midParam == null || midParam.isEmpty()) {
	        out.println("<h1>Error: Mechanic ID is missing or empty!</h1>");
	        return; 
	    }
 
	    int mid1 = Integer.parseInt(midParam);
		String name=request.getParameter("name");
		String specialization=request.getParameter("specialization");
		String exp=request.getParameter("exp");
		EmployeeService es=new EmployeeServiceImpl();
		EmployeeModel emodel=new EmployeeModel();
		emodel.setMid(mid1);
		emodel.setName(name);
		emodel.setSpecialization(specialization);
		emodel.setExperience(exp);
		out.println(mid1+"\t"+name+"\t"+specialization+"\t"+exp);
		boolean b=es.isUpdateEmployee(emodel);
		if(b) {
			RequestDispatcher rd=request.getRequestDispatcher("Mechanic.jsp");
			rd.forward(request, response);
			out.println("<h1>Update Success</h1>");
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("UpdateEmployeeController.java");
			rd.forward(request, response);
			out.println("<h1>Not Update</h1>");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
