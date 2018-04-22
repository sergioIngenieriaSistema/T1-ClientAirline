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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Company;
import org.json.JSONArray;
import org.json.JSONObject;
import rest.CompanyFacadeREST;

/**
 *
 * @author sldia
 */
@WebServlet(name = "ModelServlet", urlPatterns = {"/ModelServlet"})
public class ModelServlet extends HttpServlet {

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
        CompanyFacadeREST cfrest = new CompanyFacadeREST();
        Gson gson = new Gson();
        String companyJSON = cfrest.findAll_JSON(String.class);
        JSONArray jsona = new JSONArray(companyJSON);
        JSONObject jSONObject;
        List<Company> companies = new ArrayList();
        for (int i = 0; i < jsona.length(); i++) {
            jSONObject = (JSONObject) jsona.get(i);
            companies.add(gson.fromJson(jSONObject.toString(), Company.class));
        }
        System.out.println("Size if companies is: " + companies.size());
        
        String company = cfrest.find_JSON(String.class, "1");
        JSONObject jsono = new JSONObject(company);
        System.out.println("JSON object:" + jsono);
        
        Company c = gson.fromJson(jsono.toString(), Company.class);
        System.out.println("Company id:" + c.getId());
        System.out.println("Company name:" + c.getName());
        System.out.println("Company email:" + c.getEmail());
        System.out.println("Company phone:" + c.getPhone());
        System.out.println("Company code:" + c.getCode());
        
        request.setAttribute("companies", companies);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
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
