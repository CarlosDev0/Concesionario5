<%-- 
    Document   : portafolio
    Created on : 21/01/2020, 1:47:26 p.m.
    Author     : yesen
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
        <title>Ventas</title>
  
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="css/creative.min.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <table>
		<tr>
			<td><a href="http://localhost:3702/Concesionario5/" >Menú Principal</a> </td>
		</tr>
	</table>
        <h1>AUTOS</h1>
       <section class="page-section" id="contact">
        <div class="container">

        <!-- Contact Section Heading -->
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Datos</h2>

        <!-- Icon Divider -->
        <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>
        
        <!-- Contact Section Form -->
  <!--    <div class="row">
        <div class="col-lg-8 mx-auto"> -->
          <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
         <!-- <form name="sentMessage" id="contactForm" novalidate="novalidate"> -->
         <div class="container well">
         <form action="VehiculoServlet" method="post">

             <c:forEach var="Vehiculo" items="${articulo}">
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>ID</label>
                <input class="form-control" name="ID" type="text" value="${Vehiculo.idVehiculo}" required="required" data-validation-required-message="Por favor inserte el Registro.">
                
                <p class="help-block text-danger"></p>
              </div>
            </div>
              <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Modelo</label>
                <input class="form-control" name="modelo" type="text" placeholder="Modelo" value="${Vehiculo.modelo}" required="required" data-validation-required-message="Por favor, inserte el modelo.">
                
                <p class="help-block text-danger"></p>
              </div>
            </div>
              
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Marca</label>
                <input class="form-control" name="marca" type="text" value="${Vehiculo.marca}" required="required" data-validation-required-message="Por favor, inserte.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Precio</label>
                <input class="form-control" name="precio" type="text" value="${Vehiculo.precio}" placeholder="Ej:2000000" required="required" data-validation-required-message="Por favor, inserte el tel.">
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Matrícula</label>
                <input class="form-control" name="Matricula" type="text" value="${Vehiculo.matricula}" placeholder="MK5200" required="required" data-validation-required-message="Por favor, inserte la matrícula.">
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Descripción</label>
                <textarea class="form-control" name="descripcion" rows="5" placeholder="Message" required="required" data-validation-required-message="Please enter a message.">${Vehiculo.descripcion}</textarea>
                <p class="Porfavor inserte descripción"></p>
              </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile" name="Foto">
                    <label class="custom-file-label" for="customFile">Imagen</label>
                </div>     
            </div>
              <br>
            <div id="success"></div>
            <div class="form-group">
              <button type="submit" class="btn btn-primary btn-xl" name="action" value="editarVehiculo" id="sendMessageButton">Guardar</button>
            
           
          
         
             
              <button type="submit" class="btn btn-success btn-xl" name="action" value="cancelarNuevo" id="sendMessageButton">Cancelar</button>
            </div>
              
            </c:forEach>
          </form>
                </div>
             </div>
  </section>
                
        
  
    </body>
</html>
