/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Concesionario.DAO;


import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Concesionario.Entity.Vehiculo;
import com.Concesionario.model.Conexion;
/**
 *
 * @author USER
 */


/*
 * @autor: Elivar Largo
 * @web: www.ecodeup.com
 */

public class VehiculoDAO {
	private Conexion con;
	private Connection connection;

	public VehiculoDAO() throws SQLException {
		//System.out.println(jdbcURL);
		//con = new Conexion(jdbcURL, jdbcUsername, jdbcPassword);
                con = new Conexion();
	}

	// insertar artículo
	public boolean insertar(Vehiculo articulo) throws SQLException {
		String sql = "INSERT INTO vehiculo (Modelo,Marca, Precio, descripcion, Matricula) VALUES (?, ?, ?, ?, ?)";
		System.out.println(articulo.getMarca());
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
	/*	statement.setString(1, null);  */
		statement.setString(1, articulo.getModelo());
		statement.setString(2, articulo.getMarca());
                statement.setLong(3, articulo.getPrecio());
		statement.setString(4, articulo.getDescripcion());
		statement.setString(5, articulo.getMatricula());

		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		con.desconectar();
		return rowInserted;
	}

	// listar todos los productos
	public List<Vehiculo> listarArticulos() throws SQLException {

		List<Vehiculo> listaArticulos = new ArrayList<Vehiculo>();
		String sql = "SELECT * FROM vehiculo ORDER BY IdVehiculo";
		con.conectar();
		connection = con.getJdbcConnection();
		Statement statement = connection.createStatement();
		ResultSet resulSet = statement.executeQuery(sql);

		while (resulSet.next()) {
			int id = resulSet.getInt("IdVehiculo");
			String modelo = resulSet.getString("Modelo");
			String marca = resulSet.getString("MARCA");
			String descripcion = resulSet.getString("descripcion");
                        long precio = resulSet.getLong("Precio");
                        String matricula = resulSet.getString("Matricula");
                        
			Vehiculo articulo = new Vehiculo(id, modelo, marca, precio, descripcion,matricula);
			listaArticulos.add(articulo);
		}
		con.desconectar();
		return listaArticulos;
	}

	// obtener por id
	public Vehiculo obtenerPorId(int id) throws SQLException {
		Vehiculo articulo = null;

		String sql = "SELECT * FROM Vehiculo WHERE IdVehiculo=  '"+id+"'";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
	/*	statement.setInt(1, id); */

		ResultSet res = statement.executeQuery();
		if (res.next()) {
			articulo = new Vehiculo(res.getInt("IdVehiculo"), res.getString("modelo"), res.getString("marca"), res.getLong("precio"), res.getString("descripcion"), res.getString("Matricula"));
		}
		res.close();
		con.desconectar();

		return articulo;
	}

	// actualizar
	public boolean actualizar(Vehiculo articulo) throws SQLException {
		boolean rowActualizar = false;
		String sql = "UPDATE Vehiculo SET Modelo=?,Marca=?,descripcion=?, Precio=?, Matricula=? WHERE IdVehiculo=?";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, articulo.getModelo());
		statement.setString(2, articulo.getMarca());
		statement.setString(3, articulo.getDescripcion());
		statement.setLong(4, articulo.getPrecio());
		statement.setString(5, articulo.getMatricula());
		statement.setInt(6, articulo.getIdVehiculo());
                
		rowActualizar = statement.executeUpdate() > 0;
		statement.close();
		con.desconectar();
		return rowActualizar;
	}
	
	//eliminar
	public boolean eliminar(Vehiculo articulo) throws SQLException {
		boolean rowEliminar = false;
		String sql = "DELETE FROM Vehiculo WHERE IdVehiculo=?";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, articulo.getIdVehiculo());

		rowEliminar = statement.executeUpdate() > 0;
		statement.close();
		con.desconectar();

		return rowEliminar;
	}
        public List<Vehiculo> filtrar(String criterio) throws SQLException {

		List<Vehiculo> listaArticulos = new ArrayList<Vehiculo>();
		String sql = "SELECT * FROM vehiculo WHERE Matricula like '%"+criterio+"%' ORDER BY IdVehiculo";
		con.conectar();
		connection = con.getJdbcConnection();
		Statement statement = connection.createStatement();
		ResultSet resulSet = statement.executeQuery(sql);

		while (resulSet.next()) {
			int id = resulSet.getInt("IdVehiculo");
			String modelo = resulSet.getString("Modelo");
			String marca = resulSet.getString("MARCA");
			String descripcion = resulSet.getString("descripcion");
                        long precio = resulSet.getLong("Precio");
                        String matricula = resulSet.getString("Matricula");
                        
			Vehiculo articulo = new Vehiculo(id, modelo, marca, precio, descripcion,matricula);
			listaArticulos.add(articulo);
		}
		con.desconectar();
		return listaArticulos;
	}
}
