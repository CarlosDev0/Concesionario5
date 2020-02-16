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
        <title>Nuevo Cliente</title>
  
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
        <h1>REGISTRAR NUEVO CLIENTE</h1>
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
        

         <div class="container well">
         <form action="Cliente" method="post">

          
              <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Nombre</label>
                <input class="form-control" name="nombre" type="text" placeholder="Nombre" required="required" data-validation-required-message="Por favor, inserte el Nombre.">
                
                <p class="help-block text-danger"></p>
              </div>
            </div>
              
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Cédula</label>
                <input class="form-control" name="cedula" type="text" placeholder="Cédula" required="required" data-validation-required-message="Por favor inserte la cédula">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Ciudad</label>
                <input class="form-control" name="ciudad" type="ciudad" placeholder="Ciudad" required="required" data-validation-required-message="Por favor, inserte la Ciudad">
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Dirección</label>
                <input class="form-control" name="direccion" type="text" placeholder="Dirección" required="required" data-validation-required-message="Por favor, inserte la Dirección">
                <p class="Porfavor inserte Dirección"></p>
              </div>
                
            </div>
              <br>
            <div id="success"></div>
            <div class="form-group">
              
            
              
              <button type="submit" class="btn btn-success btn-xl" name="action" value="guardarCliente" id="sendMessageButton">Guardar</button>
           
            
              <button type="submit" class="btn btn-danger btn-xl" name="action" value="cancelarNuevo" id="sendMessageButton">Cancelar</button>
            </div>
          </form>
            <form action="Cliente" method="post">
                <button type="submit" class="btn btn-warning btn-xl" name="action" value="listarClientes">Consultar Clientes</button>
            </form>
             </div>
                </div>
             
  </section>
                
        
  
    </body>
</html>
