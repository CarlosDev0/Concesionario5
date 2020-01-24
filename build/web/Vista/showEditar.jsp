<%-- 
    Document   : nuevoVehiculo
    Created on : 8/12/2019, 11:48:03 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <div class="container well">
            <form action="ConceServlet?action=editarVehiculo" method="post">
                <table>
                    <tr>
                        <th><label>IdCliente</label></th>
                        <th><input type="text" placeholder="Enter Nombre" class="form-control" name="IdVehiculo" required=""></th>
                    </tr>
                    <tr>
                        <th><label>Marca</label></th>
                        <th><input type="text" placeholder="Enter Nombre Marca" class="form-control" name="Marca" required=""></th>
                    </tr>
                     <tr>
                        <th><label>Referencia</label></th>
                        <th><input type="text" placeholder="Enter Referencia" class="form-control" name="Referencia" required=""></th>
                    </tr>
                    <tr>
                        <th><label>Modelo</label></th>
                        <th><input type="text" placeholder="Enter Modelo" class="form-control" name="Modelo" required=""></th>
                    </tr>
                    <tr>
                    <input class="btn icon-btn btn-success" type="submit" name="action" value="Insertar">
                    <input class="btn btn-info btn-lg" type="reset" name="action" value="reset">
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
