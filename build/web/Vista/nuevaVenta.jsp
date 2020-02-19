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
        <table>
		<tr>
			<td><a href="http://localhost:3702/Concesionario5/" >Menú Principal</a> </td>
		</tr>
	</table>
        <div class="container well">
        <h1>Registrar Nueva Venta</h1>
 <form action="VentaServlet" method="POST" >
     <!--enctype="multipart/form-data"  -->
 <table>
    <tr>
    <th>Cliente</th>
    <th>
        <select class="form-control" name="Cliente" id="Cliente" >
        <option value="0">Seleccione un Cliente</option>

        <c:forEach var="cliente" items="${listaCliente}">
            <option value="${cliente.idCliente}">${cliente.nombre}</option>        
            
        </c:forEach>
        
        </select>
      </th>
            
    </tr>
 
    <tr>
        <th> Vehículo</th>
        <th>
            <select class="form-control" name="Vehiculo" id="Vehiculo" >
            <option value="0">Seleccione un Vehiculo</option>

            <c:forEach var="vehiculo" items="${listaVehiculo}">
                <option value="${vehiculo.idVehiculo}">${vehiculo.marca} - ${vehiculo.modelo}</option>
            </c:forEach>
        
            </select> 
        </th>
    </tr>
    
    
            
             <tr>
                <th> Fecha Venta</th>
                 <th> <input type="date" name="FechaVenta" class="form-control" placeholder="Ej:10000000" required="false" /></th>
            </tr>
            <tr>
                <th> Nombre Vendedor</th>
                 <th> <input type="text" name="NombreVendedor" class="form-control" placeholder="Vendedor" required="false" /></th>
            </tr>
            <tr>
                <th> Valor Venta</th>
                 <th> <input type="number" name="PrecioVentaTotal" class="form-control" placeholder="Ej:10000000" required="false" /></th>
            </tr>
            
            <div class="break"></div>                        
            
            <tr></tr>    
            <tr></tr>
            
            <tr>
                 <td colspan="2">
                 
                 
                 </td>
             </tr>
            
        </table>
     <p>&nbsp;</p>
                <input class="btn icon-btn btn-success" type="submit" name="action" value="Guardar Venta">
                <span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>
                <br/>
              <p>&nbsp;</p>
            </form>
        <form action="VentaServlet" method="POST">  <button class="btn icon-btn btn-info" type="submit" name="action" value="cancelarNuevo" id="sendMessageButton">Volver</button>
        </form>
            <br>
            
          
    </div>

    </body>
</html>
