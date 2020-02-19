/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Concesionario.Servlet;

import com.Concesionario.DAO.ClienteDAO;
import com.Concesionario.DAO.VentaDAO;
import com.Concesionario.DAO.VehiculoDAO;
import com.Concesionario.Entity.Cliente;
import com.Concesionario.Entity.Vehiculo;
import com.Concesionario.Entity.Venta;
import com.Concesionario.JavaBeans.ClienteFacadeLocal;
import com.Concesionario.JavaBeans.VehiculoFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet("/Venta")
public class VentaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    VentaDAO ventaDAO;
    ClienteDAO _clienteDAO;
    VehiculoDAO _vehiculoDAO;
    
    public void init() {
          /*  String jdbcURL = "jdbc:mysql://localhost:3308/bdconcesionario?serverTimezone=UTC";
		String jdbcUsername = "carlos";
		String jdbcPassword = "carlos";
               
            */
		try {
 
			ventaDAO = new VentaDAO();
                        _clienteDAO = new ClienteDAO();
                        _vehiculoDAO = new VehiculoDAO();
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
    @EJB
    private VehiculoFacadeLocal vehiculoFacade; 
    @EJB
    private ClienteFacadeLocal clienteFacade; 
    
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
                    case "showEdit":
                        showEditar(request,response);
                        break;
                    case "nuevo":
                        List<Cliente> listaCliente= _clienteDAO.listarClientes();
                        request.setAttribute("listaCliente", listaCliente);
                        
                        List<Vehiculo> listaArticulos= _vehiculoDAO.listarArticulos();
                        request.setAttribute("listaVehiculo", listaArticulos);
                        
                        nuevo(request,response);
                        break;
                    case "eliminar":
                        eliminar(request,response);
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
                    case "guardarVenta":
                        registrar(request,response);
                        break;
                    case "editarVenta":
                        editar(request,response);
                        break;
                    case "cancelarNuevo":
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
            for (Venta _venta : listaVentas) {
                int idV = _venta.getIdVehiculo();
                Vehiculo _vehiculo = vehiculoFacade.find(idV);
                _venta.setmarcaVehiculo(_vehiculo.getMarca()+" - "+_vehiculo.getModelo());
                int idC = _venta.getIdCliente();
                Cliente _cliente = _clienteDAO.obtenerPorId(idC);
                _venta.setNombreCliente(_cliente.getNombre());
                //Cliente _cliente = clienteFacade.find(idC);
                //_venta.setNombreCliente(_cliente.getNombre());
            }
            // nombreCliente
            for (Venta _venta : listaVentas) {
                int idV = _venta.getIdVehiculo();
                Vehiculo _vehiculo = vehiculoFacade.find(idV);
                _venta.setmarcaVehiculo(_vehiculo.getMarca()+" - "+_vehiculo.getModelo());
            }
            
            request.setAttribute("lista", listaVentas);
            System.out.println("Mostrar2");
            dispatcher.forward(request, response);
	}
    
    private void nuevo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/nuevaVenta.jsp");
		dispatcher.forward(request, response);
	}
    
    private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
       
        String sDate1="31/12/1998";  
        //Date date1=null;
        try{
            String fechaString = request.getParameter("FechaVenta");
            Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("FechaVenta"));
        
            int Id = Integer.parseInt(request.getParameter("Vehiculo"));
            String nv = request.getParameter("NombreVendedor"); 
       
       
       
            Venta _venta = new Venta(0, Integer.parseInt(request.getParameter("Cliente")), Integer.parseInt(request.getParameter("Vehiculo")), request.getParameter("NombreVendedor"), date1, Integer.parseInt(request.getParameter("PrecioVentaTotal")));	
            
            ventaDAO.insertar(_venta);
            mostrar(request, response);
        }catch(ParseException e){
            throw new RuntimeException("Could not parse start/end date time in file ");
        }
    }
    private void showEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
	List<Vehiculo> listaVehiculos = vehiculoFacade.findAll();
        List<Cliente> listaClientes = clienteFacade.findAll();
        Venta _venta = ventaDAO.obtenerPorId(Integer.parseInt(request.getParameter("id")));
        List<Venta> listaVentas = new ArrayList<Venta>();
        listaVentas.add(_venta);
        request.setAttribute("articulo", listaVentas);
	request.setAttribute("vehiculos", listaVehiculos);	
        request.setAttribute("clientes", listaClientes);	
        
	RequestDispatcher dispatcher = request.getRequestDispatcher("/Vista/showEditarVenta.jsp");
	dispatcher.forward(request, response);
    }
    
    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
		Venta ventaAEliminar = ventaDAO.obtenerPorId(Integer.parseInt(request.getParameter("id")));
		ventaDAO.eliminar(ventaAEliminar);
                mostrar(request, response);
	
		
	}
    private void editar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
        try{
            String fechaString = request.getParameter("fechaVenta");
            Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaVenta"));
            int idVenta = Integer.parseInt(request.getParameter("ID"));
            Venta ventaActualizar = new Venta(Integer.parseInt(request.getParameter("ID")), Integer.parseInt(request.getParameter("Cliente")), Integer.parseInt(request.getParameter("Vehiculo")), request.getParameter("nombreVendedor"), date1, Integer.parseInt(request.getParameter("precioVenta")));	    
            
		ventaDAO.actualizar(ventaActualizar);
	
                mostrar(request, response);
        }catch(ParseException e)
        {
            throw new RuntimeException("Could not parse start/end date time in file ");
        }
    }
}
