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
        <title>JSP Page</title>
    </head>
   <body>
        <jsp:include page="..\menu.jsp"></jsp:include>
        <div class="container well">
            <form action="VehiculoServlet?action=editarVehiculo" method="post">
            <c:forEach var="Vehiculo" items="${articulo}">
                <table>
                    <tr>
                        <th><label>IdCliente</label></th>
                        <th><input type="text" placeholder="Enter IdVehiculo" value="${Vehiculo.idVehiculo}" class="form-control" name="idVehiculo" required=""></th>
                    </tr>
                    <tr>
                        <th><label>Marca</label></th>
                        <th><input type="text" placeholder="Enter Nombre Marca" value="${Vehiculo.marca}" class="form-control" name="marca" required=""></th>
                    </tr>
                     <tr>
                        <th><label>Modelo</label></th>
                        <th><input type="text" placeholder="Enter Modelo" class="form-control" value="${Vehiculo.modelo}" name="modelo" required=""></th>
                    </tr>
                    <tr>
                        <th><label>Año Fabricacion</label></th>
                        <th><input type="text" placeholder="Enter Año Fabricacion" class="form-control" value="${Vehiculo.anoFabricacion}" name="anoFabricacion" required=""></th>
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
