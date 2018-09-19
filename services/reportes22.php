<?php
    include('includes/funciones.php');

    $mes = $_POST['fecha'];
    $mes2 = $_POST['fecha2'];
    $pro = $_POST['proveedor'];
    $sql = "SELECT id_detaImpre, fecha,sum(bn_final-bn_inicio) as totalMesBN, sum(cl_final-cl_inicio) as totalMesCl, MONTHNAME(fecha) as mes, fk_printf, detaimpre.fk_pro,
    impresoras.ubicacion as nombreImpre, modelo, serie, nombre, proveedor.ubicacion, contacto, telefono, correo, fk_tp,
    fk_proveedor, monto, condicion_pago, fecha_inicio, fecha_fin, print_bn_cant, print_color_cant, print_bn_costo, print_color_costo
    FROM detaimpre JOIN impresoras on id_printf = fk_printf JOIN proveedor on id_pro = detaimpre.fk_pro JOIN contratos on fk_proveedor = id_pro
    WHERE detaimpre.fk_pro = 1 AND MONTH(fecha) >= MONTH('$mes') AND MONTH(fecha) <= MONTH('$mes2')
    GROUP BY MONTH(fecha)";
    $json = selectAll($sql,array());
    echo json_encode($json);