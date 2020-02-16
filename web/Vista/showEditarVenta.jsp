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
        <jsp:include page="..\menu.jsp"></jsp:include>
        <div class="container well">
            <form action="VentaServlet?action=editarVenta" method="post">
            <c:forEach var="Venta" items="${articulo}">
                <table>
                    <tr>
                        <th><label>idVenta</label></th>
                        <th><input type="text" placeholder="IdVenta" value="${Venta.idVenta}" class="form-control" name="ID" required=""></th>
                    </tr>
                    <tr>
                        <th><label>idVehiculo</label></th>
                        <th><input type="text" placeholder="Enter idVehiculo" value="${Venta.idVehiculo}" class="form-control" name="Vehiculo" required=""></th>
                    </tr>
                    <tr>
                        <th><label>IdCliente</label></th>
                        <th><input type="text" placeholder="IdCliente" value="${Venta.idCliente}" class="form-control" name="Cliente" required=""></th>
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
                    <input class="btn icon-btn btn-success" type="submit" name="action" value="Actualizar">
                    <input class="btn btn-info btn-lg" type="reset" name="action" value="reset">
                    </tr>
                </table>
                </c:forEach>
            </form>
        </div>
    </body>
</html>
