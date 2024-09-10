package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.CarGarage.Model.EmployeeModel;
import org.CarGarage.Service.*;

/**
 * Servlet implementation class MechanicController
 */
@WebServlet("/MechanicController")
public class MechanicController extends HttpServlet {
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String specialization=request.getParameter("specialization");
		String experience=request.getParameter("exp");
		EmployeeService es=new EmployeeServiceImpl();
		EmployeeModel emodel=new EmployeeModel();
		if (name != null && !name.isEmpty() &&
				specialization != null && !specialization.isEmpty() &&
			    experience != null && !experience.isEmpty()) {
		emodel.setName(name);
		emodel.setSpecialization(specialization);
		emodel.setExperience(experience);
		
		boolean b=es.isAddEmployee(emodel);
		if(b && emodel!=null ) {
			RequestDispatcher rd=request.getRequestDispatcher("Mechanic.jsp");
			rd.include(request, response);
			
		}
		
		
		else {
			RequestDispatcher rd=request.getRequestDispatcher("AddNewEmployee.jsp");
			rd.include(request, response);
			out.println("<h1>Employee not added.......</h1>");
		}
		}
        else {
			
			RequestDispatcher rd=request.getRequestDispatcher("AddNewEmployee.jsp");
			rd.include(request, response);
			out.println("<h4 style='color:white;'>All Fields Required</h4>");
		}
		

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
