<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrar Artículos</title>
</head>
<body>
	<h1>PORTAFOLIO DE VEHÍCULOS</h1>
	<table>
		<tr>
			<td><a onclick="pageRedirect()" >Ir al menú</a> </td>
                        
		</tr>
	</table>
	
	<table border="1" width="100%">
		<tr>
		 <td> ID</td>
		 <td> MARCA</td>
		 <td> MODELO</td>
		 <td>DESCRIPCION</td>
		 <td>PRECIO</td>
                 
		 <td colspan=3>ACCIONES</td>
		</tr>
		<c:forEach var="Vehiculo" items="${lista}">
			<tr>
				<td><c:out value="${Vehiculo.idVehiculo}"/></td>
				<td><c:out value="${Vehiculo.marca}"/></td>
				<td><c:out value="${Vehiculo.modelo}"/></td>
				<td><c:out value="${Vehiculo.descripcion}"/></td>  
                                <td><c:out value="${Vehiculo.precio}"/></td>
                                
				
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
</body>
</html>