/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Concesionario.DAO;

import com.Concesionario.Entity.Cliente;
import com.Concesionario.model.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author USER
 */
public class ClienteDAO {
    private Conexion con;
	private Connection connection;

	public ClienteDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) throws SQLException {
		System.out.println(jdbcURL);
		con = new Conexion(jdbcURL, jdbcUsername, jdbcPassword);
	}

	// insertar artículo
	public boolean insertar(Cliente cliente) throws SQLException {
		String sql = "INSERT INTO Cliente (IdCliente, nombre, cedula) VALUES (?, ?, ?)";
		System.out.println(cliente.getNombre());
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, null);
		statement.setString(2, cliente.getNombre());
		statement.setString(3, cliente.getCedula());
		
		

		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		con.desconectar();
		return rowInserted;
	}

	// listar todos los productos
	public List<Cliente> listarClientes() throws SQLException {

		List<Cliente> listaCliente = new ArrayList<Cliente>();
		String sql = "SELECT * FROM cliente";
		con.conectar();
		connection = con.getJdbcConnection();
		Statement statement = connection.createStatement();
		ResultSet resulSet = statement.executeQuery(sql);

		while (resulSet.next()) {
			int id = resulSet.getInt("IdCliente");
			String nombre = resulSet.getString("nombre");
			String cedula = resulSet.getString("cedula");

			Cliente _cliente = new Cliente(id, nombre, cedula);
			listaCliente.add(_cliente);
		}
		con.desconectar();
		return listaCliente;
	}

	// obtener por id
	public Cliente obtenerPorId(int id) throws SQLException {
		Cliente _cliente = null;

		String sql = "SELECT * FROM cliente WHERE IdCliente=  '"+id+"'";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
	/*	statement.setInt(1, id); */

		ResultSet res = statement.executeQuery();
		if (res.next()) {
			_cliente = new Cliente(res.getInt("IdCliente"), res.getString("nombre"), res.getString("cedula"));
		}
		res.close();
		con.desconectar();

		return _cliente;
	}

	// actualizar
	public boolean actualizar(Cliente _cliente) throws SQLException {
		boolean rowActualizar = false;
		String sql = "UPDATE Cliente SET nombre=?,cedula=? WHERE IdCliente=?";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, _cliente.getNombre());
		statement.setString(2, _cliente.getCedula());
		
		statement.setInt(3, _cliente.getIdCliente());

		rowActualizar = statement.executeUpdate() > 0;
		statement.close();
		con.desconectar();
		return rowActualizar;
	}
	
	//eliminar
	public boolean eliminar(Cliente articulo) throws SQLException {
		boolean rowEliminar = false;
		String sql = "DELETE FROM cliente WHERE IdCliente=?";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, articulo.getIdCliente());

		rowEliminar = statement.executeUpdate() > 0;
		statement.close();
		con.desconectar();

		return rowEliminar;
	}
}