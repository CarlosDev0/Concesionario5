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
        <title>Nuevo Vehiculo</title>
  
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
        <h1>REGISTRE UN NUEVO VEHICULO</h1>
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
         <form action="VehiculoServlet" method="post">

             <!--
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>ID</label>
                <input class="form-control" name="ID" type="text" required="required" data-validation-required-message="Por favor inserte el Registro.">
                
                <p class="help-block text-danger"></p>
              </div> 
            </div>-->
             <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Marca</label>
                <input class="form-control" name="marca" type="text" placeholder="Marca" required="required" data-validation-required-message="Por favor, inserte.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Modelo</label>
                <input class="form-control" name="modelo" type="text" placeholder="Modelo" required="required" data-validation-required-message="Por favor, inserte el modelo.">
                
                <p class="help-block text-danger"></p>
              </div>
            </div>
              
            
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Precio</label>
                <input class="form-control" name="precio" type="number" placeholder="Ej:2000000" required="required" data-validation-required-message="Por favor, inserte el tel.">
              </div>
            </div>
             <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Matrícula</label>
                <input class="form-control" name="Matricula" type="text" placeholder="Ej:KL2000000" required="required" data-validation-required-message="Por favor, la matrícula.">
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Descripción</label>
                <textarea class="form-control" name="descripcion" rows="5" placeholder="Características Adicionales del Vehículo" required="required" data-validation-required-message="Please enter a message."></textarea>
                <p class="Porfavor inserte descripción"></p>
              </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile">
                    <label class="custom-file-label" for="customFile">Imagen</label>
                </div>     
            </div>
              <br>
            <div id="success"></div>
            <div class="form-group">
              
            
              
              <button type="submit" class="btn btn-success btn-xl" name="action" value="guardarVehiculo" id="sendMessageButton">Guardar</button>
           
            
           <%--   <button type="submit" class="btn btn-danger btn-xl" name="action" value="cancelarNuevo" id="sendMessageButton">Cancelar</button>   --%>
              <button type="reset" class="btn  btn-danger btn-xl" name="action" value="reset" id="sendMessageButton">Reset</button>
             
              
            </div>
              
            
          </form>
             <form action="Vehiculo" method="post">
                <button type="submit" class="btn btn-warning btn-xl" name="action" value="listarVehiculos">Consultar Vehículos</button>
            </form>
                </div>
             </div>
  </section>
                
        
  
    </body>
</html>
