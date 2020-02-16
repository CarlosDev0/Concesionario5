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

	public ClienteDAO() throws SQLException {
		//System.out.println(jdbcURL);
		//con = new Conexion(jdbcURL, jdbcUsername, jdbcPassword);
                con = new Conexion();
	}

	// insertar artículo
	public boolean insertar(Cliente cliente) throws SQLException {
		String sql = "INSERT INTO Cliente (nombre, cedula, ciudad, direccion) VALUES (?, ?, ?, ?)";
		System.out.println(cliente.getNombre());
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
	/*	statement.setString(1, null);  */
		statement.setString(1, cliente.getNombre());
		statement.setString(2, cliente.getCedula());
		statement.setString(3, cliente.getCiudad());
		statement.setString(4, cliente.getDireccion());

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
                        String ciudad = resulSet.getString("ciudad");
                        String direccion = resulSet.getString("direccion");
                        
			Cliente _cliente = new Cliente(id, nombre, cedula,ciudad, direccion);
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
			_cliente = new Cliente(res.getInt("IdCliente"), res.getString("nombre"), res.getString("cedula"), res.getString("ciudad"),res.getString("direccion"));
		}
		res.close();
		con.desconectar();

		return _cliente;
	}

	// actualizar
	public boolean actualizar(Cliente _cliente) throws SQLException {
		boolean rowActualizar = false;
		String sql = "UPDATE Cliente SET nombre=?,cedula=?, ciudad=?, direccion=? WHERE IdCliente=?";
		con.conectar();
		connection = con.getJdbcConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, _cliente.getNombre());
		statement.setString(2, _cliente.getCedula());
                statement.setString(3, _cliente.getCiudad());
                statement.setString(4, _cliente.getDireccion());
		
		statement.setInt(5, _cliente.getIdCliente());

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