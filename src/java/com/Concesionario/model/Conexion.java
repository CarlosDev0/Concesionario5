/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Concesionario.model;

/**
 *
 * @author USER
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * @autor: Elivar Largo
 * @web: www.ecodeup.com
 */

public class Conexion {
    private Connection jdbcConnection;
    private String jdbcURL;
    private String jdbcUsername ;
    private String jdbcPassword;
    /*
    public Conexion(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		this.jdbcURL = jdbcURL;
		this.jdbcUsername = jdbcUsername;
		this.jdbcPassword = jdbcPassword;
	}
*/
    public Conexion()
    {
        this.jdbcURL = "jdbc:mysql://localhost:3308/bdconcesionario?serverTimezone=UTC";
	this.jdbcUsername = "carlos";
	this.jdbcPassword = "carlos";
    }
	public void conectar() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(
                                        jdbcURL, jdbcUsername, jdbcPassword);
        }
    }
     
    public void desconectar() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

	public Connection getJdbcConnection() {
		return jdbcConnection;
	}  
       
}