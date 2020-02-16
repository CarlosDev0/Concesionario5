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
<title>Administrar Vehiculos</title>
</head>
<body>
	
	<table>
		<tr>
			<td><a href="http://localhost:3702/Concesionario5/" >Menú Principal</a> </td>
		</tr>
	</table>
	  <div class="container well">
              <h1>PORTAFOLIO DE VEHÍCULOS</h1>
            <table border="1" class="table table-striped">
                    <tr>
                     <th scope="row"> ID</th>
                     <th> MARCA</th>
                     <th> MODELO</th>
                     <th>DESCRIPCION</th>
                     <th>PRECIO</th>
                     <th>MATRÍCULA</th>

                     <th colspan=3>ACCIONES</th>
                    </tr>
                    <c:forEach var="Vehiculo" items="${lista}">
                            <tr>
				<td><c:out value="${Vehiculo.idVehiculo}"/></td>
				<td><c:out value="${Vehiculo.marca}"/></td>
				<td><c:out value="${Vehiculo.modelo}"/></td>
				<td><c:out value="${Vehiculo.descripcion}"/></td>  
                                <td><c:out value="${Vehiculo.precio}"/></td>
                                <td><c:out value="${Vehiculo.matricula}"/></td>
                                
				
				<td><a href="Vehiculo?action=showedit&id=<c:out value="${Vehiculo.idVehiculo}" />">Editar</a></td>
				<td><a href="Vehiculo?action=eliminar&id=<c:out value="${Vehiculo.idVehiculo}"/>">Eliminar</a> </td>				
                                <td><a href="Vehiculo?action=nuevo">Nuevo</a> </td>
			</tr>
		</c:forEach>
	</table>
        <script>
        function pageRedirect() {
            window.history.back();
        }     
        </script>
        
        </div>
</body>
</html>