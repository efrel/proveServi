<?php
    include('includes/funciones.php');

    $sql1= "SELECT * FROM detaimpre JOIN impresoras ON fk_printf = id_printf WHERE MONTH(fecha) = MONTH(?) AND impresoras.fk_pro = ?";
    $detaImpre2 = selectAll($sql1,array($_POST['fecha'], $_POST['proveedor']));
    echo json_encode($detaImpre2);
