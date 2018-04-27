/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.hotel.Booking;
import model.hotel.Room;
import org.hotels.BookingFacadeREST;
import org.hotels.RoomFacadeREST;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author sldia
 */
@WebServlet(name = "SearchRooms", urlPatterns = {"/SearchRooms"})
public class SearchRooms extends HttpServlet {

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

        String entryDate = request.getParameter("entryDate");
        String departureDate = request.getParameter("departureDate");

        RoomFacadeREST roomFacadeREST = new RoomFacadeREST();
        String jsonRooms = roomFacadeREST.findAll_JSON(String.class);
        JSONArray jsona = new JSONArray(jsonRooms);
        List<Room> rooms = new ArrayList();
        Room room;

        Gson gson = new Gson();
        JSONObject jsono;

        for (int i = 0; i < jsona.length(); i++) {
            jsono = (JSONObject) jsona.get(i);
            room = gson.fromJson(jsono.toString(), Room.class);
            if (room.getHotel().getId().equals(request.getParameter("hotelid"))) {
                rooms.add(room);
            }
        }

        BookingFacadeREST bookingFacadeREST = new BookingFacadeREST();
        String jsonbooking = bookingFacadeREST.findAll_JSON(String.class);
        JSONArray jsonArrayBooking = new JSONArray(jsonbooking);
        List<Room> notAvailableRooms = new ArrayList();
        Booking booking;
        DateFormat format = new SimpleDateFormat("yyyy-MM-DD");

        try {
            Date entryD = format.parse(entryDate);
            Date departureD = format.parse(departureDate);

            for (int i = 0; i < jsonArrayBooking.length(); i++) {
                jsono = (JSONObject) jsonArrayBooking.get(i);
                booking = gson.fromJson(jsono.toString(), Booking.class);
                if (entryD.after(format.parse(booking.getEntryDate()))
                        && entryD.before(format.parse(booking.getDepartureDate()))
                        || departureD.before(format.parse(booking.getDepartureDate()))
                        && departureD.after(format.parse(booking.getEntryDate()))) {
                    if (booking.getRoom().getHotel().getId().equals(request.getParameter("hotelid"))) {
                        notAvailableRooms.add(booking.getRoom());
                    }
                }
            }
        } catch (ParseException ex) {
            Logger.getLogger(SearchRooms.class.getName()).log(Level.SEVERE, null, ex);
        }

        rooms.removeAll(notAvailableRooms);
        
        request.setAttribute("rooms", rooms);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/rooms.jsp");
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
