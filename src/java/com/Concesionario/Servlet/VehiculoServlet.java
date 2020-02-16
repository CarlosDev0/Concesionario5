/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Concesionario.Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.Concesionario.DAO.VehiculoDAO;
import com.Concesionario.Entity.Vehiculo;
import com.Concesionario.JavaBeans.VehiculoFacadeLocal;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import javax.activation.DataSource;
import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.InitialContext;

/**
 *
 * @author USER
 */
@WebServlet("/Vehiculo")
public class VehiculoServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	VehiculoDAO articuloDAO;
 
	public void init() {
          /*  String jdbcURL = "jdbc:mysql://localhost:3308/bdconcesionario?serverTimezone=UTC";
		String jdbcUsername = "carlos";
		String jdbcPassword = "carlos";
               
            */
		try {
 
			articuloDAO = new VehiculoDAO();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
 @EJB
    private VehiculoFacadeLocal vehiculoFacade;  
 
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VehiculoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
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
			case "listarVehiculos":
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
                                index(request, response);
				break;
			}			
                    
		} catch (SQLException e) {
			e.getStackTrace();
		}
		
		
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
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
			case "guardarVehiculo":
				registrar(request, response);
				break;
			case "listarVehiculos":
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
            Vehiculo vehiculoNuevo = new Vehiculo(0, request.getParameter("modelo"), request.getParameter("marca"), Long.parseLong(request.getParameter("precio")), request.getParameter("descripcion"), request.getParameter("Matricula"));	
            vehiculoFacade.create(vehiculoNuevo);
		//articuloDAO.insertar(vehiculoNuevo);
		
                 mostrar(request, response);
	
	}
	
	private void nuevo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/nuevoVehiculo.jsp");
		dispatcher.forward(request, response);
	}
	private void cancelar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        /*
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/mostrarVehiculos.jsp");
		dispatcher.forward(request, response);   */
            mostrar(request,response);
        }
	
	private void mostrar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException , ServletException{
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/mostrarVehiculos.jsp");
		List<Vehiculo> listaArticulos = vehiculoFacade.findAll();
                //List<Vehiculo> listaArticulos= articuloDAO.listarArticulos();
		request.setAttribute("lista", listaArticulos);
                System.out.println("Mostrar2");
		dispatcher.forward(request, response);
	}	
	
	private void showEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		//Vehiculo articulo = articuloDAO.obtenerPorId(Integer.parseInt(request.getParameter("id")));
                Vehiculo articulo = vehiculoFacade.find(Integer.parseInt(request.getParameter("id")));
		List<Vehiculo> listaVehiculos = new ArrayList<Vehiculo>();
                listaVehiculos.add(articulo);
                request.setAttribute("articulo", listaVehiculos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/portafolio.jsp");
		dispatcher.forward(request, response);
	}
	
	private void editar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
           
            Vehiculo vehiculoActualizar = new Vehiculo(Integer.parseInt(request.getParameter("ID")), request.getParameter("modelo"), request.getParameter("marca"), Long.parseLong(request.getParameter("precio")), request.getParameter("descripcion"),request.getParameter("Matricula"));
            vehiculoFacade.edit(vehiculoActualizar);	
            //articuloDAO.actualizar(vehiculoActualizar);
	/*	getServletContext().getRequestDispatcher("/Vista/mostrarVehiculos.jsp").forward(request, response);  */
                mostrar(request, response);
               /* index(request, response);  */
	}
	
	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
		//Vehiculo articulo = articuloDAO.obtenerPorId(Integer.parseInt(request.getParameter("id")));
                Vehiculo vehiculoAEliminar = vehiculoFacade.find(Integer.parseInt(request.getParameter("id")));
		//articuloDAO.eliminar(articulo);
                vehiculoFacade.remove(vehiculoAEliminar);
                mostrar(request, response);
	}
}