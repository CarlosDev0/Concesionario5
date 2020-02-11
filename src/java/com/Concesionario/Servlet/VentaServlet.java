/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Concesionario.Servlet;

import com.Concesionario.DAO.VentaDAO;
import com.Concesionario.Entity.Venta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
@WebServlet("/Venta")
public class VentaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    VentaDAO ventaDAO;
    public void init() {
            String jdbcURL = "jdbc:mysql://localhost:3308/bdconcesionario?serverTimezone=UTC";
		String jdbcUsername = "carlos";
		String jdbcPassword = "carlos";
               

		try {
 
			ventaDAO = new VentaDAO(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
 
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public VentaServlet(){
        super();
    }
    


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String action = request.getParameter("action");
		System.out.println(action);
            try{
            
                switch (action)
                {
                    case "listarVentas":
                        mostrar(request,response);
                        break;
                }
            } catch (SQLException e) {
			e.getStackTrace();
		}
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
          String action = request.getParameter("action");
		System.out.println(action);
            try{    
                switch (action)
                {
                    case "listarVentas":
                        mostrar(request,response);
                        break;
                }
            } catch (SQLException e) {
			e.getStackTrace();
		}
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
    private void mostrar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException , ServletException{
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/mostrarVentas.jsp");
		List<Venta> listaVentas= ventaDAO.listarVentas();
		request.setAttribute("lista", listaVentas);
                System.out.println("Mostrar2");
		dispatcher.forward(request, response);
	}

}
