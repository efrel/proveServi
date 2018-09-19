<?php
    include('includes/funciones.php');

    $mes = substr($_POST['fecha'], 0, -3);
    $pro = $_POST['proveedor'];
    $sql = "SELECT id_detaImpre, fecha, bn_inicio, bn_final, cl_inicio, cl_final, name_file, fk_printf, fk_pro, 
                impresoras.ubicacion, modelo, serie, nombre, proveedor.ubicacion, contacto, telefono, correo, fk_tp,
                fk_proveedor, monto, condicion_pago, fecha_inicio, fecha_fin, print_bn_cant, print_color_cant, print_bn_costo, print_color_costo
                FROM detaimpre JOIN impresoras on id_printf = fk_printf JOIN proveedor on id_pro = fk_pro JOIN contratos on fk_proveedor = id_pro
                WHERE fk_pro = $pro AND fecha like '$mes%'";
    $json = selectAll($sql,array());
    echo json_encode($json);