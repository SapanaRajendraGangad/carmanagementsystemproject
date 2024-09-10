package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.CarGarage.Model.*;
import org.CarGarage.Service.PartService;
import org.CarGarage.Service.PartServiceImpl;

@WebServlet("/finalPartU")
public class FinalUpdatePartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String pidParam = request.getParameter("pid");
	    if (pidParam == null || pidParam.isEmpty()) {
	        out.println("<h1>Error: Part ID is missing or empty!</h1>");
	        return; 
	    }
	    int pid1 = Integer.parseInt(pidParam);
		String name=request.getParameter("name");
		int price=Integer.parseInt(request.getParameter("price"));
		PartService vs=new PartServiceImpl();
		PartModel pmodel=new PartModel();
		pmodel.setPid(pid1);
		pmodel.setPname(name);
		pmodel.setPrice(price);
	
		out.println(pid1+"\t"+name+"\t"+price);
		boolean b=vs.isUpdatePart(pmodel);
		if(b) {
			RequestDispatcher rd=request.getRequestDispatcher("Part.jsp");
			rd.forward(request, response);
			out.println("<h1>Update Success</h1>");
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("UpdatePartController.java");
			rd.forward(request, response);
			out.println("<h1>Not Update</h1>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
