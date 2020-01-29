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
        <title>Lab1_Arq_201902</title>
    </head>
    <body>
        <div class="container well">
        <h1>Informacion de Venta</h1>
 <form action="./VentaServlet" method="POST" enctype="multipart/form-data">
 <table>
 <tr>
 <th>Id Carro</th>
 <th><input type="text" class="form-control" placeholder="Id Carro" required="true" name="IdCarro" value="${venta.IdCarro}"/> </th>
            </tr>
 
           <tr>
                <th> Cliente ID</th>
                 <th> <input type="text" name="ClienteID" class="form-control" placeholder="Cedula" required="true" value="${venta.ClienteID}"/></th>
            </tr>
             <tr>
                <th> Fecha Venta</th>
                 <th> <input type="date" name="Date" class="form-control" placeholder="DD-MM-AAAA" required="true" value="${venta.ClienteID}"/></th>
            </tr>
            
             <tr>
                <th> Valor Venta</th>
                 <th> <input type="number" name="ValorVenta" class="form-control" placeholder="Ej:10000000" required="true" value="${venta.ClienteID}"/></th>
            </tr>

            
            <div class="break"></div>                        
                
             <tr>
                 <td colspan="2">
                 <input class="btn icon-btn btn-success" type="submit" name="action" value="Add">
                 <span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>
           
                 
                 <input class="btn icon-btn btn-info" type="submit" name="action" value="Edit">
                 <span class="glyphicon btn-glyphicon glyphicon-share img-circle text-info"></span>
                 
                 <input class="btn icon-btn btn-danger" type="submit" name="action" value="Delete">
                 <span class="glyphicon btn-glyphicon glyphicon-trash img-circle text-danger"></span>
                 
               <input class="btn icon-btn btn-primary" type="submit" name="action" value="Search">
               <span class="glyphicon btn-glyphicon glyphicon-search img-circle text-primary"></span>
               
                 
                 </td>
             </tr>
            
        </table>
            </form>
            <br>
            
            <table border="1" class="table table-striped">
                <th scope="row">Id Carro</th>
                <th>Cliente ID</th>
                <th>Fecha Venta</th>
                  <th>Valor Venta</th>
                
               
                
                <c:forEach items="${allSalls}" var="venta">
                    <tr>
                        <td>${venta.IdCarro}</td>
                        <td>${venta.Cedula}</td>
                        <td>${venta.Date}</td>
                        <th>$(venta.ValorVenta)</th>
                    </tr>
                </c:forEach>
           </table>
    </div>

    </body>
</html>
