<%-- 
    Document   : menu
    Created on : 8/12/2019, 12:47:05 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    |<a href="Vehiculo?action=listarVehiculos">Listar VehiculosX</a>|
    |<a href="">Listar Clientes</a>|
    |<a href="">Nuevo Cliente</a>
    

    
    
    <c:if test="${not empty login}">
    |<a href="ConceServlet?action=listCliente">ListarClientes</a>|
    |<a href="ConceServlet?action=listVehiculo">Listar Vehiculos</a>|
    |<a href="ConceServlet?action=listVenta">Listar Ventas</a>|
    |<a href="Vehiculo?action=listarVehiculos">Listar Vehiculos</a>|
</c:if>
    
    
|<a href="about.jsp">About</a>|
<hr/>