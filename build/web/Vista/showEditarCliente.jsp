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
        <title>Edición de Clientes</title>
  
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
        <h1>EDICIÓN DE CLIENTE</h1>
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
         <form action="Cliente" method="post">

             <c:forEach var="Cliente" items="${articulo}">
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>ID:</label>
                <input class="form-control" name="ID" type="text" value="${Cliente.idCliente}" required="required" data-validation-required-message="Por favor inserte el Registro.">
                
                <p class="help-block text-danger"></p>
              </div>
            </div>
              <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Nombre:</label>
                <input class="form-control" name="nombre" type="text" placeholder="Modelo" value="${Cliente.nombre}" required="required" data-validation-required-message="Por favor, inserte el modelo.">
                
                <p class="help-block text-danger"></p>
              </div>
            </div>
              
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Cédula:</label>
                <input class="form-control" name="cedula" type="text" value="${Cliente.cedula}" required="required" data-validation-required-message="Por favor, inserte.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Ciudad</label>
                <input class="form-control" name="ciudad" type="text" value="${Cliente.ciudad}" placeholder="Ciudad" required="required" data-validation-required-message="Por favor, inserte el tel.">
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Dirección</label>
                <textarea class="form-control" name="direccion" rows="5" placeholder="Dirección" required="required" data-validation-required-message="Please enter a message.">${Cliente.direccion}</textarea>
                <p class="Porfavor inserte dirección"></p>
              </div>
                
            </div>
              <br>
            <div id="success"></div>
            <div class="form-group">
              <button type="submit" class="btn btn-primary btn-xl" name="action" value="editarCliente" id="sendMessageButton">Guardar</button>
            
           
          
         
             
              <button type="submit" class="btn btn-success btn-xl" name="action" value="cancelarNuevo" id="sendMessageButton">Cancelar</button>
            </div>
              
            </c:forEach>
          </form>
                </div>
             </div>
  </section>
                
        
  
    </body>
</html>
