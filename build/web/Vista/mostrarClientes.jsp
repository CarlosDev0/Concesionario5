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
	<h1>LISTA DE CLIENTES</h1>
	<table>
		<tr>
			<td><a href="Vehiculo?action=index" >Ir al menú</a> </td>
                        
		</tr>
	</table>
	
	<table border="1" width="100%">
		<tr>
		 <th> ID</th>
		 <th> NOMBRE</th>
		 <th> CEDULA</th>
		 
		 
		 <th colspan=2>ACCIONES</th>
		</tr>
		<c:forEach var="Cliente" items="${lista}">
			<tr>
				<td><c:out value="${Cliente.idCliente}"/></td>
				<td><c:out value="${Cliente.nombre}"/></td>
				<td><c:out value="${Cliente.cedula}"/></td>
				
                                
				
				<td><a href="Cliente?action=showedit&id=<c:out value="${Cliente.idCliente}" />">Editar</a></td>
				<td><a href="Cliente?action=eliminar&id=<c:out value="${Cliente.idCliente}"/>">Eliminar</a> </td>				
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>