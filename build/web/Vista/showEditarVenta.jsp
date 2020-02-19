<%-- 
    Document   : nuevoVehiculo
    Created on : 8/12/2019, 11:48:03 AM
    Author     : USER
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Edición de Venta</title>
  
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

        <!-- Plugin CSS -->
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

        <!-- Theme CSS - Includes Bootstrap -->
        <link href="css/creative.min.css" rel="stylesheet">
    </head>
   <body>
       <%-- <jsp:include page="..\menu.jsp"></jsp:include>  --%>
       <table>
		<tr>
			<td><a href="http://localhost:3702/Concesionario5/" >Menú Principal</a> </td>
		</tr>
	</table> 
       <div class="container well">
            <form action="VentaServlet?action=editarVenta" method="post">
                <h1>Editar Venta</h1>
            <c:forEach var="Venta" items="${articulo}">
                <table>
                    <tr>
                        <th><label>IdVenta</label></th>
                        <th><input type="text" placeholder="IdVenta" value="${Venta.idVenta}" class="form-control" name="ID" required=""></th>
                    </tr>
                    <tr>
                        <th><label>Vehiculo</label></th>
                        <TH>
                        <select class="form-control" name="Vehiculo" id="Cliente" >
                        <c:forEach var="vehiculo" items="${vehiculos}">
                           <option value="${vehiculo.idVehiculo}" ${vehiculo.idVehiculo == Venta.idVehiculo? 'selected="selected"' : ''}>${vehiculo.marca} - ${vehiculo.modelo}</option>
                        </c:forEach> 
                      </select></TH>
                        
                    </tr>
                    <tr>
                        <th><label>IdCliente</label></th>
                        <th><select class="form-control" name="Cliente" id="Cliente" >
                        <c:forEach var="cliente" items="${clientes}">
                            <option value="${cliente.idCliente}" ${cliente.idCliente == Venta.idCliente? 'selected="selected"' : ''}>${cliente.nombre}</option>  
                        </c:forEach>
                        </select>
                           
                    </tr>
                     <tr>
                        <th><label>Fecha Venta</label></th>
                        <th><input type="date" placeholder="Fecha Venta" class="form-control" value="${Venta.fechaVenta}" name="fechaVenta" required=""></th>
                    </tr>
                    <tr>
                        <th><label>Nombre Vendedor</label></th>
                        <th><input type="text" placeholder="Nombre Vendedor" class="form-control" value="${Venta.nombreVendedor}" name="nombreVendedor" required=""></th>
                    </tr>
                    <tr>
                        <th><label>Precio Venta Total</label></th>
                        <th><input type="text" placeholder="PrecioVenta" class="form-control" value="${Venta.precioVentaTotal}" name="precioVenta" required=""></th>
                    </tr>
                    <tr>
                    <div><br></div>
                    </tr>
                    <tr>
                    <div><br></div>    
                    </tr>
                </table>
                </c:forEach>
                 <button type="submit" class="btn btn-primary  btn-xl btn-success" name="action" value="Actualizar">Actualizar</button>
                 <button type="reset" class="btn btn-warning btn-xl" name="action" value="reset" id="sendMessageButton">Cancelar</button>
                 <button type="submit" class="btn btn-info btn-xl" name="action" value="cancelarNuevo" id="sendMessageButton">Volver</button>
            </form>
        </div>
    </body>
</html>
