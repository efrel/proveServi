<!DOCTYPE html>
<html ng-app="Aplicacion">
<head>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <!--<link rel="shortcut icon" href="./assets/img/sep.ico" />-->
    <link rel="stylesheet" type="text/css" href="./assets/css/estilo.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/estilo.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/font-awesome.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <title>{{titulo}}</title>
    <script src="./assets/js/angularjs/angular.min.js"></script>
    <script src="./assets/js/angularjs/angular-route.min.js"></script>
    <!-- <script src="./assets/js/jquery/jquery.min.js"></script>-->
    <script src="./assets/js/util.js"></script>
    <script src="./assets/js/Chart.boundle.js"></script>

    <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.min2.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/editable.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/angular-datepicker.css">
    <script src="./assets/js/angular-datepicker.js"></script>

    <!-- ARCHIVOS -->
    <link rel="stylesheet" type="text/css" href="./assets/css/estiloFile.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/material.blue_grey-red.min.css">

    <!-- Generar pdf -->
    <script src="./assets/js/pdfmake/pdfmake.js"></script>
    <script src="./assets/js/pdfmake/vfs_fonts.js"></script>

    <?php
  		include './controller/user/controller.php';
  	?>
</head>

<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-light" style="background-color: #875A7B;">
    <!-- Navbar content -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler"
            aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarToggler">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="navbar-brand" href="#!impresoras">Inicio<span class="sr-only">(current)</span></a>
            </li>
            <!--<li class="nav-item">
                <a class="nav-link" href="#!gerencia">Gerencia</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">RRHH</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">ICT</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Producción</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Operación</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Finanzas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Mantenimiento</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Finca</a>
            </li>-->
            <li class="nav-item">
                <a class="nav-link" href="#!impresoras">Impresoras</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#!ingreImpre">Ingresar Impresoras</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#!proveedores">Proveedores</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#!contrato">Contratos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#!configProv">Configuración</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#!reporteImpre">Reportes</a>
            </li>
        </ul>
        <a onclick="cerrar()">
            <i class="fa fa-power-off" title="Cerrar Sesión" style="color:red"></i>
        </a>
    </div>
</nav>
<!-- <a class="navbar-brand titulo" href="#!index">Inicio</a>

<!--<nav class="menu">
    <div class="side-bar show">
      <div class="side-bar-encabezado">
        <img src="./assets/img/logo-unah-azul.png" />
      </div>
      <ul>
        <li class="activo">
          <a href="#!index">
  		        <i class="fa fa-desktop"></i>
  			    <p>Inicio</p>
  		    </a>
        </li>
      </ul>
    </div>
    <div class="encabezado">
      <a class="titulo">{{titulo}}</a>
      <ul class="menu-derecho">
        <li onclick="cerrar()">
          <a>
  		        <i class="fa fa-power-off" title="Cerrar Sesión" style="color:red"></i>
  			</a>
        </li>
        <li class="btn-menu">
          <a>
  		        <i class="fa fa-bars" ></i>
  			</a>
        </li>
      </ul>
    </div>
  </nav>-->
<div class="contenido" ng-view="">
</div>
<script>
    function cerrar() {
        //if (confirm('¿Desea cerrar sesión?')){
        localStorage.removeItem('cuenta');
        window.location.href = "login.php";
        // }
    }
</script>
<!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKDUTz8Uq47j1NLhJIvd0DRfD4hREetCA&callback=teEncuentras"></script>-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKDUTz8Uq47j1NLhJIvd0DRfD4hREetCA&libraries=places" async
        defer></script>
<!--<script src="http://maps.googleapis.com/maps/api/js?sensor=false&language=en"></script>-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
</body>

</html>
