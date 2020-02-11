<%-- 
    Document   : index
    Created on : 21/01/2020, 10:23:00 a.m.
    Author     : yesen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Font Awesome Icons -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="css/creative.min.css" rel="stylesheet">
  <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>Lab1_Arq_201902</title>
    </head>
    <body id="page-top">
         
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">Concesionario C&Y</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <table>
          <tbody>
              <tr>
                  <th><a href="Vehiculo?action=listarVehiculos">|Productos|</a></th>
                  <th><a href="Cliente?action=listarClientes">|Clientes|</a></th>
                  <th><a href="Venta?action=listarVentas">|Ventas|</a></th>
              </tr>
          </tbody>
      </table>
     <!--  <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto my-2 my-lg-0">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about">Venta</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#services">Portafolio</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="Vehiculo?action=listarVehiculos">Listar Vehiculos</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#client">Clientes</a>
          </li>
           <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#contact">Contacto</a>
          </li>
        </ul>
      </div> -->
    </div>
  </nav>
        
          <!-- Página principal -->
  <header class="masthead">
    <div class="container h-100">
      <div class="row h-100 align-items-center justify-content-center text-center">
        <div class="col-lg-10 align-self-end">
          <h1 class="text-uppercase text-white font-weight-bold">BIENVENIDO</h1>
          <hr class="divider my-4">
        </div>
        <div class="col-lg-8 align-self-baseline">
          <p class="text-white-75 font-weight-light mb-5">Administrando la información de los mejores autos en Colombia y nuestros Clientes</p>
        </div>
      </div>
    </div>
  </header>
       
          
          <!-- Seccion de Portafolio-->
  <section id="portfolio">
    <div class="container-fluid p-0">
      <div class="row no-gutters">
        <div class="col-lg-4 col-sm-6">
          <a class="portfolio-box" href="img/portfolio/fullsize/1.jpg">
            <img class="img-fluid" src="img/portfolio/thumbnails/1.jpg" alt="">
            <div class="portfolio-box-caption">
              <div class="project-category text-white-50">
                Toyota
              </div>
              <div class="project-name">
                Distintos modelos de marca Toyota
              </div>
            </div>
          </a>
        </div>
        <div class="col-lg-4 col-sm-6">
          <a class="portfolio-box" href="img/portfolio/fullsize/11.jpg">
            <img class="img-fluid" src="img/portfolio/thumbnails/11.jpg" alt="">
            <div class="portfolio-box-caption">
              <div class="project-category text-white-50">
                Chevrolet
              </div>
              <div class="project-name">
                Para todos los estilos
              </div>
            </div>
          </a>
        </div>
        <div class="col-lg-4 col-sm-6">
          <a class="portfolio-box" href="img/portfolio/fullsize/2.jpg">
            <img class="img-fluid" src="img/portfolio/thumbnails/2.jpg" alt="">
            <div class="portfolio-box-caption">
                <div class="project-category text-white-50">
                Nissan
              </div>
              <div class="project-name">
                Lo más difícil de tenerlo, es decidir el destino
              </div>
            </div>
          </a>
        </div>
        <div class="col-lg-4 col-sm-6">
          <a class="portfolio-box" href="img/portfolio/fullsize/4.jpg">
            <img class="img-fluid" src="img/portfolio/thumbnails/4.jpg" alt="">
            <div class="portfolio-box-caption">
              <div class="project-category text-white-50">
                Mercedes Benz
              </div>
              <div class="project-name">
                Sé y siéntete elegante
              </div>
            </div>
          </a>
        </div>
        <div class="col-lg-4 col-sm-6">
          <a class="portfolio-box" href="img/portfolio/fullsize/5.jpg">
            <img class="img-fluid" src="img/portfolio/thumbnails/5.jpg" alt="">
            <div class="portfolio-box-caption">
              <div class="project-category text-white-50">
                Hyundai
              </div>
              <div class="project-name">
                Velocidad y estilo
              </div>
            </div>
          </a>
        </div>
        <div class="col-lg-4 col-sm-6">
          <a class="portfolio-box" href="img/portfolio/fullsize/6.jpg">
            <img class="img-fluid" src="img/portfolio/thumbnails/6.jpg" alt="">
            <div class="portfolio-box-caption p-3">
              <div class="project-category text-white-50">
                Ford
                 </div>
              <div class="project-name">
                Elegante a su manera
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </section>
          
            <!-- Sección Elaboradores -->
  <section class="page-section" id="contact">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
          <h2 class="mt-0">Presentado por:</h2>
          <hr class="divider my-2">
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
          <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
          <div>Carlos Sanchez</div>
          <div>Yesenia Babilonia</div>
        </div>
        <div class="col-lg-4 mr-auto text-center">
          <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
          <!-- Make sure to change the email address in anchor text AND the link below! -->
          <a class="d-block" href="mailto:carlos.sanchez2@udea.edu.co">carlos.sanchez2@udea.edu.co</a>
          <a class="d-block" href="mailto:yesenia.babilonia@udea.edu.co">yesenia.babilonia@udea.edu.co</a>
        </div>
      </div>
          <div class="row justify-content-center">
        <div class="col-lg-10 text-center">
            <a class="text-muted mb-10" href="https://udearroba.udea.edu.co/home/">Ude@</a>
          <p class="text-muted mb-10">ARQUITECTURA DE SOFTWARE</p>
          <span class="text-muted mb-5" style="font-size: medium;">201902</span>
          
      </div>
              
    
      
              
    </div>
  </section>

  <!-- Pie de Página -->
  <footer class="bg-light py-5">
    <div class="container">
      <div class="small text-center text-muted">Copyright &copy; 2019 - Start Bootstrap</div>
    </div>
  </footer>
    </body>
</html>
