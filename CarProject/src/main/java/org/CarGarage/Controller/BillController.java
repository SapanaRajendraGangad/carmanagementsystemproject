package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.CarGarage.Model.BillModel;
import org.CarGarage.Service.*;

@WebServlet("/addbill")
public class BillController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		BillService bs=new BillServiceImpl();
		int amount=Integer.parseInt(request.getParameter("vid"));
		System.out.println(amount);
		String date=request.getParameter("date");
		
		int amount1=bs.isgetChargePrice(amount);
		
		 try {
		        int vid = Integer.parseInt(request.getParameter("vid"));
		        int vid1=bs.isSetVehicle(vid);
		       
		        if (vid1>0) {
		            out.println("Vehicle with ID " + vid + " already exists. Cannot add duplicate entry.");
		            return; // Exit the method
		        }
		BillModel bm=new BillModel();
		bm.setBdate(date);
				boolean b=bs.isAddBill(bm, vid, vid1);
				if(b){
					RequestDispatcher rd=request.getRequestDispatcher("ViewBill.jsp");
					rd.include(request, response);
					out.println("Bill added successfully..................");
				}
				else {
					RequestDispatcher rd=request.getRequestDispatcher("Bill.jsp");
					rd.include(request, response);
					out.println("Bill not added..................");
				
				}
	}
	
    catch(Exception ex) {
	out.println("Duplicate entry '20' for key 'bill.sid'"+ex);
	
	}
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
