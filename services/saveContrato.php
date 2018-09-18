<?php
    include('includes/funciones.php');
    if($_POST['proveedor'] == 1) {
        $sql2 = "INSERT INTO contratos(fk_proveedor,monto, condicion_pago, fecha_inicio, fecha_fin, print_bn_cant, print_color_cant, print_bn_costo, print_color_costo) VALUES (?,?,?,?,?,?,?,?,?)";
        insert($sql2, array($_POST['proveedor'], $_POST['monto'], $_POST['condicion'], $_POST['fechaInicio'], $_POST['fechaFin'], $_POST['cantBN'], $_POST['cantColor'], $_POST['costoBN'], $_POST['costoColor']));
    }elseif ($_POST['proveedor'] == 2){
        $sql2 = "INSERT INTO contratos(fk_proveedor,monto, condicion_pago, fecha_inicio, fecha_fin) VALUES (?,?,?,?,?)";
        insert($sql2, array($_POST['proveedor'], $_POST['monto'], $_POST['condicion'], $_POST['fechaInicio'], $_POST['fechaFin']));
    }
