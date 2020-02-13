<%-- 
    Document   : venta
    Created on : 21/01/2020, 1:36:49 p.m.
    Author     : yesen
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <title>Ventas</title>
    </head>
    <body>
        <div class="container well">
        <h1>Informacion de Venta</h1>
 
            <br>
            
            <table border="1" class="table table-striped">
                <th scope="row">Id Venta</th>
                <th>IdVehiculo</th>
                <th>IdCliente</th>
                  <th>NombreVendedor</th>
                  <th>Precio Venta</th>
                  <th>Fecha Venta</th>
                  <th colspan="3"></th>
                
               
                
                <c:forEach var="venta" items="${lista}">
                    <tr>
                        <td>${venta.idVenta}</td>
                        <td>${venta.idVehiculo}</td>
                        <td>${venta.idCliente}</td>
                        <td>${venta.nombreVendedor}</td>
                        <td>${venta.precioVentaTotal}</td>
                        <td></td>
                       <!-- <td>${venta.fechaVenta}</td>  -->
                        
                        <td><a href="Venta?action=showedit&id=<c:out value="${venta.idVenta}" />">Editar</a></td>
			<td><a href="Venta?action=eliminar&id=<c:out value="${venta.idVenta}" />">Eliminar</a> </td>				
                        <td><a href="Venta?action=nuevo">Nuevo</a> </td>
                    </tr>
                </c:forEach>
           </table>
    </div>

    </body>
</html>
