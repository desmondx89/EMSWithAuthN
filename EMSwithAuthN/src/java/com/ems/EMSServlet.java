/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ems;

import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Desmond
 */
public class EMSServlet extends HttpServlet {

    @Inject
    EMSFunction emsf;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            if (action.equalsIgnoreCase("Login")) {
                String userid = request.getParameter("username");
                String pw = request.getParameter("pwd");
                if (emsf.loginCheck(userid)) {
                    request.setAttribute("status", userid);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    String username = emsf.login(userid.trim(), pw.trim());
                    if (username.equals("Invalid")) {
                        request.setAttribute("Error!", "Invalid!");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    } else {
                        emsf.setLoginStatus(userid);
                        session.setAttribute("user", username);
                        request.getRequestDispatcher("home.jsp").forward(request, response);
                    }
                }

            } else if (action.equalsIgnoreCase("Logout")) {
                String username = session.getAttribute("user").toString();
                emsf.setLogoutStatus(username);
                session.invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            System.out.println("Exception from Servlet : " + ex.getMessage());
            ex.printStackTrace();
        }
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
