/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Concesionario.Servlet;

import com.Concesionario.DAO.ClienteDAO;
import com.Concesionario.Entity.Cliente;
import com.Concesionario.JavaBeans.ClienteFacadeLocal;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
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
@WebServlet("/Cliente")
/* @WebServlet(name = "ClienteServlet", urlPatterns = {"/ClienteServlet"})  */
public class ClienteServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;
	ClienteDAO _clienteDAO;
 
	public void init() {
            String jdbcURL = "jdbc:mysql://localhost:3308/bdconcesionario?serverTimezone=UTC";
		String jdbcUsername = "carlos";
		String jdbcPassword = "carlos";
               

		try {
 
			_clienteDAO = new ClienteDAO(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
/*
    @EJB
    private ClienteFacadeLocal clienteFacade;  */

    public ClienteServlet() {
            super();
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
    
    /*
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ClienteServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClienteServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
*/
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        System.out.println("Hola Servlet..");
		String action = request.getParameter("action");
		System.out.println(action);
		try {
			switch (action) {
			case "index":
				index(request, response);
				break;
			case "nuevo":
				nuevo(request, response);
				break;
			case "register":
				System.out.println("entro");
				registrar(request, response);
				break;
			case "listarClientes":
				mostrar(request, response);
				break;
			case "showedit":
				showEditar(request, response);
				break;	
			case "editarVehiculo":
				editar(request, response);
				break;
			case "eliminar":
				eliminar(request, response);
				break;
			default:
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
        System.out.println("Hola Servlet..");
		/*doGet(request, response); */
                String action = request.getParameter("action");
		System.out.println(action);
		try {
			switch (action) {
			case "index":
				index(request, response);
				break;
			case "nuevo":
				nuevo(request, response);
				break;
			case "guardarCliente":
				registrar(request, response);
				break;
			case "listarClientes":
				mostrar(request, response);
				break;
			case "showedit":
				showEditar(request, response);
				break;	
			case "editarCliente":
				editar(request, response);
				break;
			case "eliminar":
				eliminar(request, response);
				break;
                        case "cancelarNuevo":
                                cancelar(request, response);
                        default:
				break;
			}			
		} catch (SQLException e) {
			e.getStackTrace();
		}
    }
    private void index (HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
		//mostrar(request, response);
		RequestDispatcher dispatcher= request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
 
	private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		Cliente articulo = new Cliente(0, request.getParameter("nombre"), request.getParameter("cedula"), request.getParameter("ciudad"), request.getParameter("direccion") );
		_clienteDAO.insertar(articulo);
		
                mostrar(request, response);
                /*  
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);*/
	}
	
	private void nuevo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/nuevoCliente.jsp");
		dispatcher.forward(request, response);
	}
	
	
	private void mostrar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException , ServletException{
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/mostrarClientes.jsp");
		List<Cliente> listaCliente= _clienteDAO.listarClientes();
		request.setAttribute("lista", listaCliente);
                System.out.println("Mostrar2");
		dispatcher.forward(request, response);
	}	
	
	private void showEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
            int id = Integer.parseInt(request.getParameter("id"));
            Cliente articulo = _clienteDAO.obtenerPorId(Integer.parseInt(request.getParameter("id")));
		List<Cliente> listaCliente = new ArrayList<Cliente>();
                listaCliente.add(articulo);
                request.setAttribute("articulo", listaCliente);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/showEditarCliente.jsp");
		dispatcher.forward(request, response);
	}
	
	private void editar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
		Cliente articulo = new Cliente(Integer.parseInt(request.getParameter("ID")), request.getParameter("nombre"), request.getParameter("cedula"), request.getParameter("ciudad"), request.getParameter("direccion"));
		_clienteDAO.actualizar(articulo);
                 mostrar(request, response);
	/*	index(request, response); */
	}
	
	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
            Cliente articulo = _clienteDAO.obtenerPorId(Integer.parseInt(request.getParameter("id")));
		_clienteDAO.eliminar(articulo);
                mostrar(request, response);
	/*	RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);  */
		
	}
        
        private void cancelar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        /*
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/mostrarVehiculos.jsp");
		dispatcher.forward(request, response);   */
            mostrar(request,response);
        }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
        /*
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>*/

}
