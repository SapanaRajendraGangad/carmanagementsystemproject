package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.CarGarage.Model.PartModel;
import org.CarGarage.Service.*;


@WebServlet("/PartC")
public class PartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		int price=Integer.parseInt(request.getParameter("price"));
		PartService es=new PartServiceImpl();
		PartModel pmodel=new PartModel();
		if (name != null && !name.isEmpty()) {
		pmodel.setPname(name);
		pmodel.setPrice(price);
		
		boolean b=es.isAddNewParts(pmodel);
		if(b && pmodel!=null ) {
			RequestDispatcher rd=request.getRequestDispatcher("Part.jsp");
			rd.include(request, response);
			
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("AddParts.jsp");
			rd.include(request, response);
			out.println("<h1>Part not added.......</h1>");
		}
		}
		else {
			
			RequestDispatcher rd=request.getRequestDispatcher("AddParts.jsp");
			rd.include(request, response);
			out.println("<h4 style='color:white;'>All Fields Required</h4>");
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
