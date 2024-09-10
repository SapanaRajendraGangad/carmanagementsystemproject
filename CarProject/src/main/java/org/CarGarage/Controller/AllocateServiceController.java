package org.CarGarage.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.CarGarage.Model.ServiceModel;
import org.CarGarage.Service.ServiceService;
import org.CarGarage.Service.ServiceServiceImpl;

@WebServlet("/AllocateServiceController")
public class AllocateServiceController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        ServiceService serviceService = new ServiceServiceImpl();

        String date = request.getParameter("date");
        int charges = Integer.parseInt(request.getParameter("charges"));
        String distance = request.getParameter("distance");
        String noplate = request.getParameter("noplate");
        String[] partNames = request.getParameterValues("partNames");
        String[] mechanicNames = request.getParameterValues("mechanicNames");

        ServiceModel smodel = new ServiceModel();
        smodel.setDistance(distance);
        smodel.setCharges(charges);
        smodel.setDate(date);

        List<String> parts = new ArrayList<>();
        List<String> mechanics = new ArrayList<>();

        if (partNames != null) {
            for (String part : partNames) {
                parts.add(part);
            }
        }

        if (mechanicNames != null) {
            for (String mechanic : mechanicNames) {
                mechanics.add(mechanic);
            }
        }

        boolean isServiceAdded = serviceService.isAddService(smodel, noplate, parts, mechanics);

        if (isServiceAdded) {
            out.println("Service added successfully.");
            RequestDispatcher rd = request.getRequestDispatcher("Service.jsp");
            rd.include(request, response);
        } else {
            out.println("Failed to add service.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
