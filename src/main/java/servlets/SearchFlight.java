/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Flight;
import org.json.JSONArray;
import org.json.JSONObject;
import rest.FlightFacadeREST;

/**
 *
 * @author sldia
 */
@WebServlet(name = "SearchFlight", urlPatterns = {"/SearchFlight"})
public class SearchFlight extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        Gson gson = new Gson();
        FlightFacadeREST flightFacadeREST = new FlightFacadeREST();
        String flights = flightFacadeREST.findAll_JSON(String.class);
        System.out.println("Flights: " + flights);
        List<Flight> allFlights = new ArrayList();
        List<Flight> queryResultFlight = new ArrayList();
        
        JSONArray jsona = new JSONArray(flights);
        JSONObject jsono;
        for (int i = 0; i < jsona.length(); i++) {
            jsono = (JSONObject) jsona.get(i);
            allFlights.add(gson.fromJson(jsono.toString(), Flight.class));
        }
        
        String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        String departureDate = request.getParameter("departure");
        String returnDate = request.getParameter("return");
        
        System.out.println("Origin: " + origin);
        System.out.println("Destination: " + destination);
        System.out.println("Departure: " + departureDate);
        System.out.println("ReturnDate: " + returnDate);
        
        /*Pattern pattern = Pattern.compile("\\d{4}-\\d{2}-\\d{2}");
        Matcher matcher = pattern.matcher(departureDate);
        matcher.find();
        System.out.println("Matcher full: " + matcher.group());*/
        
        for (Flight flight : allFlights) {
            if (flight.getRoute().getOrigin().getAirportName().equals(request.getParameter("origin")) && 
                    flight.getRoute().getDestination().getAirportName().equals(request.getParameter("destination")) &&
                    flight.getRoute().getDay().substring(0, 10).equals(request.getParameter("departure"))) {
                
                System.out.println("THERE ARE FLIGHTS!");
                queryResultFlight.add(flight);
            }
        }
        
        request.setAttribute("flights", queryResultFlight);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/flights.jsp");
        dispatcher.forward(request, response);
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
