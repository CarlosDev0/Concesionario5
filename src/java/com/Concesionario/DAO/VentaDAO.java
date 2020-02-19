/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Concesionario.DAO;

/**
 *
 * @author USER
 */

import com.Concesionario.Entity.Venta;
import com.Concesionario.model.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.Concesionario.model.Conexion;
import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
/**
 *
 * @author USER
 */
public class VentaDAO {
    private Conexion con;
	private Connection connection;

	public VentaDAO() throws SQLException {
		//System.out.println(jdbcURL);
		//con = new Conexion(jdbcURL, jdbcUsername, jdbcPassword);
                con = new Conexion();
	}

	// insertar artículo
	public boolean insertar(Venta venta) throws SQLException {
		String sql = "INSERT INTO Ventas (IdVenta, IdCliente, IdVehiculo, NombreVendedor, PrecioVentaTotal, FechaVenta) VALUES (?, ?, ?, ?, ?, ?)";
		System.out.println(venta.getIdVehiculo());
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, 0);  
		statement.setInt(2, venta.getIdCliente());
		statement.setInt(3, venta.getIdVehiculo());
		statement.setString(4, venta.getNombreVendedor());
                statement.setInt(5, venta.getPrecioVentaTotal());
                
                Instant instant = venta.getFechaVenta().toInstant();
                ZoneId zoneId = ZoneId.of ( "America/Montreal" );
                ZonedDateTime zdt = ZonedDateTime.ofInstant ( instant , zoneId );
                LocalDate localDate = zdt.toLocalDate();
                java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
		statement.setDate(6, sqlDate);

		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		con.desconectar();
		return rowInserted;
	}

	// listar todos los productos
	public List<Venta> listarVentas() throws SQLException {

		List<Venta> listaVentas = new ArrayList<Venta>();
		String sql = "SELECT * FROM Ventas";
		con.conectar();
		connection = con.getJdbcConnection();
		Statement statement = connection.createStatement();
		ResultSet resulSet = statement.executeQuery(sql);

		while (resulSet.next()) {
			int idVenta = resulSet.getInt("IdVenta");
			int idVehiculo = resulSet.getInt("IdVehiculo");
			int idCliente = resulSet.getInt("IdCliente");
                        String NombreVendedor = resulSet.getString("NombreVendedor");
                        short cantidad = resulSet.getShort("Cantidad");

                        Date fechaVenta = resulSet.getDate("FechaVenta");
                        Integer PrecioVentaTotal=resulSet.getInt("PrecioVentaTotal");

                        Venta _venta = new Venta(idVenta, idCliente, idVehiculo, NombreVendedor, fechaVenta, PrecioVentaTotal);

			listaVentas.add(_venta);
		}
		con.desconectar();
		return listaVentas;
	}

	// obtener por id
	public Venta obtenerPorId(int id) throws SQLException {
		Venta _venta = null;

		String sql = "SELECT * FROM Ventas WHERE IdVenta=  '"+id+"'";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
	/*	statement.setInt(1, id); */

		ResultSet res = statement.executeQuery();
		if (res.next()) {
                 
			_venta = new Venta(res.getInt("IdVenta"), res.getInt("IdCliente"), res.getInt("IdVehiculo"), res.getString("NombreVendedor"), res.getDate("FechaVenta"), res.getInt("PrecioVentaTotal"));
		}
		res.close();
		con.desconectar();

		return _venta;
	}

	// actualizar
	public boolean actualizar(Venta _venta) throws SQLException {
		boolean rowActualizar = false;
		String sql = "UPDATE Ventas SET idCliente=?,idVehiculo=?, NombreVendedor=?, FechaVenta=?, PrecioVentaTotal=? WHERE IdVenta=?";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, _venta.getIdCliente());
		statement.setInt(2, _venta.getIdVehiculo());
                statement.setString(3, _venta.getNombreVendedor());
		
                Instant instant = _venta.getFechaVenta().toInstant();
                ZoneId zoneId = ZoneId.of ( "America/Montreal" );
                ZonedDateTime zdt = ZonedDateTime.ofInstant ( instant , zoneId );
                LocalDate localDate = zdt.toLocalDate();
                java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
		statement.setDate(4, sqlDate);
               statement.setInt(5, _venta.getPrecioVentaTotal());
                
		statement.setInt(6, _venta.getIdVenta());

		rowActualizar = statement.executeUpdate() > 0;
		statement.close();
		con.desconectar();
		return rowActualizar;
	}
	
	//eliminar
	public boolean eliminar(Venta articulo) throws SQLException {
		boolean rowEliminar = false;
		String sql = "DELETE FROM Ventas WHERE IdVenta=?";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, articulo.getIdVenta());

		rowEliminar = statement.executeUpdate() > 0;
		statement.close();
		con.desconectar();

		return rowEliminar;
	}
}